Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E6E327542
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:35:51 +0100 (CET)
Received: from localhost ([::1]:54874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVbK-0000sa-8X
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:35:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPu-0005my-8I
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:02 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:42519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPj-0007ls-5Q
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:01 -0500
Received: by mail-pf1-x42e.google.com with SMTP id w18so10270141pfu.9
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N0oZwSek+9kdlYWcTKW/6zdB8jdhgx5Lh7Rb5VgVPYQ=;
 b=R5Zl+aKWQv/P+q5JdaEiZW9Jo8cK2e0t71UkLR6CftRtbDfpy9nnDnUhn/b3m3rAHL
 kg9ATIjQBY5jBZ7TCGXE1oIXDVENlWdcG2WovgfRu4WiZULt494nPWZf/48PXkZO4X7d
 K9qOI9VtWIutOAS8Zt0cRmk0GrADszFbLfkJY4+ZTVUXNrz1vGitfM1M2/KVm5j36UwF
 MHM6yhjf3Mda61+5EJSagoHa3Wastoz59aoQahjJLLJDKvYOSZgTJFMaMMzxdtMicqhC
 VrhqD9JiE3urJfMm1GIkl8ZMVevhC2luXijx3lURcvV3CaOz8Pit5AXy4HlVR6kU0c+Y
 c4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N0oZwSek+9kdlYWcTKW/6zdB8jdhgx5Lh7Rb5VgVPYQ=;
 b=ohvFypfhG1jNkAALrEgBtqEAhHCtzU1eavbQYAB8ceCw30M3oXvYu4lqM1tZpL/C63
 8LDhh++Cq43QSEIsIsmdmMJ71SEywVkTfAlI4gfgbCkuU5031irQT4eUjprOVhEzeLEy
 w2evQXn/Cg4bQ0hhnCgRO0js8rynKFIDck5QRLzeeWQyALX0sYMdWjW3uJiKvJpFz1nQ
 d2vuPNTBDiEp0HRzdglEUTvaA/oT3sT7It0mYjj5/BaYAYZcZV00HnmgscUkpKB7E4mP
 hv5XcNt3IsqnnH/D8860NYeDXe//fAvCvWWcEsaG23GGXwnCS0k8uqrxYWnjbGvAd0Ta
 35Sg==
X-Gm-Message-State: AOAM531GsR5TxP7eV4GaCrLGSsHz8o9LsuTvSIQls84/n1VQYaMMCE2l
 V0hRvDcj7MgOFj9aus5M8d0B682/wQRrHw==
X-Google-Smtp-Source: ABdhPJwEBhnz2tvrixqH2ZV20hMq0YiHNNQfeLV/f0j9jLmz4TxKTXDolzBoij9aWx59s/b0mUh33Q==
X-Received: by 2002:a63:c343:: with SMTP id e3mr11522199pgd.8.1614554629460;
 Sun, 28 Feb 2021 15:23:49 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 31/50] target/i386: Assert !GUEST for user-only
Date: Sun, 28 Feb 2021 15:23:02 -0800
Message-Id: <20210228232321.322053-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

For user-only, we do not need to check for VMM intercept.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 3779da9042..cd376a2c07 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -139,11 +139,13 @@ typedef struct DisasContext {
 #define CPL(S)    3
 #define IOPL(S)   0
 #define SVME(S)   false
+#define GUEST(S)  false
 #else
 #define PE(S)     (((S)->flags & HF_PE_MASK) != 0)
 #define CPL(S)    ((S)->cpl)
 #define IOPL(S)   ((S)->iopl)
 #define SVME(S)   (((S)->flags & HF_SVME_MASK) != 0)
+#define GUEST(S)  (((S)->flags & HF_GUEST_MASK) != 0)
 #endif
 #if defined(CONFIG_USER_ONLY) && defined(TARGET_X86_64)
 #define VM86(S)   false
@@ -677,7 +679,7 @@ static void gen_check_io(DisasContext *s, MemOp ot, target_ulong cur_eip,
             tcg_abort();
         }
     }
-    if(s->flags & HF_GUEST_MASK) {
+    if (GUEST(s)) {
         gen_update_cc_op(s);
         gen_jmp_im(s, cur_eip);
         svm_flags |= (1 << (4 + ot));
@@ -2417,8 +2419,9 @@ gen_svm_check_intercept_param(DisasContext *s, target_ulong pc_start,
                               uint32_t type, uint64_t param)
 {
     /* no SVM activated; fast case */
-    if (likely(!(s->flags & HF_GUEST_MASK)))
+    if (likely(!GUEST(s))) {
         return;
+    }
     gen_update_cc_op(s);
     gen_jmp_im(s, pc_start - s->cs_base);
     gen_helper_svm_check_intercept_param(cpu_env, tcg_const_i32(type),
@@ -8511,6 +8514,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     g_assert(LMA(dc) == ((flags & HF_LMA_MASK) != 0));
     g_assert(ADDSEG(dc) == ((flags & HF_ADDSEG_MASK) != 0));
     g_assert(SVME(dc) == ((flags & HF_SVME_MASK) != 0));
+    g_assert(GUEST(dc) == ((flags & HF_GUEST_MASK) != 0));
 
     dc->cc_op = CC_OP_DYNAMIC;
     dc->cc_op_dirty = false;
-- 
2.25.1


