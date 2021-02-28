Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 341DF32754D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:41:50 +0100 (CET)
Received: from localhost ([::1]:43730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVh7-0008Jb-0H
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:41:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPn-0005To-GK
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:55 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:39294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPV-0007iI-6R
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:55 -0500
Received: by mail-pl1-x632.google.com with SMTP id k22so8761988pll.6
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eWU48+PmRMax2TIUlWmTbNBZGlHPNyOmd8zQuonIrmY=;
 b=agasLxkVbDR2asl2wYEV9qXQy61UhPH+QOMW8JBVAz9VnXgzopRJBvuDY7l1VOVvLT
 5m9n7DwQMOSg6xfUmSN+UOsl4dRHQblPw/ZZ5ktqO33ixAdu2Yvx7A9r77jzY4imslt2
 +vPftpDlVud0JtGW5F0aEJL51hgGY89nULz5xUjP0pepn2zymjPkYcnZF3PsjmEsIeHC
 vD4kQcpcDV5doWRD9qokSm9gGVfh0ab6hRfJFdaMwUD0UM8EM5ivvDkKdt4W3b5J3gB9
 K7yuByw+Y2xbwqzz2qnmZYs2D6IpBAL9j3jxR8tWj7KobvdDE/RLF7hqJWqU7/Cads63
 rc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eWU48+PmRMax2TIUlWmTbNBZGlHPNyOmd8zQuonIrmY=;
 b=BdOEBuusa7/jjoaSkPBfRWM/8fmx6K7mdXfdFcWSvlgYoZZrRpMRHPDBU58SUn31k4
 WR8XJdV3GGd4G3ZDdfQW3ijk/yWihyEA4D1t8AXI6BjNyTCG9K7TenCUMZEm4oy7Utbw
 9S9PovH3/tdXobwjizkyvnZw6P/LppxvaqUOruhRCu7nhe4Q/FNNvSpFcHBydlkKQ2zu
 PiTRQfc+cD7Bg+otT2EXyiJYfJllfnBq86/ZstWsZyc9hIRnD2xdohJmRrYj4RJwo7fr
 Q8gOH5Fn65+a/AT1v0SFdp1nFi2kYK592Q5Wc5VTvR2mJitmQL0X3pXTjcC2BdlTI00Y
 D7+A==
X-Gm-Message-State: AOAM5329ZRqRZsWYV3+Qqe3cuczRUQuXiAr5DS58OBVGN1mzt38FS24b
 QN0QsSlBqLFWOti97AkmxcQ/aMWPjmhB5g==
X-Google-Smtp-Source: ABdhPJx4QcD3Yf2h7PGzGzyCYRVX4BooUam4YC+zOO1Q1KDuLoqtHaMwttdytq/7exiQ7hM0RRv70g==
X-Received: by 2002:a17:90a:5d14:: with SMTP id
 s20mr6464631pji.6.1614554615721; 
 Sun, 28 Feb 2021 15:23:35 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/50] target/i386: Assert !ADDSEG for x86_64 user-only
Date: Sun, 28 Feb 2021 15:22:45 -0800
Message-Id: <20210228232321.322053-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

LMA disables traditional segmentation, exposing a flat address space.
This means that ADDSEG is off.

Since we're adding an accessor macro, pull the value directly out
of flags otherwise.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index c8728397d0..33da97d0a6 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -108,7 +108,6 @@ typedef struct DisasContext {
 #ifdef TARGET_X86_64
     bool x86_64_hregs;
 #endif
-    int addseg; /* non zero if either DS/ES/SS have a non zero base */
     int f_st;   /* currently unused */
     int tf;     /* TF cpu flag */
     int jmp_opt; /* use direct block chaining for direct jumps */
@@ -156,10 +155,12 @@ typedef struct DisasContext {
 #define VM86(S)   false
 #define CODE32(S) true
 #define SS32(S)   true
+#define ADDSEG(S) false
 #else
 #define VM86(S)   (((S)->flags & HF_VM_MASK) != 0)
 #define CODE32(S) (((S)->flags & HF_CS32_MASK) != 0)
 #define SS32(S)   (((S)->flags & HF_SS32_MASK) != 0)
+#define ADDSEG(S) (((S)->flags & HF_ADDSEG_MASK) != 0)
 #endif
 #if !defined(TARGET_X86_64)
 #define CODE64(S) false
@@ -492,7 +493,7 @@ static void gen_lea_v_seg(DisasContext *s, MemOp aflag, TCGv a0,
 #endif
     case MO_32:
         /* 32 bit address */
-        if (ovr_seg < 0 && s->addseg) {
+        if (ovr_seg < 0 && ADDSEG(s)) {
             ovr_seg = def_seg;
         }
         if (ovr_seg < 0) {
@@ -505,7 +506,7 @@ static void gen_lea_v_seg(DisasContext *s, MemOp aflag, TCGv a0,
         tcg_gen_ext16u_tl(s->A0, a0);
         a0 = s->A0;
         if (ovr_seg < 0) {
-            if (s->addseg) {
+            if (ADDSEG(s)) {
                 ovr_seg = def_seg;
             } else {
                 return;
@@ -2429,7 +2430,7 @@ static void gen_push_v(DisasContext *s, TCGv val)
     tcg_gen_subi_tl(s->A0, cpu_regs[R_ESP], size);
 
     if (!CODE64(s)) {
-        if (s->addseg) {
+        if (ADDSEG(s)) {
             new_esp = s->tmp4;
             tcg_gen_mov_tl(new_esp, s->A0);
         }
@@ -8500,8 +8501,8 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     g_assert(CODE64(dc) == ((flags & HF_CS64_MASK) != 0));
     g_assert(SS32(dc) == ((flags & HF_SS32_MASK) != 0));
     g_assert(LMA(dc) == ((flags & HF_LMA_MASK) != 0));
+    g_assert(ADDSEG(dc) == ((flags & HF_ADDSEG_MASK) != 0));
 
-    dc->addseg = (flags >> HF_ADDSEG_SHIFT) & 1;
     dc->f_st = 0;
     dc->tf = (flags >> TF_SHIFT) & 1;
     dc->cc_op = CC_OP_DYNAMIC;
-- 
2.25.1


