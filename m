Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213853895D6
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:52:45 +0200 (CEST)
Received: from localhost ([::1]:40598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRJE-0004wA-3i
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyX-0003t1-La
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:22 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:36633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyK-0005fW-RR
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:19 -0400
Received: by mail-oi1-x22a.google.com with SMTP id f184so14009037oig.3
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=apFSgGZXwWAqwxDJM0bgwOp5DD1DSEWrQeh+D0YbI6s=;
 b=XUD75oIUwLikKs7mPxU5geugEFyJXbhCRG4mrjPSG9hhdDPVPVvLsw8YrFcihP9RnS
 4TGEtXkRuTpUvW3FOF4REZjFM3vdT2ldZa9eksjbGwy+GFBooxfKCyya75ABCSsJu27Y
 T1+R7fpc/J6AU+v7JM33I121YAOm8tae4YGVgW1rCjGeIV4ZRLdohPibYwXmyfb90CSi
 TJ827Zq30owTrNLkBhPrFpS9Fo5E3mM6ozwVPMQIyghGFJxro698nkyHHzWnsKV4zH4Y
 p2m7VPSVQX581kPbQBpPooLwPwmvyqOzaJx9cyGuRcVzjASob+wEgtXvmQbE7AEXvuhv
 /Kkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=apFSgGZXwWAqwxDJM0bgwOp5DD1DSEWrQeh+D0YbI6s=;
 b=gNkDkCTIrwwEXYMdeqQMaLkyj5u1kBHM2SBj9mLeWe6yQaiDV/frOrvpr94bX0O0oR
 1lObqGiaKVvKTuYZOdOClLAwic0Q3/gHEZdxffBAJE0n1QOK5gYrYMzu2Hl4jfPHT5hq
 ii1F/yavLNUeIwxVRXv7VMMl+alvBp79hwS4cCJvHaGSgkGZzcwn/wM/siueGY7kg/wm
 QgDtFdb8knABHKdeRDfv1HZVBPk8RQoyS/JRK0X0qUGyxCQ1qsLYN1uKCRqZhB6ANjZx
 mCe2Oi1d0ZJFJdtyH10gRS1qiyGBamPVjn8NoNJudTTuzmuRqalgXsfykFo+z83G138/
 50EA==
X-Gm-Message-State: AOAM530qQD+qW1Bg+jprOJDef/Ie1A5G64z8yvNSvs6D0ySwiExzPXTD
 eJBvrFR+SgmBXgMSzM8ckU6GQnoGzP6kjSid
X-Google-Smtp-Source: ABdhPJzQlfqBzSCfDnovN6KHBVZXFLbVQiV5u0gxieftIacbK7W6C3hh1oi5Ac9swOD52RVsrvXdWw==
X-Received: by 2002:a05:6808:13c9:: with SMTP id
 d9mr537097oiw.142.1621449067292; 
 Wed, 19 May 2021 11:31:07 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/50] target/i386: Introduce REX_PREFIX
Date: Wed, 19 May 2021 13:30:15 -0500
Message-Id: <20210519183050.875453-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
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
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-16-richard.henderson@linaro.org>
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


