Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EBC433CBD
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:52:04 +0200 (CEST)
Received: from localhost ([::1]:43894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcsLL-00025u-Bu
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqz5-0005My-Ih
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:24:59 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:33356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqyx-0007ce-8e
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:24:59 -0400
Received: by mail-pl1-x62e.google.com with SMTP id y4so13943792plb.0
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 08:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C1T5Mwdpts89xr8x6xmc/boxWuJ+jcHTkvFs44ULios=;
 b=J3KFDQO1KWZxlGH+bunHXaCllB6INBYMD4w5rvMHeBxIFMOG+xBAf7CIVCvEKY6E2O
 14nBm0C0t9uYhnn/d2HeXxe33YE4ZYxyRX/qTnkHb2VcjyNtqAIizDkXiFZHS+uPO4DV
 XTsftCzlcs//1CXBxnx9PcaHqqXnvcLtUFtRC6BJg6D4APK/EGkOblsyVB/YUmyXv9Ii
 wepIZGFKNlbpR2pqlmGwxO3W/tksbkpLAsIz82mFPMDwJoF6nIMPOErLVJLMy3uLwFSp
 Yje99U8ngsuDGXgA3HwKNq6q/UXTChNsqmyyEiGTFrsuZXKr6Ciaq3qdxPBabZwsK2P8
 TRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C1T5Mwdpts89xr8x6xmc/boxWuJ+jcHTkvFs44ULios=;
 b=iMKsi8/ken0hubDxHpSbaVEk4IsbEnStJcEe/WmbIaxCGSc/1k0u5zusQagprmTrZY
 3aNHUE48hDdLm9Wpy56TCAfID6o90SaR1b20L3fcc5cMANXHnXgdNcmg8JGPGokz2gDO
 N1S0uk8dOUURqH2YjFLjdUYevad3ORi4IOgYlhW2amr1W7oW5gCv3lVfg1esxFAXuMRD
 hdvSJmmcOuwgHRs88QsXCj2JQA+OJAIdusBiEV8I1lcZjLtYMd6+xgoFbO/2gDZltFF2
 e/RF/v+GRwrRv7y4hwVCkB7MqjIhBlGoE/NMYr+ubVf4bgOtIkjS8Twi/BKZ+VIxux21
 XCRw==
X-Gm-Message-State: AOAM530w18C8tf+dleJ4+1m0LtctukWB3qyFeXncllVcw3xP7UDBUCTe
 A4IedbMRwW3jd5Szy4OI8se9RCYzm3uPKw==
X-Google-Smtp-Source: ABdhPJy3dwfc0/pB1cMx/xXpD+YGgW1wHJt1J+HGgaKSrY7+LVUgXmZF1LTtmAXeftG6/6UdPVb0sA==
X-Received: by 2002:a17:90b:33cb:: with SMTP id
 lk11mr649144pjb.0.1634657089914; 
 Tue, 19 Oct 2021 08:24:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i2sm3293814pjt.19.2021.10.19.08.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 08:24:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 15/16] target/riscv: Use riscv_csrrw_debug for cpu_dump
Date: Tue, 19 Oct 2021 08:24:37 -0700
Message-Id: <20211019152438.269077-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019152438.269077-1-richard.henderson@linaro.org>
References: <20211019152438.269077-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the official debug read interface to the csrs,
rather than referencing the env slots directly.
Put the list of csrs to dump into a table.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c | 90 +++++++++++++++++++++++-----------------------
 1 file changed, 46 insertions(+), 44 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f352c2b74c..3454b19c17 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -241,52 +241,54 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 #endif
     qemu_fprintf(f, " %-8s " TARGET_FMT_lx "\n", "pc", env->pc);
+
 #ifndef CONFIG_USER_ONLY
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ", env->mhartid);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", (target_ulong)env->mstatus);
-    if (riscv_cpu_mxl(env) == MXL_RV32) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatush ",
-                     (target_ulong)(env->mstatus >> 32));
+    {
+        static const int dump_csrs[] = {
+            CSR_MHARTID,
+            CSR_MSTATUS,
+            CSR_MSTATUSH,
+            CSR_HSTATUS,
+            CSR_VSSTATUS,
+            CSR_MIP,
+            CSR_MIE,
+            CSR_MIDELEG,
+            CSR_HIDELEG,
+            CSR_MEDELEG,
+            CSR_HEDELEG,
+            CSR_MTVEC,
+            CSR_STVEC,
+            CSR_VSTVEC,
+            CSR_MEPC,
+            CSR_SEPC,
+            CSR_VSEPC,
+            CSR_MCAUSE,
+            CSR_SCAUSE,
+            CSR_VSCAUSE,
+            CSR_MTVAL,
+            CSR_STVAL,
+            CSR_HTVAL,
+            CSR_MTVAL2,
+            CSR_MSCRATCH,
+            CSR_SSCRATCH,
+            CSR_SATP,
+        };
+
+        for (int i = 0; i < ARRAY_SIZE(dump_csrs); ++i) {
+            int csrno = dump_csrs[i];
+            target_ulong val = 0;
+            RISCVException res = riscv_csrrw_debug(env, csrno, &val, 0, 0);
+
+            /*
+             * Rely on the smode, hmode, etc, predicates within csr.c
+             * to do the filtering of the registers that are present.
+             */
+            if (res == RISCV_EXCP_NONE) {
+                qemu_fprintf(f, " %-8s " TARGET_FMT_lx "\n",
+                             csr_ops[csrno].name, val);
+            }
+        }
     }
-    if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hstatus ", env->hstatus);
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus ",
-                     (target_ulong)env->vsstatus);
-    }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mip     ", env->mip);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mie     ", env->mie);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mideleg ", env->mideleg);
-    if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hideleg ", env->hideleg);
-    }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "medeleg ", env->medeleg);
-    if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hedeleg ", env->hedeleg);
-    }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtvec   ", env->mtvec);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stvec   ", env->stvec);
-    if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vstvec  ", env->vstvec);
-    }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mepc    ", env->mepc);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "sepc    ", env->sepc);
-    if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsepc   ", env->vsepc);
-    }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mcause  ", env->mcause);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "scause  ", env->scause);
-    if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vscause ", env->vscause);
-    }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval   ", env->mtval);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval   ", env->stval);
-    if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "htval ", env->htval);
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval2 ", env->mtval2);
-    }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mscratch", env->mscratch);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "sscratch", env->sscratch);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "satp    ", env->satp);
 #endif
 
     for (i = 0; i < 32; i++) {
-- 
2.25.1


