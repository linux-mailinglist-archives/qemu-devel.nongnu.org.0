Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE2059078A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 22:47:26 +0200 (CEST)
Received: from localhost ([::1]:37954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMF5Q-0005mR-WC
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 16:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <furquan@rivosinc.com>)
 id 1oMEzd-0003yw-KI
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 16:41:25 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:44938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <furquan@rivosinc.com>)
 id 1oMEzV-0005jl-I8
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 16:41:19 -0400
Received: by mail-pf1-x42d.google.com with SMTP id h28so17425586pfq.11
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 13:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=0N4nP6kWOkSVDN5AS7NAV6lK9AvoNJvZoVvifNo6cBw=;
 b=5Y0mVsHDNZSiHjMxnxtHsGBMoX1GWgkjDFI4/pJI+tRSl80ehnkQCP0r+YTNA5qPJP
 jlpXhm2qrUvfaBgHLVUjFwyZn0VzXUMkg4+Bv96uOh8E8cMGdExi9RVmJItb9l4C23GJ
 3pMimrsJTbAjO7qhxppXo2BNY9Dl5RbuTkBLZlijHXtutTBnON0mgdfb9ve6RO3wd/NN
 4M0JP6WBNTTBYS5KZofDcAh71KavmastlohZS5IF6zmIP47K16mVygU/JXJyhW/pdRsE
 AM9HpZ0gYs2YjMOARGw3srfCD1oWNV68xeBhsz8jYHoTPHbK2MeWQWQh8qllWeJaqU8z
 ZYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=0N4nP6kWOkSVDN5AS7NAV6lK9AvoNJvZoVvifNo6cBw=;
 b=FU+EaV9kxHHxhnFg15oLcUlXiLveu8d2VOikZ0dcF+DNXi4kZyiR0l7CP+pi1HpnIq
 b162upU62CLZex5v+GmQZNOxYMbBfC6BVSdKmvm/eCYfryhDH158tvmzgohhnOEaGP67
 TBR8mZ82XTxqVhybcAT9oJwuIR3GwJL2eAq2u5nXA9VljKti/dlFiyOUxHuxHVvZFoks
 2HqipuNc3Wyl9wVEwWxzBTEokF+FpjYsCqnM1805D+SqncUG2LVE70xK+SicEbkpmvEi
 V28r2MjD2SqkeyP8XoBDq0Z1GxoqhXHWNe4/EYjvjUEjpR6rSRIh7v7bQAzKsuxDeti9
 907A==
X-Gm-Message-State: ACgBeo2WNB1fdIFayW0ohYG0A6AWu35tb0j35QFsF/Yq0/cm+Tv2i0f+
 c9LNrDWyoT3YXFaRmJhDToORM+yQaPMv0zurFHGc2A==
X-Google-Smtp-Source: AA6agR6aHJJ3Kmql+modxaf9kffw6wlIt+LE3gD2Ib23h9bHOnhS1qdHXQVofEXNhIh1AEaxY0fhSqIl4BtlAKtuq6U=
X-Received: by 2002:a05:6a00:10cf:b0:528:48c3:79e0 with SMTP id
 d15-20020a056a0010cf00b0052848c379e0mr866756pfu.18.1660250475200; Thu, 11 Aug
 2022 13:41:15 -0700 (PDT)
MIME-Version: 1.0
From: Furquan Shaikh <furquan@rivosinc.com>
Date: Thu, 11 Aug 2022 13:41:04 -0700
Message-ID: <CA+tJHD7FcrBTetGRO0vZn-XGPmZmQraMrw1dw9ia6jzHQniB0w@mail.gmail.com>
Subject: [PATCH] riscv: Make semihosting configurable for all privilege modes
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=furquan@rivosinc.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 Aug 2022 16:43:28 -0400
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

Unlike ARM, RISC-V does not define a separate breakpoint type for
semihosting. Instead, it is entirely ABI. Thus, we need an option
to allow users to configure what the ebreak behavior should be for
different privilege levels - M, S, U, VS, VU. As per the RISC-V
privilege specification[1], ebreak traps into the execution
environment. However, RISC-V debug specification[2] provides
ebreak{m,s,u,vs,vu} configuration bits to allow ebreak behavior to
be configured to trap into debug mode instead. This change adds
settable properties for RISC-V CPUs - `ebreakm`, `ebreaks`, `ebreaku`,
`ebreakvs` and `ebreakvu` to allow user to configure whether qemu
should treat ebreak as semihosting traps or trap according to the
privilege specification.

[1] https://github.com/riscv/riscv-isa-manual/releases/download/draft-20220723-10eea63/riscv-privileged.pdf
[2] https://github.com/riscv/riscv-debug-spec/blob/release/riscv-debug-release.pdf

Signed-off-by: Furquan Shaikh <furquan@rivosinc.com>
---
 target/riscv/cpu.c        |  8 ++++++++
 target/riscv/cpu.h        |  7 +++++++
 target/riscv/cpu_helper.c | 26 +++++++++++++++++++++++++-
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ac6f82ebd0..082194652b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -953,6 +953,14 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("short-isa-string", RISCVCPU,
cfg.short_isa_string, false),

     DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
+
+    /* Debug spec */
+    DEFINE_PROP_BOOL("ebreakm", RISCVCPU, cfg.ebreakm, true),
+    DEFINE_PROP_BOOL("ebreaks", RISCVCPU, cfg.ebreaks, false),
+    DEFINE_PROP_BOOL("ebreaku", RISCVCPU, cfg.ebreaku, false),
+    DEFINE_PROP_BOOL("ebreakvs", RISCVCPU, cfg.ebreakvs, false),
+    DEFINE_PROP_BOOL("ebreakvu", RISCVCPU, cfg.ebreakvu, false),
+
     DEFINE_PROP_END_OF_LIST(),
 };

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5c7acc055a..eee8e487a6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -454,6 +454,13 @@ struct RISCVCPUConfig {
     bool epmp;
     bool aia;
     bool debug;
+
+    /* Debug spec */
+    bool ebreakm;
+    bool ebreaks;
+    bool ebreaku;
+    bool ebreakvs;
+    bool ebreakvu;
     uint64_t resetvec;

     bool short_isa_string;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 59b3680b1b..be09abbe27 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1314,6 +1314,30 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr
address, int size,

     return true;
 }
+
+static bool semihosting_enabled(RISCVCPU *cpu)
+{
+    CPURISCVState *env = &cpu->env;
+
+    switch (env->priv) {
+    case PRV_M:
+        return cpu->cfg.ebreakm;
+    case PRV_S:
+        if (riscv_cpu_virt_enabled(env)) {
+            return cpu->cfg.ebreakvs;
+        } else {
+            return cpu->cfg.ebreaks;
+        }
+    case PRV_U:
+        if (riscv_cpu_virt_enabled(env)) {
+            return cpu->cfg.ebreakvu;
+        } else {
+            return cpu->cfg.ebreaku;
+        }
+    }
+
+    return false;
+}
 #endif /* !CONFIG_USER_ONLY */

 /*
@@ -1342,7 +1366,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     target_ulong mtval2 = 0;

     if  (cause == RISCV_EXCP_SEMIHOST) {
-        if (env->priv >= PRV_S) {
+        if (semihosting_enabled(cpu)) {
             do_common_semihosting(cs);
             env->pc += 4;
             return;
--
2.34.1

