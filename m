Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C97F282055
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Aug 2019 17:35:06 +0200 (CEST)
Received: from localhost ([::1]:54983 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1huf0s-00080H-0P
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 11:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52291)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <david@redhat.com>) id 1huewo-0003ux-9E
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 11:30:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1huewn-0000yp-AK
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 11:30:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45374)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1huewl-0000xN-By; Mon, 05 Aug 2019 11:30:51 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EAD0A300BEA8;
 Mon,  5 Aug 2019 15:30:49 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-48.ams2.redhat.com [10.36.117.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D54726B49B;
 Mon,  5 Aug 2019 15:30:47 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Aug 2019 17:29:46 +0200
Message-Id: <20190805152947.28536-9-david@redhat.com>
In-Reply-To: <20190805152947.28536-1-david@redhat.com>
References: <20190805152947.28536-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Mon, 05 Aug 2019 15:30:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH-for-4.2 v1 8/9] s390x/cpumodel: Prepare for
 changes of QEMU model
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Setup the 4.1 compatibility model so we can add new features to the
LATEST model.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/s390x/s390-virtio-ccw.c  | 2 ++
 target/s390x/gen-features.c | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 593b34e0e2..c815a65ee9 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -671,7 +671,9 @@ DEFINE_CCW_MACHINE(4_2, "4.2", true);
=20
 static void ccw_machine_4_1_instance_options(MachineState *machine)
 {
+    static const S390FeatInit qemu_cpu_feat =3D { S390_FEAT_LIST_QEMU_V4=
_1 };
     ccw_machine_4_2_instance_options(machine);
+    s390_set_qemu_cpu_model(0x2964, 13, 2, qemu_cpu_feat);
 }
=20
 static void ccw_machine_4_1_class_options(MachineClass *mc)
diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index 49a650ac52..7e82f2f004 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -698,11 +698,14 @@ static uint16_t qemu_V4_0[] =3D {
     S390_FEAT_ZPCI,
 };
=20
-static uint16_t qemu_LATEST[] =3D {
+static uint16_t qemu_V4_1[] =3D {
     S390_FEAT_STFLE_53,
     S390_FEAT_VECTOR,
 };
=20
+static uint16_t qemu_LATEST[] =3D {
+};
+
 /* add all new definitions before this point */
 static uint16_t qemu_MAX[] =3D {
     /* generates a dependency warning, leave it out for now */
@@ -824,6 +827,7 @@ static FeatGroupDefSpec QemuFeatDef[] =3D {
     QEMU_FEAT_INITIALIZER(V2_11),
     QEMU_FEAT_INITIALIZER(V3_1),
     QEMU_FEAT_INITIALIZER(V4_0),
+    QEMU_FEAT_INITIALIZER(V4_1),
     QEMU_FEAT_INITIALIZER(LATEST),
     QEMU_FEAT_INITIALIZER(MAX),
 };
--=20
2.21.0


