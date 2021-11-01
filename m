Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 994F8441FB3
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:56:36 +0100 (CET)
Received: from localhost ([::1]:59492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbXv-0002li-MZ
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb6B-0003nu-62
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:57 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:35457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb60-0000dk-Mh
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:53 -0400
Received: by mail-qk1-x736.google.com with SMTP id az8so6040827qkb.2
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fofFGJJJzbXM7L3Ibz3JhPAmpo8LElJ1YWB6iIwHWsU=;
 b=iJz5aBp5c5DmycG9BeNmcEJaa7U+dntpj/XdowBohvetysOrXufHfUAts+tRn//gWD
 z/3yj+ghOf+aicrZQJ3M0ss9PM3k6/nteqLfJNX32bqjszbjjHYkNGlt5nsIGADJO/Tt
 W0Y/ruhyiIR6sYwey0x+SamdyNh3y5Lc4hxaHAnfnbZHGPMIVgmrZFobB5vs1k7ObPgN
 ZBPqQ5ypltEfCUW2Fwgg9sz3syYWT/zkG/sYjR68df9WI5IvyMIFiy/A7jmC6Siqd+Ef
 DAX22/lp2iwz2CA575b55oA7ENiH5neH9Vi4kTSBJpKnhPNPg3YnvA0okVCU19ZV18d2
 /mqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fofFGJJJzbXM7L3Ibz3JhPAmpo8LElJ1YWB6iIwHWsU=;
 b=fCuG0P0SwukmaLCKSJBa0ICzNUYEJy+BZO1QRGSMqq8deu7HASywNT+vUZiKkhzYhH
 oAWk7sLdRPPy8AKMuzLP6PwJY0l11Fm3nvPGI8XmMSQg9QZup4UjL9hN2pVMHfJycjEz
 B5hQSFzJScmw4dvBmhumfUETUPDRw7vsYoXcij59SLL82DdL7DI8oiLNXS5+fTJbPAns
 VfEH+I05WJGQP5a3YMMsxA5oD7+UoyoRCoLuBw5eJA+/gGRRwGen3s4kEDth6Pvk98jW
 uMJtQgN1GXpFTKuHi2JLIeaB3aRWD08F2gWlhUbIMS7Wcb1n9blEJmjOt5qo3owsu+Kq
 aelA==
X-Gm-Message-State: AOAM530r91Bj1TLI+9kqoyaUhNu7RPG5a8YnsIjWrZtLqyc5sqAiHUXn
 yNAID9pkC/goK9gGu5hl8dxYGjO4LxiGDA==
X-Google-Smtp-Source: ABdhPJx/MjBSKYVgkyYAXzC6Kj3C1xb78zct1s/6wF0h/uEymQb66lOtBVKACTRyKpIsL8YqVKvSyA==
X-Received: by 2002:a37:b2c2:: with SMTP id
 b185mr24576789qkf.272.1635787663810; 
 Mon, 01 Nov 2021 10:27:43 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t5sm6075331qkf.34.2021.11.01.10.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:27:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 22/60] target/arm: Use cpu_loop_exit_sigsegv for mte tag
 lookup
Date: Mon,  1 Nov 2021 13:26:51 -0400
Message-Id: <20211101172729.23149-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new os interface for raising the exception,
rather than calling arm_cpu_tlb_fill directly.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 724175210b..e09b7e46a2 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -84,10 +84,8 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
     uintptr_t index;
 
     if (!(flags & (ptr_access == MMU_DATA_STORE ? PAGE_WRITE_ORG : PAGE_READ))) {
-        /* SIGSEGV */
-        arm_cpu_tlb_fill(env_cpu(env), ptr, ptr_size, ptr_access,
-                         ptr_mmu_idx, false, ra);
-        g_assert_not_reached();
+        cpu_loop_exit_sigsegv(env_cpu(env), ptr, ptr_access,
+                              !(flags & PAGE_VALID), ra);
     }
 
     /* Require both MAP_ANON and PROT_MTE for the page. */
-- 
2.25.1


