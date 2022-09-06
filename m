Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B4B5AE5DB
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 12:50:02 +0200 (CEST)
Received: from localhost ([::1]:55306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVW9Z-00026S-LF
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 06:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWk-0000GD-DL
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:57 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:34720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWi-0003bj-1N
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:54 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 z14-20020a7bc7ce000000b003a5db0388a8so7847575wmk.1
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=AHR0afnmw1Pzr7GboZG/SeqWvqBzQ1hpArBDHCu8T8o=;
 b=Gceews2iVIYGKJuL5vKj6wphX3SUN4tG5bFkdomRhfjS4QZUBk6wxcshZQSQtNkElC
 OSaXENk4DLl88GVLlX2wr4XSxrpG/SBtr/a82eRmvTvk9mswtkb5VSDpW2W7ABn7Ghjl
 UZ0os7Kpma8snjBrH4Yqw5XCqBl3pzg8hQ8W/vccuGb0LTiAWqOQWIdDBu2yMyw1JEVX
 FLltUN37DWJc/qygZz/NC5PGqoUNTqHJjA9H2VvGTwpzSAKJyWGWheeyoAh4GrVG8oHG
 E9iByLQFzcXeCzE0n9BEhbEcZcg1FIRolfsm5pXnWTqmeJtXPluufJqshYPgHF2rHad3
 CQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=AHR0afnmw1Pzr7GboZG/SeqWvqBzQ1hpArBDHCu8T8o=;
 b=ZhZeCLF3KdSATos4jDF5QX5e5NFjcSvp73Fy975LVAg1rSSuFmS8vtQ9DkNZlyJxx0
 pCArXMXh05nYOyJ4HadxH75ll8M2TTSp+JCiyOEe22rb6oWAKfqmoFdx48JTwjw8pr8S
 5q6j16L3WmdP/PatTy/IOi9E9U6fVWtcJ1pBJCUJeenypZGAHqS1BWvvCrI3azRlKn9B
 3lEalHGvMIGGzanyzdN0choYYaHZ/uMzH3np9mtPxjcdzya+hVLzPemCrKSUydg8Dv7X
 pxe7VjA91NU7pxAq+ij2NtApB7xAVbMzCLKGLXsD2CQOFUQo01Fb3dJm3csYD8yp/iOU
 Lkog==
X-Gm-Message-State: ACgBeo1v4g69qUvvDjhxTZFS2jPp6lwlJjggl1Z2xAT+37UM0HfaImY2
 2xhqWjR9RAUbQrSwpaEeKNPu+BenRz0dXM6p
X-Google-Smtp-Source: AA6agR6Zvwi4xx6fUf405VhhXCBdSPzzL6mUi47X2RLo61e4fEUt8oD30W4EPzdNyPX6zLx/JNwONg==
X-Received: by 2002:a05:600c:4f53:b0:3a6:9d3c:47e9 with SMTP id
 m19-20020a05600c4f5300b003a69d3c47e9mr13668898wmq.116.1662458990676; 
 Tue, 06 Sep 2022 03:09:50 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003a840690609sm23125014wmc.36.2022.09.06.03.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:09:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 17/23] target/i386: Create gen_jmp_rel
Date: Tue,  6 Sep 2022 11:09:26 +0100
Message-Id: <20220906100932.343523-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100932.343523-1-richard.henderson@linaro.org>
References: <20220906100932.343523-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create a common helper for pc-relative branches.
The jmp jb insn was missing a mask for CODE32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 57 ++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 30 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index cedc195837..07c7764649 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -226,6 +226,7 @@ static void gen_eob(DisasContext *s);
 static void gen_jr(DisasContext *s);
 static void gen_jmp(DisasContext *s, target_ulong eip);
 static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num);
+static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num);
 static void gen_op(DisasContext *s1, int op, MemOp ot, int d);
 static void gen_exception_gpf(DisasContext *s);
 
@@ -1173,7 +1174,7 @@ static TCGLabel *gen_jz_ecx_string(DisasContext *s)
     TCGLabel *l2 = gen_new_label();
     gen_op_jnz_ecx(s, s->aflag, l1);
     gen_set_label(l2);
-    gen_jmp_tb(s, s->pc - s->cs_base, 1);
+    gen_jmp_rel(s, MO_32, 0, 1);
     gen_set_label(l1);
     return l2;
 }
@@ -2756,6 +2757,18 @@ static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num)
     }
 }
 
+static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num)
+{
+    target_ulong dest = s->pc - s->cs_base + diff;
+
+    if (ot == MO_16) {
+        dest &= 0xffff;
+    } else if (!CODE64(s)) {
+        dest &= 0xffffffff;
+    }
+    gen_jmp_tb(s, dest, tb_num);
+}
+
 static void gen_jmp(DisasContext *s, target_ulong eip)
 {
     gen_jmp_tb(s, eip, 0);
@@ -6816,20 +6829,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0xe8: /* call im */
         {
-            if (dflag != MO_16) {
-                tval = (int32_t)insn_get(env, s, MO_32);
-            } else {
-                tval = (int16_t)insn_get(env, s, MO_16);
-            }
-            tval += s->pc - s->cs_base;
-            if (dflag == MO_16) {
-                tval &= 0xffff;
-            } else if (!CODE64(s)) {
-                tval &= 0xffffffff;
-            }
+            int diff = (dflag != MO_16
+                        ? (int32_t)insn_get(env, s, MO_32)
+                        : (int16_t)insn_get(env, s, MO_16));
             gen_push_v(s, eip_next_tl(s));
             gen_bnd_jmp(s);
-            gen_jmp(s, tval);
+            gen_jmp_rel(s, dflag, diff, 0);
         }
         break;
     case 0x9a: /* lcall im */
@@ -6847,19 +6852,13 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         goto do_lcall;
     case 0xe9: /* jmp im */
-        if (dflag != MO_16) {
-            tval = (int32_t)insn_get(env, s, MO_32);
-        } else {
-            tval = (int16_t)insn_get(env, s, MO_16);
+        {
+            int diff = (dflag != MO_16
+                        ? (int32_t)insn_get(env, s, MO_32)
+                        : (int16_t)insn_get(env, s, MO_16));
+            gen_bnd_jmp(s);
+            gen_jmp_rel(s, dflag, diff, 0);
         }
-        tval += s->pc - s->cs_base;
-        if (dflag == MO_16) {
-            tval &= 0xffff;
-        } else if (!CODE64(s)) {
-            tval &= 0xffffffff;
-        }
-        gen_bnd_jmp(s);
-        gen_jmp(s, tval);
         break;
     case 0xea: /* ljmp im */
         {
@@ -6876,12 +6875,10 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         goto do_ljmp;
     case 0xeb: /* jmp Jb */
-        tval = (int8_t)insn_get(env, s, MO_8);
-        tval += s->pc - s->cs_base;
-        if (dflag == MO_16) {
-            tval &= 0xffff;
+        {
+            int diff = (int8_t)insn_get(env, s, MO_8);
+            gen_jmp_rel(s, dflag, diff, 0);
         }
-        gen_jmp(s, tval);
         break;
     case 0x70 ... 0x7f: /* jcc Jb */
         tval = (int8_t)insn_get(env, s, MO_8);
-- 
2.34.1


