Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF849380CCE
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:23:49 +0200 (CEST)
Received: from localhost ([::1]:44908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZfI-0000H5-Sh
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVo-0005mA-Pa
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:00 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:35425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVn-00070G-2d
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:00 -0400
Received: by mail-qk1-x736.google.com with SMTP id x8so29027356qkl.2
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Gs/1/30xL7hv2VvnlV5zfpjIpB7onnJxnqYo2zbYrQ=;
 b=V1RRMxQ33LNqnduX0H0Lj5kPakzx2aKqKL/wDGW3MOOzhQJee6ZjxEy9l6yulTVaDH
 LCUYy70m1wLvThwOfAvfOqhEGuT285BmVo9OjUwdKkRBLr0w1crxftDA37yw1U1kbeAb
 IJXURPIui3zo3E/eaUIBYx8U5MIZZtRaOsEwXAAIJgvM8b3BdSP8ttZe+GuCr8Oolud0
 sEm8hFSvWXrQh27H0dnXLy0NzbGRsT/W/5pRWVcV73G6oJfPZDQNs4nVld/TalGz6KyS
 PqUh4SqgN9Gn7ObeBnxlra/Zn+/tiImeoEVVqxgUW3PZlPwaBWfhBuCq2drek8RlL9+t
 bw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Gs/1/30xL7hv2VvnlV5zfpjIpB7onnJxnqYo2zbYrQ=;
 b=Bh2bfDUaIhpKfZjj9zS1qQqnJ5jwKxUkE18iV2DS5ZZx6wzi/oY5dd6hi+T23Jwh0u
 x+RzQckJi6fdJQfEgL7A15nhSb7GOme4r1jGyQzUFkxVA0rgx8lRXQClYQfmDe++jTRs
 WuM359o08JbXGWuJeoJZiY7zPBTQPLe5onwWmvkY9l1mDGxKdmBfazROSD1iyuYgW4pR
 KA3bHt82OVEv+DMsZP1i16K+6fY0DRTvVxrtedGuLBDsbSNPZEG+hXIwByhm1BGrKl8P
 JEuRYMa7qUswfQGuM3QL0OQrv2zZIXmOL5UB7mBLJlJonSYUZG58Q9iIC17+ve97iVPG
 6Xwg==
X-Gm-Message-State: AOAM532nQ7TNENVhU3ukDkkvkm1WXc8OCb0AAWJt3zwyIN1JtZtAehbQ
 Ol1lSachocNa8/a2HZHSFuLBwRdgVnBWxZZ0GG8=
X-Google-Smtp-Source: ABdhPJydhRGbptGr12KOJ95rTwWPFkGkTfX7SmjojytAlj71ZtDu+o90s85EDNaSEyxah2jbhU0fog==
X-Received: by 2002:a37:684d:: with SMTP id d74mr16663377qkc.151.1621005238098; 
 Fri, 14 May 2021 08:13:58 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:13:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/50] target/i386: Introduce REX_PREFIX
Date: Fri, 14 May 2021 10:13:07 -0500
Message-Id: <20210514151342.384376-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The existing flag, x86_64_hregs, does not accurately describe
its setting.  It is true if and only if a REX prefix has been
seen.  Yes, that affects the "h" regs, but that's secondary.

Add PREFIX_REX and include this bit in s->prefix.  Add REX_PREFIX
so that the check folds away when x86_64 is compiled out.

Fold away the reg >= 8 check, because bit 3 of the register
number comes from the REX prefix in the first place.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 7d7ab3e03d..79a37fb1a7 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -39,6 +39,7 @@
 #define PREFIX_DATA   0x08
 #define PREFIX_ADR    0x10
 #define PREFIX_VEX    0x20
+#define PREFIX_REX    0x40
 
 #ifdef TARGET_X86_64
 #define REX_X(s) ((s)->rex_x)
@@ -105,9 +106,6 @@ typedef struct DisasContext {
     int vex_v;  /* vex vvvv register, without 1's complement.  */
     CCOp cc_op;  /* current CC operation */
     bool cc_op_dirty;
-#ifdef TARGET_X86_64
-    bool x86_64_hregs;
-#endif
     int f_st;   /* currently unused */
     int tf;     /* TF cpu flag */
     int jmp_opt; /* use direct block chaining for direct jumps */
@@ -173,6 +171,12 @@ typedef struct DisasContext {
 #define LMA(S)    (((S)->flags & HF_LMA_MASK) != 0)
 #endif
 
+#ifdef TARGET_X86_64
+#define REX_PREFIX(S)  (((S)->prefix & PREFIX_REX) != 0)
+#else
+#define REX_PREFIX(S)  false
+#endif
+
 static void gen_eob(DisasContext *s);
 static void gen_jr(DisasContext *s, TCGv dest);
 static void gen_jmp(DisasContext *s, target_ulong eip);
@@ -336,14 +340,10 @@ static void gen_update_cc_op(DisasContext *s)
  */
 static inline bool byte_reg_is_xH(DisasContext *s, int reg)
 {
-    if (reg < 4) {
+    /* Any time the REX prefix is present, byte registers are uniform */
+    if (reg < 4 || REX_PREFIX(s)) {
         return false;
     }
-#ifdef TARGET_X86_64
-    if (reg >= 8 || s->x86_64_hregs) {
-        return false;
-    }
-#endif
     return true;
 }
 
@@ -4559,7 +4559,6 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 #ifdef TARGET_X86_64
     s->rex_x = 0;
     s->rex_b = 0;
-    s->x86_64_hregs = false;
 #endif
     s->rip_offset = 0; /* for relative ip address */
     s->vex_l = 0;
@@ -4614,12 +4613,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x40 ... 0x4f:
         if (CODE64(s)) {
             /* REX prefix */
+            prefixes |= PREFIX_REX;
             rex_w = (b >> 3) & 1;
             rex_r = (b & 0x4) << 1;
             s->rex_x = (b & 0x2) << 2;
             REX_B(s) = (b & 0x1) << 3;
-            /* select uniform byte register addressing */
-            s->x86_64_hregs = true;
             goto next_byte;
         }
         break;
@@ -4643,14 +4641,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
             /* 4.1.1-4.1.3: No preceding lock, 66, f2, f3, or rex prefixes. */
             if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ
-                            | PREFIX_LOCK | PREFIX_DATA)) {
+                            | PREFIX_LOCK | PREFIX_DATA | PREFIX_REX)) {
                 goto illegal_op;
             }
-#ifdef TARGET_X86_64
-            if (s->x86_64_hregs) {
-                goto illegal_op;
-            }
-#endif
             rex_r = (~vex2 >> 4) & 8;
             if (b == 0xc5) {
                 /* 2-byte VEX prefix: RVVVVlpp, implied 0f leading opcode byte */
-- 
2.25.1


