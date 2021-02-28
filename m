Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF99732754A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:41:47 +0100 (CET)
Received: from localhost ([::1]:43506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVh4-0008EO-Te
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:41:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPj-0005RH-Cj
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:52 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:38889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPW-0007iN-Db
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:51 -0500
Received: by mail-pj1-x1029.google.com with SMTP id l18so10481498pji.3
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F2Soij/n72t5+4Lnb4cZ68WmnkGE/xgVzkoBmLKFKwI=;
 b=P8x2E8tauKRddyCoYM7luWl2XmJ4L7azYPNx63yS9DYkOXBgarLlSJwV6gFqM88OC7
 4Z4dhvBbvmpFF3FLe3U++P81KgKLR3y7zDImdLLwn3iy+A3vGQZ9aeD3+U6wubNvfZNI
 d7nl3pJXPSe0rWVtcenYUQs2HeXLQ/CjUM3L21j8WAnlXdZRWj1Xljoz7nrg7sins75L
 vD5SKw9hVatcwRzskCvd/2eqOxXUoJF7WREttsxBA8FCzq+u+y9SiJHAyQFLcYhh4Iin
 VHoayLdHZQ2fD9TCKMsZuP+rxvAODTO07bdDLddek/5oBNQ//526fcvYs1C2HgK0DThI
 EacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F2Soij/n72t5+4Lnb4cZ68WmnkGE/xgVzkoBmLKFKwI=;
 b=TXTel131QyJAtggzJutKZP5enhWGj2ROq1kQ2DOyW3zWCsReiEazoiF6knNiC3bahM
 OJ2CbIaGsjQl+ehzYIuqqHK6983pUHmBuuKXg5xsGR3xPdicKSQLyC0z6jHgRpbU+EGI
 XvMyieRh3g8E7lNBIEMGrTbhN1U+RPacQCmsUT23NwesTAtINXBqxiO4VomFnfJtyJWq
 DwaOt1tfFE3+x1RPhm/iUyc3PO7jjDDPtD+sCPnm8n4noJuneQ+rc6N+JjqLrh0djPDO
 EBqWEE0X6+Tzu5o6CWWabX84EyQC7aZJ/oM16hYY66OvfIvttiKVe1ToNz0vHWIosVTA
 b1TQ==
X-Gm-Message-State: AOAM53134bsoh6Q2J3a22sRlJKhNokXA/pMaIfEauVAcdTcEjnDYj20X
 kmjNAwpPEYUN0N2qdsYMAwEk/TnfXDUqJg==
X-Google-Smtp-Source: ABdhPJyu6qu15KyYgMCAyWjErjOX2z0GUSEmr0mzieHuVTjcojpPZoZprqypmoIJeFWeQ4DcVl8JjQ==
X-Received: by 2002:a17:90a:f28e:: with SMTP id
 fs14mr2752851pjb.100.1614554616745; 
 Sun, 28 Feb 2021 15:23:36 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/50] target/i386: Introduce REX_PREFIX
Date: Sun, 28 Feb 2021 15:22:46 -0800
Message-Id: <20210228232321.322053-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
index 33da97d0a6..31b128d4fe 100644
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


