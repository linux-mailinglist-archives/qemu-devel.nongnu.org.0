Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A36CD4C1F14
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:49:08 +0100 (CET)
Received: from localhost ([::1]:46230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN0RX-0002sJ-PA
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:49:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0B3-00078S-Er
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:32:05 -0500
Received: from [2607:f8b0:4864:20::1036] (port=40522
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0Az-0001Ge-TS
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:32:04 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 em10-20020a17090b014a00b001bc3071f921so3970800pjb.5
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 14:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uavi3yQmU7TEij7jJpcySVBC3+TVvlm3sHX3b1s1W6c=;
 b=E4feHmkw/CmFwD/8fElw2/hS3oCNmfdUHVZDn3IWXTB7dIjgwUZi0XJAmOQNRegIrz
 28lSFtVcpbFJhChctH0KvNC6hhURRAY5Y+axEGoOwMJNodSBAsf25ZxjXk81nUgVgeGy
 vB8IvZTfWPkecl0hniL82TztDa6Uhpn1wtVqm8sRb5PVVGnJfDP70d0ewDYpgY0Oalaz
 EDD2JnlE3+OOfSXF5Wsoea459gs7XrxGteBsSFR+WrrcOx5Pcovx23uz3tAFri6Z8I05
 k5kUIvFx7L9vInfJi69uv8Wg1ZdFiqH/jy6zrk3Ht9qmwQkxv2V8nIQ760oIyzeUyDDv
 Vr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uavi3yQmU7TEij7jJpcySVBC3+TVvlm3sHX3b1s1W6c=;
 b=ITX5ud7LzKTbrRHC/3bXvhfCyXf3atnL/QzA3lEPD2yUmPlyLo3BFFazsiT4axZdJ+
 iRNEVuIXxBtbk6FvQlc0E+SpSbgnXF0GyxJhVoJxrP57MB8RI/sN2346WFu2AF4m0pMg
 LGwfjpXU1LNvK5sSy4JuIcMdicLIw5cdyVTHgsJhfT/f/Cx3FiRpzkjSL+ExHQiXhSFH
 2E3n7ONnPVFQBEKfzaanjpnee6gjawIFyrMPbXmTe5zIBx6x1nJ1cjMuigHdzSMb19bP
 RQDlWj0e63eJOaHZwau6m7RvejRgFaaru/vE/XBK1ZrCuRq98u14xds486KLKpzeQsI9
 toPQ==
X-Gm-Message-State: AOAM531waA4L92CuXj6OnWyviyBVtVJ+OA/JoKHx7sllRXzEO9mx23CL
 uLMLtPF+1nRd/Zj2SQ9X31AYKbeq9AwM5g==
X-Google-Smtp-Source: ABdhPJxb4tQh/Aqc00UJdkf3ZPWL5HdNfaPw1YifBNDGI05bexFevqqPyY+XrbGa6GviaQhGQvIuog==
X-Received: by 2002:a17:90b:d91:b0:1bc:ade1:54e3 with SMTP id
 bg17-20020a17090b0d9100b001bcade154e3mr3020272pjb.8.1645655520073; 
 Wed, 23 Feb 2022 14:32:00 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 14:31:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/17] target/arm: Introduce tlbi_aa64_get_range
Date: Wed, 23 Feb 2022 12:31:32 -1000
Message-Id: <20220223223137.114264-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Merge tlbi_aa64_range_get_length and tlbi_aa64_range_get_base,
returning a structure containing both results.  Pass in the
ARMMMUIdx, rather than the digested two_ranges boolean.

This is in preparation for FEAT_LPA2, where the interpretation
of 'value' depends on the effective value of DS for the regime.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 58 +++++++++++++++++++--------------------------
 1 file changed, 24 insertions(+), 34 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 950f56599e..31c2a716f2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4511,70 +4511,60 @@ static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 }
 
 #ifdef TARGET_AARCH64
-static uint64_t tlbi_aa64_range_get_length(CPUARMState *env,
-                                           uint64_t value)
-{
-    unsigned int page_shift;
-    unsigned int page_size_granule;
-    uint64_t num;
-    uint64_t scale;
-    uint64_t exponent;
+typedef struct {
+    uint64_t base;
     uint64_t length;
+} TLBIRange;
+
+static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
+                                     uint64_t value)
+{
+    unsigned int page_size_granule, page_shift, num, scale, exponent;
+    TLBIRange ret = { };
 
-    num = extract64(value, 39, 5);
-    scale = extract64(value, 44, 2);
     page_size_granule = extract64(value, 46, 2);
 
     if (page_size_granule == 0) {
         qemu_log_mask(LOG_GUEST_ERROR, "Invalid page size granule %d\n",
                       page_size_granule);
-        return 0;
+        return ret;
     }
 
     page_shift = (page_size_granule - 1) * 2 + 12;
-
+    num = extract64(value, 39, 5);
+    scale = extract64(value, 44, 2);
     exponent = (5 * scale) + 1;
-    length = (num + 1) << (exponent + page_shift);
 
-    return length;
-}
+    ret.length = (num + 1) << (exponent + page_shift);
 
-static uint64_t tlbi_aa64_range_get_base(CPUARMState *env, uint64_t value,
-                                        bool two_ranges)
-{
-    /* TODO: ARMv8.7 FEAT_LPA2 */
-    uint64_t pageaddr;
-
-    if (two_ranges) {
-        pageaddr = sextract64(value, 0, 37) << TARGET_PAGE_BITS;
+    if (regime_has_2_ranges(mmuidx)) {
+        ret.base = sextract64(value, 0, 37) << TARGET_PAGE_BITS;
     } else {
-        pageaddr = extract64(value, 0, 37) << TARGET_PAGE_BITS;
+        ret.base = extract64(value, 0, 37) << TARGET_PAGE_BITS;
     }
 
-    return pageaddr;
+    return ret;
 }
 
 static void do_rvae_write(CPUARMState *env, uint64_t value,
                           int idxmap, bool synced)
 {
     ARMMMUIdx one_idx = ARM_MMU_IDX_A | ctz32(idxmap);
-    bool two_ranges = regime_has_2_ranges(one_idx);
-    uint64_t baseaddr, length;
+    TLBIRange range;
     int bits;
 
-    baseaddr = tlbi_aa64_range_get_base(env, value, two_ranges);
-    length = tlbi_aa64_range_get_length(env, value);
-    bits = tlbbits_for_regime(env, one_idx, baseaddr);
+    range = tlbi_aa64_get_range(env, one_idx, value);
+    bits = tlbbits_for_regime(env, one_idx, range.base);
 
     if (synced) {
         tlb_flush_range_by_mmuidx_all_cpus_synced(env_cpu(env),
-                                                  baseaddr,
-                                                  length,
+                                                  range.base,
+                                                  range.length,
                                                   idxmap,
                                                   bits);
     } else {
-        tlb_flush_range_by_mmuidx(env_cpu(env), baseaddr,
-                                  length, idxmap, bits);
+        tlb_flush_range_by_mmuidx(env_cpu(env), range.base,
+                                  range.length, idxmap, bits);
     }
 }
 
-- 
2.25.1


