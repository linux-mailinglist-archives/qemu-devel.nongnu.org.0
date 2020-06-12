Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 498EF1F7154
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jun 2020 02:25:06 +0200 (CEST)
Received: from localhost ([::1]:35900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjXVJ-0002gh-Ax
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 20:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <geoff@hostfission.com>)
 id 1jjXSu-0006zB-H8
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 20:22:36 -0400
Received: from mail1.hostfission.com ([139.99.139.48]:33198)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geoff@hostfission.com>) id 1jjXSr-0001I3-Ko
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 20:22:36 -0400
Received: from moya.office.hostfission.com (office.hostfission.com
 [220.233.29.71])
 by mail1.hostfission.com (Postfix) with ESMTP id 157B8444F1;
 Fri, 12 Jun 2020 10:16:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1591920973;
 bh=1t76te5+unvB/lGElLkT/Q78MNCTZLQzmHCzHolgV6k=;
 h=From:Date:Subject:To:Cc:From;
 b=JMNhrEsZITkAlD31y0XaZZxDdohS5/IfAKTXt6YEnP2MBunMBiF1OdxwXrybfMcYL
 iII6OecMcvmarNuK5IXegYtxT2GCOeB5mBTlPNZlrypAWVL5dBNKgxJG/YMJycMkR0
 axVppOoRF+nSLR9YI39ctAsUJKRuvX1FZFQey17g=
Received: by moya.office.hostfission.com (Postfix, from userid 0)
 id E7F733A069B; Fri, 12 Jun 2020 10:16:12 +1000 (AEST)
From: Geoffrey McRae <geoff@hostfission.com>
Date: Fri, 12 Jun 2020 01:20:54 +1000
Subject: [PATCH 5/6] audio/jack: honour the enable state of the audio device
To: <qemu-devel@nongnu.org>
Cc: <kraxel@redhat.com>
X-Mailer: mail (GNU Mailutils 3.5)
Message-Id: <20200612001612.E7F733A069B@moya.office.hostfission.com>
Received-SPF: pass client-ip=139.99.139.48; envelope-from=geoff@hostfission.com;
 helo=mail1.hostfission.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 20:16:15
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

Signed-off-by: Geoffrey McRae <geoff@hostfission.com>
---
 audio/jackaudio.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/audio/jackaudio.c b/audio/jackaudio.c
index 249cbd3265..b2b53985ae 100644
--- a/audio/jackaudio.c
+++ b/audio/jackaudio.c
@@ -56,7 +56,7 @@ typedef struct QJackClient {
     AudiodevJackPerDirectionOptions *opt;
 
     bool out;
-    bool finished;
+    bool enabled;
     bool connect_ports;
     int  packets;
 
@@ -271,9 +271,17 @@ static int qjack_process(jack_nframes_t nframes, void *arg)
     }
 
     if (c->out) {
-        qjack_buffer_read_l(&c->fifo, buffers, nframes);
+        if (likely(c->enabled)) {
+            qjack_buffer_read_l(&c->fifo, buffers, nframes);
+        } else {
+            for(int i = 0; i < c->nchannels; ++i) {
+                memset(buffers[i], 0, nframes * sizeof(float));
+            }
+        }
     } else {
-        qjack_buffer_write_l(&c->fifo, buffers, nframes);
+        if (likely(c->enabled)) {
+            qjack_buffer_write_l(&c->fifo, buffers, nframes);
+        }
     }
 
     return 0;
@@ -314,8 +322,8 @@ static void qjack_client_recover(QJackClient *c)
     if (c->state == QJACK_STATE_DISCONNECTED &&
         c->packets % 100 == 0) {
 
-        /* if not finished then attempt to recover */
-        if (!c->finished) {
+        /* if enabled then attempt to recover */
+        if (c->enabled) {
             dolog("attempting to reconnect to server\n");
             qjack_client_init(c);
         }
@@ -387,7 +395,6 @@ static int qjack_client_init(QJackClient *c)
     char client_name[jack_client_name_size()];
     jack_options_t options = JackNullOption;
 
-    c->finished      = false;
     c->connect_ports = true;
 
     snprintf(client_name, sizeof(client_name), "%s-%s",
@@ -483,8 +490,10 @@ static int qjack_init_out(HWVoiceOut *hw, struct audsettings *as,
     }
 
     jo->c.out       = true;
+    jo->c.enabled   = false;
     jo->c.nchannels = as->nchannels;
     jo->c.opt       = dev->u.jack.out;
+
     int ret = qjack_client_init(&jo->c);
     if (ret != 0) {
         return ret;
@@ -519,8 +528,10 @@ static int qjack_init_in(HWVoiceIn *hw, struct audsettings *as,
     }
 
     ji->c.out       = false;
+    ji->c.enabled   = false;
     ji->c.nchannels = as->nchannels;
     ji->c.opt       = dev->u.jack.in;
+
     int ret = qjack_client_init(&ji->c);
     if (ret != 0) {
         return ret;
@@ -568,23 +579,25 @@ static void qjack_client_fini(QJackClient *c)
 static void qjack_fini_out(HWVoiceOut *hw)
 {
     QJackOut *jo = (QJackOut *)hw;
-    jo->c.finished = true;
     qjack_client_fini(&jo->c);
 }
 
 static void qjack_fini_in(HWVoiceIn *hw)
 {
     QJackIn *ji = (QJackIn *)hw;
-    ji->c.finished = true;
     qjack_client_fini(&ji->c);
 }
 
 static void qjack_enable_out(HWVoiceOut *hw, bool enable)
 {
+    QJackOut *jo = (QJackOut *)hw;
+    jo->c.enabled = enable;
 }
 
 static void qjack_enable_in(HWVoiceIn *hw, bool enable)
 {
+    QJackIn *ji = (QJackIn *)hw;
+    ji->c.enabled = enable;
 }
 
 static int qjack_thread_creator(jack_native_thread_t *thread,
-- 
2.20.1


