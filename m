Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D98D3708C7
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 21:24:58 +0200 (CEST)
Received: from localhost ([::1]:36868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcvEX-0004oc-Dj
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 15:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raimue@zebra.codingfarm.de>)
 id 1lcv55-0005b0-7L
 for qemu-devel@nongnu.org; Sat, 01 May 2021 15:15:11 -0400
Received: from donkey.codingfarm.de ([2a01:4f8:190:12cf::d:1]:43680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raimue@zebra.codingfarm.de>)
 id 1lcv53-0007pV-7F
 for qemu-devel@nongnu.org; Sat, 01 May 2021 15:15:10 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by donkey.codingfarm.de (Postfix) with ESMTPSA id 2E8E780B38;
 Sat,  1 May 2021 21:06:23 +0200 (CEST)
Received: by zebra.codingfarm.de (Postfix, from userid 1000)
 id 003E844CD9; Sat,  1 May 2021 21:06:22 +0200 (CEST)
From: =?UTF-8?q?Rainer=20M=C3=BCller?= <raimue@codingfarm.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] input-linux: Allow to toggle grab from QMP
Date: Sat,  1 May 2021 21:06:22 +0200
Message-Id: <20210501190622.153901-3-raimue@codingfarm.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501190622.153901-1-raimue@codingfarm.de>
References: <20210501190622.153901-1-raimue@codingfarm.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a01:4f8:190:12cf::d:1;
 envelope-from=raimue@zebra.codingfarm.de; helo=donkey.codingfarm.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NO_DNS_FOR_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Rainer=20M=C3=BCller?= <raimue@codingfarm.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch allows to boot a guest without the input-linux device being
grabbed immediately from the host. This is useful when the guest is
automatically started, but is supposed to stay in the background until
the user actively switches to it with a key combination.

In this usage example the host continues to own the keyboard until the
user explicitly toggles the grab state with both control keys:
  -object input-linux,id=kbd1,evdev=/dev/input/eventX,grab-active=off

When grab-active is not given, input-linux will behave as before and
devices are being grabbed immediately on initialization.

Note that even if grab_all=on is set, other devices will initially be
grabbed according to their own grab-active option. The first toggle
operation on a grab_all=on device will sync state to the other devices.

Furthermore, this new option allows to toggle the grab state from QMP
with the qom-set command. By setting grab-active at runtime, the device
will be grabbed or released as indicated by the passed value.

  $ ./scripts/qmp-shell /tmp/qmp.sock
  (QEMU) qom-set path=/objects/kbd1 property=grab-active value=true
  {"return": {}}
  (QEMU) qom-get path=/objects/kbd1 property=grab-active
  {"return": true}

For devices with grab_all=on, the action will propagate to other devices
as if the grab toggle hotkey was used.

Signed-off-by: Rainer Müller <raimue@codingfarm.de>
---
 qapi/qom.json    |  3 +++
 ui/input-linux.c | 39 +++++++++++++++++++++++++++++++++++----
 2 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index cd0e76d564..51704465ec 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -488,6 +488,8 @@
 #
 # @repeat: enables auto-repeat events (default: false)
 #
+# @grab-active: if true, device is grabbed (default: true)
+#
 # @grab-toggle: the key or key combination that toggles device grab
 #               (default: ctrl-ctrl)
 #
@@ -497,6 +499,7 @@
   'data': { 'evdev': 'str',
             '*grab_all': 'bool',
             '*repeat': 'bool',
+            '*grab-active': 'bool',
             '*grab-toggle': 'GrabToggleKeys' } }
 
 ##
diff --git a/ui/input-linux.c b/ui/input-linux.c
index 47d489d738..64efb83e21 100644
--- a/ui/input-linux.c
+++ b/ui/input-linux.c
@@ -399,10 +399,9 @@ static void input_linux_complete(UserCreatable *uc, Error **errp)
     }
 
     qemu_set_fd_handler(il->fd, input_linux_event, NULL, il);
-    if (il->keycount) {
-        /* delay grab until all keys are released */
-        il->grab_request = true;
-    } else {
+    /* delay grab until all keys are released */
+    if (il->grab_request && !il->keycount) {
+        il->grab_request = false;
         input_linux_toggle_grab(il);
     }
     QTAILQ_INSERT_TAIL(&inputs, il, next);
@@ -493,8 +492,37 @@ static void input_linux_set_grab_toggle(Object *obj, int value,
     il->grab_toggle = value;
 }
 
+static bool input_linux_get_grab_active(Object *obj, Error **errp)
+{
+    InputLinux *il = INPUT_LINUX(obj);
+
+    return il->grab_active;
+}
+
+static void input_linux_set_grab_active(Object *obj, bool value,
+                                        Error **errp)
+{
+    InputLinux *il = INPUT_LINUX(obj);
+
+    if (!il->initialized) {
+        il->grab_request = value;
+        return;
+    }
+
+    if (il->grab_active != value) {
+        if (il->keycount) {
+            il->grab_request = true;
+        } else {
+            input_linux_toggle_grab(il);
+        }
+    }
+}
+
 static void input_linux_instance_init(Object *obj)
 {
+    InputLinux *il = INPUT_LINUX(obj);
+
+    il->grab_request = true;
 }
 
 static void input_linux_class_init(ObjectClass *oc, void *data)
@@ -512,6 +540,9 @@ static void input_linux_class_init(ObjectClass *oc, void *data)
     object_class_property_add_bool(oc, "repeat",
                                    input_linux_get_repeat,
                                    input_linux_set_repeat);
+    object_class_property_add_bool(oc, "grab-active",
+                                   input_linux_get_grab_active,
+                                   input_linux_set_grab_active);
     object_class_property_add_enum(oc, "grab-toggle", "GrabToggleKeys",
                                    &GrabToggleKeys_lookup,
                                    input_linux_get_grab_toggle,
-- 
2.25.1


