Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164506F7A9D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:19:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujut-0008O0-32; Thu, 04 May 2023 21:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujub-0008KH-KO
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:07 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujuZ-0007lb-C3
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:04 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-64115eef620so16306540b3a.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248822; x=1685840822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=APvvZooxKzMDjU/SEAU1BSPZSDT4yDNWxKxwghZLWeA=;
 b=YnSPJFDi2QS3XwmsDUzZdvMgDYea39r/kwJLlxfsNcCTABUx4u2IXjOj6KoVtmG6h9
 Y0l3Bb3JBl3RIdvH1MdtW7fWUUVmGLXpnaCE0SsrBQg+Dk2tP85yioM79F3zC9E1qqeX
 vi77n+0hKqTAbHXkNs4w1z6FD80tk+Soi2odT3NVyzEy5BAazjS0E5v6KcpzV9IQwi/t
 VoKKK5DZvpS4HvcSNoZ1IRUF34ny1MjZVDPh4WwF2hL3sS1kSWkHAUcwWtE9SepNeonz
 HSbVhByRBltwbIUdS7XsLbNeaUE/JKYD9RiYGKiRFHY5HrvMzhgfsi7NlxXw2hcBmaU+
 qrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248822; x=1685840822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=APvvZooxKzMDjU/SEAU1BSPZSDT4yDNWxKxwghZLWeA=;
 b=gxRP5SGDsKdHI3DMnl/xodGIbgoA06EZyHlWl7C5ouA/ULTpTwujcvGenS6Ag9e18v
 Cf87uenhnci8yJOAQqJUfnRvS5LkYzJ8rfwkU4rFaQgy+9xMGzjMTdSa3n4hl3mpkQHX
 tf5HDKvF7AXvi/pjB9VwSUjt5d9Dc1V3ehQ1BoBZ6Q1Q15yqVnJOhdyNEGTJyEkCsAD5
 8go4119qTKdf7Il7bDL1g1QVEMFw4CV4+C6yWSZ/BVE3CE8LYZGY8f0t0oLVcTlpp2DB
 1ZzHwTO82PX6NyNaRL8EOgSQ1l79VLzkGB6Twf6NCKOANkEhXhe9jjOD0ci9EmscBTSz
 RTkQ==
X-Gm-Message-State: AC+VfDynbLCjSrsFx8HNoiG2SU73Y8rFDbwss3jAYtB7Y20T7COJD4IV
 Ut+3x7RxkovKPKk4jKqUhTfvfEn5aOlxDg==
X-Google-Smtp-Source: ACHHUZ4qL6qH0JeZup0ANp1txO9nR1NLAsFLyYq/M+6icira9o80YYkZH1sgco5PibWjhbbOwDoRYw==
X-Received: by 2002:a17:902:f546:b0:1a3:dcc1:307d with SMTP id
 h6-20020a170902f54600b001a3dcc1307dmr6869053plf.23.1683248821807; 
 Thu, 04 May 2023 18:07:01 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:07:01 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 65/89] target/riscv: Use cpu_ld*_code_mmu for HLVX
Date: Fri,  5 May 2023 11:02:17 +1000
Message-Id: <20230505010241.21812-66-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x430.google.com
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

Use the new functions to properly check execute permission
for the read rather than read permission.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-10-richard.henderson@linaro.org>
Message-Id: <20230412114333.118895-10-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/op_helper.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 0adfd1ca9a..49179e7a5a 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -427,18 +427,27 @@ void helper_hyp_gvma_tlb_flush(CPURISCVState *env)
     helper_hyp_tlb_flush(env);
 }
 
+/*
+ * TODO: These implementations are not quite correct.  They perform the
+ * access using execute permission just fine, but the final PMP check
+ * is supposed to have read permission as well.  Without replicating
+ * a fair fraction of cputlb.c, fixing this requires adding new mmu_idx
+ * which would imply that exact check in tlb_fill.
+ */
 target_ulong helper_hyp_hlvx_hu(CPURISCVState *env, target_ulong address)
 {
     int mmu_idx = cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;
+    MemOpIdx oi = make_memop_idx(MO_TEUW, mmu_idx);
 
-    return cpu_lduw_mmuidx_ra(env, address, mmu_idx, GETPC());
+    return cpu_ldw_code_mmu(env, address, oi, GETPC());
 }
 
 target_ulong helper_hyp_hlvx_wu(CPURISCVState *env, target_ulong address)
 {
     int mmu_idx = cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;
+    MemOpIdx oi = make_memop_idx(MO_TEUL, mmu_idx);
 
-    return cpu_ldl_mmuidx_ra(env, address, mmu_idx, GETPC());
+    return cpu_ldl_code_mmu(env, address, oi, GETPC());
 }
 
 #endif /* !CONFIG_USER_ONLY */
-- 
2.40.0


