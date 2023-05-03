Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C966F5114
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:18:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6bq-0004ub-Ap; Wed, 03 May 2023 03:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ap-0008Lk-2P
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:08:04 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aE-0005pm-Sh
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:08:01 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f192c23fffso29497045e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097644; x=1685689644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8dOhNAZCA6lBCroa7XUF6EpxbAxZlxMP8g62cl8mX24=;
 b=j8mxuMsRornH4TXgd8vucrTFCuB7pnWF+a7hrNni1WjqJjx/VMpfYZp1vH1fQErl4U
 FRlMhJGuAlMrADkfp5oLNybcCQw9wjk7BIIw2voFD1iXGnFwTXS74Qm4kViJuDu8J0ye
 O+YOru42nVdTDkBVG6p1zteeEhZkY3TGdbOm0PgnbYbqNp2Gx39zT/dDtCYwRzbiPe03
 v9f34LA7LIxQaAphOXXIrQKKknd5XSPY1pe3HzrzZyG85RTj+hvd/lReCBfYLcDQzv3H
 fmuy43aMZNKgSbCnytXpIW/VFG1c6THaDftgVGp+gc+BKJsg+Kfpmo3woxxXcZgbvv+v
 yeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097644; x=1685689644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8dOhNAZCA6lBCroa7XUF6EpxbAxZlxMP8g62cl8mX24=;
 b=gWzXa+eTXXUxXjS+DmjpzYyrwb0Nmm7EwWL8cROgTg54YBy+kkQwafWLC2koisTB2G
 SvOAYqlCY/Z3D5OWnP0r8p+/GAJ45mAerEOXxeiF4AH7h9OFseFSVMLomxHYEkaOu4xl
 Ev7urc3ySM5GKY1s25tzfSj0zjflHtTILVosrTBABgRrBCyDUE0oaDHkFsOwpODTFtOb
 beflhzg1Itlvmn002qHqJebSn5YzKqIRRZFvHUy85939EjJ17qVfN7gV5AQXAUzz6M7D
 vjVvZQ5aebrikZlWthbOZPYhi5rTKHfXNq5aCujJ8Fo3sqjtgpETOz/F2Acp3b/flOSi
 6pcA==
X-Gm-Message-State: AC+VfDz7muRNfX70NX6RVrkp+yqG/jX554+IwQpEr/QTwhCnMcY0JRZk
 p/UsT42i6vL4gjcUwcNXmaM2Tlow6XQ2iIisufRAOw==
X-Google-Smtp-Source: ACHHUZ5kRSZo+qWPzOob1sOLT/bw826brYBvNNd5c9KInZDkVpj8PGvYHtmPnuBUyo7YeSawKhcGZw==
X-Received: by 2002:a05:600c:2318:b0:3f1:72ec:400d with SMTP id
 24-20020a05600c231800b003f172ec400dmr13219593wmo.33.1683097644056; 
 Wed, 03 May 2023 00:07:24 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 35/57] accel/tcg: Remove helper_unaligned_{ld,st}
Date: Wed,  3 May 2023 08:06:34 +0100
Message-Id: <20230503070656.1746170-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

These functions are now unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-ldst.h |  6 ------
 accel/tcg/user-exec.c  | 10 ----------
 2 files changed, 16 deletions(-)

diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
index 64f48e6990..7dd57013e9 100644
--- a/include/tcg/tcg-ldst.h
+++ b/include/tcg/tcg-ldst.h
@@ -60,10 +60,4 @@ void helper_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
 void helper_st16_mmu(CPUArchState *env, target_ulong addr, Int128 val,
                      MemOpIdx oi, uintptr_t retaddr);
 
-#ifdef CONFIG_USER_ONLY
-
-G_NORETURN void helper_unaligned_ld(CPUArchState *env, target_ulong addr);
-G_NORETURN void helper_unaligned_st(CPUArchState *env, target_ulong addr);
-
-#endif /* CONFIG_USER_ONLY */
 #endif /* TCG_LDST_H */
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 8f86254eb4..7b824dcde8 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -889,16 +889,6 @@ void page_reset_target_data(target_ulong start, target_ulong last) { }
 
 /* The softmmu versions of these helpers are in cputlb.c.  */
 
-void helper_unaligned_ld(CPUArchState *env, target_ulong addr)
-{
-    cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_LOAD, GETPC());
-}
-
-void helper_unaligned_st(CPUArchState *env, target_ulong addr)
-{
-    cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_STORE, GETPC());
-}
-
 static void *cpu_mmu_lookup(CPUArchState *env, abi_ptr addr,
                             MemOp mop, uintptr_t ra, MMUAccessType type)
 {
-- 
2.34.1


