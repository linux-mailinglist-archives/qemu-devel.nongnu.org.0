Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC3C3C1782
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:56:28 +0200 (CEST)
Received: from localhost ([::1]:48570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XK7-0000My-3B
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5D-0001ZJ-7B
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:03 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:40882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X59-0008C9-Ut
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:02 -0400
Received: by mail-pg1-x529.google.com with SMTP id g22so6598701pgl.7
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nBdqjSVeVXgtT2KNOpd+QF/PXWJox+iIJ0CG3FMfQD4=;
 b=NIoBVMMjsl6FFLjYMlxelflCu0X6sSw0MPqhXr1SY2wmWNwmyBWSSH3zpf8qyufnxd
 5Mj5hB2ObC93Ng1Oq8sybzZ/JrjO1Ht3SxZVobr34WSUaYUs3CNVOE14TUHxRn8gsHnR
 LWWKh6PlyDEnTDorgwaIO5RZa77fd8erTSWEmj9gH4ugNSHe6GrVFOvJMe8YiEqaqk+P
 s9WHJkbTmi5cazICK2gOgmM456wnNGzBeViaQajm0GPEWHEsoGCi2xANnPCgg8mprvEB
 x59VH08jleh+I2QHW/opcv08CCvv3BAhf4M64M38owwmTII7KdrXotykl6fqhRhCoM5f
 ZLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nBdqjSVeVXgtT2KNOpd+QF/PXWJox+iIJ0CG3FMfQD4=;
 b=OGpmKox1Wekf7wV39YhmM436D/VaVHr+HwTv4AUjPpRttApLHOm/LUoytJEaEAi05C
 tUUx1Wh/UrBk3yVtuz2t8nX0z9SMTYm4Se0dZG83uiJuz4VPqtyGRskZL3aVCDaFAWYr
 nTGAKSIIlcHgi1ucdqUsgamyu3BRQt3NS8JeUCIrKmWVtri4czRe6clhAQxxVi6btpWy
 tRVMBe7T3COfDmZH0A39zKfVFy8ltRNjmJiEQT1c6ZUO4rl4RuLI2Kp/rQRWKyYiXuLu
 Tr1FNKNS+wU5GRHqkuzIKgMn6GpfJK2jGeiEwz8YXr/iQbP+A4u2flV4TtSf2RSruCJ+
 SPrQ==
X-Gm-Message-State: AOAM530xY7ox+5U9huLJhvXpOJWhmR6rGZCNN7xdu8ddL4aCgF7xplZd
 uIsh5gMA6mx3NNAaba0Ih1AjyuQyhgWFuA==
X-Google-Smtp-Source: ABdhPJw1+8hME2SByWU/g96/HAksD4AxOeT6dUPadSKL+PQoY6k6xYdrL5pgm6Vmj9S0IAfU2gk0hQ==
X-Received: by 2002:a63:1c0e:: with SMTP id c14mr32546924pgc.11.1625762458460; 
 Thu, 08 Jul 2021 09:40:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:40:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/28] target/m68k: Use translator_use_goto_tb
Date: Thu,  8 Jul 2021 09:40:35 -0700
Message-Id: <20210708164050.711967-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Acked-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index f0c5bf9154..05b96fdda7 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -1520,16 +1520,6 @@ static void gen_exit_tb(DisasContext *s)
         }                                                               \
     } while (0)
 
-static inline bool use_goto_tb(DisasContext *s, uint32_t dest)
-{
-#ifndef CONFIG_USER_ONLY
-    return (s->base.pc_first & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)
-        || (s->base.pc_next & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
 /* Generate a jump to an immediate address.  */
 static void gen_jmp_tb(DisasContext *s, int n, uint32_t dest)
 {
@@ -1537,7 +1527,7 @@ static void gen_jmp_tb(DisasContext *s, int n, uint32_t dest)
         update_cc_op(s);
         tcg_gen_movi_i32(QREG_PC, dest);
         gen_singlestep_exception(s);
-    } else if (use_goto_tb(s, dest)) {
+    } else if (translator_use_goto_tb(&s->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(QREG_PC, dest);
         tcg_gen_exit_tb(s->base.tb, n);
-- 
2.25.1


