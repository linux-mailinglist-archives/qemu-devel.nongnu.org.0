Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED4232752F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:26:10 +0100 (CET)
Received: from localhost ([::1]:57832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVRx-0007DS-8A
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:26:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPd-0005OI-7N
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:45 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:38491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPT-0007i1-9c
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:45 -0500
Received: by mail-pf1-x42c.google.com with SMTP id 201so10276111pfw.5
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XZsGfWtTysVo81uFFzyXKZud5EEc/xMwJHVIKqPG4Tc=;
 b=MXw/ZsZ2bAwnR+WKLo9j+BVs7UxHxdRNumqkPaalXdzy50zZVSd9cvc0QSipPlHh5m
 ez/IrigcdTWBiwzW9WowngQzRevxFMSZ9QcdyVMxmVkr45cuWkq75OQ735+d7DdwsGMB
 EmWomuqIPM68LxFpTSFHQXUZpWP29t6UeFferIeE+IUrL6/9p+Z1hYuKGHl734sKw0oG
 BT23bsQRGkoQzLyQNXc6F5s82/16lKBbzTKneLKSzW1BSUQ3uD8Xy6SeuNEOOOfidORg
 TEFROJEIyE3mMGrumMbhkfMuTGVZglode1uBxWKYM4HpjC2SqPLGnxdEo0mlmviF3pLo
 AiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XZsGfWtTysVo81uFFzyXKZud5EEc/xMwJHVIKqPG4Tc=;
 b=sEm/OHoZYKlmq9K24zQn8jVo8qyfNghWatb1NSp/0FliU/Ay2WyHezGiAPTP9dCKdF
 L2wZfPtpb41HEeQAbMuCmx+6JRMSahj3thlJyWB2DzWPpp78x1KfNql56hmM1vWMn5xP
 9BV+3eiO5SoK7ZzlC79yKLOt7LrEudmURRzkJ4JV2nhU8keD3FJA/JB356iO2asOjgV4
 mBfUG8b4blO18SYHy4RTrYYdBTMDUQlL0JM6kWhE7PIuOJudi013UgRo8DQFKDyNl5DD
 UU1bhpbTIUnuyWAl13HpuEvmYNtTso3/6f8359dwO0l6JkC/Hx9yI5GIGmkb8fs1AARw
 BhIg==
X-Gm-Message-State: AOAM5334cZ/0onlD7uhrcPfCVkbez6CnDQhhJ8UpZWze0RcxoX7c/GBN
 X/+hHm289/2EBaKZwJIz36+kFoXuII+2lQ==
X-Google-Smtp-Source: ABdhPJxbs6hf64FvGKB6grWS62QGLnq0Ay69lDgL0QPe2OyO2dbXQGc8OSkjE7Pm+IuJ+yu+aTgayQ==
X-Received: by 2002:aa7:9514:0:b029:1ee:1397:701 with SMTP id
 b20-20020aa795140000b02901ee13970701mr12360027pfp.19.1614554613122; 
 Sun, 28 Feb 2021 15:23:33 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/50] target/i386: Assert SS32 for x86_64 user-only
Date: Sun, 28 Feb 2021 15:22:42 -0800
Message-Id: <20210228232321.322053-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

For user-only, SS32 == !VM86, because we are never in
real-mode.  Since we cannot enter vm86 mode for x86_64
user-only, SS32 is always set.

Since we're adding an accessor macro, pull the value
directly out of flags otherwise.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index d46ebc1dc2..ede6e4c5cd 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -107,7 +107,6 @@ typedef struct DisasContext {
 #endif
     int vex_l;  /* vex vector length */
     int vex_v;  /* vex vvvv register, without 1's complement.  */
-    int ss32;   /* 32 bit stack segment */
     CCOp cc_op;  /* current CC operation */
     bool cc_op_dirty;
 #ifdef TARGET_X86_64
@@ -160,9 +159,11 @@ typedef struct DisasContext {
 #if defined(CONFIG_USER_ONLY) && defined(TARGET_X86_64)
 #define VM86(S)   false
 #define CODE32(S) true
+#define SS32(S)   true
 #else
 #define VM86(S)   (((S)->flags & HF_VM_MASK) != 0)
 #define CODE32(S) (((S)->flags & HF_CS32_MASK) != 0)
+#define SS32(S)   (((S)->flags & HF_SS32_MASK) != 0)
 #endif
 
 static void gen_eob(DisasContext *s);
@@ -352,7 +353,7 @@ static inline MemOp mo_pushpop(DisasContext *s, MemOp ot)
 /* Select the size of the stack pointer.  */
 static inline MemOp mo_stacksize(DisasContext *s)
 {
-    return CODE64(s) ? MO_64 : s->ss32 ? MO_32 : MO_16;
+    return CODE64(s) ? MO_64 : SS32(s) ? MO_32 : MO_16;
 }
 
 /* Select only size 64 else 32.  Used for SSE operand sizes.  */
@@ -2451,12 +2452,12 @@ static inline void gen_pop_update(DisasContext *s, MemOp ot)
 
 static inline void gen_stack_A0(DisasContext *s)
 {
-    gen_lea_v_seg(s, s->ss32 ? MO_32 : MO_16, cpu_regs[R_ESP], R_SS, -1);
+    gen_lea_v_seg(s, SS32(s) ? MO_32 : MO_16, cpu_regs[R_ESP], R_SS, -1);
 }
 
 static void gen_pusha(DisasContext *s)
 {
-    MemOp s_ot = s->ss32 ? MO_32 : MO_16;
+    MemOp s_ot = SS32(s) ? MO_32 : MO_16;
     MemOp d_ot = s->dflag;
     int size = 1 << d_ot;
     int i;
@@ -2472,7 +2473,7 @@ static void gen_pusha(DisasContext *s)
 
 static void gen_popa(DisasContext *s)
 {
-    MemOp s_ot = s->ss32 ? MO_32 : MO_16;
+    MemOp s_ot = SS32(s) ? MO_32 : MO_16;
     MemOp d_ot = s->dflag;
     int size = 1 << d_ot;
     int i;
@@ -2494,7 +2495,7 @@ static void gen_popa(DisasContext *s)
 static void gen_enter(DisasContext *s, int esp_addend, int level)
 {
     MemOp d_ot = mo_pushpop(s, s->dflag);
-    MemOp a_ot = CODE64(s) ? MO_64 : s->ss32 ? MO_32 : MO_16;
+    MemOp a_ot = CODE64(s) ? MO_64 : SS32(s) ? MO_32 : MO_16;
     int size = 1 << d_ot;
 
     /* Push BP; compute FrameTemp into T1.  */
@@ -8490,8 +8491,8 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     g_assert(IOPL(dc) == iopl);
     g_assert(VM86(dc) == ((flags & HF_VM_MASK) != 0));
     g_assert(CODE32(dc) == ((flags & HF_CS32_MASK) != 0));
+    g_assert(SS32(dc) == ((flags & HF_SS32_MASK) != 0));
 
-    dc->ss32 = (flags >> HF_SS32_SHIFT) & 1;
     dc->addseg = (flags >> HF_ADDSEG_SHIFT) & 1;
     dc->f_st = 0;
     dc->tf = (flags >> TF_SHIFT) & 1;
-- 
2.25.1


