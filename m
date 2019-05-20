Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9189023F5A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 19:46:52 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39524 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSmN9-0002vU-JK
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 13:46:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56339)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hSlqm-0000Of-C6
	for qemu-devel@nongnu.org; Mon, 20 May 2019 13:13:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hSlqk-0006s0-8h
	for qemu-devel@nongnu.org; Mon, 20 May 2019 13:13:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:61913)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1hSlqi-0006qr-OA; Mon, 20 May 2019 13:13:22 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8778730917AB;
	Mon, 20 May 2019 17:13:19 +0000 (UTC)
Received: from localhost (ovpn-204-110.brq.redhat.com [10.40.204.110])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06EA5100200A;
	Mon, 20 May 2019 17:13:13 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 May 2019 19:03:01 +0200
Message-Id: <20190520170302.13643-54-cohuck@redhat.com>
In-Reply-To: <20190520170302.13643-1-cohuck@redhat.com>
References: <20190520170302.13643-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 20 May 2019 17:13:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 53/54] s390x/cpumodel: add gen15 defintions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
	David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Christian Borntraeger <borntraeger@de.ibm.com>

add several new features (msa9, sort, deflate, additional vector
instructions, new general purpose instructions) to generation 15.

Also disable csske and bpb from the default and base models >=3D15.
This will allow to migrate gen15 machines to future machines that
do not have these features.

Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
Message-Id: <20190429090250.7648-9-borntraeger@de.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/gen-features.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index 8fc2e8e72fc9..c346b76bdfbe 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -13,6 +13,7 @@
=20
 #include <inttypes.h>
 #include <stdio.h>
+#include <string.h>
 #include "cpu_features_def.h"
=20
 #define ARRAY_SIZE(array) (sizeof(array) / sizeof(array[0]))
@@ -419,6 +420,10 @@ static uint16_t base_GEN14_GA1[] =3D {
=20
 #define base_GEN14_GA2 EmptyFeat
=20
+static uint16_t base_GEN15_GA1[] =3D {
+    S390_FEAT_MISC_INSTRUCTION_EXT3,
+};
+
 /* Full features (in order of release)
  * Automatically includes corresponding base features.
  * Full features are all features this hardware supports even if kvm/QEM=
U do not
@@ -548,6 +553,16 @@ static uint16_t full_GEN14_GA1[] =3D {
=20
 #define full_GEN14_GA2 EmptyFeat
=20
+static uint16_t full_GEN15_GA1[] =3D {
+    S390_FEAT_VECTOR_ENH2,
+    S390_FEAT_GROUP_ENH_SORT,
+    S390_FEAT_GROUP_DEFLATE_CONVERSION,
+    S390_FEAT_VECTOR_BCD_ENH,
+    S390_FEAT_GROUP_MSA_EXT_9,
+    S390_FEAT_GROUP_MSA_EXT_9_PCKMO,
+    S390_FEAT_ETOKEN,
+};
+
 /* Default features (in order of release)
  * Automatically includes corresponding base features.
  * Default features are all features this version of QEMU supports for t=
his
@@ -624,6 +639,16 @@ static uint16_t default_GEN14_GA1[] =3D {
=20
 #define default_GEN14_GA2 EmptyFeat
=20
+static uint16_t default_GEN15_GA1[] =3D {
+    S390_FEAT_VECTOR_ENH2,
+    S390_FEAT_GROUP_ENH_SORT,
+    S390_FEAT_GROUP_DEFLATE_CONVERSION,
+    S390_FEAT_VECTOR_BCD_ENH,
+    S390_FEAT_GROUP_MSA_EXT_9,
+    S390_FEAT_GROUP_MSA_EXT_9_PCKMO,
+    S390_FEAT_ETOKEN,
+};
+
 /* QEMU (CPU model) features */
=20
 static uint16_t qemu_V2_11[] =3D {
@@ -740,6 +765,7 @@ static CpuFeatDefSpec CpuFeatDef[] =3D {
     CPU_FEAT_INITIALIZER(GEN13_GA2),
     CPU_FEAT_INITIALIZER(GEN14_GA1),
     CPU_FEAT_INITIALIZER(GEN14_GA2),
+    CPU_FEAT_INITIALIZER(GEN15_GA1),
 };
=20
 #define FEAT_GROUP_INITIALIZER(_name)                  \
@@ -808,6 +834,11 @@ static void set_bits(uint64_t list[], BitSpec bits)
     }
 }
=20
+static inline void clear_bit(uint64_t list[], unsigned long nr)
+{
+    list[nr / 64] &=3D ~(1ULL << (nr % 64));
+}
+
 static void print_feature_defs(void)
 {
     uint64_t base_feat[S390_FEAT_MAX / 64 + 1] =3D {};
@@ -818,6 +849,12 @@ static void print_feature_defs(void)
     printf("\n/* CPU model feature list data */\n");
=20
     for (i =3D 0; i < ARRAY_SIZE(CpuFeatDef); i++) {
+        /* With gen15 CSSKE and BPB are deprecated */
+        if (strcmp(CpuFeatDef[i].name, "S390_FEAT_LIST_GEN15_GA1") =3D=3D=
 0) {
+            clear_bit(base_feat, S390_FEAT_CONDITIONAL_SSKE);
+            clear_bit(default_feat, S390_FEAT_CONDITIONAL_SSKE);
+            clear_bit(default_feat, S390_FEAT_BPB);
+        }
         set_bits(base_feat, CpuFeatDef[i].base_bits);
         /* add the base to the default features */
         set_bits(default_feat, CpuFeatDef[i].base_bits);
--=20
2.20.1


