Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A062AA9C9
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Nov 2020 07:35:44 +0100 (CET)
Received: from localhost ([::1]:48498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kbeIh-0001eC-4G
	for lists+qemu-devel@lfdr.de; Sun, 08 Nov 2020 01:35:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <root@moya.office.hostfission.com>)
 id 1kbeH9-0000l7-UH
 for qemu-devel@nongnu.org; Sun, 08 Nov 2020 01:34:07 -0500
Received: from mail1.hostfission.com ([139.99.139.48]:35124)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <root@moya.office.hostfission.com>)
 id 1kbeH7-0003Db-RX
 for qemu-devel@nongnu.org; Sun, 08 Nov 2020 01:34:07 -0500
Received: from moya.office.hostfission.com (office.hostfission.com
 [220.233.29.71])
 by mail1.hostfission.com (Postfix) with ESMTP id 6A3CC44A97;
 Sun,  8 Nov 2020 17:34:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1604817244;
 bh=hfnwULlJmudPWetlts036KPeZHQgDubrxSWJPnwuiOY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZInItdjL/PXJFWllYu4/eLtnQpwd0WPoU3jqzg2a+SabPwyU42/HpJxprIXIUHJwQ
 IhEtKNtVuqMgA1dNxLSt6zdYPdjjgL4wwHNiajaiMahDmWDTF2gSztvkj35vGLVXM+
 beSvwlypFaxcU5R4YPM4a500SoZVWn31zLM8s2Ig=
Received: by moya.office.hostfission.com (Postfix, from userid 0)
 id 5F3663A0388; Sun,  8 Nov 2020 17:34:04 +1100 (AEDT)
From: Geoffrey McRae <geoff@hostfission.com>
To: qemu-devel@nongnu.org
Cc: Geoffrey McRae <geoff@hostfission.com>, kraxel@redhat.com,
 pbonzini@redhat.com, qemu_oss@crudebyte.com
Subject: [PATCH v10 1/1] audio/jack: fix use after free segfault
Date: Sun,  8 Nov 2020 17:33:50 +1100
Message-Id: <20201108063351.35804-2-geoff@hostfission.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201108063351.35804-1-geoff@hostfission.com>
References: <20201107000458.8754-1-geoff@hostfission.com>
 <20201108063351.35804-1-geoff@hostfission.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=139.99.139.48;
 envelope-from=root@moya.office.hostfission.com; helo=mail1.hostfission.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/08 01:34:04
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
connection when a server shutdown signal is received. Without this
libjack2 attempts to "clean up" old clients and causes a use after free
segfault.

Signed-off-by: Geoffrey McRae <geoff@hostfission.com>
---
 audio/jackaudio.c | 50 +++++++++++++++++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 13 deletions(-)

diff --git a/audio/jackaudio.c b/audio/jackaudio.c
index 1e714b30bc..3b7c18443d 100644
--- a/audio/jackaudio.c
+++ b/audio/jackaudio.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu/module.h"
 #include "qemu/atomic.h"
+#include "qemu/main-loop.h"
 #include "qemu-common.h"
 #include "audio.h"
 
@@ -63,6 +64,7 @@ typedef struct QJackClient {
     QJackState      state;
     jack_client_t  *client;
     jack_nframes_t  freq;
+    QEMUBH         *shutdown_bh;
 
     struct QJack   *j;
     int             nchannels;
@@ -87,6 +89,7 @@ QJackIn;
 static int qjack_client_init(QJackClient *c);
 static void qjack_client_connect_ports(QJackClient *c);
 static void qjack_client_fini(QJackClient *c);
+static QemuMutex qjack_shutdown_lock;
 
 static void qjack_buffer_create(QJackBuffer *buffer, int channels, int frames)
 {
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
@@ -489,15 +498,16 @@ static int qjack_init_out(HWVoiceOut *hw, struct audsettings *as,
     QJackOut *jo  = (QJackOut *)hw;
     Audiodev *dev = (Audiodev *)drv_opaque;
 
-    qjack_client_fini(&jo->c);
-
     jo->c.out       = true;
     jo->c.enabled   = false;
     jo->c.nchannels = as->nchannels;
     jo->c.opt       = dev->u.jack.out;
 
+    jo->c.shutdown_bh = qemu_bh_new(qjack_shutdown_bh, &jo->c);
+
     int ret = qjack_client_init(&jo->c);
     if (ret != 0) {
+        qemu_bh_delete(jo->c.shutdown_bh);
         return ret;
     }
 
@@ -525,15 +535,16 @@ static int qjack_init_in(HWVoiceIn *hw, struct audsettings *as,
     QJackIn  *ji  = (QJackIn *)hw;
     Audiodev *dev = (Audiodev *)drv_opaque;
 
-    qjack_client_fini(&ji->c);
-
     ji->c.out       = false;
     ji->c.enabled   = false;
     ji->c.nchannels = as->nchannels;
     ji->c.opt       = dev->u.jack.in;
 
+    ji->c.shutdown_bh = qemu_bh_new(qjack_shutdown_bh, &ji->c);
+
     int ret = qjack_client_init(&ji->c);
     if (ret != 0) {
+        qemu_bh_delete(ji->c.shutdown_bh);
         return ret;
     }
 
@@ -555,7 +566,7 @@ static int qjack_init_in(HWVoiceIn *hw, struct audsettings *as,
     return 0;
 }
 
-static void qjack_client_fini(QJackClient *c)
+static void qjack_client_fini_locked(QJackClient *c)
 {
     switch (c->state) {
     case QJACK_STATE_RUNNING:
@@ -564,28 +575,40 @@ static void qjack_client_fini(QJackClient *c)
 
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
+    qemu_mutex_lock(&qjack_shutdown_lock);
+    qjack_client_fini_locked(c);
+    qemu_mutex_unlock(&qjack_shutdown_lock);
 }
 
 static void qjack_fini_out(HWVoiceOut *hw)
 {
     QJackOut *jo = (QJackOut *)hw;
     qjack_client_fini(&jo->c);
+
+    qemu_bh_delete(jo->c.shutdown_bh);
 }
 
 static void qjack_fini_in(HWVoiceIn *hw)
 {
     QJackIn *ji = (QJackIn *)hw;
     qjack_client_fini(&ji->c);
+
+    qemu_bh_delete(ji->c.shutdown_bh);
 }
 
 static void qjack_enable_out(HWVoiceOut *hw, bool enable)
@@ -662,6 +685,7 @@ static void qjack_info(const char *msg)
 
 static void register_audio_jack(void)
 {
+    qemu_mutex_init(&qjack_shutdown_lock);
     audio_driver_register(&jack_driver);
     jack_set_thread_creator(qjack_thread_creator);
     jack_set_error_function(qjack_error);
-- 
2.20.1


