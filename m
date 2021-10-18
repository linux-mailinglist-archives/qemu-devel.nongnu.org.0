Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF6B430D3A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 03:05:24 +0200 (CEST)
Received: from localhost ([::1]:39428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcH5d-0000ko-Nv
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 21:05:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2G-0006M4-FL; Sun, 17 Oct 2021 21:01:52 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a]:33395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2C-00009w-74; Sun, 17 Oct 2021 21:01:52 -0400
Received: by mail-ua1-x92a.google.com with SMTP id i15so2010244uap.0;
 Sun, 17 Oct 2021 18:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7hEts6owz/MoxbfBw+3jz6iXo5GERS/EWgUpoLMlsqc=;
 b=XM+36S1hdZAvjLDiWZnBLNLzdfguszm+/BhCYWjvc0queminjbbirY1YyGg84Ua5Ti
 LrDmexXC2Lr28hJdiI89bklnSNbgvT7jB2rr7sDl84azpYpLiax/J+y2yg+oXG3ce4jN
 gmrMBAucpM6z+aMAaEa5AS9h8Q0D6aEsAjHVj+fWh6M8NpMrDXLzItGm6osPrssRrMkF
 AOlRf8BL4h5TQmCLq9MHhFeKW/lVkGpeufG4je1E6GEJgcU1DVl0KFNJ5mIFTM89KKo6
 p7z/ByTr2RO88dKaJAR/ljzRWGRXkJ74CSrna1AkU99s4QJFnCtl75Y4nDlwmnyfBpIk
 NHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7hEts6owz/MoxbfBw+3jz6iXo5GERS/EWgUpoLMlsqc=;
 b=np+3b7OOOlvgFT716SS1euw+nuA2MQHBndigEYaYpqq93MCn3EFmkqkKLpVW/uuPiJ
 cQ3CPqM+ve+LYgkRpO4Ct0uOXonB2hp8p6Bgy6EVEEeur82HHwmDuBw+f5l48Bm/FYwH
 XgKEcNqhvbTt6pt/SiULw1wamHCO1pxm36q7Dq2sNfVQgz24Eu4JYxkQ3nWYuhrhxbfl
 qgOx4aF5V+m5Am74//32b0vRSiVRxD2ybopE3hJ2lRKawdLsFjYDDqUX8nUSp3MNGIBh
 DANU6yHjwwcCiMVMFDieNDp0ghbxyFfoJkiCoXPWv92CvnBmSaWAYvgAcX0wTa6UWLiT
 Ihyg==
X-Gm-Message-State: AOAM531t5xZ42a4f+9FoxBCL7bsoMgBYT/btZSEr7gu1b3nZkE8+1aj8
 eGDlHJUMIW+IZDZbCVTIaYGDaskWhQ8=
X-Google-Smtp-Source: ABdhPJzRtW5gnjrbBFclcvdXT/N/6HNaASn0xtqlY9FjLNW0EPqwo0oo9GZx7YG5L/SP/IVGK0Zs8g==
X-Received: by 2002:ab0:58c1:: with SMTP id r1mr23059498uac.89.1634518906959; 
 Sun, 17 Oct 2021 18:01:46 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.137.170])
 by smtp.gmail.com with ESMTPSA id m15sm8271607vsh.31.2021.10.17.18.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 18:01:46 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/15] target/ppc: add MMCR0 PMCC bits to hflags
Date: Sun, 17 Oct 2021 22:01:19 -0300
Message-Id: <20211018010133.315842-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018010133.315842-1-danielhb413@gmail.com>
References: <20211018010133.315842-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92a.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 clg@kaod.org, matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're going to add PMU support for TCG PPC64 chips, based on IBM POWER8+
emulation and following PowerISA v3.1. This requires several PMU related
registers to be exposed to userspace (problem state). PowerISA v3.1
dictates that the PMCC bits of the MMCR0 register controls the level of
access of the PMU registers to problem state.

This patch start things off by exposing both PMCC bits to hflags,
allowing us to access them via DisasContext in the read/write callbacks
that we're going to add next.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h         | 6 ++++++
 target/ppc/helper_regs.c | 6 ++++++
 target/ppc/translate.c   | 4 ++++
 3 files changed, 16 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index baa4e7c34d..0df1a5a970 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -342,6 +342,10 @@ typedef struct ppc_v3_pate_t {
 #define MSR_RI   1  /* Recoverable interrupt                        1        */
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
+/* PMU bits */
+#define MMCR0_PMCC0  PPC_BIT(44)         /* PMC Control bit 0 */
+#define MMCR0_PMCC1  PPC_BIT(45)         /* PMC Control bit 1 */
+
 /* LPCR bits */
 #define LPCR_VPM0         PPC_BIT(0)
 #define LPCR_VPM1         PPC_BIT(1)
@@ -607,6 +611,8 @@ enum {
     HFLAGS_SE = 10,  /* MSR_SE -- from elsewhere on embedded ppc */
     HFLAGS_FP = 13,  /* MSR_FP */
     HFLAGS_PR = 14,  /* MSR_PR */
+    HFLAGS_PMCC0 = 15,  /* MMCR0 PMCC bit 0 */
+    HFLAGS_PMCC1 = 16,  /* MMCR0 PMCC bit 1 */
     HFLAGS_VSX = 23, /* MSR_VSX if cpu has VSX */
     HFLAGS_VR = 25,  /* MSR_VR if cpu has VRE */
 
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 1bfb480ecf..99562edd57 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -109,6 +109,12 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
     if (env->spr[SPR_LPCR] & LPCR_HR) {
         hflags |= 1 << HFLAGS_HR;
     }
+    if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMCC0) {
+        hflags |= 1 << HFLAGS_PMCC0;
+    }
+    if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMCC1) {
+        hflags |= 1 << HFLAGS_PMCC1;
+    }
 
 #ifndef CONFIG_USER_ONLY
     if (!env->has_hv_mode || (msr & (1ull << MSR_HV))) {
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 9ca78ee156..70ae4bda92 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -176,6 +176,8 @@ struct DisasContext {
     bool tm_enabled;
     bool gtse;
     bool hr;
+    bool mmcr0_pmcc0;
+    bool mmcr0_pmcc1;
     ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
     int singlestep_enabled;
     uint32_t flags;
@@ -8559,6 +8561,8 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->tm_enabled = (hflags >> HFLAGS_TM) & 1;
     ctx->gtse = (hflags >> HFLAGS_GTSE) & 1;
     ctx->hr = (hflags >> HFLAGS_HR) & 1;
+    ctx->mmcr0_pmcc0 = (hflags >> HFLAGS_PMCC0) & 1;
+    ctx->mmcr0_pmcc1 = (hflags >> HFLAGS_PMCC1) & 1;
 
     ctx->singlestep_enabled = 0;
     if ((hflags >> HFLAGS_SE) & 1) {
-- 
2.31.1


