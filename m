Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 468C16BCEF1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 13:06:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcmMD-0002id-O9; Thu, 16 Mar 2023 08:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1pcmM8-0002hQ-PC
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:05:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1pcmM6-0002li-N3
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:05:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678968314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aqsQaWrWYEA1dOgXV6EY799w70U5nBg8XBVK8rkTfwo=;
 b=bYv9bnBmTB69UeyZsZMC0VdLNBX7XAsrG3DL+/iMQX8BFGke4f5sqsFOMOTDhn32Z60BaF
 vGSwEly2LV3E9ZxaSM3Bb8sr/DpNLr1aVf+WezZCjsYcUW+a7Ab3asHe55PKGhaAt3Xtez
 wIUoDHU3viz5A34m0u9uGlAa1Vd9HKI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-VNyZfQMzO4y_ebxm2lbhhQ-1; Thu, 16 Mar 2023 08:05:12 -0400
X-MC-Unique: VNyZfQMzO4y_ebxm2lbhhQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2019210146F7;
 Thu, 16 Mar 2023 12:05:12 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.33.36.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99F22140EBF4;
 Thu, 16 Mar 2023 12:05:10 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sergio Lopez <slp@redhat.com>
Subject: [PATCH v2 2/6] ui: add the infrastructure to support MT events
Date: Thu, 16 Mar 2023 13:06:20 +0100
Message-Id: <20230316120624.46410-3-slp@redhat.com>
In-Reply-To: <20230316120624.46410-1-slp@redhat.com>
References: <20230316120624.46410-1-slp@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add the required infrastructure to support generating multitouch events.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 include/ui/input.h    |  3 +++
 qapi/ui.json          | 45 ++++++++++++++++++++++++++++++++++++++++---
 replay/replay-input.c | 18 +++++++++++++++++
 ui/input.c            |  6 ++++++
 ui/trace-events       |  1 +
 5 files changed, 70 insertions(+), 3 deletions(-)

diff --git a/include/ui/input.h b/include/ui/input.h
index c86219a1c1..2a3dffd417 100644
--- a/include/ui/input.h
+++ b/include/ui/input.h
@@ -8,9 +8,12 @@
 #define INPUT_EVENT_MASK_BTN   (1<<INPUT_EVENT_KIND_BTN)
 #define INPUT_EVENT_MASK_REL   (1<<INPUT_EVENT_KIND_REL)
 #define INPUT_EVENT_MASK_ABS   (1<<INPUT_EVENT_KIND_ABS)
+#define INPUT_EVENT_MASK_MTT   (1<<INPUT_EVENT_KIND_MTT)
 
 #define INPUT_EVENT_ABS_MIN    0x0000
 #define INPUT_EVENT_ABS_MAX    0x7FFF
+#define INPUT_EVENT_SLOTS_MIN  0x0
+#define INPUT_EVENT_SLOTS_MAX  0xa
 
 typedef struct QemuInputHandler QemuInputHandler;
 typedef struct QemuInputHandlerState QemuInputHandlerState;
diff --git a/qapi/ui.json b/qapi/ui.json
index 98322342f7..dee9c2b5bb 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1014,7 +1014,7 @@
 ##
 { 'enum'  : 'InputButton',
   'data'  : [ 'left', 'middle', 'right', 'wheel-up', 'wheel-down', 'side',
-  'extra', 'wheel-left', 'wheel-right' ] }
+  'extra', 'wheel-left', 'wheel-right', 'touch' ] }
 
 ##
 # @InputAxis:
@@ -1026,6 +1026,17 @@
 { 'enum'  : 'InputAxis',
   'data'  : [ 'x', 'y' ] }
 
+##
+# @InputMultitouchType:
+#
+# Type of a multitouch event.
+#
+# Since: 8.1
+##
+{ 'enum'  : 'InputMultitouchType',
+  'data'  : [ 'begin', 'update', 'end', 'cancel', 'data' ] }
+
+
 ##
 # @InputKeyEvent:
 #
@@ -1069,13 +1080,31 @@
   'data'  : { 'axis'    : 'InputAxis',
               'value'   : 'int' } }
 
+##
+# @InputMultitouchEvent:
+#
+# Multitouch input event.
+#
+# @axis: Which axis is referenced by @value.
+# @value: Pointer position.  For absolute coordinates the
+#         valid range is 0 -> 0x7ffff
+#
+# Since: 8.1
+##
+{ 'struct'  : 'InputMultitouchEvent',
+  'data'  : { 'type'       : 'InputMultitouchType',
+              'slot'       : 'int',
+              'tracking-id': 'int',
+              'axis'       : 'InputAxis',
+              'value'      : 'int' } }
+
 ##
 # @InputEventKind:
 #
 # Since: 2.0
 ##
 { 'enum': 'InputEventKind',
-  'data': [ 'key', 'btn', 'rel', 'abs' ] }
+  'data': [ 'key', 'btn', 'rel', 'abs', 'mtt' ] }
 
 ##
 # @InputKeyEventWrapper:
@@ -1101,6 +1130,14 @@
 { 'struct': 'InputMoveEventWrapper',
   'data': { 'data': 'InputMoveEvent' } }
 
+##
+# @InputMultitouchEventWrapper:
+#
+# Since: 8.1
+##
+{ 'struct': 'InputMultitouchEventWrapper',
+  'data': { 'data': 'InputMultitouchEvent' } }
+
 ##
 # @InputEvent:
 #
@@ -1112,6 +1149,7 @@
 #        - 'btn': Input event of pointer buttons
 #        - 'rel': Input event of relative pointer motion
 #        - 'abs': Input event of absolute pointer motion
+#        - 'mtt': Input event of Multitouch
 #
 # Since: 2.0
 ##
@@ -1121,7 +1159,8 @@
   'data'  : { 'key'     : 'InputKeyEventWrapper',
               'btn'     : 'InputBtnEventWrapper',
               'rel'     : 'InputMoveEventWrapper',
-              'abs'     : 'InputMoveEventWrapper' } }
+              'abs'     : 'InputMoveEventWrapper',
+              'mtt'     : 'InputMultitouchEventWrapper' } }
 
 ##
 # @input-send-event:
diff --git a/replay/replay-input.c b/replay/replay-input.c
index 1147e3d34e..092f6b5ee9 100644
--- a/replay/replay-input.c
+++ b/replay/replay-input.c
@@ -22,6 +22,7 @@ void replay_save_input_event(InputEvent *evt)
     InputKeyEvent *key;
     InputBtnEvent *btn;
     InputMoveEvent *move;
+    InputMultitouchEvent *mtt;
     replay_put_dword(evt->type);
 
     switch (evt->type) {
@@ -58,6 +59,14 @@ void replay_save_input_event(InputEvent *evt)
         replay_put_dword(move->axis);
         replay_put_qword(move->value);
         break;
+    case INPUT_EVENT_KIND_MTT:
+        mtt = evt->u.mtt.data;
+        replay_put_dword(mtt->type);
+        replay_put_qword(mtt->slot);
+        replay_put_qword(mtt->tracking_id);
+        replay_put_dword(mtt->axis);
+        replay_put_qword(mtt->value);
+        break;
     case INPUT_EVENT_KIND__MAX:
         /* keep gcc happy */
         break;
@@ -73,6 +82,7 @@ InputEvent *replay_read_input_event(void)
     InputBtnEvent btn;
     InputMoveEvent rel;
     InputMoveEvent abs;
+    InputMultitouchEvent mtt;
 
     evt.type = replay_get_dword();
     switch (evt.type) {
@@ -109,6 +119,14 @@ InputEvent *replay_read_input_event(void)
         evt.u.abs.data->axis = (InputAxis)replay_get_dword();
         evt.u.abs.data->value = replay_get_qword();
         break;
+    case INPUT_EVENT_KIND_MTT:
+        evt.u.mtt.data = &mtt;
+        evt.u.mtt.data->type = (InputMultitouchType)replay_get_dword();
+        evt.u.mtt.data->slot = replay_get_qword();
+        evt.u.mtt.data->tracking_id = replay_get_qword();
+        evt.u.mtt.data->axis = (InputAxis)replay_get_dword();
+        evt.u.mtt.data->value = replay_get_qword();
+        break;
     case INPUT_EVENT_KIND__MAX:
         /* keep gcc happy */
         break;
diff --git a/ui/input.c b/ui/input.c
index f2d1e7a3a7..f788db20f7 100644
--- a/ui/input.c
+++ b/ui/input.c
@@ -212,6 +212,7 @@ static void qemu_input_event_trace(QemuConsole *src, InputEvent *evt)
     InputKeyEvent *key;
     InputBtnEvent *btn;
     InputMoveEvent *move;
+    InputMultitouchEvent *mtt;
 
     if (src) {
         idx = qemu_console_get_index(src);
@@ -250,6 +251,11 @@ static void qemu_input_event_trace(QemuConsole *src, InputEvent *evt)
         name = InputAxis_str(move->axis);
         trace_input_event_abs(idx, name, move->value);
         break;
+    case INPUT_EVENT_KIND_MTT:
+        mtt = evt->u.mtt.data;
+        name = InputAxis_str(mtt->axis);
+        trace_input_event_mtt(idx, name, mtt->value);
+        break;
     case INPUT_EVENT_KIND__MAX:
         /* keep gcc happy */
         break;
diff --git a/ui/trace-events b/ui/trace-events
index 977577fbba..6747361745 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -90,6 +90,7 @@ input_event_key_qcode(int conidx, const char *qcode, bool down) "con %d, key qco
 input_event_btn(int conidx, const char *btn, bool down) "con %d, button %s, down %d"
 input_event_rel(int conidx, const char *axis, int value) "con %d, axis %s, value %d"
 input_event_abs(int conidx, const char *axis, int value) "con %d, axis %s, value 0x%x"
+input_event_mtt(int conidx, const char *axis, int value) "con %d, axis %s, value 0x%x"
 input_event_sync(void) ""
 input_mouse_mode(int absolute) "absolute %d"
 
-- 
2.38.1


