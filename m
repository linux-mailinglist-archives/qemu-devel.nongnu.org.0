Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08D45F1CDF
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:37:26 +0200 (CEST)
Received: from localhost ([::1]:42106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oedcL-0004pd-OA
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedCQ-0003JZ-91
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:39 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:39797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedCF-0004Gd-Ji
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:38 -0400
Received: by mail-qk1-x730.google.com with SMTP id x18so4406262qkn.6
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 07:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=mIF77OthLavLtQuqetJUdz3FJ5349hd9QtJO8fQT4pE=;
 b=qIN1PCuiKZQVnko3Ah7AdwlOZjKTtYdhBH5n5jhlKSDTkjjKc+MvzbyEl8fRG07Okj
 LWwRutVhIyNDX+uQOehXNJyEB55Fq5flh4JGPySmpk0jB+gorWNLInPhVJsHBV3GhOtD
 etSUW/uJYPJPkCVPZ9lx+rpG0kLIarRW5Q4SanYVQzaGQAqqJC9hbbQYpaVJounjJtYn
 c7u9javN8V5JduhFyxwMXFBMj+B+HMc0yTOlhe6TzCu60QxbDmkBJSlW+4cfff+IPbbE
 fCNTo9ptzCg7uhxNwBTJwfvCQb46ULE5ZCNUM6Um1zxCktgAaOwJ3S4qTBkhVYfk9hLT
 1LUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=mIF77OthLavLtQuqetJUdz3FJ5349hd9QtJO8fQT4pE=;
 b=xZT99tGDmkY6xtETm5ab5Si9FE4Lz2hjAr6XL+t0LA27Y3wic8u51DmWWCYLX57JeY
 3/NpN4sEy7+YaSmIXoutsSYVTUeOOa0Je3EPhSoEuuQBdfTQ4gnQ802dGTMX6VJH1v60
 mFWn3JqbxwymGF6mMadNZxHEbilp/DuaDTz5xgZtzxI1GfNxmgFRThGlXa0701sLmYE7
 721/rb0V0ttrA6AeDXTms5trxjMl8eCG6NHPhMEnG1ykjU6LXBcXL1x0Zb/MpPLS9ncx
 SxUzXrCv+5AOaMG5Mudve4d7dLh+MjID/mtHd/yxHWnIvsDuJ8ymbp9Gfr4wKant4wUL
 2lIw==
X-Gm-Message-State: ACrzQf3xNqcWTmBAAPqfw6NDDUJLZ50TsY4gIH7oUENnFIx4vIhGsnJs
 FtWDs3zPm6u+nJDVdb3eX9ow9m6MsV6xVi2H
X-Google-Smtp-Source: AMsMyM68mkTx3egFYCtZZUAy96BrhOSA0dav6gUpxhQz6by6URp6io8XPG/Qd1zm07y1Sw3sAC3xog==
X-Received: by 2002:a05:620a:1214:b0:6cd:f5da:f1b9 with SMTP id
 u20-20020a05620a121400b006cdf5daf1b9mr9168540qkj.283.1664633426584; 
 Sat, 01 Oct 2022 07:10:26 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm6075914qkp.106.2022.10.01.07.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:10:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v3 19/26] target/i386: Use gen_jmp_rel for gen_jcc
Date: Sat,  1 Oct 2022 07:09:28 -0700
Message-Id: <20221001140935.465607-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001140935.465607-1-richard.henderson@linaro.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x730.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 57 ++++++++++++-------------------------
 1 file changed, 18 insertions(+), 39 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 434a6ad6cd..5b84be4975 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2409,32 +2409,14 @@ static void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
     }
 }
 
-static inline void gen_jcc(DisasContext *s, int b,
-                           target_ulong val, target_ulong next_eip)
+static void gen_jcc(DisasContext *s, int b, int diff)
 {
-    TCGLabel *l1, *l2;
+    TCGLabel *l1 = gen_new_label();
 
-    if (s->jmp_opt) {
-        l1 = gen_new_label();
-        gen_jcc1(s, b, l1);
-
-        gen_goto_tb(s, 0, next_eip);
-
-        gen_set_label(l1);
-        gen_goto_tb(s, 1, val);
-    } else {
-        l1 = gen_new_label();
-        l2 = gen_new_label();
-        gen_jcc1(s, b, l1);
-
-        gen_jmp_im(s, next_eip);
-        tcg_gen_br(l2);
-
-        gen_set_label(l1);
-        gen_jmp_im(s, val);
-        gen_set_label(l2);
-        gen_eob(s);
-    }
+    gen_jcc1(s, b, l1);
+    gen_jmp_rel_csize(s, 0, 1);
+    gen_set_label(l1);
+    gen_jmp_rel(s, s->dflag, diff, 0);
 }
 
 static void gen_cmovcc1(CPUX86State *env, DisasContext *s, MemOp ot, int b,
@@ -4780,7 +4762,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     int shift;
     MemOp ot, aflag, dflag;
     int modrm, reg, rm, mod, op, opreg, val;
-    target_ulong next_eip, tval;
     bool orig_cc_op_dirty = s->cc_op_dirty;
     CCOp orig_cc_op = s->cc_op;
 
@@ -6933,22 +6914,20 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         break;
     case 0x70 ... 0x7f: /* jcc Jb */
-        tval = (int8_t)insn_get(env, s, MO_8);
-        goto do_jcc;
+        {
+            int diff = (int8_t)insn_get(env, s, MO_8);
+            gen_bnd_jmp(s);
+            gen_jcc(s, b, diff);
+        }
+        break;
     case 0x180 ... 0x18f: /* jcc Jv */
-        if (dflag != MO_16) {
-            tval = (int32_t)insn_get(env, s, MO_32);
-        } else {
-            tval = (int16_t)insn_get(env, s, MO_16);
+        {
+            int diff = (dflag != MO_16
+                        ? (int32_t)insn_get(env, s, MO_32)
+                        : (int16_t)insn_get(env, s, MO_16));
+            gen_bnd_jmp(s);
+            gen_jcc(s, b, diff);
         }
-    do_jcc:
-        next_eip = s->pc - s->cs_base;
-        tval += next_eip;
-        if (dflag == MO_16) {
-            tval &= 0xffff;
-        }
-        gen_bnd_jmp(s);
-        gen_jcc(s, b, tval, next_eip);
         break;
 
     case 0x190 ... 0x19f: /* setcc Gv */
-- 
2.34.1


