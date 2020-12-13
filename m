Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AFC2D9080
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:27:42 +0100 (CET)
Received: from localhost ([::1]:42100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koXy1-00046I-3c
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:27:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXro-0002i2-Rp
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:21:16 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXrn-0005Zb-7D
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:21:16 -0500
Received: by mail-wm1-x331.google.com with SMTP id q75so13417398wme.2
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BwBCSJKUs74AgI90rgGgJ5DnyTy76Cwmh6AmTQxT6D8=;
 b=mrwpFWGC/8qrenEQFhf/VblmOHmQoA6rejjcRRVDeYwpRb49BQO8vN8IeucQNyvrtF
 f8YuxMsC/iKs1KnLM42AK032qwQW6l08i6+WiyZDZK6g6QWF4NM+9+VGOd3vLxmT/7Qi
 ccFby7l/TiVjCbtXYXFPy+2pgJoFqeSrI59iqIwfv3HsS6nVHPMaVXFf5lZVFu7AX39r
 jWGdRsJxAltvakb4Mt5uDaC8KH3wT0ikuaV+GraTYk0xm8X5YbCOlXXnM2oGq16xiT8y
 vnVMGbcFrCJe28hJIbBHmyESd2jtuTxLLL7rxUCjjEMqKleKO1LzwlpHA9T4SRG4Yxtb
 dHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BwBCSJKUs74AgI90rgGgJ5DnyTy76Cwmh6AmTQxT6D8=;
 b=sT2eltwSrpyYSrEuiUKdPip3+7TSMqVUfFtxYBJo2OuBz/+Aq629DHkZhgRHQZDldt
 l5QhdueYhdU8Z1kY89s5iMgRF7eqQQKofg7qFua+Qyd3eHX9wI8EMidJ0pfrjdFcauj/
 J2K5u+LnXEsbbk9yBeQ63GD+NybWKbbGpLqP1Ngk1KE33TI5fIicYv5+AWK7RLYHbjkG
 D9Op6j5pRpsVNwykRKR+dBE3W+dmeTcEIBYCV9sj+nor5rvGizBJHE/VNlPTbaIgdjiw
 e+V/M1mJPJcqHcVpuxS2uHELDevi2Qv7JG1dbOFpjVqBm6IhAeSx4iapweIuXyC1W8zj
 5Qww==
X-Gm-Message-State: AOAM531rWO5im0u4MXgDB4lQrItlelbsPpWQn57zBjySbTBt3SIgITq8
 J8IALgD33vpepGgDdS9Jqg4a08t5Bms=
X-Google-Smtp-Source: ABdhPJyjCdeXDlFSxrZSqJn/AgC7v3c15fguzRGYdbHseBQtSeIjGz1sP0ZJiYfQIPcPfGi/6wFVDw==
X-Received: by 2002:a1c:2288:: with SMTP id i130mr24700600wmi.78.1607890873572; 
 Sun, 13 Dec 2020 12:21:13 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id h184sm28789455wmh.23.2020.12.13.12.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:21:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/26] target/mips: Introduce ase_mt_available() helper
Date: Sun, 13 Dec 2020 21:19:37 +0100
Message-Id: <20201213201946.236123-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213201946.236123-1-f4bug@amsat.org>
References: <20201213201946.236123-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of accessing CP0_Config3 directly and checking
the 'Multi-Threading Present' bit, introduce an helper
to simplify code review.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201204222622.2743175-3-f4bug@amsat.org>
---
 target/mips/cpu.h        | 7 +++++++
 hw/mips/cps.c            | 3 +--
 target/mips/cp0_helper.c | 2 +-
 target/mips/cpu.c        | 2 +-
 target/mips/helper.c     | 2 +-
 target/mips/translate.c  | 2 +-
 6 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 5d3b2a01c01..3ac21d0e9c0 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1289,6 +1289,13 @@ int cpu_mips_signal_handler(int host_signum, void *pinfo, void *puc);
 bool cpu_type_supports_cps_smp(const char *cpu_type);
 bool cpu_supports_isa(const CPUMIPSState *env, uint64_t isa_mask);
 bool cpu_type_supports_isa(const char *cpu_type, uint64_t isa);
+
+/* Check presence of multi-threading ASE implementation */
+static inline bool ase_mt_available(CPUMIPSState *env)
+{
+    return env->CP0_Config3 & (1 << CP0C3_MT);
+}
+
 void cpu_set_exception_base(int vp_index, target_ulong address);
 
 /* addr.c */
diff --git a/hw/mips/cps.c b/hw/mips/cps.c
index 962b1b0b87c..7a0d289efaf 100644
--- a/hw/mips/cps.c
+++ b/hw/mips/cps.c
@@ -58,8 +58,7 @@ static void main_cpu_reset(void *opaque)
 
 static bool cpu_mips_itu_supported(CPUMIPSState *env)
 {
-    bool is_mt = (env->CP0_Config5 & (1 << CP0C5_VP)) ||
-                 (env->CP0_Config3 & (1 << CP0C3_MT));
+    bool is_mt = (env->CP0_Config5 & (1 << CP0C5_VP)) || ase_mt_available(env);
 
     return is_mt && !kvm_enabled();
 }
diff --git a/target/mips/cp0_helper.c b/target/mips/cp0_helper.c
index cb899fe3d73..36a92857bfb 100644
--- a/target/mips/cp0_helper.c
+++ b/target/mips/cp0_helper.c
@@ -1164,7 +1164,7 @@ void helper_mtc0_entryhi(CPUMIPSState *env, target_ulong arg1)
     old = env->CP0_EntryHi;
     val = (arg1 & mask) | (old & ~mask);
     env->CP0_EntryHi = val;
-    if (env->CP0_Config3 & (1 << CP0C3_MT)) {
+    if (ase_mt_available(env)) {
         sync_c0_entryhi(env, env->current_tc);
     }
     /* If the ASID changes, flush qemu's TLB.  */
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 687e2680dd1..9d7edc1ca21 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -74,7 +74,7 @@ static bool mips_cpu_has_work(CPUState *cs)
     }
 
     /* MIPS-MT has the ability to halt the CPU.  */
-    if (env->CP0_Config3 & (1 << CP0C3_MT)) {
+    if (ase_mt_available(env)) {
         /*
          * The QEMU model will issue an _WAKE request whenever the CPUs
          * should be woken up.
diff --git a/target/mips/helper.c b/target/mips/helper.c
index 59de58fcbc9..0c657865793 100644
--- a/target/mips/helper.c
+++ b/target/mips/helper.c
@@ -419,7 +419,7 @@ void cpu_mips_store_status(CPUMIPSState *env, target_ulong val)
         tlb_flush(env_cpu(env));
     }
 #endif
-    if (env->CP0_Config3 & (1 << CP0C3_MT)) {
+    if (ase_mt_available(env)) {
         sync_c0_status(env, env, env->current_tc);
     } else {
         compute_hflags(env);
diff --git a/target/mips/translate.c b/target/mips/translate.c
index f218997f049..ccc82abce04 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -31917,7 +31917,7 @@ void cpu_state_reset(CPUMIPSState *env)
 
     cpu_mips_store_count(env, 1);
 
-    if (env->CP0_Config3 & (1 << CP0C3_MT)) {
+    if (ase_mt_available(env)) {
         int i;
 
         /* Only TC0 on VPE 0 starts as active.  */
-- 
2.26.2


