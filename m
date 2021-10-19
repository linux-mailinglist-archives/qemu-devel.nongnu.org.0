Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5904432B20
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 02:14:34 +0200 (CEST)
Received: from localhost ([::1]:54710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mccm1-00044L-Pd
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 20:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZT-000525-FV
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 20:01:35 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:36421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZG-0001mi-92
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 20:01:35 -0400
Received: by mail-pf1-x42c.google.com with SMTP id m26so16059401pff.3
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 17:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Uy+EMg3VuLMVRYQKBMZoT0zq//rHXap3pUqZ5CBHGc=;
 b=T9mvGZ1HotAqhPr7Qz4XIks4xqUpqgDzXrLpEZOEPa23ccHbxvTxSl4izWudwdx8OW
 fO8B668eULvZGL50+uQVwP3Ess4u76l9OlN83bqqYDE+vY6aDg8UFp/Av5+cATSDxhqx
 osU0bYTbJY8dcMrvOny+Vlz6HaPxRfULk4RJ3zAmDLbu8PMHRilUzYPA8OaUQeML/TN3
 YCxlslP4cbfyDcb/lYwGXk+53YC6nbkz/srUottFmm/8b2b4zfDvkZk1nfglCNrdFmyT
 UHHseDToPgwPkIOGlHyRmr/Rr/6fDkxtQHmC+YPxVO8Drspa2DfOyLVeUeDefHpIaFOY
 GrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Uy+EMg3VuLMVRYQKBMZoT0zq//rHXap3pUqZ5CBHGc=;
 b=VM3seK4Fv5x2cheusqxl5Nlm+8sT1hiwlbjtoX+FgighbOUKhlUoaBgqZqrtz2G/Fj
 EAx331oaM/it0i5GI1kYPjmmYnMWxl5s7/3BfPqdDJtVXvayyiA9GPR/F4TA1hdRhuQx
 6pt4zi11PjAR9HsZktW6nL/2sAb/d6dQa9ufpTj7he8b6dyA60FKdOGD2rPYfbyb2Clf
 /XSkAmS1NUlkEOz1qhyARZeAE3K+qQfXNgvtvIPJ3sIOFE36w6PjaVErwQjN4ZsPbFH/
 zVqJCDJK7qQN56WSmL2a+aTXzJlE/XyxVN0ayP2OyZZ6EZxTCOQ7H4P6mjbdaJCPzuFf
 eodQ==
X-Gm-Message-State: AOAM533u9C8El92lXYDuS4WTRRHNWbNIoJFQws3runLuuvAVUElCpCAQ
 h/NaOrpUXLTcxWKNEvpYnZQP4/VXgN0rIg==
X-Google-Smtp-Source: ABdhPJx4e97axyzkE2xgZ43LwxrRqq+8Du68zpAI+MGpSrojmPpkkFtLebDR+FMq0ydXKf75CwJl9Q==
X-Received: by 2002:a65:6a0f:: with SMTP id m15mr26313241pgu.298.1634601680630; 
 Mon, 18 Oct 2021 17:01:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q14sm3068220pfk.3.2021.10.18.17.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 17:01:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/16] target/riscv: Use riscv_csrrw_debug for cpu_dump
Date: Mon, 18 Oct 2021 17:01:07 -0700
Message-Id: <20211019000108.3678724-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019000108.3678724-1-richard.henderson@linaro.org>
References: <20211019000108.3678724-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
 target/riscv/cpu.c | 99 +++++++++++++++++++++++++---------------------
 1 file changed, 55 insertions(+), 44 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f352c2b74c..b81b880900 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -241,52 +241,63 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
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
+        static const struct {
+            const char *name;
+            int csrno;
+            int misa;
+            bool rv32;
+        } dump_csrs[] = {
+            { "mhartid",    CSR_MHARTID },
+            { "mstatus",    CSR_MSTATUS },
+            { "mstatush",   CSR_MSTATUSH, 0, true },
+            { "hstatus",    CSR_HSTATUS,  RVH },
+            { "vsstatus",   CSR_VSSTATUS, RVH },
+            { "mip",        CSR_MIP },
+            { "mie",        CSR_MIE },
+            { "mideleg",    CSR_MIDELEG },
+            { "hideleg",    CSR_HIDELEG,  RVH },
+            { "medeleg",    CSR_MEDELEG },
+            { "hedeleg",    CSR_HEDELEG,  RVH },
+            { "mtvec",      CSR_MTVEC },
+            { "stvec",      CSR_STVEC },
+            { "vstvec",     CSR_VSTVEC,   RVH },
+            { "mepc",       CSR_MEPC },
+            { "sepc",       CSR_SEPC },
+            { "vsepc",      CSR_VSEPC,    RVH },
+            { "mcause",     CSR_MCAUSE },
+            { "scause",     CSR_SCAUSE },
+            { "vscause",    CSR_VSCAUSE,  RVH },
+            { "mtval",      CSR_MTVAL },
+            { "stval",      CSR_STVAL },
+            { "htval",      CSR_HTVAL,    RVH },
+            { "mtval2",     CSR_MTVAL2,   RVH },
+            { "mscratch",   CSR_MSCRATCH },
+            { "sscratch",   CSR_SSCRATCH },
+            { "satp",       CSR_SATP},
+        };
+
+        bool rv32 = riscv_cpu_mxl(env) == MXL_RV32;
+
+        for (int i = 0; i < ARRAY_SIZE(dump_csrs); ++i) {
+            target_ulong val = 0;
+            RISCVException result;
+
+            if (dump_csrs[i].misa && !riscv_has_ext(env, dump_csrs[i].misa)) {
+                continue;
+            }
+            if (dump_csrs[i].rv32 && !rv32) {
+                continue;
+            }
+
+            result = riscv_csrrw_debug(env, dump_csrs[i].csrno, &val, 0, 0);
+            assert(result == RISCV_EXCP_NONE);
+            qemu_fprintf(f, " %-8s " TARGET_FMT_lx "\n",
+                         dump_csrs[i].name, val);
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


