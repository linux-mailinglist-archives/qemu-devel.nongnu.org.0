Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A98968A02C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 18:19:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNziN-0007vE-HG; Fri, 03 Feb 2023 12:19:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNziL-0007uv-9R
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 12:19:05 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNziJ-0003uz-Ea
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 12:19:04 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 nm12-20020a17090b19cc00b0022c2155cc0bso5551108pjb.4
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 09:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TQQRTt9wh6JkN5MkdqnTeYcUcVtxRYe/lb4nMRLRe4o=;
 b=pXjMy3LdvgqLub3Zh++VappA9vB8psUy2nMJq7j/VpIxm5mBVQ9ffgF+wsW1q3LVp4
 7xQNKHUCa7/BblX2oqMZ70EZN7q4b1Ndp3uw4UbiOeMNrCmDUbCqFntcIFDHiwkiI7WA
 2SaxbId54nLxT3UEbF+rXyS0aAzVVQPBWSEPYW/1ZOGNNRJMeWYIvk6RymlsBB9m9NR8
 jvGfq7DayGvX8ykfIAqJLJbOsww5YKzz+jC9vd7LMdkMzpvk679AlKrcWk80Zmn6tMv3
 AE4zHBpTBhti29IgMzsQ1TE/rCNv5PR4Vrl0myNyeTnVMji8JpzqMJAojFPLHwH833Wy
 NNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TQQRTt9wh6JkN5MkdqnTeYcUcVtxRYe/lb4nMRLRe4o=;
 b=GAsa1Qh7pf5dAuvGymdM5rLbhWQLY9dB0LcESefxsepFKxI/pIIa7ZPeGxfKzUtKGi
 ei2tupuiwNL+LE7P4BuMNz5I5DGJQ9SylmR/SSOdmhK6Zb2XXJVUqHgjJmZqDmnTtYHN
 I/9ktiBBEFEYzbXsU3TUb0rvG5Sq5wQfemrkkJVNpakarKxDeYXkbdd+xYsNUbXwCSk8
 Tc0UfHfE1WFrtuxfYFPa5RE53M02NkVT0hcz6U5OcaqkMhj/LqSJKhwzCu8vR2V+iJdC
 +wuSUcdFTtuaXynmCCW3W0ZdXfoTnWsw/y8yp23TKTzQXUMR+B4N1Wdq7+mFI4OaEVfT
 a2mQ==
X-Gm-Message-State: AO0yUKXIlMC0i8z4r0gSRZdtVtgMkrPgU2Ukw4wx2DDlcdEa2mC/kqYk
 Q3KKPfMJqPhE+PrI9EfaRpxf61Zydwab7c7l
X-Google-Smtp-Source: AK7set/mdKnGrhSvOPVrTlC2qZ0LOmrp4CZ88Zsllu7EqiQpUc9MGhs2Wo10Ly6ij/uvHL563fMUtg==
X-Received: by 2002:a17:90b:388a:b0:22c:745a:7ad7 with SMTP id
 mu10-20020a17090b388a00b0022c745a7ad7mr11907762pjb.5.1675444741783; 
 Fri, 03 Feb 2023 09:19:01 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 ms17-20020a17090b235100b002262ab43327sm5254459pjb.26.2023.02.03.09.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 09:19:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] tcg/aarch64: Fix patching of LDR in tb_target_set_jmp_target
Date: Fri,  3 Feb 2023 07:18:58 -1000
Message-Id: <20230203171858.3279252-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

'offset' should be bits [23:5] of LDR instruction, rather than [4:0].

Fixes: d59d83a1c388 ("tcg/aarch64: Reorg goto_tb implementation")
Reported-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index fde3b30ad1..a091326f84 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1914,7 +1914,7 @@ void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
         ptrdiff_t i_offset = i_addr - jmp_rx;
 
         /* Note that we asserted this in range in tcg_out_goto_tb. */
-        insn = deposit32(I3305_LDR | TCG_REG_TMP, 0, 5, i_offset >> 2);
+        insn = deposit32(I3305_LDR | TCG_REG_TMP, 5, 19, i_offset >> 2);
     }
     qatomic_set((uint32_t *)jmp_rw, insn);
     flush_idcache_range(jmp_rx, jmp_rw, 4);
-- 
2.34.1


