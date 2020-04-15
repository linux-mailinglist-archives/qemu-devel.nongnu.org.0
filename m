Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CBF1A9044
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 03:17:08 +0200 (CEST)
Received: from localhost ([::1]:41080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOWfr-00070g-Uh
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 21:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58498)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alazar@bitdefender.com>) id 1jOWPA-0001MB-Rd
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 20:59:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alazar@bitdefender.com>) id 1jOWP9-0005Ck-5d
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 20:59:52 -0400
Received: from mx01.bbu.dsd.mx.bitdefender.com ([91.199.104.161]:49114)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alazar@bitdefender.com>)
 id 1jOWP8-00052i-PO
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 20:59:51 -0400
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 664CA3074872
 for <qemu-devel@nongnu.org>; Wed, 15 Apr 2020 03:59:36 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 55FEC305B7A3;
 Wed, 15 Apr 2020 03:59:36 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v1 24/26] kvm: vmi: add 'unhook_on_shutdown' property
Date: Wed, 15 Apr 2020 03:59:36 +0300
Message-Id: <20200415005938.23895-25-alazar@bitdefender.com>
In-Reply-To: <20200415005938.23895-1-alazar@bitdefender.com>
References: <20200415005938.23895-1-alazar@bitdefender.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.199.104.161
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
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some introspection tools can detect when the guest is shutting down.
This new option, 'unhook_on_shutdown' controls if QEMU will notify the
introspection tool on a shutdown command at its level.

Signed-off-by: Adalbert Laz=C4=83r <alazar@bitdefender.com>
---
 accel/kvm/vmi.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/accel/kvm/vmi.c b/accel/kvm/vmi.c
index 2c6981a4bf..02877eec06 100644
--- a/accel/kvm/vmi.c
+++ b/accel/kvm/vmi.c
@@ -58,6 +58,7 @@ typedef struct VMIntrospection {
     GSource *unhook_timer;
     uint32_t unhook_timeout;
     bool async_unhook;
+    bool unhook_on_shutdown;
=20
     int reconnect_time;
=20
@@ -203,6 +204,20 @@ static void prop_set_async_unhook(Object *obj, bool =
value, Error **errp)
     i->async_unhook =3D value;
 }
=20
+static bool prop_get_unhook_on_shutdown(Object *obj, Error **errp)
+{
+    VMIntrospection *i =3D VM_INTROSPECTION(obj);
+
+    return i->unhook_on_shutdown;
+}
+
+static void prop_set_unhook_on_shutdown(Object *obj, bool value, Error *=
*errp)
+{
+    VMIntrospection *i =3D VM_INTROSPECTION(obj);
+
+    i->unhook_on_shutdown =3D value;
+}
+
 static void prop_get_uint32(Object *obj, Visitor *v, const char *name,
                             void *opaque, Error **errp)
 {
@@ -285,6 +300,11 @@ static void instance_init(Object *obj)
                              prop_get_async_unhook,
                              prop_set_async_unhook, NULL);
=20
+    i->unhook_on_shutdown =3D true;
+    object_property_add_bool(obj, "unhook_on_shutdown",
+                             prop_get_unhook_on_shutdown,
+                             prop_set_unhook_on_shutdown, NULL);
+
     vmstate_register(NULL, 0, &vmstate_introspection, i);
 }
=20
@@ -801,6 +821,11 @@ static bool intercept_action(VMIntrospection *i,
     }
=20
     switch (action) {
+    case VMI_INTERCEPT_SHUTDOWN:
+        if (!i->unhook_on_shutdown) {
+            return false;
+        }
+        break;
     case VMI_INTERCEPT_FORCE_RESET:
         disconnect_and_unhook_kvmi(i);
         return false;

