Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A0464F3B9
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:09:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IaP-0000WF-Tk; Fri, 16 Dec 2022 16:49:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6IaO-0000VY-6i
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:49:44 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6IaM-0001h1-2t
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:49:43 -0500
Received: by mail-ej1-x62f.google.com with SMTP id ud5so9226237ejc.4
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YEOmiH6ZA2K4WWTAuLU3ov9+lPjBsfcIXnzt1rbZt/4=;
 b=laMhzE+AwsXrsrudqbScu2qa2Dylv82/F9Dqp34B3kL6Ij/CW9PPHWhTF/lxiqfjr7
 1KMswOW9ocC42drmC1WdDO+OQrzkloghkcxI3i7MXsET0Qequ5j9/rbJzI7Q8qN0HJih
 aUmWT96h3U8/uICs2Cyr6S8lJ10oLmJXJvZhCKp/XHboD/9k08NNoIFyANsoVu9Gxmp8
 1ZGn/1Zzj0Yr1cied7GGL2TjuEg3YTZGj1zfuGtrOwzx5iU5x6hmxYLmMVRnZepbOKbf
 zdZALytXaBwhzwGz/wQuvX0zNuQwdX9kTJh5V+nMnBq7V8XXTXi+sJxkpeDbo7XwKBnv
 HSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YEOmiH6ZA2K4WWTAuLU3ov9+lPjBsfcIXnzt1rbZt/4=;
 b=8MgqdlPuyS3qjIVWVe0231SH46tTL7ogipUoEhw+AyxgLwwaNuflBCyrbQw2N736Lv
 nirKdiuU1g05FuIxoCldN+3G+T2fHNd5d3XDSvO5eCFaeg/JDLz4KK/8hyilxqeFaCrg
 +Nj+es5TihHrSpzVzR8mN0OrIiut5j1Q182lxHsc3nETVbRtxYJppD70az7O5rOCqTZ1
 cZCa2UqOO8rbJUC6v1lnLhjEHLOaP4UuTA8HPzfcmRn0g0IlTl0By/3olOKEKGtPu1nF
 wRSxevhY2a4oIUp2HaC4KPJ8JRGawwnJ4Jvhmb6B4ivnFCGTqqPyLaPMEW/R64JPhyrW
 5E7A==
X-Gm-Message-State: ANoB5pnhDQyzeqBrOMlo+cNKJOX3k1K/ulOUQ+ZIkiqYGBfnn2U8SgKa
 GWejBxMuFO6ko3d0snlRmJPyfG8ZJfDC14VyVZQ=
X-Google-Smtp-Source: AA0mqf5Bl5dHW1gG5CdpiPptsdKzfB/xcZ7E4o9b9c2pcjovz2OME029SjAq4DfQ4vM7Eyqv52W/wQ==
X-Received: by 2002:a17:906:5509:b0:7b2:7ae8:3661 with SMTP id
 r9-20020a170906550900b007b27ae83661mr41769770ejp.21.1671227380452; 
 Fri, 16 Dec 2022 13:49:40 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 el14-20020a056402360e00b0046c5baa1f58sm1267640edb.97.2022.12.16.13.49.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 13:49:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/2] hw/arm/smmu-common: Avoid using inlined functions with
 external linkage
Date: Fri, 16 Dec 2022 22:49:24 +0100
Message-Id: <20221216214924.4711-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216214924.4711-1-philmd@linaro.org>
References: <20221216214924.4711-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
 hw/arm/smmu-common.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 9f196625a2..54186f31cb 100644
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
2.38.1


