Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2649432754E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:44:43 +0100 (CET)
Received: from localhost ([::1]:52044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVju-0003Jq-2p
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:44:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPm-0005SJ-C0
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:54 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:35215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPZ-0007jF-1P
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:54 -0500
Received: by mail-pj1-x1031.google.com with SMTP id e9so10493901pjj.0
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sfziPdMmHXMl0JUBj2FD4iN9zl8J9PwSm1EfUyjEWb0=;
 b=TOec1IVh6bWEIdINJoXPLJ7y6ez4SCM9aixdp/mxKsEo4h2QE89bvd2w8TN1SirBD8
 v4AnpRgWG+2u5Y/j5XJvXvNeYIApdkFL67hXQSAeIahibB7U4RTKxg5j8bTHf62ovshT
 lWqygS9C9YiUrzjadc1GN3k2Ny2Qh3HuQwCaZE/m4GPWa7opbi7JRkOS0pNbNxp8QOc6
 BjoYZNQBBHOekA3G2sGLwNWAwphMz4N4GTtAFVQx+LAMJCbiVOKHJp3sZq4sOYVTHwZ0
 NfdzwzT9rLhRky6ftlm8WsUL2J1pueu+SlawpysZ7GDiHByEMl7Sy9CrP8uL2cOJVRrf
 mIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sfziPdMmHXMl0JUBj2FD4iN9zl8J9PwSm1EfUyjEWb0=;
 b=EF9oZWx5oruFcSRimIzra+iKfeVP3ApyiWg2CujFHP7f/AYhG1h351e3qBUXDAIZK0
 K+7g2YM4wulu0H2u05qjUahYQrmmJdJnGO1K/1nGTILXMrkqk3Gf1oCa99l/Rh5iiEdB
 NTzsUvyaRoEqRh93n/ODlf1Yw4VpNyw/IgX98MY8ijgFT/TOex2EW+GQ3fWWgn9L4pEv
 ZmgmRAe1Yz/WA/qQc0vWJ1pPdmlzCFeauedsssri5HFoSXjD2zzml9BEQWJQsYWiNa3G
 0IBkWNOhRyjg0xq9bXJwU5ZNw0++zmWwp4TCJF1Wq9dDZ2MDFnwiKRIeFCNFdQ+/v4pM
 8QgQ==
X-Gm-Message-State: AOAM532HyCuzQTo2rzALoBnAgMwaFoGecXSFt69VJHPJqVjGoevTOFAv
 SZBko5F727nDbcaHEdu9mhMTKI+X+obmYw==
X-Google-Smtp-Source: ABdhPJyKnBGQTYZNUIcJemIcPeNs8Uk9jk9wQj3HRcX5blEPk+Zcm/XefvbecxYb0wU+F/cHgrJF9Q==
X-Received: by 2002:a17:90a:e2ca:: with SMTP id
 fr10mr14256102pjb.154.1614554619196; 
 Sun, 28 Feb 2021 15:23:39 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/50] target/i386: Move rex_w into DisasContext
Date: Sun, 28 Feb 2021 15:22:49 -0800
Message-Id: <20210228232321.322053-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: cfontana@suse.de
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
index aa10d0ba99..deb1e43430 100644
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


