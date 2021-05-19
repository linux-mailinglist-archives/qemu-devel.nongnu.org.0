Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E993A3895C0
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:48:00 +0200 (CEST)
Received: from localhost ([::1]:51416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljREd-0001iN-PS
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyV-0003r6-4F
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:19 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:36636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyN-0005hg-Dh
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:16 -0400
Received: by mail-oi1-x22c.google.com with SMTP id f184so14009212oig.3
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X/FFxNAJ2f0+Zc5rdCpNj+t2LEQqtzj2zkGTB7lInGQ=;
 b=dSPI+1oSgj7IlmfppGBOHSg8/2hCMFtI7ZO3ADTS2WGtaPsKVmlQOEtdEdyosMy1VZ
 IJajYazkvPbWiC731TGhxDhwXLaMe7kdePfkwTotvqcZB+kh8kGHSYx3enbThH4nE7QH
 MAibZYFx/0M2NagoCarmXyQGpDWrnIZ7xdSr1iqGBj3KpNoT4JBAaOcq5ynw58Ny205D
 sYg3PQtyzw8iPKVFyFvPDdhenxP0zL6Tuv4eYEuxj2mjhQcbV/EWuarBXHHMj09F16tw
 olBQYxdupT/q3b98sMLxbVrC3q+F8EQubO+tRdBzwWR2VnTEAkLQY3EQL3YCYQfcNxB3
 P65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X/FFxNAJ2f0+Zc5rdCpNj+t2LEQqtzj2zkGTB7lInGQ=;
 b=UvLwj89H3YOf7WoxJwa4BjVjtYHAaSDHr+TS9RNZD1EzHS/7AjmRxVByC7+FfKYV9P
 /zFisVQBVvs8beBB0JlCf49d0QhYV6B9oUwrAUSOQzuDjGh19FNHJ6/9VEAh6TDSZNMA
 eTmVhw0BghLK1ehuev1lJB4n1300ViThDwzqgauGQI4EOA/ORKRzQoygc/pV/W1ON1x5
 5R5LnY3PDtX/5YNigwvOEadSGZUeGyqmfN9p0VYk9CjCRsmqe+KRw4zLiR12+enbhzLH
 z0BQ+Xc4f2GI6+gu3LpGeeHEBHWr+iLqgcPRpBt6iMk9CL6xsMsnIKCgL26N/wpGhDsm
 wNew==
X-Gm-Message-State: AOAM532Bzpv669cl8peyDybLxN59/nW88cpsMHIVzQ4Wa92lJ26yu4H0
 QK/QSsk0IDjRyvjvkbwAb3BUOfvzDmeM7+Um
X-Google-Smtp-Source: ABdhPJxkOyFtnGlDxlyfihZZc3Sm5kL9BboDHZk+iML8PulSrR0TGrE9bL3cYdGhGnkmeNlOcGgTCg==
X-Received: by 2002:aca:44d4:: with SMTP id r203mr514041oia.76.1621449070311; 
 Wed, 19 May 2021 11:31:10 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/50] target/i386: Move rex_w into DisasContext
Date: Wed, 19 May 2021 13:30:18 -0500
Message-Id: <20210519183050.875453-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Treat this flag exactly like we treat the other rex bits.
The -1 initialization is unused; the two tests are > 0 and == 1,
so the value can be reduced to a bool.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-19-richard.henderson@linaro.org>
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


