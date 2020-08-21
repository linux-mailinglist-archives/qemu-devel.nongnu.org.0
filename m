Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F5724D685
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 15:47:46 +0200 (CEST)
Received: from localhost ([::1]:55382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k97OT-0000IA-3C
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 09:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <root@moya.office.hostfission.com>)
 id 1k97Mm-0006wk-1e
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 09:46:00 -0400
Received: from mail1.hostfission.com ([139.99.139.48]:45500)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <root@moya.office.hostfission.com>)
 id 1k97Mk-0001YO-2r
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 09:45:59 -0400
Received: from moya.office.hostfission.com (office.hostfission.com
 [220.233.29.71])
 by mail1.hostfission.com (Postfix) with ESMTP id BEB85427AE;
 Fri, 21 Aug 2020 23:45:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1598017555;
 bh=t+j1DCvYERemptMnn8fWd/5gLpk86NvVv1XtD2x2gR4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vn03Sk915552j9b8EpjGAkjTKiquMtRX7YnFguO4d5yEhWdCSkSpCrCpB4B7l50En
 BmMpfj3xr/QbVlyQh8kDgM50C6LErDx5CVA+KhhzCSRPVGRxhW3TJIzAbXGK+huaIk
 MUQPjOPBdU4qC7xlDiZ/HHEKTGSyNj6JAqDQH348=
Received: by moya.office.hostfission.com (Postfix, from userid 0)
 id A1AF73A0099; Fri, 21 Aug 2020 23:45:55 +1000 (AEST)
From: Geoffrey McRae <geoff@hostfission.com>
To: qemu-devel@nongnu.org
Cc: Geoffrey McRae <geoff@hostfission.com>, kraxel@redhat.com,
 pbonzini@redhat.com
Subject: [PATCH v8 1/1] audio/jack: fix use after free segfault
Date: Fri, 21 Aug 2020 23:45:54 +1000
Message-Id: <20200821134554.101397-2-geoff@hostfission.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200821134554.101397-1-geoff@hostfission.com>
References: <20200821134554.101397-1-geoff@hostfission.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=139.99.139.48;
 envelope-from=root@moya.office.hostfission.com; helo=mail1.hostfission.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 09:45:56
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change registers a bottom handler to close the JACK client
connection when a server shutdown signal is recieved. Without this
libjack2 attempts to "clean up" old clients and causes a use after free
segfault.

Signed-off-by: Geoffrey McRae <geoff@hostfission.com>
---
 audio/jackaudio.c | 55 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 42 insertions(+), 13 deletions(-)

diff --git a/audio/jackaudio.c b/audio/jackaudio.c
index 72ed7c4929..572ebea208 100644
--- a/audio/jackaudio.c
+++ b/audio/jackaudio.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu/module.h"
 #include "qemu/atomic.h"
+#include "qemu/main-loop.h"
 #include "qemu-common.h"
 #include "audio.h"
 
@@ -63,6 +64,8 @@ typedef struct QJackClient {
     QJackState      state;
     jack_client_t  *client;
     jack_nframes_t  freq;
+    QemuMutex       shutdown_lock;
+    QEMUBH         *shutdown_bh;
 
     struct QJack   *j;
     int             nchannels;
@@ -306,21 +309,27 @@ static int qjack_xrun(void *arg)
     return 0;
 }
 
+static void qjack_shutdown_bh(void *opaque)
+{
+    QJackClient *c = (QJackClient *)opaque;
+    qjack_client_fini(c);
+}
+
 static void qjack_shutdown(void *arg)
 {
     QJackClient *c = (QJackClient *)arg;
     c->state = QJACK_STATE_SHUTDOWN;
+    qemu_bh_schedule(c->shutdown_bh);
 }
 
 static void qjack_client_recover(QJackClient *c)
 {
-    if (c->state == QJACK_STATE_SHUTDOWN) {
-        qjack_client_fini(c);
+    if (c->state != QJACK_STATE_DISCONNECTED) {
+        return;
     }
 
     /* packets is used simply to throttle this */
-    if (c->state == QJACK_STATE_DISCONNECTED &&
-        c->packets % 100 == 0) {
+    if (c->packets % 100 == 0) {
 
         /* if enabled then attempt to recover */
         if (c->enabled) {
@@ -489,15 +498,18 @@ static int qjack_init_out(HWVoiceOut *hw, struct audsettings *as,
     QJackOut *jo  = (QJackOut *)hw;
     Audiodev *dev = (Audiodev *)drv_opaque;
 
-    qjack_client_fini(&jo->c);
-
     jo->c.out       = true;
     jo->c.enabled   = false;
     jo->c.nchannels = as->nchannels;
     jo->c.opt       = dev->u.jack.out;
 
+    jo->c.shutdown_bh = qemu_bh_new(qjack_shutdown_bh, &jo->c);
+    qemu_mutex_init(&jo->c.shutdown_lock);
+
     int ret = qjack_client_init(&jo->c);
     if (ret != 0) {
+        qemu_bh_delete(jo->c.shutdown_bh);
+        qemu_mutex_destroy(&jo->c.shutdown_lock);
         return ret;
     }
 
@@ -525,15 +537,18 @@ static int qjack_init_in(HWVoiceIn *hw, struct audsettings *as,
     QJackIn  *ji  = (QJackIn *)hw;
     Audiodev *dev = (Audiodev *)drv_opaque;
 
-    qjack_client_fini(&ji->c);
-
     ji->c.out       = false;
     ji->c.enabled   = false;
     ji->c.nchannels = as->nchannels;
     ji->c.opt       = dev->u.jack.in;
 
+    ji->c.shutdown_bh = qemu_bh_new(qjack_shutdown_bh, &ji->c);
+    qemu_mutex_init(&ji->c.shutdown_lock);
+
     int ret = qjack_client_init(&ji->c);
     if (ret != 0) {
+        qemu_bh_delete(ji->c.shutdown_bh);
+        qemu_mutex_destroy(&ji->c.shutdown_lock);
         return ret;
     }
 
@@ -555,7 +570,7 @@ static int qjack_init_in(HWVoiceIn *hw, struct audsettings *as,
     return 0;
 }
 
-static void qjack_client_fini(QJackClient *c)
+static void qjack_client_fini_locked(QJackClient *c)
 {
     switch (c->state) {
     case QJACK_STATE_RUNNING:
@@ -564,28 +579,42 @@ static void qjack_client_fini(QJackClient *c)
 
     case QJACK_STATE_SHUTDOWN:
         jack_client_close(c->client);
+        c->client = NULL;
+
+        qjack_buffer_free(&c->fifo);
+        g_free(c->port);
+
+        c->state = QJACK_STATE_DISCONNECTED;
         /* fallthrough */
 
     case QJACK_STATE_DISCONNECTED:
         break;
     }
+}
 
-    qjack_buffer_free(&c->fifo);
-    g_free(c->port);
-
-    c->state = QJACK_STATE_DISCONNECTED;
+static void qjack_client_fini(QJackClient *c)
+{
+    qemu_mutex_lock(&c->shutdown_lock);
+    qjack_client_fini_locked(c);
+    qemu_mutex_unlock(&c->shutdown_lock);
 }
 
 static void qjack_fini_out(HWVoiceOut *hw)
 {
     QJackOut *jo = (QJackOut *)hw;
     qjack_client_fini(&jo->c);
+
+    qemu_bh_delete(jo->c.shutdown_bh);
+    qemu_mutex_destroy(&jo->c.shutdown_lock);
 }
 
 static void qjack_fini_in(HWVoiceIn *hw)
 {
     QJackIn *ji = (QJackIn *)hw;
     qjack_client_fini(&ji->c);
+
+    qemu_bh_delete(ji->c.shutdown_bh);
+    qemu_mutex_destroy(&ji->c.shutdown_lock);
 }
 
 static void qjack_enable_out(HWVoiceOut *hw, bool enable)
-- 
2.20.1


