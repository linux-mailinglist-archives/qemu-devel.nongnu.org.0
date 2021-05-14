Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C33DD380D41
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:34:40 +0200 (CEST)
Received: from localhost ([::1]:42188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZpj-00013V-NM
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZW2-0005z5-AV
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:14 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:43899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVp-00071T-IG
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:13 -0400
Received: by mail-qt1-x831.google.com with SMTP id c10so12603724qtx.10
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j3jIdgzkdy+zadQXXnxssNNXrHd6sc0uIKQLcspEtOE=;
 b=rVXM7AQof1N1wBD1P3wpnIDgQsXyaptymcyTZVPHSCZKmxdNutRTmFBUsFx7ujLM7r
 pX7eudN6p7Dw84Ze4d0AqPGw6jJikjIEIQjF5Ch49420wC/+27tqYvLHQ4n3TOKD3BU/
 88dm7GTb2+VCes8+KQEHh4Akjc7dfp+ymgTyZcOJV30vjU1i+acBxy4HNksUDizH6oql
 ZdGlPcVqVaJOUf15v8Ha5PwzjYk8m9jcl6q7GoQZznG/auomKjRB3/Xlt35SC0eeOA6p
 39rkQ/jpCDEs1O39uI3Ldgg1WxbiTkbusTbq1Xmj9BANr66btfypFH6LrJ9rh6wxR3uq
 rX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j3jIdgzkdy+zadQXXnxssNNXrHd6sc0uIKQLcspEtOE=;
 b=IHmzuoycZ8624L09awrLygGbjqjHoOPgFfApf/pYQvAIek3zumTy7UBOQYhXr9nA5l
 SARTMli+aiQGF2Km0GKrvRQdwoKfGp6QPk9xS+h+/5PU0ZBLqQ/VqkOWMrOt3QWMSrTD
 7c80UIHqquU3cTKqRfeyPLf6bcM22uy5DJoSYS0E/T9lKBaCZT28xeg6q/G4iyjjRPln
 brSAolWmdAy86M5dlRkGYrRhZUbY0oLDSaKZwblWMfrydcomjB3PPGctMoQp0/vfbFA5
 d31vUkXFWLYOOHECIE/lhb6yFXwzHKqBwPQpNGzIjLZvoLn3bXdgBfNgeEzN7ATGaIWe
 OvGA==
X-Gm-Message-State: AOAM530t9OL2V1rkO9gIDCNFqjaG+fACKv9K6HCG+Ff9u5q3xEZ9jhbY
 efsGYoghUF70X71ohQgMaBoWuw3I64LfC/ndWVE=
X-Google-Smtp-Source: ABdhPJxVfhzAQAd4UQpHd4/0D08lAILpKuWwij7crWV3FpHlfOSCgai7c8UK9RecP4yQfex8udP31g==
X-Received: by 2002:ac8:7d0c:: with SMTP id g12mr30126009qtb.224.1621005240768; 
 Fri, 14 May 2021 08:14:00 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:14:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/50] target/i386: Move rex_w into DisasContext
Date: Fri, 14 May 2021 10:13:10 -0500
Message-Id: <20210514151342.384376-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Treat this flag exactly like we treat the other rex bits.
The -1 initialization is unused; the two tests are > 0 and == 1,
so the value can be reduced to a bool.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 22175c6628..4222f09b6f 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -95,6 +95,7 @@ typedef struct DisasContext {
     uint8_t rex_r;
     uint8_t rex_x;
     uint8_t rex_b;
+    bool rex_w;
 #endif
     int vex_l;  /* vex vector length */
     int vex_v;  /* vex vvvv register, without 1's complement.  */
@@ -167,11 +168,13 @@ typedef struct DisasContext {
 
 #ifdef TARGET_X86_64
 #define REX_PREFIX(S)  (((S)->prefix & PREFIX_REX) != 0)
+#define REX_W(S)       ((S)->rex_w)
 #define REX_R(S)       ((S)->rex_r + 0)
 #define REX_X(S)       ((S)->rex_x + 0)
 #define REX_B(S)       ((S)->rex_b + 0)
 #else
 #define REX_PREFIX(S)  false
+#define REX_W(S)       false
 #define REX_R(S)       0
 #define REX_X(S)       0
 #define REX_B(S)       0
@@ -4552,12 +4555,12 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     MemOp ot, aflag, dflag;
     int modrm, reg, rm, mod, op, opreg, val;
     target_ulong next_eip, tval;
-    int rex_w;
     target_ulong pc_start = s->base.pc_next;
 
     s->pc_start = s->pc = pc_start;
     s->override = -1;
 #ifdef TARGET_X86_64
+    s->rex_w = false;
     s->rex_r = 0;
     s->rex_x = 0;
     s->rex_b = 0;
@@ -4571,7 +4574,6 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     }
 
     prefixes = 0;
-    rex_w = -1;
 
  next_byte:
     b = x86_ldub_code(env, s);
@@ -4615,7 +4617,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         if (CODE64(s)) {
             /* REX prefix */
             prefixes |= PREFIX_REX;
-            rex_w = (b >> 3) & 1;
+            s->rex_w = (b >> 3) & 1;
             s->rex_r = (b & 0x4) << 1;
             s->rex_x = (b & 0x2) << 2;
             s->rex_b = (b & 0x1) << 3;
@@ -4654,12 +4656,12 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 b = x86_ldub_code(env, s) | 0x100;
             } else {
                 /* 3-byte VEX prefix: RXBmmmmm wVVVVlpp */
+                vex3 = x86_ldub_code(env, s);
 #ifdef TARGET_X86_64
                 s->rex_x = (~vex2 >> 3) & 8;
                 s->rex_b = (~vex2 >> 2) & 8;
+                s->rex_w = (vex3 >> 7) & 1;
 #endif
-                vex3 = x86_ldub_code(env, s);
-                rex_w = (vex3 >> 7) & 1;
                 switch (vex2 & 0x1f) {
                 case 0x01: /* Implied 0f leading opcode bytes.  */
                     b = x86_ldub_code(env, s) | 0x100;
@@ -4686,7 +4688,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         /* In 64-bit mode, the default data size is 32-bit.  Select 64-bit
            data with rex_w, and 16-bit data with 0x66; rex_w takes precedence
            over 0x66 if both are present.  */
-        dflag = (rex_w > 0 ? MO_64 : prefixes & PREFIX_DATA ? MO_16 : MO_32);
+        dflag = (REX_W(s) ? MO_64 : prefixes & PREFIX_DATA ? MO_16 : MO_32);
         /* In 64-bit mode, 0x67 selects 32-bit addressing.  */
         aflag = (prefixes & PREFIX_ADR ? MO_32 : MO_64);
     } else {
@@ -5082,7 +5084,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 /* operand size for jumps is 64 bit */
                 ot = MO_64;
             } else if (op == 3 || op == 5) {
-                ot = dflag != MO_16 ? MO_32 + (rex_w == 1) : MO_16;
+                ot = dflag != MO_16 ? MO_32 + REX_W(s) : MO_16;
             } else if (op == 6) {
                 /* default push size is 64 bit */
                 ot = mo_pushpop(s, dflag);
-- 
2.25.1


