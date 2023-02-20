Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE3869D2E5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:43:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUB7U-0004y5-GI; Mon, 20 Feb 2023 13:42:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6W-0004Xp-Ai
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:40 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6L-000484-Aw
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:32 -0500
Received: by mail-pl1-x62c.google.com with SMTP id bh1so2503000plb.11
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x6mVVLeAKLfZ1QsaICACHihb7zGLUdrCmrZOJHSfaPM=;
 b=Pa/2FLLdjM+UIhNaCoU7zB6nIBxw5Lo4d+Hk8Y9R/DetyIES7yznTCruZFvUGghlrW
 HGteNiVQj//DAyJBfXVm+BM1550BTMXCF5wRTp7vshS4+pQJGmpKXe7Ex8DVKY6kLzrw
 oGN7LM2+6Hn4mv3aFqGqPWMH/3brV3YWsRKy9hV1yKqpqg6mfbHvHr3EMrhyp4i3XZ1L
 d4lZvENCN/ydjL6G+wPGxrFLVGxVEEkaYy66mKqNnj768HATRiYppd7812AZm+V0dlGn
 E70uHd2fIJToXL/BnI8OnTeag8072HS+Te/5jyknMfWKYFj37Ftr151qAz3vt3pJKyVt
 gE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x6mVVLeAKLfZ1QsaICACHihb7zGLUdrCmrZOJHSfaPM=;
 b=eRDolln4l+NeDljgKMw1Z0SIsiZjxkt1pIab3pJ6UKQHDi4WvDhMIKzrUVwb3Kg+UZ
 93eK6TbElMLE9rTPEv40dOmkC1TZY4VtP+CONOacFhwd+0JrpMh4TzgidogZcL9DRZRn
 IrH8DMNsPWgVonu1YwwxcG52llc4aW+LXYvJUdiu9r3B2HFhwMHOHEjb1fOCp+/YTlPx
 Gr7/T02yJykBgeZwzDDzM10vI9wCN0bUNgMl5zNX/rnlCvTyjOC9YBlBgLtK3+k/HTUT
 N+o8jrR54fp91cmtGTFZGt9+/Lmrmau8OeqWTRIlGPzg1BQhJnqnsUjTJ5YOPcWQ6cuE
 HvYg==
X-Gm-Message-State: AO0yUKW+9h5GexWI99F9TfV+aSoi+9u8PmQoClDtugFlKRHcs63MLalH
 t6FClPXv73N+QlIacEMaE8rtaaX08u3f4Nqt6q4=
X-Google-Smtp-Source: AK7set+yeaWcraQCaucHFZVyZ7+789H4Ut1/Mjq6gCx6by3898/Zf/KOSD8HyUohBtojCZY+MYu+hw==
X-Received: by 2002:a17:902:f68f:b0:19c:1433:5fba with SMTP id
 l15-20020a170902f68f00b0019c14335fbamr2708852plg.0.1676918481992; 
 Mon, 20 Feb 2023 10:41:21 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jk20-20020a170903331400b0019258bcf3ffsm1911676plb.56.2023.02.20.10.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 10:41:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 14/27] target/s390x: Assert masking of psw.addr in
 cpu_get_tb_cpu_state
Date: Mon, 20 Feb 2023 08:40:39 -1000
Message-Id: <20230220184052.163465-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220184052.163465-1-richard.henderson@linaro.org>
References: <20230220184052.163465-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When changing modes via SAM, we raise a specification exception if the
new PC is out of range.  The masking in s390x_tr_init_disas_context
was too late to be correct, but may be removed.  Add a debugging
assert in cpu_get_tb_cpu_state.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/cpu.h           | 20 ++++++++++++++------
 target/s390x/tcg/translate.c |  6 +-----
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 7d6d01325b..c7eeebfc53 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -379,17 +379,25 @@ static inline int cpu_mmu_index(CPUS390XState *env, bool ifetch)
 }
 
 static inline void cpu_get_tb_cpu_state(CPUS390XState* env, target_ulong *pc,
-                                        target_ulong *cs_base, uint32_t *flags)
+                                        target_ulong *cs_base, uint32_t *pflags)
 {
-    *pc = env->psw.addr;
-    *cs_base = env->ex_value;
-    *flags = (env->psw.mask >> FLAG_MASK_PSW_SHIFT) & FLAG_MASK_PSW;
+    int flags = (env->psw.mask >> FLAG_MASK_PSW_SHIFT) & FLAG_MASK_PSW;
     if (env->cregs[0] & CR0_AFP) {
-        *flags |= FLAG_MASK_AFP;
+        flags |= FLAG_MASK_AFP;
     }
     if (env->cregs[0] & CR0_VECTOR) {
-        *flags |= FLAG_MASK_VECTOR;
+        flags |= FLAG_MASK_VECTOR;
     }
+    *pflags = flags;
+    *cs_base = env->ex_value;
+    *pc = env->psw.addr;
+#ifdef CONFIG_DEBUG_TCG
+    if (!(flags & FLAG_MASK_32)) {
+        assert(*pc <= 0xffffff);
+    } else if (!(flags & FLAG_MASK_64)) {
+        assert(*pc <= 0x7fffffff);
+    }
+#endif
 }
 
 /* PER bits from control register 9 */
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 3a61491222..d21b6d7f72 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6563,11 +6563,7 @@ static void s390x_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    /* 31-bit mode */
-    if (!(dc->base.tb->flags & FLAG_MASK_64)) {
-        dc->base.pc_first &= 0x7fffffff;
-        dc->base.pc_next = dc->base.pc_first;
-    }
+    /* Note cpu_get_tb_cpu_state asserts PC is masked for the mode. */
 
     dc->cc_op = CC_OP_DYNAMIC;
     dc->ex_value = dc->base.tb->cs_base;
-- 
2.34.1


