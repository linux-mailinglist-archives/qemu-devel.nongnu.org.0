Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 247C96DF41A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 13:47:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmYtl-0006aU-GG; Wed, 12 Apr 2023 07:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtJ-0004z4-UD
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:43:59 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtI-0002NQ-Ai
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:43:57 -0400
Received: by mail-wr1-x430.google.com with SMTP id e7so494456wrc.12
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 04:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299835; x=1683891835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zn52Ufb7DRbVaQ81Qm+6XQB/991khVVrBH6/wkfCyPw=;
 b=tct9DIzAzD/uENt4eA2Cqn0Fmd8KmINwv3jrPeu7YUoQLVUOVMPtzAs11P6KlHoEBq
 psbFabdJIBPWD8DQTUYlUO5bBp6p39SwcTmPc665VJgPvKHUuOW+CqMdp8GkU0XJ9oPj
 7ul9MXh2162cSexD4qFLsIoMAFyFaVC4ZBRwsAz1P016MjhKtLo95qBEvRVU3AP3CaKX
 nDJFB10/mTbU4jfLUWHkqxm0ZIcYbCSBiVXXCFptlpFk2L9542vlDyh/zh6bnFMuTR1J
 P0A7IWrKn80LU++ix5yPdWrYQtInz+oRSBp+3hDDaFa8/fwnedql3nDOcE9P+A5Y7Ev9
 z38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299835; x=1683891835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zn52Ufb7DRbVaQ81Qm+6XQB/991khVVrBH6/wkfCyPw=;
 b=q7CKL8ehhIdCmhydA2w6AKL9fYmpFTf1feAKCCMMb4AMg4OXbNBDHOdUESbj/0LvNC
 5YOrMI+1CGrsFFKiZDjm4NGwerASDW2PVmWGm+DKUk6xIiFpxwB9QDK+lCi6qvODDsga
 zN0T9naOk/MGajOlWGUuzAe6NthLGn9YvuzjRN4CYGB/YQp7tjl7xoZ6zaC9EcEm1/+G
 mAgv4MNwxXq90Gbv4ts0+Lz4wMjKrkJDL1x4//6c1feivt06ceiqLAGpiXoCy2nHFgok
 3IlJO0L7iyZCQ2kdP19dC5FrRebk+IdYuI+1BrsCg5mvlkBI/LMKZb7YGa517q3ynZ/y
 3HvQ==
X-Gm-Message-State: AAQBX9cKOWZXwGl19s3OtpJZa6vsIdjq0HaxMWCP8dKn8JEho0cn/5bH
 XBhy9r7ryweJXRCDtfYlvU4++/PXw3kq3WIZEU+q+pJC
X-Google-Smtp-Source: AKy350Y7eOmOq9QKa+ymbWiAbGYqs2gUm360EMJFkcH6lpvLADPH9jRCJHxcCQB4Dt272SSs6fVbHg==
X-Received: by 2002:a5d:4902:0:b0:2c7:d575:e8a4 with SMTP id
 x2-20020a5d4902000000b002c7d575e8a4mr9580924wrq.65.1681299835563; 
 Wed, 12 Apr 2023 04:43:55 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 22/25] target/riscv: Don't modify SUM with is_debug
Date: Wed, 12 Apr 2023 13:43:30 +0200
Message-Id: <20230412114333.118895-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
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

If we want to give the debugger a greater view of memory than
the cpu, we should simply disable the access check entirely,
not simply for this one corner case.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-23-richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 6dc3fdf594..9a2b944990 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -823,7 +823,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         }
         widened = 2;
     }
-    sum = mmuidx_sum(mmu_idx) || is_debug;
+    sum = mmuidx_sum(mmu_idx);
     switch (vm) {
     case VM_1_10_SV32:
       levels = 2; ptidxbits = 10; ptesize = 4; break;
-- 
2.34.1


