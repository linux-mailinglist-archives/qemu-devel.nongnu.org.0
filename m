Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EB565F18B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:56:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTM0-0000Wr-Sd; Thu, 05 Jan 2023 11:44:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTLy-0000Sv-IC
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:30 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTLv-0007NS-9t
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:29 -0500
Received: by mail-wm1-x32a.google.com with SMTP id ay40so28486885wmb.2
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ng4n7caOd1N7rKPRAQimra3XDjGA4Dk/t3YXksN0GKU=;
 b=ps3q43XhTsM6WIcrZTzz4bXFINYGUjaivSP07xcM/UCSeGOy57Ns1bcausVy40IJId
 W0yiiD0wwtBM8wwdTC/uGHlcT0xEqODzBea7bXFSRyhhY3BQda9v/Jz+43hYIra7ADxp
 AAVPgMwrnzj02oE0e5q4SSq9I+z3OPXkT8DCntjzK+y+yJ5Yj5ikpgBg7kO9jJa4TvSD
 BM73vsbSLZv6J95Jfr1p+ZuLc75JdlhdHX/YuRgWCr3LxMMuKEhyiqMFRR35sZFTLTXb
 VBYRnPuo7ZJ7Fr583Mv4hK8Q3QPr4cu9aRhGRFlMqX+33Cvi8/kRcnLkBM6KbLICtfho
 5lcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ng4n7caOd1N7rKPRAQimra3XDjGA4Dk/t3YXksN0GKU=;
 b=mMx/M3cohBRt1jkbepj1nfyuujax4jdr5nyKM/9g88WFCygRhzKQu7icFmjQCK9y40
 Pg1+PPrXIumRbat42lkznRhIpfpOUkuHWEXWuA/+gZltKOmhkeoLMieoZa7y2LmF38ET
 bocAI0dH7Nj0BlBEePckqZ1kksYUVW9vSeh9F4KHwqzrCCSsv3PlWdiKqaU+xKs7d+Bw
 om2IP7b7Vw7eYBYVBnqGxVOV6hRotp9mXWo6bgeoPyQySQ8sHSDc8vxWknjOLgVycMdd
 LsqqjTJHLKAZHhJ6bLcMkxMK7d+Uni2Cz2Vcl5nBHFlwXFQ3ogEeEpaCVv1U4xoDD33A
 kImA==
X-Gm-Message-State: AFqh2krvLC13dvOQLTxRefRxh2cJZyNq9ye5jo9EaQyZ6z71tQjDDqaT
 AKrXujgr6c8cI4fwV7ndPIVGOBv8sknE/pBK
X-Google-Smtp-Source: AMrXdXvkU6YLSEq9uvZ+u1m0ecLgwlb+HSHA9gkWWzRFcvgQiQdXKVOp9g2axT8U2VuHGnNAjTSj1A==
X-Received: by 2002:a05:600c:4191:b0:3d7:9ae7:e4f2 with SMTP id
 p17-20020a05600c419100b003d79ae7e4f2mr38940905wmh.35.1672937066045; 
 Thu, 05 Jan 2023 08:44:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/34] target/arm: Add ARM Cortex-R52 CPU
Date: Thu,  5 Jan 2023 16:43:51 +0000
Message-Id: <20230105164417.3994639-9-peter.maydell@linaro.org>
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

From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>

All constants are taken from the ARM Cortex-R52 Processor TRM Revision: r1p3

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20221206102504.165775-8-tobias.roehmel@rwth-aachen.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu_tcg.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 568cbcfc524..ccde5080eb7 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -854,6 +854,47 @@ static void cortex_r5_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortexr5_cp_reginfo);
 }
 
+static void cortex_r52_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_PMSA);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    cpu->midr = 0x411fd133; /* r1p3 */
+    cpu->revidr = 0x00000000;
+    cpu->reset_fpsid = 0x41034023;
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x12111111;
+    cpu->isar.mvfr2 = 0x00000043;
+    cpu->ctr = 0x8144c004;
+    cpu->reset_sctlr = 0x30c50838;
+    cpu->isar.id_pfr0 = 0x00000131;
+    cpu->isar.id_pfr1 = 0x10111001;
+    cpu->isar.id_dfr0 = 0x03010006;
+    cpu->id_afr0 = 0x00000000;
+    cpu->isar.id_mmfr0 = 0x00211040;
+    cpu->isar.id_mmfr1 = 0x40000000;
+    cpu->isar.id_mmfr2 = 0x01200000;
+    cpu->isar.id_mmfr3 = 0xf0102211;
+    cpu->isar.id_mmfr4 = 0x00000010;
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232142;
+    cpu->isar.id_isar3 = 0x01112131;
+    cpu->isar.id_isar4 = 0x00010142;
+    cpu->isar.id_isar5 = 0x00010001;
+    cpu->isar.dbgdidr = 0x77168000;
+    cpu->clidr = (1 << 27) | (1 << 24) | 0x3;
+    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
+    cpu->ccsidr[1] = 0x201fe00a; /* 32KB L1 icache */
+
+    cpu->pmsav7_dregion = 16;
+    cpu->pmsav8r_hdregion = 16;
+}
+
 static void cortex_r5f_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1163,6 +1204,7 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
                              .class_init = arm_v7m_class_init },
     { .name = "cortex-r5",   .initfn = cortex_r5_initfn },
     { .name = "cortex-r5f",  .initfn = cortex_r5f_initfn },
+    { .name = "cortex-r52",  .initfn = cortex_r52_initfn },
     { .name = "ti925t",      .initfn = ti925t_initfn },
     { .name = "sa1100",      .initfn = sa1100_initfn },
     { .name = "sa1110",      .initfn = sa1110_initfn },
-- 
2.25.1


