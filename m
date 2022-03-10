Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDAD4D46CF
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:26:20 +0100 (CET)
Received: from localhost ([::1]:40582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHs3-0007X7-BT
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:26:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxq-0006KZ-Ht
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:28:14 -0500
Received: from [2607:f8b0:4864:20::62f] (port=47055
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxo-00083z-Ds
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:28:13 -0500
Received: by mail-pl1-x62f.google.com with SMTP id w4so4560095ply.13
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LTuw5YwD7AAqbGDKsXNMlzx47tIusaHPWNHDAjQuUEg=;
 b=Hl+PbNhubeLhz963N5yNtLp0Vln4ixO4efwemAj7Q7Gfv5gN177fqK+69jmfFI55SQ
 ieFrAht5Kv08VZmz2peZdGT6MGYYqkTo5oDH0lbBUpgWPldawIlUn0PTBoBaOe+SZQYU
 n1GAZHgu1lK6hdviOSEUKs0mh4QWja7II6YCyEGdQuEdaITdz4HCDxkGZHPrcHm+7mVM
 3kKISdZoeO3XNNA3ysw1mSchUzSNIBXenqPXSHrXLAhhuvmdh4PfoXyYW9nW6KUkjhgs
 eGLhrOmWIylI1PrMuRbwYDD3dDShnjpXF1IOq7d5MULttSVdFFoFfa7l2gsyKqHagI46
 9IWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LTuw5YwD7AAqbGDKsXNMlzx47tIusaHPWNHDAjQuUEg=;
 b=i8NCPTjjk2HumkBvA3fCha93+XrUYLpVppGEl6ukXCSNlzr/PcP4fktpfqmG10ermv
 tOB2rzWhYyGICsCY1NVShL9vxeVLW2vWQc2hucJ97ZnKU1SkQPN+pn7AgILh9xzYX6U3
 sDzLSTS3oorq0VorEVJo/d88sIlhN0Ze18PS0AqeUapMvgl5e2TUVuQ8bilCcJ1u08kD
 SW+zBuON2Gu4vZUl9+WdU7ad/RDjI4VKJJD3kIP+tl+t8sREEPAA5puN4P18jNQ8I89Q
 QQfSZqME9fBlkYDIbmsB3KCM9HPLDrDhcqaec0mmPn/WhI676QmFdlPSUMVbDDPVlLqA
 N6MQ==
X-Gm-Message-State: AOAM530ajzWcZVRrmoCa9favmcwPkorIst9nvR8u0XNyF2WbgkXDS/Fp
 FrRqA0ZgASZ6WTWQghx9elnhM9R2I/mntg==
X-Google-Smtp-Source: ABdhPJzFmv3JXKD+4rYYQAWKoREO5BA9yUUZRPyqYE70wfWT2iH+IBcsj06h5WGiYkLSHw985SgXZg==
X-Received: by 2002:a17:90b:1e0a:b0:1bf:4d46:741c with SMTP id
 pg10-20020a17090b1e0a00b001bf4d46741cmr15430919pjb.116.1646911691197; 
 Thu, 10 Mar 2022 03:28:11 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:28:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 39/48] target/nios2: Implement Misaligned destination
 exception
Date: Thu, 10 Mar 2022 03:27:16 -0800
Message-Id: <20220310112725.570053-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Indirect branches, plus eret and bret optionally raise
an exception when branching to a misaligned address.
The exception is required when an mmu is enabled, but
enable it always because the fallback behaviour is not
documented (though presumably it discards low bits).

For the purposes of the linux-user cpu loop, if EXCP_UNALIGN
(misaligned data) were to arrive, it would be treated the
same as EXCP_UNALIGND (misaligned destination).  See the
!defined(CONFIG_NIOS2_ALIGNMENT_TRAP) block in kernel/traps.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c |  6 ++++++
 target/nios2/op_helper.c    |  9 ++++++++-
 target/nios2/translate.c    | 15 ++++++++++++++-
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index ea364b7d1f..67220128aa 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -43,6 +43,12 @@ void cpu_loop(CPUNios2State *env)
             force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->pc);
             break;
 
+        case EXCP_UNALIGN:
+        case EXCP_UNALIGND:
+            force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN,
+                            env->ctrl[CR_BADADDR]);
+            break;
+
         case EXCP_TRAP:
             switch (env->error_code) {
             case 0:
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index c93b66c9aa..849867becd 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -64,6 +64,13 @@ uint32_t helper_divu(CPUNios2State *env, uint32_t num, uint32_t den)
 void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
 {
     Nios2CPU *cpu = env_archcpu(env);
+    CPUState *cs = env_cpu(env);
+
+    if (unlikely(new_pc & 3)) {
+        env->ctrl[CR_BADADDR] = new_pc;
+        cs->exception_index = EXCP_UNALIGND;
+        cpu_loop_exit_restore(cs, GETPC());
+    }
 
     /*
      * Both estatus and bstatus have no constraints on write;
@@ -74,6 +81,6 @@ void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
 
     env->ctrl[CR_STATUS] = new_status;
     env->pc = new_pc;
-    cpu_loop_exit(env_cpu(env));
+    cpu_loop_exit(cs);
 }
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index f7bab0908b..1e784c8a37 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -170,11 +170,24 @@ static void gen_goto_tb(DisasContext *dc, int n, uint32_t dest)
 
 static void gen_jumpr(DisasContext *dc, int regno, bool is_call)
 {
-    tcg_gen_mov_tl(cpu_pc, load_gpr(dc, regno));
+    TCGLabel *l = gen_new_label();
+    TCGv test = tcg_temp_new();
+    TCGv dest = load_gpr(dc, regno);
+
+    tcg_gen_andi_tl(test, dest, 3);
+    tcg_gen_brcondi_tl(TCG_COND_NE, test, 0, l);
+    tcg_temp_free(test);
+
+    tcg_gen_mov_tl(cpu_pc, dest);
     if (is_call) {
         tcg_gen_movi_tl(dest_gpr(dc, R_RA), dc->base.pc_next);
     }
     tcg_gen_lookup_and_goto_ptr();
+
+    gen_set_label(l);
+    tcg_gen_st_tl(dest, cpu_env, offsetof(CPUNios2State, ctrl[CR_BADADDR]));
+    t_gen_helper_raise_exception(dc, EXCP_UNALIGND);
+
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
-- 
2.25.1


