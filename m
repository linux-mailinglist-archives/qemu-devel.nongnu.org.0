Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id CB73438914
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 13:31:05 +0200 (CEST)
Received: from localhost ([::1]:48656 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZD5L-0001Rm-6k
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 07:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55757)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hZBa2-0003WH-4I
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:54:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hZBZw-0003gs-9T
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:54:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54976)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hZBZv-0003ei-QS; Fri, 07 Jun 2019 05:54:32 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C92BA30862BE;
 Fri,  7 Jun 2019 09:54:30 +0000 (UTC)
Received: from localhost (dhcp-192-191.str.redhat.com [10.33.192.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 754145B802;
 Fri,  7 Jun 2019 09:54:30 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri,  7 Jun 2019 11:52:35 +0200
Message-Id: <20190607095237.11364-34-cohuck@redhat.com>
In-Reply-To: <20190607095237.11364-1-cohuck@redhat.com>
References: <20190607095237.11364-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 07 Jun 2019 09:54:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 33/35] s390x: Bump the "qemu" CPU model up to a
 stripped-down z13
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

We don't care about the other two missing base features:
- S390_FEAT_DFP_PACKED_CONVERSION
- S390_FEAT_GROUP_GEN13_PTFF

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/s390x/s390-virtio-ccw.c  |  2 ++
 target/s390x/cpu_models.c   |  4 ++--
 target/s390x/gen-features.c | 11 +++++++----
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index bbc6e8fa0bab..4d643686cb56 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -669,7 +669,9 @@ DEFINE_CCW_MACHINE(4_1, "4.1", true);
=20
 static void ccw_machine_4_0_instance_options(MachineState *machine)
 {
+    static const S390FeatInit qemu_cpu_feat =3D { S390_FEAT_LIST_QEMU_V4=
_0 };
     ccw_machine_4_1_instance_options(machine);
+    s390_set_qemu_cpu_model(0x2827, 12, 2, qemu_cpu_feat);
 }
=20
 static void ccw_machine_4_0_class_options(MachineClass *mc)
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 21ea81948306..b5d16e4c8966 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -86,8 +86,8 @@ static S390CPUDef s390_cpu_defs[] =3D {
     CPUDEF_INIT(0x8562, 15, 1, 47, 0x08000000U, "gen15b", "IBM 8562 GA1"=
),
 };
=20
-#define QEMU_MAX_CPU_TYPE 0x2827
-#define QEMU_MAX_CPU_GEN 12
+#define QEMU_MAX_CPU_TYPE 0x2964
+#define QEMU_MAX_CPU_GEN 13
 #define QEMU_MAX_CPU_EC_GA 2
 static const S390FeatInit qemu_max_cpu_feat_init =3D { S390_FEAT_LIST_QE=
MU_MAX };
 static S390FeatBitmap qemu_max_cpu_feat;
diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index a818c8033285..dc320a06c271 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -689,7 +689,7 @@ static uint16_t qemu_V3_1[] =3D {
     S390_FEAT_MSA_EXT_4,
 };
=20
-static uint16_t qemu_LATEST[] =3D {
+static uint16_t qemu_V4_0[] =3D {
     /*
      * Only BFP bits are implemented (HFP, DFP, PFPO and DIVIDE TO INTEG=
ER not
      * implemented yet).
@@ -698,11 +698,13 @@ static uint16_t qemu_LATEST[] =3D {
     S390_FEAT_ZPCI,
 };
=20
-/* add all new definitions before this point */
-static uint16_t qemu_MAX[] =3D {
-    /* z13+ features */
+static uint16_t qemu_LATEST[] =3D {
     S390_FEAT_STFLE_53,
     S390_FEAT_VECTOR,
+};
+
+/* add all new definitions before this point */
+static uint16_t qemu_MAX[] =3D {
     /* generates a dependency warning, leave it out for now */
     S390_FEAT_MSA_EXT_5,
 };
@@ -821,6 +823,7 @@ static FeatGroupDefSpec FeatGroupDef[] =3D {
 static FeatGroupDefSpec QemuFeatDef[] =3D {
     QEMU_FEAT_INITIALIZER(V2_11),
     QEMU_FEAT_INITIALIZER(V3_1),
+    QEMU_FEAT_INITIALIZER(V4_0),
     QEMU_FEAT_INITIALIZER(LATEST),
     QEMU_FEAT_INITIALIZER(MAX),
 };
--=20
2.20.1


