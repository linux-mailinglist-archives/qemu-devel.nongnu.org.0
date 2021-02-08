Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121C73140D6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:48:09 +0100 (CET)
Received: from localhost ([::1]:57284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9DS4-00057C-4Q
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:48:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minus@mnus.de>)
 id 1l97MX-0008BZ-Un; Mon, 08 Feb 2021 09:18:07 -0500
Received: from zeus.servers.mnus.de ([78.47.191.162]:42258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minus@mnus.de>)
 id 1l97ME-0006Aa-IZ; Mon, 08 Feb 2021 09:17:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mnus.de;
 s=mnus.de-helios; t=1612793846;
 bh=qzLztpuyPxzVmWfrBGfohC9xbS0SByUsKqUn35YWEFM=;
 h=From:To:Cc:Subject:Date;
 b=ZcWWdu12YcGGu+HDNteOSvsYJ2VVOhROGaS5bPNzK+qSnNPdWCrZo9AYE2GfuOvQN
 +a7aAIQxQ7bvJ8ZxeuAaLY2dSIkM8HFpJa/afLb/8qkdCsq7mbuChD6abvLNdvWLqc
 fM3Dw33VxBrilz9rYKW/5SOzEGYkK2nPfnwxhHRdmnTT49zrLyov7mxMD+vbv0kgD5
 V9cd/zjKMXeWElRSYYv6dOfDj7U5AqNJcklyqZWgM6j1BORMmZ6ZpfPLSlR9NNSDm0
 40a51OUZfLTPoLoCa9YWpdj6svpD6YbVTbxVkSAcUt43ig8x7LnmnJqkht0X9rlVUk
 rtqL+tmJ8HBrhsKcBSVnu+U49qLcd6wrSse4UHT4fpzqSvhWyJEc64j7HpJ9jKlSaU
 qeCpQeg11IZnOhT+dV346GbBoLw3CtHloIc8kph636XabEX76w+7iGfptxmBVkSVfB
 W5AE17RogUMgyFfbhly2X3HNArWCpwII2+pqYP1HFU6/FpUtBClZuboAxeZ2NDxZyd
 hk+oVKcWmq+JcAo9wXTpn8r2RCrCNYM9d4dGHbIe7KFuIZ+qxW5vmKXteNG/tdXU5N
 gQ69wiqQT0/QyiCDj8c7eUTSZBS6nuTf/2Oae5/F0d1SDyQoZZ6L8mYz0rHhKjFU6O
 5sAPPrfQUeoWHYoqfSer1p94=
From: minus <minus@mnus.de>
To: qemu-devel@nongnu.org
Subject: [PATCH] input-linux: Make grabbing on start configurable
Date: Mon,  8 Feb 2021 15:17:24 +0100
Message-Id: <20210208141724.58067-1-minus@mnus.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=78.47.191.162; envelope-from=minus@mnus.de;
 helo=zeus.servers.mnus.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 08 Feb 2021 09:34:37 -0500
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
Cc: qemu-trivial@nongnu.org, minus <minus@mnus.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Setting grab_on_start=off allows starting a VM on boot that shares the
keyboard/mouse of the host but without grabbing it immediately.

Signed-off-by: minus <minus@mnus.de>
---
 ui/input-linux.c | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/ui/input-linux.c b/ui/input-linux.c
index 05c0c98819..c4f82eaa98 100644
--- a/ui/input-linux.c
+++ b/ui/input-linux.c
@@ -44,6 +44,7 @@ struct InputLinux {
     bool        grab_request;
     bool        grab_active;
     bool        grab_all;
+    bool        grab_on_start;
     bool        keydown[KEY_CNT];
     int         keycount;
     int         wheel;
@@ -394,11 +395,13 @@ static void input_linux_complete(UserCreatable *uc, Error **errp)
     }
 
     qemu_set_fd_handler(il->fd, input_linux_event, NULL, il);
-    if (il->keycount) {
-        /* delay grab until all keys are released */
-        il->grab_request = true;
-    } else {
-        input_linux_toggle_grab(il);
+    if (il->grab_on_start) {
+        if (il->keycount) {
+            /* delay grab until all keys are released */
+            il->grab_request = true;
+        } else {
+            input_linux_toggle_grab(il);
+        }
     }
     QTAILQ_INSERT_TAIL(&inputs, il, next);
     il->initialized = true;
@@ -450,6 +453,21 @@ static bool input_linux_get_grab_all(Object *obj, Error **errp)
     return il->grab_all;
 }
 
+static void input_linux_set_grab_on_start(Object *obj, bool value,
+                                          Error **errp)
+{
+    InputLinux *il = INPUT_LINUX(obj);
+
+    il->grab_on_start = value;
+}
+
+static bool input_linux_get_grab_on_start(Object *obj, Error **errp)
+{
+    InputLinux *il = INPUT_LINUX(obj);
+
+    return il->grab_on_start;
+}
+
 static void input_linux_set_grab_all(Object *obj, bool value,
                                    Error **errp)
 {
@@ -490,6 +508,9 @@ static void input_linux_set_grab_toggle(Object *obj, int value,
 
 static void input_linux_instance_init(Object *obj)
 {
+    InputLinux *il = INPUT_LINUX(obj);
+
+    il->grab_on_start = true;
 }
 
 static void input_linux_class_init(ObjectClass *oc, void *data)
@@ -504,6 +525,9 @@ static void input_linux_class_init(ObjectClass *oc, void *data)
     object_class_property_add_bool(oc, "grab_all",
                                    input_linux_get_grab_all,
                                    input_linux_set_grab_all);
+    object_class_property_add_bool(oc, "grab_on_start",
+                                   input_linux_get_grab_on_start,
+                                   input_linux_set_grab_on_start);
     object_class_property_add_bool(oc, "repeat",
                                    input_linux_get_repeat,
                                    input_linux_set_repeat);
-- 
2.30.0


