Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36EC380CC4
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:21:46 +0200 (CEST)
Received: from localhost ([::1]:36368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZdK-00033K-16
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVl-0005WL-5F
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:13:57 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:46990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVj-0006xt-Af
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:13:56 -0400
Received: by mail-qk1-x732.google.com with SMTP id 76so28989804qkn.13
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=53VSGDilcCOmb1LoxSKsg+aenS/sWLsgrSIWT3KvKvU=;
 b=Xq1u1fy2F0mkZn3NTG0DP/uLWqM3jQ4e6qzjPYZGrkOM/R7rZ1wBuZjT2qU2Wi92eU
 G+W85Uw5TX+2aKPJnZjx2Rq5iWMlzKYm31xDNJGz/6iU7QLek9MDLafFJooK1VaTDxbI
 3pjs4Vm8P4f0MbffGd+jlmEgkUDQBBBYmKpLEV1Bu01Px8e05Drwx5dBYS3KWhk4T7i5
 eq8KdIx3+JKdSydAfs3i7O/y9rRI7uwHl9uuNj+RQbrctyhOtGVXqP80Z94nUxwqAVpa
 Pm4nNtxq7ZML2JUFYphjqPxjMmDTKzP0drW0Eb38uuylOftD6+aSI8NoaHGUJp9C6hAt
 dfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=53VSGDilcCOmb1LoxSKsg+aenS/sWLsgrSIWT3KvKvU=;
 b=ZXamgGKstutFDzdBkWvs+tN62h0YpqNkZZmsBPNI07iJ1hT5BdbdOAQ0ID8r/60hJh
 ZQdXxd1omC3TYZDEyQlfqnB8G5WhMt8MA2qMuuQcC02G2eJwaf8H9y5RRmTZXdQJ/ies
 0P+Di5RhOzBlVCCS5cAeobIuZa0rwrBUE3mFh785HY1Go9FdnfNi28zFmJaevntoHQgm
 Lx/575/zT4UpX5LTeEGLZldR355n4Xd6fdBCl9j5N1bT22+uGSfF2mfxssOTqeOJ8d4D
 D4Lptr1MveeBm+ec+ny+AfkiRjce5zMH48+LXNOtNkD8hm7FzxOFe2gmisPkJ9SnR4ui
 3PZA==
X-Gm-Message-State: AOAM531SOzZwnfXewPVqLxAUK07UP4pOinI1zEmT2xwG4G0g4+/AfQ8O
 x5nbZT0mD1BBmuRVX7JGRDPhB4Yoii/ENO2ERdQ=
X-Google-Smtp-Source: ABdhPJw4naxbuVT6EmWb8i9U2XxifpHfv+lEO6a8Tjk7s/KKorWsxOQYgx/Jrfzz4uqUo1cDIP/bpQ==
X-Received: by 2002:a37:f604:: with SMTP id y4mr24346323qkj.207.1621005234436; 
 Fri, 14 May 2021 08:13:54 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:13:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/50] target/i386: Assert SS32 for x86_64 user-only
Date: Fri, 14 May 2021 10:13:03 -0500
Message-Id: <20210514151342.384376-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
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


