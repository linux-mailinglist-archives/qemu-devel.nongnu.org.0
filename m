Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4066DF42D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 13:49:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmYtg-0005yk-B3; Wed, 12 Apr 2023 07:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYt9-0004ml-PL
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:43:47 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYt7-0002PS-T9
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:43:47 -0400
Received: by mail-wr1-x42b.google.com with SMTP id g5so13963139wrb.5
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 04:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299823; x=1683891823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jf2N922f7MxhHGZfTcgNdzsCq9UU22b0tOdlcxX9fy8=;
 b=v/jWYxdJsgTuWFPt6wHpyVXn2fUj/zYPVBvMTgmj+8NBdxqnxOIr6zyx31dKLv5sb1
 Sfie28Z3vW3trfGGnL5kSPdiUVVO0joqiR7ai//b4jKF19uxA9okt4+bE2EHzQaCMn0x
 APUQMJmhYKtWRT+nyCENCV+Uu85AydKyV98g5lkYq/bC83I2iPAFsGkhFFEE3SP2Q6eV
 o1lkCwKEPPHNT0/j+jblNG6qAu53yve3LL6hpW/fs1KH8pQ1K9XoPeuUP7jku/Vt7lEL
 WkRnCVFnDgwIQBaEyaNazdcfYly/h8jTN64LsmhvAV4QJ4+rWdTxMUjEAZEWUstQmoJa
 vU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299823; x=1683891823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jf2N922f7MxhHGZfTcgNdzsCq9UU22b0tOdlcxX9fy8=;
 b=PE7dsA15B32lB08sZsX45GAmtJ/+r72rrHicNk3JyRjlSpzTAbndotqQ7ZUiZrsMWx
 2Oyo2KBzn+38aj9cmtx4pRiRBI+eQ1kAK7y5LKhffqpfUQ8cvwvPPWVFskaCC6gcjQHq
 NgvyvSMkB4Z6Z2YYQVMZUqF/dSnSMswQCE5qZ5miYRhC0QW31cQluTTZGfalCIZ9+EXY
 iaUTwAglwPL6hageHV10NwKmknvf7DZACif+TcHT/MEtEraka7DsRCUTeojETyl1x7bK
 f2wKXMmBEKH1Zcw/PTk+OjXDDp6U7pmhfUBa1coZtyecAV/lh6aAcII88oiO85/MZKm7
 nOBA==
X-Gm-Message-State: AAQBX9fefW6P8eNCalruf+WycQFnAcFHDde0ST1ZVPf1aVSMTYk53vOg
 8slb+zbrYW719vr1uCcGtil0gXmywGP0BjD3JPeSr8sh
X-Google-Smtp-Source: AKy350Z9I8VNHI/2rTFt8qdAoLS5u/dXJyYo6UGRa8rszrfmxZje4BBdckRBqMN1zRQki3cusGc59Q==
X-Received: by 2002:a5d:4e8b:0:b0:2f5:20b:e944 with SMTP id
 e11-20020a5d4e8b000000b002f5020be944mr586206wru.29.1681299823058; 
 Wed, 12 Apr 2023 04:43:43 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 09/25] target/riscv: Use cpu_ld*_code_mmu for HLVX
Date: Wed, 12 Apr 2023 13:43:17 +0200
Message-Id: <20230412114333.118895-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Use the new functions to properly check execute permission
for the read rather than read permission.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-10-richard.henderson@linaro.org>
---
 target/riscv/op_helper.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 00bdf77f32..4a0bb5b11a 100644
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
2.34.1


