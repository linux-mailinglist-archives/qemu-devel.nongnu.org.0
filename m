Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D91C1A9002
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 03:02:30 +0200 (CEST)
Received: from localhost ([::1]:40884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOWRh-00034i-5D
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 21:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58354)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alazar@bitdefender.com>) id 1jOWOy-0000vs-IE
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 20:59:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alazar@bitdefender.com>) id 1jOWOx-00051u-GE
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 20:59:40 -0400
Received: from mx01.bbu.dsd.mx.bitdefender.com ([91.199.104.161]:49092)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alazar@bitdefender.com>)
 id 1jOWOx-000511-7t
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 20:59:39 -0400
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 50B2930747CC
 for <qemu-devel@nongnu.org>; Wed, 15 Apr 2020 03:59:35 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 3F091305B7A4;
 Wed, 15 Apr 2020 03:59:35 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v1 13/26] kvm: vmi: block the object destruction if the
 chardev is connected
Date: Wed, 15 Apr 2020 03:59:25 +0300
Message-Id: <20200415005938.23895-14-alazar@bitdefender.com>
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

The introspection tool can modify the VM while it is running
(e.g. it can set breakpoints), and when the VM is no longer introspected
these changes need to be removed. Until then, we block the destruction of
the introspection object that would lead to the unexpected shutdown
of the introspection channel.

Signed-off-by: Adalbert Laz=C4=83r <alazar@bitdefender.com>
---
 accel/kvm/vmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/accel/kvm/vmi.c b/accel/kvm/vmi.c
index f456ca56ef..2ce8a60565 100644
--- a/accel/kvm/vmi.c
+++ b/accel/kvm/vmi.c
@@ -151,11 +151,19 @@ static bool chardev_is_connected(VMIntrospection *i=
, Error **errp)
     return obj && object_property_get_bool(obj, "connected", errp);
 }
=20
+static bool introspection_can_be_deleted(UserCreatable *uc)
+{
+    VMIntrospection *i =3D VM_INTROSPECTION(uc);
+
+    return !chardev_is_connected(i, NULL);
+}
+
 static void class_init(ObjectClass *oc, void *data)
 {
     UserCreatableClass *uc =3D USER_CREATABLE_CLASS(oc);
=20
     uc->complete =3D complete;
+    uc->can_be_deleted =3D introspection_can_be_deleted;
 }
=20
 static void instance_init(Object *obj)

