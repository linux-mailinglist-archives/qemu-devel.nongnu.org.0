Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3C065F23C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:08:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTMf-0001Lj-UM; Thu, 05 Jan 2023 11:45:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTMI-0000m7-0B
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:50 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTMC-0007Ss-Lq
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:48 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso1787135wmq.1
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NIfbKJ/3ZkCvJIhNz8wE2t2u1al6fnbpkmOv2zew4vY=;
 b=MAzC5WOQTyz31T9GyWYxgHhDqod4dRuoANpsKo05PnaKOpRtBQ0OynQFAD2vgFRvAv
 ewi2SLseQKhc4xziNLaWTPNfw08VOLf5wBUJwxbm2EKYtBESIznPeqE7YuLdCEA4fARs
 JylCfUxGodTkbJvxjdT4KykXfdEHfmr1TIVFix/V0IN6AiO6+lFSIDBnddwCehX/lFvw
 0xAGOIFkYKW5SxL7JRzfNzUQDXGK7cW7d8cknK9cPkFZYrjV6ev8H+hTCqZ7sfwU5OAm
 T0J3YPpkG1WFGcUhMQDEoEjGZMO6faPUw43rUd/dNmDGpQD0o4igDn+VOsTqM/4DZrK0
 yxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NIfbKJ/3ZkCvJIhNz8wE2t2u1al6fnbpkmOv2zew4vY=;
 b=rANS9RJwe0Nhz1XVgQ+ENZ0ItIWtYPhaoCJp9ZOxdwrB8dol9Qn2pwj+Z/lNefi7zj
 S9x4OVsa2MoAcwlw8IaVbykAOTU7Lp7dzsVaI8+ZfDDZVs5daPLCfYHUIAKrOIy6v/Gd
 +qknPmBh2etd6aJ9gFRthR0pAQnDfflt3RUdrQ2VUHw8m4Be86c6BV/XyNk8ohsvnKiQ
 V60Uj6qe3/YaiTbyrK6JHEOhmA8Iky2ozNVHtKHsdfpbtJUNTZ7+5DfAn1PmZselQybe
 Qq+drBDLDfeykpIUWBfKEE34Lwo4HtZUJBQHwfU0w3UOQowpaCu0bNXZIzsOICUcXub4
 CRhQ==
X-Gm-Message-State: AFqh2kpjSyKxa3oaFZwrtKa5w0CMFfIBwa8D6uvba0dD3EezrowOB2ka
 4anqamWA5iT7rrfXJABqoULSuzCeDmBd599c
X-Google-Smtp-Source: AMrXdXtyW3a/FpULxdv7zIcYfL5a0b80t5oeoPd4c2LCTTMj2hLx+Dc1XllXtm/Df3AQ/WGLT4OQPw==
X-Received: by 2002:a05:600c:1f18:b0:3cf:5583:8b3f with SMTP id
 bd24-20020a05600c1f1800b003cf55838b3fmr35524312wmb.20.1672937083374; 
 Thu, 05 Jan 2023 08:44:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/34] hw/arm/smmu-common: Avoid using inlined functions with
 external linkage
Date: Thu,  5 Jan 2023 16:44:12 +0000
Message-Id: <20230105164417.3994639-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

When using Clang ("Apple clang version 14.0.0 (clang-1400.0.29.202)")
and building with -Wall we get:

  hw/arm/smmu-common.c:173:33: warning: static function 'smmu_hash_remove_by_asid_iova' is used in an inline function with external linkage [-Wstatic-in-inline]
  hw/arm/smmu-common.h:170:1: note: use 'static' to give inline function 'smmu_iotlb_inv_iova' internal linkage
    void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
    ^
    static

None of our code base require / use inlined functions with external
linkage. Some places use internal inlining in the hot path. These
two functions are certainly not in any hot path and don't justify
any inlining, so these are likely oversights rather than intentional.

Reported-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20221216214924.4711-3-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmu-common.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 9f196625a2b..54186f31cb5 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -116,7 +116,7 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *new)
     g_hash_table_insert(bs->iotlb, key, new);
 }
 
-inline void smmu_iotlb_inv_all(SMMUState *s)
+void smmu_iotlb_inv_all(SMMUState *s)
 {
     trace_smmu_iotlb_inv_all();
     g_hash_table_remove_all(s->iotlb);
@@ -146,9 +146,8 @@ static gboolean smmu_hash_remove_by_asid_iova(gpointer key, gpointer value,
            ((entry->iova & ~info->mask) == info->iova);
 }
 
-inline void
-smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
-                    uint8_t tg, uint64_t num_pages, uint8_t ttl)
+void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
+                         uint8_t tg, uint64_t num_pages, uint8_t ttl)
 {
     /* if tg is not set we use 4KB range invalidation */
     uint8_t granule = tg ? tg * 2 + 10 : 12;
@@ -174,7 +173,7 @@ smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
                                 &info);
 }
 
-inline void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
+void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
 {
     trace_smmu_iotlb_inv_asid(asid);
     g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asid);
@@ -374,8 +373,8 @@ error:
  *
  * return 0 on success
  */
-inline int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
-                    SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
+int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
+             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
 {
     if (!cfg->aa64) {
         /*
-- 
2.25.1


