Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B738230D77
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 17:16:20 +0200 (CEST)
Received: from localhost ([::1]:59276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0RL1-0000ic-0z
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 11:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1k0RFp-0000XK-DJ
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 11:10:57 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:57036
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1k0RFm-000836-RE
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 11:10:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595949053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+FCzgHmXiuU6rMRVcaVlslV/fEexjYvhaArIyICSvqM=;
 b=e+0Gos4u4McCmsT9j1IN3iJkRaDiA5QI8lWdSALu621JzafGWpJhtbF5X/fT+NJWqsO0am
 yI7kLfG155T+aqUHUkIZE5PjxAQlFTilh/DIP4Fa/MoFYlRmZduuDziyCTbEiG4FyRKXvp
 9avNG7NAogiy61pryQWMDEE2f3VvFUc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-x2SwA-VNMHW-XCJH3Xig1g-1; Tue, 28 Jul 2020 11:10:51 -0400
X-MC-Unique: x2SwA-VNMHW-XCJH3Xig1g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9250379EC7;
 Tue, 28 Jul 2020 15:10:49 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-203.ams2.redhat.com [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F9E769328;
 Tue, 28 Jul 2020 15:10:42 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com
Subject: [PATCH for-5.2 v4 10/11] hw/arm/smmuv3: Support HAD and advertise
 SMMUv3.1 support
Date: Tue, 28 Jul 2020 17:08:14 +0200
Message-Id: <20200728150815.11446-11-eric.auger@redhat.com>
In-Reply-To: <20200728150815.11446-1-eric.auger@redhat.com>
References: <20200728150815.11446-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 10:31:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: jean-philippe@linaro.org, robh@kernel.org, robin.murphy@arm.com,
 mst@redhat.com, zhangfei.gao@foxmail.com, shameerali.kolothum.thodi@huawei.com,
 will@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

HAD is a mandatory features with SMMUv3.1 if S1P is set, which is
our case. Other 3.1 mandatory features come with S2P which we don't
have.

So let's support HAD and advertise SMMUv3.1 support in AIDR.

HAD support allows the CD to disable hierarchical attributes, ie.
if the HAD0/1 bit is set, the APTable field of table descriptors
walked through TTB0/1 is ignored.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmuv3-internal.h     | 2 ++
 include/hw/arm/smmu-common.h | 1 +
 hw/arm/smmu-common.c         | 2 +-
 hw/arm/smmuv3.c              | 6 +++++-
 hw/arm/trace-events          | 2 +-
 5 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index bd34a4f330..9ae7d97faf 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -54,6 +54,7 @@ REG32(IDR1,                0x4)
 
 REG32(IDR2,                0x8)
 REG32(IDR3,                0xc)
+     FIELD(IDR3, HAD,         2, 1);
 REG32(IDR4,                0x10)
 REG32(IDR5,                0x14)
      FIELD(IDR5, OAS,         0, 3);
@@ -578,6 +579,7 @@ static inline int pa_range(STE *ste)
         lo = (x)->word[(sel) * 2 + 2] & ~0xfULL;            \
         hi | lo;                                            \
     })
+#define CD_HAD(x, sel)   extract32((x)->word[(sel) * 2 + 2], 1, 1)
 
 #define CD_TSZ(x, sel)   extract32((x)->word[0], (16 * (sel)) + 0, 6)
 #define CD_TG(x, sel)    extract32((x)->word[0], (16 * (sel)) + 6, 2)
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 4f6acf634c..880dccd7c0 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -50,6 +50,7 @@ typedef struct SMMUTransTableInfo {
     uint64_t ttb;              /* TT base address */
     uint8_t tsz;               /* input range, ie. 2^(64 -tsz)*/
     uint8_t granule_sz;        /* granule page shift */
+    bool had;                  /* hierarchical attribute disable */
 } SMMUTransTableInfo;
 
 typedef struct SMMUTLBEntry {
diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 8d89a86699..3838db1395 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -316,7 +316,7 @@ static int smmu_ptw_64(SMMUTransCfg *cfg,
         if (is_table_pte(pte, level)) {
             ap = PTE_APTABLE(pte);
 
-            if (is_permission_fault(ap, perm)) {
+            if (is_permission_fault(ap, perm) && !tt->had) {
                 info->type = SMMU_PTW_ERR_PERMISSION;
                 goto error;
             }
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 718f28462e..b262f0e4a7 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -254,6 +254,8 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->idr[1] = FIELD_DP32(s->idr[1], IDR1, EVENTQS, SMMU_EVENTQS);
     s->idr[1] = FIELD_DP32(s->idr[1], IDR1, CMDQS,   SMMU_CMDQS);
 
+    s->idr[3] = FIELD_DP32(s->idr[3], IDR3, HAD, 1);
+
    /* 4K and 64K granule support */
     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
@@ -270,6 +272,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
 
     s->features = 0;
     s->sid_split = 0;
+    s->aidr = 0x1;
 }
 
 static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
@@ -506,7 +509,8 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
         if (tt->ttb & ~(MAKE_64BIT_MASK(0, cfg->oas))) {
             goto bad_cd;
         }
-        trace_smmuv3_decode_cd_tt(i, tt->tsz, tt->ttb, tt->granule_sz);
+        tt->had = CD_HAD(cd, i);
+        trace_smmuv3_decode_cd_tt(i, tt->tsz, tt->ttb, tt->granule_sz, tt->had);
     }
 
     event->record_trans_faults = CD_R(cd);
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 3d905e0f7d..c8a4d80f6b 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -39,7 +39,7 @@ smmuv3_translate_abort(const char *n, uint16_t sid, uint64_t addr, bool is_write
 smmuv3_translate_success(const char *n, uint16_t sid, uint64_t iova, uint64_t translated, int perm) "%s sid=%d iova=0x%"PRIx64" translated=0x%"PRIx64" perm=0x%x"
 smmuv3_get_cd(uint64_t addr) "CD addr: 0x%"PRIx64
 smmuv3_decode_cd(uint32_t oas) "oas=%d"
-smmuv3_decode_cd_tt(int i, uint32_t tsz, uint64_t ttb, uint32_t granule_sz) "TT[%d]:tsz:%d ttb:0x%"PRIx64" granule_sz:%d"
+smmuv3_decode_cd_tt(int i, uint32_t tsz, uint64_t ttb, uint32_t granule_sz, bool had) "TT[%d]:tsz:%d ttb:0x%"PRIx64" granule_sz:%d had:%d"
 smmuv3_cmdq_cfgi_ste(int streamid) "streamid =%d"
 smmuv3_cmdq_cfgi_ste_range(int start, int end) "start=0x%d - end=0x%d"
 smmuv3_cmdq_cfgi_cd(uint32_t sid) "streamid = %d"
-- 
2.21.3


