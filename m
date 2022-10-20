Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAD46066AE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:06:52 +0200 (CEST)
Received: from localhost ([::1]:56566 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZ0F-0003Mt-0U
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:06:43 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYpu-00070x-56
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYi-0001Ik-9q
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:02 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYe-0000xv-EL
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:21:59 -0400
Received: by mail-wr1-x429.google.com with SMTP id a10so34045375wrm.12
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/DWuBYa4aOb60ht8o7znjRMzmxCMgDkX1ptiBmDXkhs=;
 b=Jdf0IsHMa1IVJl3mJHI9VEq6Kjmu/2jmclHspRJ22W5DZaS8g/FAKjsYMgjyAVFm4y
 pHcP4I1lfYLkUlsLpMYrSJqUi+GBGavQ5xP95BvxUr+tWf53pWjoOkobxnRCKlAcNUKC
 N7wsKYojsRq/VnI17GA35zsC06/NZy0FJXe+4CE9kcPRZRkU0cPstBGroa3KsmPxnuFn
 sGJ9EZToz7wnhQzOOpPaeEB0RHVEWtvCll5Z4AY3Q4ljX3Q2XvCXUjXWcmr6UP7Me0cf
 YM3oCvNW/AWr/zk6nZWcA1ih1OoAM2sm6x5oyDJqCK0z7DC0yZFtdB/VL+vg2E5BPX+H
 iycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/DWuBYa4aOb60ht8o7znjRMzmxCMgDkX1ptiBmDXkhs=;
 b=U8vyjh6P3ZklaA7PvgOvYcmiqVYlqYXz/8MnxyfnhidVAaUc3yhOqKCB5oHDgqhI1v
 W3wycouJsjl31mkHu6r2XbKYltGdvrX408V1AYjqnzumPEPkQKIW3g1XSgCUqqGMGoV4
 i9JxXFm70410Gbieve/EInDebEECrw7pySFWtoMH/EKfR6iBfhCIpdpGTnKguCET2T4I
 Ax5pcMiM3LN+C8V2PvjrQm6bCGLBEaW1fqFKlis2nSMxY4KVNc9pv0jh7PSUR7elCJBj
 BdZEsbjrMxjggKQiUkPMbyO7FfmEXNb58WriOpvzgAX0C2nkQZAXJW7KT4ofDd2OWADD
 m8VA==
X-Gm-Message-State: ACrzQf1r+jWcoGeoeaHFmqbtR4cM/Dnxwh2sSB6jxAk+3e3PPqE9MWOV
 +XyJ3wpVdfiFaQur0UoNpLPja1oRmjaEKA==
X-Google-Smtp-Source: AMsMyM5TQezJdIP57tTlPvFHFSjzc9mhGpzVv4qIFQjBgRLMCdVm1oO3WnobsVetesohX8eBqWKJOw==
X-Received: by 2002:a5d:6387:0:b0:22f:1880:d68e with SMTP id
 p7-20020a5d6387000000b0022f1880d68emr8265251wru.322.1666268512733; 
 Thu, 20 Oct 2022 05:21:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm16520192wrs.53.2022.10.20.05.21.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:21:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/24] target/arm: Enable TARGET_PAGE_ENTRY_EXTRA
Date: Thu, 20 Oct 2022 13:21:25 +0100
Message-Id: <20221020122146.3177980-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020122146.3177980-1-peter.maydell@linaro.org>
References: <20221020122146.3177980-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Copy attrs and shareability, into the TLB.  This will eventually
be used by S1_ptw_translate to report stage1 translation failures,
and by do_ats_write to fill in PAR_EL1.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221011031911.2408754-2-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu-param.h  | 12 ++++++++++++
 target/arm/tlb_helper.c |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 08681828ac4..38347b0d208 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -30,6 +30,18 @@
  */
 # define TARGET_PAGE_BITS_VARY
 # define TARGET_PAGE_BITS_MIN  10
+
+/*
+ * Cache the attrs and shareability fields from the page table entry.
+ *
+ * For ARMMMUIdx_Stage2*, pte_attrs is the S2 descriptor bits [5:2].
+ * Otherwise, pte_attrs is the same as the MAIR_EL1 8-bit format.
+ * For shareability, as in the SH field of the VMSAv8-64 PTEs.
+ */
+# define TARGET_PAGE_ENTRY_EXTRA  \
+     uint8_t pte_attrs;           \
+     uint8_t shareability;
+
 #endif
 
 #define NB_MMU_MODES 8
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 49601394ec1..353edbeb1de 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -236,6 +236,9 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             arm_tlb_mte_tagged(&res.f.attrs) = true;
         }
 
+        res.f.pte_attrs = res.cacheattrs.attrs;
+        res.f.shareability = res.cacheattrs.shareability;
+
         tlb_set_page_full(cs, mmu_idx, address, &res.f);
         return true;
     } else if (probe) {
-- 
2.25.1


