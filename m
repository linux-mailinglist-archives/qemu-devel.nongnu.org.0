Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 102BB67C403
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 05:43:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKu2v-0000VR-9e; Wed, 25 Jan 2023 23:39:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2q-0000Sz-Do
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:39:28 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2o-0004XT-P6
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:39:28 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 k10-20020a17090a590a00b0022ba875a1a4so4225116pji.3
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 20:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZnBSw+DizwOZo4UW4Jj6dd8GS0IvC1zlFir1RDsd6zE=;
 b=qGESYRYhTD1fIaahtXNNzjF/OwKy2algwf1JQdYPLMoq4KCGNHxlLaIWCjUOEIaoif
 m4bLZASdzz7M77ynToDq46QKgActY3596RhT1+GeHtLoAFIL5YpAhhme6uiCXfsp5pBe
 VJWoXxOCTnlYh01/tO29NtuvgqFqgpvrBgzjrNMuC5CNkv1QVCCUw136jglLvpUFwdT8
 3JWBINauzVurMbGmaO4maaVy5cniet7qlhMIfL4jhE7b7v8j6z8EYMZZAwuJOqv8Bsgq
 qLEjs/ZdJoYplJP8CTiUyi4GlFjrsukbn5Va6U4vGlEzGCbgAsJpMK7S+itR6Ril2R44
 OSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZnBSw+DizwOZo4UW4Jj6dd8GS0IvC1zlFir1RDsd6zE=;
 b=4JpyKE1W06NpWIuqhhIwZtmJfHca/t33bN8vgo9M8pF6WXDU2mba9WLiA0G5cMfg/5
 Cpvs/N4RFhHNYPEMqbOvv4tPP7B7NjQm9oQLmSyZh/AiO5FX+ymuGHVmc1j98J6pcS0u
 ZL+uDy5pyrzYIC7RakI5auB657la04diAHwN15NsrCv69PwV9TM12d5prIePeRken5sV
 YdQiUeC0RUwAS5vVAKvtlic+siNOyyQhql0jbtZmQB08Zz2ooHsAKVjHKLLmCuuRZPHP
 Az2rm0yjOe0d0JfPuI2AtH5sZJINTa6fbXHzlVw6hsr2fNzY7Its0V9N3t3T334Mp265
 SUMg==
X-Gm-Message-State: AFqh2ko7b7GNdsAk3QIKCr4pDXPbmJXLqIrM2Pcu2HJwZmaLlM/aTmI/
 8LHKzdQQx+njZGdVwZ/rlnZfPGMppo4q8JHwDL0=
X-Google-Smtp-Source: AMrXdXumbwGchRpC7VI4aOkCUNkyx6jMlvFyR/KAE21XIuGDjT/2AVg4AVw8i0s0r8tqtQKZIaQHlw==
X-Received: by 2002:a17:90a:5793:b0:229:1f6d:47fc with SMTP id
 g19-20020a17090a579300b002291f6d47fcmr36238162pji.41.1674707962455; 
 Wed, 25 Jan 2023 20:39:22 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 s62-20020a17090a69c400b00228e56d375asm233376pjj.33.2023.01.25.20.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 20:39:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v5 34/36] target/i386: Split out gen_cmpxchg8b, gen_cmpxchg16b
Date: Wed, 25 Jan 2023 18:38:22 -1000
Message-Id: <20230126043824.54819-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126043824.54819-1-richard.henderson@linaro.org>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>
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


