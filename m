Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B40A36F7A6D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:13:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujwZ-000232-Mk; Thu, 04 May 2023 21:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujvL-0000uW-Iu
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:51 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujvJ-000860-O3
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:51 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-24e015fcf3dso931895a91.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248868; x=1685840868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rrHxR+eiZh8W9v/w2e7/d7prgivlc2G2D0PUHvIbg2s=;
 b=EtcBpEpMtqmr2taqIeWkwvrRzZZMETzTadrBFIRkxySiJbOOEAQoI8gZZt0N3otq4A
 p7JlsFO+h+H4dmsIbu+0zMGbssNnnE77beEz1q0eMKVGgnW1smWPBjex9HasmUpazmVZ
 8aoi54NXQF7RnjfippmHbpqsJCPMfD6blyMdoxHsxdKmStive80NFNuniUGRrs5acdXx
 e9AFGB4m5fReBNC4i/KYI2rivBUkYSzh7FX9sk/fa+u+fxE8yHnxyppgeAZtWyGtZHVx
 R6H5C5suXc2SRmwJL+zyPELbvcdCEYL982ZKmGcd3XrCmdjLeL4ghWVqZgimgDpDhFLX
 xTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248868; x=1685840868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rrHxR+eiZh8W9v/w2e7/d7prgivlc2G2D0PUHvIbg2s=;
 b=R0lB/ftGY9DNbBwpvyUjFOuxWwFhiVPq33pdlhB6FWj7uwReLiR3K97Nam45zUW8zX
 5erGgwWuYDUnHaJ4yfSeVsojHk8T03ZWiMgSbMxdzoEEtmPID1xwXHSgxVGk7IJynRBX
 U9zrZ/9T0ni5vP4aAe+ll7RbnhjHqD3HlFcn+EctzqgOTiDzmjedg362JQms4n+D/sdR
 kDAbdGdn0Eh8Zbq6f7dOi+xl5R32ebtNhWlIhfgkr0VWyF9kc1uBxSdRUMgevGw3Hck2
 r6wIXu8FdIQ7bfHV32SIG1YAbaTDpUp47rwWyu6dTCVEwVJLyUnV2Z0t4QTSWw+uuyTr
 F/Ug==
X-Gm-Message-State: AC+VfDwOSSmi/bx3C4L5Afw16sbdS8rTgbQK9xt7N9rMqNzDcJw79cAq
 2nxzVhSh/kpKcwFBnsW8qk4snCQbq3nuuw==
X-Google-Smtp-Source: ACHHUZ4yS/+CUbdeDnA+n0pbgimztEEgD9OYwLgLmQ+bx+f59TySAkBI9o7y1d16T553UOdBsXQ+aQ==
X-Received: by 2002:a17:90a:9dc9:b0:24d:fcc0:1949 with SMTP id
 x9-20020a17090a9dc900b0024dfcc01949mr4503655pjv.12.1683248867979; 
 Thu, 04 May 2023 18:07:47 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:07:47 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 78/89] target/riscv: Don't modify SUM with is_debug
Date: Fri,  5 May 2023 11:02:30 +1000
Message-Id: <20230505010241.21812-79-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Richard Henderson <richard.henderson@linaro.org>

If we want to give the debugger a greater view of memory than
the cpu, we should simply disable the access check entirely,
not simply for this one corner case.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-23-richard.henderson@linaro.org>
Message-Id: <20230412114333.118895-23-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
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
2.40.0


