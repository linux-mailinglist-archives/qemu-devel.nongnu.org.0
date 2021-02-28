Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 171A4327535
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:28:22 +0100 (CET)
Received: from localhost ([::1]:38054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVU4-0002EN-Us
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:28:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPZ-0005Nn-9U
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:42 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:38896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPQ-0007h2-NK
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:41 -0500
Received: by mail-pj1-x1031.google.com with SMTP id l18so10481401pji.3
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NSyzwXdepOJtmog9MVMDw1s/eSNq+uZi1xq2Xphvsqo=;
 b=gHbr/9FObM/39IcDAecbZG9XYIvp+Z8jBI7hYvQXX5Wr/YCXw7lARRTwV4iBOe+7sq
 KRPS4ZUVqYO1hdV+I0vRkCYg09/zXZAlWKsRIkhPRsXuM4bhYygF5fP01BiT5I1zP/EO
 1QDuoKC05Y0SwPE5edi76YmYnRNC3JPS8bkjR8wIK59yGPUdBaj6SkCcLx8+ekRXbcqH
 QF3Z6o9pzbDj1Gba8bbyxKm8tSLaMHVjINoM6Xj+XabzpPxImYuYXWa4ESs0KRTLdfCD
 PuKzToH2yOg0MsN38g1SutMgJgRl8SJXYzNjJrrzKg8YXDWw6mi6OJLLbttxibMu276I
 6mcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NSyzwXdepOJtmog9MVMDw1s/eSNq+uZi1xq2Xphvsqo=;
 b=nBLEH8QBpxsGRQULoeVcr11btHjec/GlIy7+ufb/S86RIEYT2OnxRI+Rayeer+mdBb
 3jt8GJuv1VRZ8Tyfpq2D8aZPyx1ExANDbr06QVnPNeoX0pthchghwJvlJpvBTRxySLq8
 VBZ6wfYaZ1SBcQyMD/hnjoGmGVothCTUt5IVKeNQLOalFP6cCSLDlsZ5+K9YDPBWTkbc
 oTkNw3Zok6JumBxvT8FP/b1eGrQO8FZdpmRvMIg38tnPFj4qJZXHK8GQw7cRlSVPIZjf
 kG60BXoTQd1iFG7jaR0tYpNKC9l1JDy3oxcIuhTfiPRft+4CrYZ/WnnsZ7eFaT/eDLan
 7V+A==
X-Gm-Message-State: AOAM531QltNFE+Yt+fx1uGArTz2u/JGc3KUiPJY75PQskUMXF5vbHH3C
 U9kVte4nkmOJAdVm23icSQjbZd4dNrMOIQ==
X-Google-Smtp-Source: ABdhPJx1EeJGrtJUo9RQDQfKwCD8fHM3akuAkwar4wKLKrA4B1OiCuSehYLmXzHBOiDZy6TuzXuiMA==
X-Received: by 2002:a17:902:ed94:b029:de:8844:a650 with SMTP id
 e20-20020a170902ed94b02900de8844a650mr12808202plj.56.1614554610604; 
 Sun, 28 Feb 2021 15:23:30 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/50] target/i386: Assert IOPL is 0 for user-only
Date: Sun, 28 Feb 2021 15:22:39 -0800
Message-Id: <20210228232321.322053-9-richard.henderson@linaro.org>
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

On real hardware, the linux kernel has the iopl(2) syscall which
can set IOPL to 3, to allow e.g. the xserver to briefly disable
interrupts while programming the graphics card.

However, QEMU cannot and does not implement this syscall, so the
IOPL is never changed from 0.  Which means that all of the checks
vs CPL <= IOPL are false for user-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 50dc693edc..5f24615826 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -97,6 +97,7 @@ typedef struct DisasContext {
 
 #ifndef CONFIG_USER_ONLY
     uint8_t cpl;   /* code priv level */
+    uint8_t iopl;  /* i/o priv level */
 #endif
 
     int code32; /* 32 bit code segment */
@@ -116,7 +117,6 @@ typedef struct DisasContext {
     int addseg; /* non zero if either DS/ES/SS have a non zero base */
     int f_st;   /* currently unused */
     int vm86;   /* vm86 mode */
-    int iopl;
     int tf;     /* TF cpu flag */
     int jmp_opt; /* use direct block chaining for direct jumps */
     int repz_opt; /* optimize jumps within repz instructions */
@@ -153,9 +153,11 @@ typedef struct DisasContext {
 #ifdef CONFIG_USER_ONLY
 #define PE(S)     true
 #define CPL(S)    3
+#define IOPL(S)   0
 #else
 #define PE(S)     (((S)->flags & HF_PE_MASK) != 0)
 #define CPL(S)    ((S)->cpl)
+#define IOPL(S)   ((S)->iopl)
 #endif
 
 static void gen_eob(DisasContext *s);
@@ -629,7 +631,7 @@ static void gen_check_io(DisasContext *s, MemOp ot, target_ulong cur_eip,
 {
     target_ulong next_eip;
 
-    if (PE(s) && (CPL(s) > s->iopl || s->vm86)) {
+    if (PE(s) && (CPL(s) > IOPL(s) || s->vm86)) {
         tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
         switch (ot) {
         case MO_8:
@@ -1307,7 +1309,7 @@ static bool check_cpl0(DisasContext *s)
 /* If vm86, check for iopl == 3; if not, raise #GP and return false. */
 static bool check_vm86_iopl(DisasContext *s)
 {
-    if (!s->vm86 || s->iopl == 3) {
+    if (!s->vm86 || IOPL(s) == 3) {
         return true;
     }
     gen_exception_gpf(s);
@@ -1317,7 +1319,7 @@ static bool check_vm86_iopl(DisasContext *s)
 /* Check for iopl allowing access; if not, raise #GP and return false. */
 static bool check_iopl(DisasContext *s)
 {
-    if (s->vm86 ? s->iopl == 3 : CPL(s) <= s->iopl) {
+    if (s->vm86 ? IOPL(s) == 3 : CPL(s) <= IOPL(s)) {
         return true;
     }
     gen_exception_gpf(s);
@@ -6750,7 +6752,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                                                           & 0xffff));
                 }
             } else {
-                if (CPL(s) <= s->iopl) {
+                if (CPL(s) <= IOPL(s)) {
                     if (dflag != MO_16) {
                         gen_helper_write_eflags(cpu_env, s->T0,
                                                 tcg_const_i32((TF_MASK |
@@ -8468,23 +8470,25 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     CPUX86State *env = cpu->env_ptr;
     uint32_t flags = dc->base.tb->flags;
     int cpl = (flags >> HF_CPL_SHIFT) & 3;
+    int iopl = (flags >> IOPL_SHIFT) & 3;
 
     dc->cs_base = dc->base.tb->cs_base;
     dc->flags = flags;
 #ifndef CONFIG_USER_ONLY
     dc->cpl = cpl;
+    dc->iopl = iopl;
 #endif
 
     /* We make some simplifying assumptions; validate they're correct. */
     g_assert(PE(dc) == ((flags & HF_PE_MASK) != 0));
     g_assert(CPL(dc) == cpl);
+    g_assert(IOPL(dc) == iopl);
 
     dc->code32 = (flags >> HF_CS32_SHIFT) & 1;
     dc->ss32 = (flags >> HF_SS32_SHIFT) & 1;
     dc->addseg = (flags >> HF_ADDSEG_SHIFT) & 1;
     dc->f_st = 0;
     dc->vm86 = (flags >> VM_SHIFT) & 1;
-    dc->iopl = (flags >> IOPL_SHIFT) & 3;
     dc->tf = (flags >> TF_SHIFT) & 1;
     dc->cc_op = CC_OP_DYNAMIC;
     dc->cc_op_dirty = false;
-- 
2.25.1


