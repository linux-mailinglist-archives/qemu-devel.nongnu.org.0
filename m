Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 503E661182B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:52:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooST7-0005vK-SG; Fri, 28 Oct 2022 12:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSSp-0002cf-Ix; Fri, 28 Oct 2022 12:44:11 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSSn-00011b-TD; Fri, 28 Oct 2022 12:44:11 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 t4-20020a9d7f84000000b00661c3d864f9so3278565otp.10; 
 Fri, 28 Oct 2022 09:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fkKD5NwF/AdGDH5rY2PB8WuM5fuyoDzb8BPGEhn1NZ4=;
 b=gffO2UE79xNytQdmUFwoCOw64GqPRwB4eMADF2pflSz+XjVbCddNACbwBo4OaQem4h
 c7kkCZWeLf3KvFMxrLFeCLZKX+OyVZCNU1UKQLVySMwrNWXNk+Hbp5wmGZI6TURgXsMa
 up2ls+BpxPMuxaZUqLSM5iU4HL2TlIoobJOH0z0gRFEAHQnFS3QHnEEDNk1SfhQSbQnp
 fTKCCZFVD2BbqgFt33edIEE2TzH4JTRIFcc6djVNcbU52BhtkXUsLKEKfSPmzYaE66OE
 7O98BHti8RfdQd5jL7/U4KxnU/hUaJ7670Yh39dmDm4ACI6fAIbVyFk0aIHKnAl/fFJ7
 MPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fkKD5NwF/AdGDH5rY2PB8WuM5fuyoDzb8BPGEhn1NZ4=;
 b=MapBfdYiSRXyo+5VduV4/H33OJ4z1u855K0EHsRwjX+KfKrYQ8WG6qKwxSbyMDeyha
 qd/ONd8ZlwBN2qGJQr4sHse1b1ueV7QcYqHX25ORvqQAQn8jtRLw3i0AdXQEa2+l5bQq
 ZmdKPnu8e4nSS3fVZ1UHZ2nHtx6imHoZHoD6AiRijITv+HRl1EABtJ0aJuixtDFMStHe
 Iodr1NWaWXKfPvnjrR9PYJY3xDtbydlZHnKbqqUyvEeAfNMlOKbabP0sVqrE7gul2KWl
 h7/XSRhe3ChEGnoYVgPQOIaofBAnYzXP/8ItWSFshqwiQn52Xtf0vTTpVsayP1h2ezC4
 g/xw==
X-Gm-Message-State: ACrzQf3UCGyeDhXqe1fmRkt0VhIRiE+zHW1+l9r+lHOG9VN5OfdZ7N+N
 f58W/nc28CzV3gQLygtIqAjCmA7tgBsR2g==
X-Google-Smtp-Source: AMsMyM7MtAdDNfezp+Iqz481+g2z8msnX6uAoTgdt9fk5Tc65ecGN54oAKjsPLNAAKDPqc8g5WpQUA==
X-Received: by 2002:a05:6830:1217:b0:661:c542:503c with SMTP id
 r23-20020a056830121700b00661c542503cmr136586otp.40.1666975448092; 
 Fri, 28 Oct 2022 09:44:08 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:44:06 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Leandro Lupori <leandro.lupori@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 56/62] target/ppc: Add new PMC HFLAGS
Date: Fri, 28 Oct 2022 13:39:45 -0300
Message-Id: <20221028163951.810456-57-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Leandro Lupori <leandro.lupori@eldorado.org.br>

Add 2 new PMC related HFLAGS:
- HFLAGS_PMCJCE - value of MMCR0 PMCjCE bit
- HFLAGS_PMC_OTHER - set if a PMC other than PMC5-6 is enabled

These flags allow further optimization of PMC5 update code, by
allowing frequently tested conditions to be performed at
translation time.

Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20221025202424.195984-3-leandro.lupori@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h         | 4 +++-
 target/ppc/helper_regs.c | 6 ++++++
 target/ppc/translate.c   | 4 ++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index cc2d0305ff..81d4263a07 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -696,7 +696,9 @@ enum {
     HFLAGS_PR = 14,  /* MSR_PR */
     HFLAGS_PMCC0 = 15,  /* MMCR0 PMCC bit 0 */
     HFLAGS_PMCC1 = 16,  /* MMCR0 PMCC bit 1 */
-    HFLAGS_INSN_CNT = 17, /* PMU instruction count enabled */
+    HFLAGS_PMCJCE = 17, /* MMCR0 PMCjCE bit */
+    HFLAGS_PMC_OTHER = 18, /* PMC other than PMC5-6 is enabled */
+    HFLAGS_INSN_CNT = 19, /* PMU instruction count enabled */
     HFLAGS_VSX = 23, /* MSR_VSX if cpu has VSX */
     HFLAGS_VR = 25,  /* MSR_VR if cpu has VRE */
 
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 2e85e124ab..c0aee5855b 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -109,6 +109,9 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
     if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMCC1) {
         hflags |= 1 << HFLAGS_PMCC1;
     }
+    if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMCjCE) {
+        hflags |= 1 << HFLAGS_PMCJCE;
+    }
 
 #ifndef CONFIG_USER_ONLY
     if (!env->has_hv_mode || (msr & (1ull << MSR_HV))) {
@@ -119,6 +122,9 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
     if (env->pmc_ins_cnt) {
         hflags |= 1 << HFLAGS_INSN_CNT;
     }
+    if (env->pmc_ins_cnt & 0x1e) {
+        hflags |= 1 << HFLAGS_PMC_OTHER;
+    }
 #endif
 
     /*
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 29e4b728e2..8d79522f98 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -177,6 +177,8 @@ struct DisasContext {
     bool hr;
     bool mmcr0_pmcc0;
     bool mmcr0_pmcc1;
+    bool mmcr0_pmcjce;
+    bool pmc_other;
     bool pmu_insn_cnt;
     ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
     int singlestep_enabled;
@@ -7512,6 +7514,8 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->hr = (hflags >> HFLAGS_HR) & 1;
     ctx->mmcr0_pmcc0 = (hflags >> HFLAGS_PMCC0) & 1;
     ctx->mmcr0_pmcc1 = (hflags >> HFLAGS_PMCC1) & 1;
+    ctx->mmcr0_pmcjce = (hflags >> HFLAGS_PMCJCE) & 1;
+    ctx->pmc_other = (hflags >> HFLAGS_PMC_OTHER) & 1;
     ctx->pmu_insn_cnt = (hflags >> HFLAGS_INSN_CNT) & 1;
 
     ctx->singlestep_enabled = 0;
-- 
2.37.3


