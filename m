Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE74E6F512A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:21:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6bA-0000zt-ML; Wed, 03 May 2023 03:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aW-00070o-2D
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:07:44 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6a4-0005jz-Kg
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:07:43 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f1728c2a57so47624925e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097634; x=1685689634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5j/yMASWGStjwMM59Hf05R5CdVFVYJotd2cRr9oH9m0=;
 b=CaQjqtpSDch0Exsm8wEG8Gdb9dWKcyj8xeVd9MEC/vB96p6Hd23o/LlGHSzGg2acZy
 zilBP52CFOe2LQ8GsjwqHWUEFjfwQfI6WP/mPrdzq4tubr7u4OyCA9aHwy+f0Q9wA7lN
 BCyPRZtKgAMUiRIRJ4CbSjHsLASEeW2M5eeR+4CGNvHPXJypFN2RL1Oq19sVS+3+ni/i
 edGh7iugrEyZ1u4MUr4O7b8MtFUz09VfK3xhVzBnMlp0PYOA4ocGJ++W4k9dgumZFHtK
 NGaagHS/dgtuOTeWYwouQVgSsku7qxBe7ZPcTOZyJth6wVMe6crRYTLipdWRap7GoAmm
 b1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097634; x=1685689634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5j/yMASWGStjwMM59Hf05R5CdVFVYJotd2cRr9oH9m0=;
 b=U/ktTdWsIOokA9CYjvepy+hNV7IhZvvC+bC2i6ANfkgHrO06MJ2Gv7NN9YU94+onsU
 CtV14kW+9nfih27dKPlyXMx5zAE81HgkaK9EDsCqKYL9HuYDD3424HAkWFD+mXVE9Xbn
 TuVI9Q8Qx/JciDMRwjeh4wlFeEe5wB3tqWWbLhlHk0eOh6GAwvyoFQlNfBLP7izwVz73
 Vzhg4Y/HhcfqBrisvplrQBvGeSnBFquFO1UVfL3A5L8vDaOVgSDnQU3Hmi4DdDT0DPga
 SUxXye+XWNzGjUrdWJScauE2gtQQHbym8tphimw4r3rdozLA+XTe7a03eTdvKhU6Cqd2
 q3kA==
X-Gm-Message-State: AC+VfDzCMGjE6+jiYfcdyhEl3NM/BW4P6+pIx3MzTnzlbNtK6yK5RI/4
 Byz49XZNAZl+w1XU6I4pslAi4C8OEk1PZKcnflwn9w==
X-Google-Smtp-Source: ACHHUZ69uQOvna65AymTXFLBokzAO38IvjYKIWrOzUru7z0tEfVVT90zf/Ie89bNseq4JpyC1tM+4w==
X-Received: by 2002:a1c:7912:0:b0:3f0:41b3:9256 with SMTP id
 l18-20020a1c7912000000b003f041b39256mr13784978wme.10.1683097634480; 
 Wed, 03 May 2023 00:07:14 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 22/57] tcg/aarch64: Use full load/store helpers in
 user-only mode
Date: Wed,  3 May 2023 08:06:21 +0100
Message-Id: <20230503070656.1746170-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 43acb4fbcb..09c9ecad0f 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1595,7 +1595,6 @@ typedef struct {
     TCGType index_ext;
 } HostAddress;
 
-#ifdef CONFIG_SOFTMMU
 static const TCGLdstHelperParam ldst_helper_param = {
     .ntmp = 1, .tmp = { TCG_REG_TMP }
 };
@@ -1628,40 +1627,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_goto(s, lb->raddr);
     return true;
 }
-#else
-static void tcg_out_adr(TCGContext *s, TCGReg rd, const void *target)
-{
-    ptrdiff_t offset = tcg_pcrel_diff(s, target);
-    tcg_debug_assert(offset == sextract64(offset, 0, 21));
-    tcg_out_insn(s, 3406, ADR, rd, offset);
-}
-
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    if (!reloc_pc19(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
-        return false;
-    }
-
-    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_X1, l->addrlo_reg);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_X0, TCG_AREG0);
-
-    /* "Tail call" to the helper, with the return address back inline. */
-    tcg_out_adr(s, TCG_REG_LR, l->raddr);
-    tcg_out_goto_long(s, (const void *)(l->is_ld ? helper_unaligned_ld
-                                        : helper_unaligned_st));
-    return true;
-}
-
-static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-
-static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-#endif /* CONFIG_SOFTMMU */
 
 /*
  * For softmmu, perform the TLB load and compare.
-- 
2.34.1


