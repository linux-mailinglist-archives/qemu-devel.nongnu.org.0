Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E81976F7AA7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:19:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujuy-0000IT-FR; Thu, 04 May 2023 21:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujup-0008WP-4E
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:21 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujun-0007yG-Di
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:18 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-51452556acdso731164a12.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248835; x=1685840835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RGNIw9bc7Cyb4tZyzwGyzD9oYOSakGAm6uS/tG53Jdc=;
 b=GXERoG+dZGhszy9tdsnXMJUOH7bukEQCekqeIhXQlwt21wogNNjqVhl/po20QC9X2w
 7KQbwEHE7Vy1a/o/97ymvw8euX0bQuDmvLJWXkRYW3cbG8FTy570iM8LMUwU+SqE7GDJ
 VZlxlscwsPC7U7KYWlE/lSZFgJzSEWyRU8iiyvusxMi2sOPw8Ka/Z5sFK4oTqubCAQtZ
 9J5nWZV2Cv0tUKWm/y4cHdrEJ8nQsozkQ4SJCS1dIFrQpd1SReTIWO2foGovOoHfU7/5
 o+gH0zdNFOOyvwIAn3XtGTLE49v3a4ujDDhlqtIT2vRFJeCfhkk7OW/XdsAWafr7RTCQ
 Cyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248835; x=1685840835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RGNIw9bc7Cyb4tZyzwGyzD9oYOSakGAm6uS/tG53Jdc=;
 b=CoHGRedsOPf0fT3XNbqz8GLJXBzeZKMJAGp+C9hB6YfHA50F/Yo4cMoNtt7VEQifsl
 criHvIkroIxqD85YGQFNWrX6738bMK5WvUHeYDlWxVOHAwYuaPHncim7MLAwgzsM6qRV
 SsnE6XxB9HoW5irrdiKfUda+TVUyYxo7MyYsG+Y0mu0me6ZQRn0+FLtO8F+vDgmbKWHG
 hoVOuMIT5jsoNaQ1LIfKYGuofsvOZkuOF/7Tv9NcxvRULrubwDA0hCkk3U6y79JGsini
 CqDNn+C4HbDz1MD4lXTIb+8TtDEJHxiolYn0gzwzID8fhy2baKl+Xp2MibDgpxmNcgOv
 7i+A==
X-Gm-Message-State: AC+VfDyb27TBYj1xRdep9YzKIlxaE7mDTj7oBMhIkvF2gMUq399+4LWh
 OJhPC2lW9p56kNyXQC51p5jXzIP1moFUbg==
X-Google-Smtp-Source: ACHHUZ7iyTAvqn6qf26bxjwYWw8EunvKxfCopx0/kDtBbd5gTXP5ypwFYSfsLXo9mKe5zCKGWKb/rg==
X-Received: by 2002:a17:903:22c4:b0:19e:4bc3:b1ef with SMTP id
 y4-20020a17090322c400b0019e4bc3b1efmr6160564plg.64.1683248835607; 
 Thu, 04 May 2023 18:07:15 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:07:15 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 69/89] target/riscv: Introduce mmuidx_priv
Date: Fri,  5 May 2023 11:02:21 +1000
Message-Id: <20230505010241.21812-70-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x535.google.com
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

Use the priv level encoded into the mmu_idx, rather than
starting from env->priv.  We have already checked MPRV+MPP
in riscv_cpu_mmu_index -- no need to repeat that.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-14-richard.henderson@linaro.org>
Message-Id: <20230412114333.118895-14-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/internals.h  | 9 +++++++++
 target/riscv/cpu_helper.c | 6 +-----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 0b61f337dd..4aa1cb409f 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -37,6 +37,15 @@
 #define MMUIdx_M            3
 #define MMU_2STAGE_BIT      (1 << 2)
 
+static inline int mmuidx_priv(int mmu_idx)
+{
+    int ret = mmu_idx & 3;
+    if (ret == MMUIdx_S_SUM) {
+        ret = PRV_S;
+    }
+    return ret;
+}
+
 static inline bool mmuidx_sum(int mmu_idx)
 {
     return (mmu_idx & 3) == MMUIdx_S_SUM;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 29ee9b1b42..57bb19c76e 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -758,7 +758,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
      */
     MemTxResult res;
     MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
-    int mode = env->priv;
+    int mode = mmuidx_priv(mmu_idx);
     bool use_background = false;
     hwaddr ppn;
     int napot_bits = 0;
@@ -781,10 +781,6 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
      */
     if (riscv_cpu_two_stage_lookup(mmu_idx)) {
         mode = get_field(env->hstatus, HSTATUS_SPVP);
-    } else if (mode == PRV_M && access_type != MMU_INST_FETCH) {
-        if (get_field(env->mstatus, MSTATUS_MPRV)) {
-            mode = get_field(env->mstatus, MSTATUS_MPP);
-        }
     }
 
     if (first_stage == false) {
-- 
2.40.0


