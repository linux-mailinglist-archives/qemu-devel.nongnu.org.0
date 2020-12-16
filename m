Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B03882DC199
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 14:51:26 +0100 (CET)
Received: from localhost ([::1]:49698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpXDB-0008L1-PV
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 08:51:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpX5k-0000UB-5u
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:43:44 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpX5i-0005NT-FJ
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:43:43 -0500
Received: by mail-wr1-x431.google.com with SMTP id y17so23206928wrr.10
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 05:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OBt9eJBX3pTIBLp30XCH/Bjd/stHNhDGzJ5XaGYAJJU=;
 b=t9MfVhMxMbWgQASEuCwaYR1S1dHxFdFpRmdQvdPlIvsdornJbuG7dMa4xSBeu7iqDB
 bpG3UFiJgLSERb0A5BnwXWnctQKWppNP6XHEZ+t0IoDGuWfaT7hvazakFWXmT0CTErrj
 rFQYdw2RG9uCipgQKZ9kb1zb/rpEBf+1nweqIFLSeb/71XB1ZtOvRa2apqeJUCQo3c52
 6v3fqo2nV+w8Xx8Zyb5pI3WNm24joIuN79/Y9nE6Mz8U6MhN4KWtliyuKmyJWU9bqM/Y
 +M9lG26QoSorVqg/1jCo83vChZKxvGgCOsMyt6znYuuQb0tpy834X/o/hCO/2FIFmqZS
 8AGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OBt9eJBX3pTIBLp30XCH/Bjd/stHNhDGzJ5XaGYAJJU=;
 b=mkJ8GS9UTCbtcvG4dxwM7r6TqZVxdPSjeg+hCJPRbx2lglNbwT8nGaoh/3OKS6z23e
 mHnZLvZERtfnwd54klU8hetgqXoOsPlIGmNSdwL9rU0hhltGj6uJ655zbL9yYJjV9dsc
 2NuVS6IgGqBsyITVyAV2BZwKnq9UntPZh5GP0ZqoBHgSlK0ow459nqA3WrXR6oka+S8i
 6rc3RHEexJBAoRKGJWTRGgRT8MeFJySfk5qorpzjP0ut6qYSGrqXkkY3lVgbzp1crysZ
 HOfywA6vNjuCaxh9sZ3KZ5V7CBNGJDVoGOIK6HIQo0GOFO0DdGyPSFWZ4++DFYkb4nuY
 3ACw==
X-Gm-Message-State: AOAM530p88bmgX1UEI+ziU0j7KaCQyNr+N7VZ2hkpJaoZNkwxwa9mGh1
 ItquTGVaY5vSroDlc59Cg6QEtLhCQXs=
X-Google-Smtp-Source: ABdhPJyFlaeC39Lw8FBllcb4uKna9cveR3MqU4YbpW33QC8ubtsim0bKbvynd1uC6G1w13jNmlpEOA==
X-Received: by 2002:adf:9d49:: with SMTP id o9mr39344000wre.413.1608126220968; 
 Wed, 16 Dec 2020 05:43:40 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id o13sm2685057wmc.44.2020.12.16.05.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 05:43:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/11] target/mips/mips-defs: Use ISA_MIPS3 for ISA_MIPS64
Date: Wed, 16 Dec 2020 14:43:19 +0100
Message-Id: <20201216134328.851840-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201216134328.851840-1-f4bug@amsat.org>
References: <20201216134328.851840-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 Paul Burton <paulburton@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MIPS 64-bit ISA is introduced with MIPS3.
No need for another bit/definition to check for 64-bit.

Simplify CPU_MIPS64 definition as CPU_MIPS5 contains
CPU_MIPS4 which contains CPU_MIPS3 which contains ISA_MIPS3.

Suggested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h |  5 ++---
 hw/mips/boston.c        |  2 +-
 target/mips/translate.c | 10 +++++-----
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index f4d76e562d1..2756e72a9d6 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -19,12 +19,11 @@
  */
 #define ISA_MIPS1         0x0000000000000001ULL
 #define ISA_MIPS2         0x0000000000000002ULL
-#define ISA_MIPS3         0x0000000000000004ULL
+#define ISA_MIPS3         0x0000000000000004ULL /* 64-bit */
 #define ISA_MIPS4         0x0000000000000008ULL
 #define ISA_MIPS5         0x0000000000000010ULL
 #define ISA_MIPS32        0x0000000000000020ULL
 #define ISA_MIPS32R2      0x0000000000000040ULL
-#define ISA_MIPS64        0x0000000000000080ULL
 #define ISA_MIPS64R2      0x0000000000000100ULL
 #define ISA_MIPS32R3      0x0000000000000200ULL
 #define ISA_MIPS64R3      0x0000000000000400ULL
@@ -78,7 +77,7 @@
 
 /* MIPS Technologies "Release 1" */
 #define CPU_MIPS32      (CPU_MIPS2 | ISA_MIPS32)
-#define CPU_MIPS64      (CPU_MIPS5 | CPU_MIPS32 | ISA_MIPS64)
+#define CPU_MIPS64      (CPU_MIPS5 | CPU_MIPS32)
 
 /* MIPS Technologies "Release 2" */
 #define CPU_MIPS32R2    (CPU_MIPS32 | ISA_MIPS32R2)
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index c3b94c68e1b..f44f681fab5 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -463,7 +463,7 @@ static void boston_mach_init(MachineState *machine)
         exit(1);
     }
 
-    is_64b = cpu_type_supports_isa(machine->cpu_type, ISA_MIPS64);
+    is_64b = cpu_type_supports_isa(machine->cpu_type, ISA_MIPS3);
 
     object_initialize_child(OBJECT(machine), "cps", &s->cps, TYPE_MIPS_CPS);
     object_property_set_str(OBJECT(&s->cps), "cpu-type", machine->cpu_type,
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 15265485f76..8c0ecfa17e1 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -8538,7 +8538,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     const char *register_name = "invalid";
 
     if (sel != 0) {
-        check_insn(ctx, ISA_MIPS64);
+        check_insn(ctx, ISA_MIPS3);
     }
 
     switch (reg) {
@@ -9264,7 +9264,7 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     const char *register_name = "invalid";
 
     if (sel != 0) {
-        check_insn(ctx, ISA_MIPS64);
+        check_insn(ctx, ISA_MIPS3);
     }
 
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
@@ -14502,12 +14502,12 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
                 break;
 #if defined(TARGET_MIPS64)
             case RR_RY_CNVT_ZEW:
-                check_insn(ctx, ISA_MIPS64);
+                check_insn(ctx, ISA_MIPS3);
                 check_mips_64(ctx);
                 tcg_gen_ext32u_tl(cpu_gpr[rx], cpu_gpr[rx]);
                 break;
             case RR_RY_CNVT_SEW:
-                check_insn(ctx, ISA_MIPS64);
+                check_insn(ctx, ISA_MIPS3);
                 check_mips_64(ctx);
                 tcg_gen_ext32s_tl(cpu_gpr[rx], cpu_gpr[rx]);
                 break;
@@ -27203,7 +27203,7 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
 #if defined(TARGET_MIPS64)
     case OPC_DCLO:
     case OPC_DCLZ:
-        check_insn(ctx, ISA_MIPS64);
+        check_insn(ctx, ISA_MIPS3);
         check_mips_64(ctx);
         gen_cl(ctx, op1, rd, rs);
         break;
-- 
2.26.2


