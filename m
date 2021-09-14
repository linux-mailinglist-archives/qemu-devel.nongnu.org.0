Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2536140A24E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 03:04:48 +0200 (CEST)
Received: from localhost ([::1]:57086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwsR-0007RO-7D
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 21:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6k-0001p4-TX
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:37 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:34636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6a-0007oc-SR
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:29 -0400
Received: by mail-pg1-x52e.google.com with SMTP id f129so11014027pgc.1
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lfHEU0h5Le847eX4DM1XEq9AMNUwFAkVQZGho6aNMI4=;
 b=bT0+pS5vnqmPXi4cUrsD6WaLpiF8ftnD4tWyBz5J7/ppVQp0ns6Y96Fu6EAt1r+eN2
 H0NXMYQsxG2xzYflPiNp38zZaM0We96Fhcwmdo/0khu6kL1beF87XYLwSEkn8ubnoFaW
 ZYH3ZWhxqgvgdHKhOCKyWrcb/kiC8vvxw+RO4Wfjrr5HWsAlA7h1QxVmGxx/NGZ30+RD
 X3GE0iIRNrOiHpeA7vNEZtfnf4RYXhNf+2t6mSGTe6hA7IIownreYYaeW1fBxtb4ioSY
 iUWfk3Miz5X/hxnCmdUh+p7dQHzWlfnCvJsBtOYzthBT28jKfLpgFshhEsZuka+Wnr2F
 we9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lfHEU0h5Le847eX4DM1XEq9AMNUwFAkVQZGho6aNMI4=;
 b=LmY2zEqx29IxdN2ckNz2pJtGOBFDeYpyoBytYZQUv4xcIuhpIBfgjnzvS6axSHPffD
 1g0Osg3KOaEDne2K58VT7E6yxLb3xAbYZkX8KBqrZLitjK51sV29hMR0zeZCxVgWnS35
 0lduJqKhL+0xrUa298576IKgXcqZRv8Htv1ga8Ko/kGcDmjR9Ul7M+wfnpPS1xYOupWE
 CbsD8lvnDUgFqZ3qW5kqUjcU8W1RPI1DGyOhxhxma7TVwhBfGc+c0Lq8JLpWWa730K0T
 otiWtRijna5DhEVfNl3gTDHi+WdEexv00mfvCIhOaf446VkqojV+bcMRtCOWVnarFWNu
 oG4A==
X-Gm-Message-State: AOAM531ZAGAPe/gADdglTg8dsBtIT0Z1FDVfld1S9ILPwJ/sEkn4GnOK
 ZobuovWcSBPKs8qzQJDfCvlt0Oug6447iQ==
X-Google-Smtp-Source: ABdhPJwVZykISQkNVTguCCJeJa3JUyTLnOEEUu8kVpZ15gw6c4dHv/+OZAnlL5Wt99ViJgOLPR14ig==
X-Received: by 2002:a62:51c6:0:b0:43d:e849:c69d with SMTP id
 f189-20020a6251c6000000b0043de849c69dmr2038528pfb.31.1631578519439; 
 Mon, 13 Sep 2021 17:15:19 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/44] target/rx: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Mon, 13 Sep 2021 17:14:41 -0700
Message-Id: <20210914001456.793490-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210911165434.531552-22-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/cpu.h    | 2 ++
 target/rx/cpu.c    | 2 +-
 target/rx/helper.c | 4 ++++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 0b4b998c7b..faa3606f52 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -124,8 +124,10 @@ typedef RXCPU ArchCPU;
 #define CPU_RESOLVING_TYPE TYPE_RX_CPU
 
 const char *rx_crname(uint8_t cr);
+#ifndef CONFIG_USER_ONLY
 void rx_cpu_do_interrupt(CPUState *cpu);
 bool rx_cpu_exec_interrupt(CPUState *cpu, int int_req);
+#endif /* !CONFIG_USER_ONLY */
 void rx_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 int rx_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int rx_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 96cc96e514..25a4aa2976 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -186,10 +186,10 @@ static const struct SysemuCPUOps rx_sysemu_ops = {
 static const struct TCGCPUOps rx_tcg_ops = {
     .initialize = rx_translate_init,
     .synchronize_from_tb = rx_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = rx_cpu_exec_interrupt,
     .tlb_fill = rx_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = rx_cpu_exec_interrupt,
     .do_interrupt = rx_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
 };
diff --git a/target/rx/helper.c b/target/rx/helper.c
index db6b07e389..f34945e7e2 100644
--- a/target/rx/helper.c
+++ b/target/rx/helper.c
@@ -40,6 +40,8 @@ void rx_cpu_unpack_psw(CPURXState *env, uint32_t psw, int rte)
     env->psw_c = FIELD_EX32(psw, PSW, C);
 }
 
+#ifndef CONFIG_USER_ONLY
+
 #define INT_FLAGS (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIR)
 void rx_cpu_do_interrupt(CPUState *cs)
 {
@@ -142,6 +144,8 @@ bool rx_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 hwaddr rx_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 {
     return addr;
-- 
2.25.1


