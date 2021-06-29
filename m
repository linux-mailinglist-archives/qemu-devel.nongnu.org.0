Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0493B788D
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:23:26 +0200 (CEST)
Received: from localhost ([::1]:53964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJKP-00018w-OR
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItA-0007z5-9D
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:16 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:45628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIsu-0000rg-Qa
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:10 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso3078525pjb.4
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xTwMJU3bsMsUDKAuT4u9lBehIy/XuCs4LFcFtzDowXM=;
 b=PzZJcqo8Wkz008DtPhOldpFKhSJk7j5GP27thyDGmacx5ATG2SBfZ9NeQuLCs1iEiP
 6XYG4a4CdAeG0FPWmcjQn4kAInUTenGrQ6+pO97R4TsCtTvNXA8R3RxYouMwdbduvmom
 u+aQWWw9WNYwsc0Enk2DDS8qplNe+RYZey3LAuVHRB4bo9RkkpJuvgw48NLJn+4EhimP
 PMxNaeg0jlSubcj2DSTkvKxM5zIMbb03ueYV+T3hFnHZiuAvaNodlA2A8a4aMGgIQ3N1
 IFK9SEKkdlSr1reSZfCXu6RYQuV0q6Wtovicchc8brQbtne/KZo/KQgyZZA3SLOi2JXT
 qp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xTwMJU3bsMsUDKAuT4u9lBehIy/XuCs4LFcFtzDowXM=;
 b=kBAa39kSlxZx2VAjqqBadxdvL2N2s/hqgYBnLHefcjtO5YpFMVrCx8KTZHR/R/P2vW
 IGGwxUF3FYahzX5lrYMNCNmoQ5mDoivWOw/UJgaoW0byqbBfU1moKOqghcz3HVACUgEb
 1krR4hduo8enboH6QMFnEvG1ftu27Q4Y3Fb6Va0S8hoHW2yqZx2CiU5D7+O2+hD4Bqmz
 FEZ0fRoFhHN9R4nepUZLiO9jO12fC/PnCsYeqJ37Kk6TCRxU5yBCYBe7mMoUb142WLCQ
 AB+DtjJO/Kp+s2Lb8w1c2BZ4YGS3jgf28g23boACGr7MlB2cQqhNocttPTKTmh8LGbDZ
 iiSg==
X-Gm-Message-State: AOAM532xiwYAe2u513mJyv/lOl/oMfPkBPcVl3abVdQNp37roSL9cDtf
 xbXi5vLGHEYHXCtSNMzDOyBi7xrUIKrsSA==
X-Google-Smtp-Source: ABdhPJwEmcbuvaIIX4mz7VWJcltMVThj7asShuqWk+eN8Rny/YntDxdqWouBS2mvHm37T9aOUYsqjg==
X-Received: by 2002:a17:90b:4f44:: with SMTP id
 pj4mr18851189pjb.100.1624992899566; 
 Tue, 29 Jun 2021 11:54:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:54:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/63] target/nios2: Remove assignment to env in
 handle_instruction
Date: Tue, 29 Jun 2021 11:53:58 -0700
Message-Id: <20210629185455.3131172-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Direct assignments to env during translation do not work.

As it happens, the only way we can get here is if env->pc
is already set to dc->pc.  We will trap on the first insn
we execute anywhere on the page.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 66f4c25b06..6fd4330b31 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -740,14 +740,15 @@ static void handle_instruction(DisasContext *dc, CPUNios2State *env)
     uint32_t code;
     uint8_t op;
     const Nios2Instruction *instr;
+
 #if defined(CONFIG_USER_ONLY)
     /* FIXME: Is this needed ? */
     if (dc->pc >= 0x1000 && dc->pc < 0x2000) {
-        env->regs[R_PC] = dc->pc;
         t_gen_helper_raise_exception(dc, 0xaa);
         return;
     }
 #endif
+
     code = cpu_ldl_code(env, dc->pc);
     op = get_opcode(code);
 
-- 
2.25.1


