Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A393F449A
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 07:12:36 +0200 (CEST)
Received: from localhost ([::1]:32932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI2GB-0002cS-3l
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 01:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Renwei.Liu@verisilicon.com>)
 id 1mHz8C-0002tr-6L; Sun, 22 Aug 2021 21:52:08 -0400
Received: from shasxm06.verisilicon.com ([101.89.135.45]:53321
 helo=shasxm03.verisilicon.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Renwei.Liu@verisilicon.com>)
 id 1mHz89-0003XC-3a; Sun, 22 Aug 2021 21:52:07 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1629683183; h=from:subject:to:date:message-id;
 bh=bIizIrHcXtixAnY2HSX2eUm/Tb+YW80LXNGRaaT8LYA=;
 b=F700K/ra70X++iG14VIwgjkMtTWh9d/waECrZyKoWKWo5mrM8Q9sSv8KwKikmjgXYIaKj0IhQwH
 RV989PcAaZKfhLSYs9fIv6GHcLPW8xkQ0UB3ecJqeRlz2zlsQdNoLXzbwlPBAcwLZLjQqCZp2mrIu
 6/1jm+FbdmOcJofPoQo=
Received: from SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa]) by
 SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda%16]) with mapi id
 14.03.0408.000; Mon, 23 Aug 2021 09:46:22 +0800
From: "Liu, Renwei" <Renwei.Liu@verisilicon.com>
To: Eric Auger <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: [PATCH] hw/arm/smmuv3: Simplify range invalidation
Thread-Topic: [PATCH] hw/arm/smmuv3: Simplify range invalidation
Thread-Index: AdeXwKzI4zmU/Mw4Rty9EcTbk9iaGA==
Date: Mon, 23 Aug 2021 01:46:22 +0000
Message-ID: <4FA89A717CD8094DBA0FE20FA5F98EAA010E6E8841@SHASXM03.verisilicon.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.46.44]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--3.261400-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Received-SPF: pass client-ip=101.89.135.45;
 envelope-from=Renwei.Liu@verisilicon.com; helo=shasxm03.verisilicon.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 23 Aug 2021 01:10:40 -0400
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Li,
 Chunming" <Chunming.Li@verisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify range invalidation which can avoid to iterate over all
iotlb entries multi-times. For instance invalidations patterns like
"invalidate 32 4kB pages starting from 0xffacd000" need to iterate over
all iotlb entries 6 times (num_pages: 1, 2, 16, 8, 4, 1). It only needs
to iterate over all iotlb entries once with new implementation.

Signed-off-by: Renwei Liu <renwei.liu@verisilicon.com>
---
 hw/arm/smmu-common.c   |  6 +++---
 hw/arm/smmu-internal.h |  2 +-
 hw/arm/smmuv3.c        | 22 ++++------------------
 3 files changed, 8 insertions(+), 22 deletions(-)
 mode change 100644 =3D> 100755 hw/arm/smmu-common.c
 mode change 100644 =3D> 100755 hw/arm/smmu-internal.h
 mode change 100644 =3D> 100755 hw/arm/smmuv3.c

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
old mode 100644
new mode 100755
index 0459850a93..ccb085f83c
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -142,8 +142,8 @@ static gboolean smmu_hash_remove_by_asid_iova(gpointer =
key, gpointer value,
     if (info->asid >=3D 0 && info->asid !=3D SMMU_IOTLB_ASID(iotlb_key)) {
         return false;
     }
-    return ((info->iova & ~entry->addr_mask) =3D=3D entry->iova) ||
-           ((entry->iova & ~info->mask) =3D=3D info->iova);
+    return (entry->iova >=3D info->iova) &&
+           ((entry->iova + entry->addr_mask) < (info->iova + info->range))=
;
 }
=20
 inline void
@@ -167,7 +167,7 @@ smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t =
iova,
=20
     SMMUIOTLBPageInvInfo info =3D {
         .asid =3D asid, .iova =3D iova,
-        .mask =3D (num_pages * 1 << granule) - 1};
+        .range =3D num_pages * 1 << granule};
=20
     g_hash_table_foreach_remove(s->iotlb,
                                 smmu_hash_remove_by_asid_iova,
diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
old mode 100644
new mode 100755
index 2d75b31953..f0e3a777af
--- a/hw/arm/smmu-internal.h
+++ b/hw/arm/smmu-internal.h
@@ -101,7 +101,7 @@ uint64_t iova_level_offset(uint64_t iova, int inputsize=
,
 typedef struct SMMUIOTLBPageInvInfo {
     int asid;
     uint64_t iova;
-    uint64_t mask;
+    uint64_t range;
 } SMMUIOTLBPageInvInfo;
=20
 typedef struct SMMUSIDRange {
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
old mode 100644
new mode 100755
index 01b60bee49..0b009107d1
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -857,7 +857,7 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int=
 asid, dma_addr_t iova,
=20
 static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
 {
-    dma_addr_t end, addr =3D CMD_ADDR(cmd);
+    dma_addr_t addr =3D CMD_ADDR(cmd);
     uint8_t type =3D CMD_TYPE(cmd);
     uint16_t vmid =3D CMD_VMID(cmd);
     uint8_t scale =3D CMD_SCALE(cmd);
@@ -866,7 +866,6 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cm=
d)
     bool leaf =3D CMD_LEAF(cmd);
     uint8_t tg =3D CMD_TG(cmd);
     uint64_t num_pages;
-    uint8_t granule;
     int asid =3D -1;
=20
     if (type =3D=3D SMMU_CMD_TLBI_NH_VA) {
@@ -880,23 +879,10 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *=
cmd)
         return;
     }
=20
-    /* RIL in use */
-
     num_pages =3D (num + 1) * BIT_ULL(scale);
-    granule =3D tg * 2 + 10;
-
-    /* Split invalidations into ^2 range invalidations */
-    end =3D addr + (num_pages << granule) - 1;
-
-    while (addr !=3D end + 1) {
-        uint64_t mask =3D dma_aligned_pow2_mask(addr, end, 64);
-
-        num_pages =3D (mask + 1) >> granule;
-        trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, num_pages, ttl, =
leaf);
-        smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
-        smmu_iotlb_inv_iova(s, asid, addr, tg, num_pages, ttl);
-        addr +=3D mask + 1;
-    }
+    trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf=
);
+    smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
+    smmu_iotlb_inv_iova(s, asid, addr, tg, num_pages, ttl);
 }
=20
 static gboolean
--=20
2.32.0


