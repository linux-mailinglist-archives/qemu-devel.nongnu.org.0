Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA955661320
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 03:46:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pELaj-0006mx-9H; Sat, 07 Jan 2023 21:39:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELaR-0006Zq-Lh
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:39:03 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZP-0004UT-P7
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:39:03 -0500
Received: by mail-pl1-x62d.google.com with SMTP id d9so5859943pll.9
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 18:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ScRTiCetY4GULFmLSkWpnFNmGzWjdbMDLDjsbqu5fo=;
 b=TOAXi5LNjIeY1nkvmNKr1LLyMMYFpHORFQuq1LndUTcqcW19FupH/WNFkTSqWN4rLE
 4wt69j5xi2rQiFDqzem5zig+c29iLZJ3+RjDM4qc0pGvl0RBfz5lt/FgLanpFmqCMnVe
 PozALU5VBxd7h63o5rnKun4r2UJG/Wy2z0TlXW7JJRWi9wle9q9/gq05rab5xS7J1Gjw
 93X6ifPoHPkeQy5TEZmmbUb3P0BufSHolivO079loX6zKFFFQM6E3Uvl4A4rLZ/DhVlz
 OJbGCtNekzyKOBmqHMtlCB+qWSqO+ZvqbLTVvFBXDigWzanuETn8rNH70KE30/ywiPds
 AbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ScRTiCetY4GULFmLSkWpnFNmGzWjdbMDLDjsbqu5fo=;
 b=hreBfG2ryoIy1G4Bsow39FG/pWcks8HKiEPQfoVkwnk03pTDnY9uONb0ZMh2//EmOG
 CzVjlW25ModcKVXIYFIggpT2PQ4nd5fXBiDenQH85aR4cdXy26BQMebkFwSZiR0ZdwCe
 UQsIY4UfoYqsVfUqLaBV9XvxEgAlePimklh1N9GelA1T5ZfSKHlHGg+TPjIKO5nNeLWr
 wnSlfZS9jpoAqeJi4E/KCibcmnBVbw4gjDlIBEtaSwilNHJ63fcrl6vF6v8Agp5sb4Jq
 MWOypkfFKunv5bvva2UJ+3sDDFYmQXmy77LNLqdEN52vbjrf8p27yYw9ljLBUO282tFY
 hf4w==
X-Gm-Message-State: AFqh2kqwiSOqWmVn16gdQ/PGj4rEPjZA0tSd9FVOjcpyYaFn5zXkUfcn
 LBd+IuAkKNSy3fdWIGNqpsIcAgal3jw6dbLr
X-Google-Smtp-Source: AMrXdXsffHGUNC1FPVOOyvPzoLG6DHbo1HOOC+3BkFPxIrPU8WfHrlZT9WG8uGe2vb/VQSUvC69/2w==
X-Received: by 2002:a17:902:cf09:b0:191:3e64:a5ff with SMTP id
 i9-20020a170902cf0900b001913e64a5ffmr83605253plg.68.1673145479006; 
 Sat, 07 Jan 2023 18:37:59 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 34/36] target/i386: Split out gen_cmpxchg8b, gen_cmpxchg16b
Date: Sat,  7 Jan 2023 18:37:17 -0800
Message-Id: <20230108023719.2466341-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 48 ++++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 7e0b2a709a..a82131d635 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2993,6 +2993,34 @@ static void gen_sty_env_A0(DisasContext *s, int offset, bool align)
 #include "emit.c.inc"
 #include "decode-new.c.inc"
 
+static void gen_cmpxchg8b(DisasContext *s, CPUX86State *env, int modrm)
+{
+    gen_lea_modrm(env, s, modrm);
+
+    if ((s->prefix & PREFIX_LOCK) &&
+        (tb_cflags(s->base.tb) & CF_PARALLEL)) {
+        gen_helper_cmpxchg8b(cpu_env, s->A0);
+    } else {
+        gen_helper_cmpxchg8b_unlocked(cpu_env, s->A0);
+    }
+    set_cc_op(s, CC_OP_EFLAGS);
+}
+
+#ifdef TARGET_X86_64
+static void gen_cmpxchg16b(DisasContext *s, CPUX86State *env, int modrm)
+{
+    gen_lea_modrm(env, s, modrm);
+
+    if ((s->prefix & PREFIX_LOCK) &&
+        (tb_cflags(s->base.tb) & CF_PARALLEL)) {
+        gen_helper_cmpxchg16b(cpu_env, s->A0);
+    } else {
+        gen_helper_cmpxchg16b_unlocked(cpu_env, s->A0);
+    }
+    set_cc_op(s, CC_OP_EFLAGS);
+}
+#endif
+
 /* convert one instruction. s->base.is_jmp is set if the translation must
    be stopped. Return the next pc value */
 static bool disas_insn(DisasContext *s, CPUState *cpu)
@@ -3844,28 +3872,14 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 if (!(s->cpuid_ext_features & CPUID_EXT_CX16)) {
                     goto illegal_op;
                 }
-                gen_lea_modrm(env, s, modrm);
-                if ((s->prefix & PREFIX_LOCK) &&
-                    (tb_cflags(s->base.tb) & CF_PARALLEL)) {
-                    gen_helper_cmpxchg16b(cpu_env, s->A0);
-                } else {
-                    gen_helper_cmpxchg16b_unlocked(cpu_env, s->A0);
-                }
-                set_cc_op(s, CC_OP_EFLAGS);
+                gen_cmpxchg16b(s, env, modrm);
                 break;
             }
-#endif        
+#endif
             if (!(s->cpuid_features & CPUID_CX8)) {
                 goto illegal_op;
             }
-            gen_lea_modrm(env, s, modrm);
-            if ((s->prefix & PREFIX_LOCK) &&
-                (tb_cflags(s->base.tb) & CF_PARALLEL)) {
-                gen_helper_cmpxchg8b(cpu_env, s->A0);
-            } else {
-                gen_helper_cmpxchg8b_unlocked(cpu_env, s->A0);
-            }
-            set_cc_op(s, CC_OP_EFLAGS);
+            gen_cmpxchg8b(s, env, modrm);
             break;
 
         case 7: /* RDSEED */
-- 
2.34.1


