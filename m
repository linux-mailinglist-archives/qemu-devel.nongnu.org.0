Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4577138958E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:36:06 +0200 (CEST)
Received: from localhost ([::1]:45598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljR37-0003fH-8U
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyL-0003gm-Sf
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:09 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:46766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyG-0005d5-PA
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:09 -0400
Received: by mail-oi1-x229.google.com with SMTP id x15so13957928oic.13
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WSEAQX4xoDFetSNg7thFVzG9HtsA7xC95w5bxK6vv/Y=;
 b=GNeqFw4tGH2sLzPy8JddiI1DFhZcD7MSEvWZrrn9P1NTimYlBz0jaFqjAwChTaTlw2
 mCN9jHHHBpGwDymASedCe9FelXQp3zjlw67ExS8aaTSvGH6MY0uquMySq2ApjSuCr45X
 lBVkJf6EDYv5oaEYn575VYIutDSSSTDzURnc20UaFHm+GLM0W5tSjveBiHUCDVgLHOQa
 gSoSvrx0vMlWqD1iE9zVDlSmr31pLOrWJo1teLallOFQwZPKUhgjd8wsf4tjLqomh64u
 4ZZ3pizGRxw/eLheHDmfHV3Yux6yh2W1sY3DZSXFz11amQxnGqNYuhMXo1JfuvbXnId8
 Ubiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WSEAQX4xoDFetSNg7thFVzG9HtsA7xC95w5bxK6vv/Y=;
 b=Srq2lYz1y7H7sE9lLwYxV3TTQaJrOcfsCWFc6x/8vN0z9O98rcSeMPvY9gDbqtD50O
 YlQEdOIiy2t9Ve1IdP35q9kbgTS1ma1/N9wONnKBxb/lqa6oawO7t8Pk3YQng3dMQnXb
 Zk27/56gmsvX89Kmkd6UL9Wd3dtLiurmuXTD2YnRyN0hbAHbFmDxXD3VsPEdwENK801g
 dECHjmSjCLx1p6E4XLRq8URRkRyVdtHZH+/TCs3l9ewHc5lzHSWxJkHKO5t5k9c/3Cmy
 86C8RjQW1auQrym/hDPwhYiNKMH8s6Yyte9RMepfrQ5U6MWI4HLwHh7K/TVwLMhkn0Wu
 98LQ==
X-Gm-Message-State: AOAM53179EiR6jhd2naKCjnhgW8YkWcv/dcvc+n+ZHmVTmCCZhNh+6KE
 h9GpMlYWY53CQrClzhyk4AZM51BMbwdZN7Le
X-Google-Smtp-Source: ABdhPJzFfPmyuoLpA0jUOlWXlL1I0/vxDfkpB3k0trwxcb+eCFc/i5VAWlTTNCRfWyJedlHCeEnH5w==
X-Received: by 2002:a05:6808:b08:: with SMTP id
 s8mr503642oij.162.1621449063523; 
 Wed, 19 May 2021 11:31:03 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/50] target/i386: Assert SS32 for x86_64 user-only
Date: Wed, 19 May 2021 13:30:11 -0500
Message-Id: <20210519183050.875453-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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

For user-only, SS32 == !VM86, because we are never in
real-mode.  Since we cannot enter vm86 mode for x86_64
user-only, SS32 is always set.

Since we're adding an accessor macro, pull the value
directly out of flags otherwise.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-12-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index b570921410..7b5031f647 100644
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
@@ -8496,8 +8497,8 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
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


