Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA7D6C8DA4
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 12:52:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pg2Rh-0004My-4x; Sat, 25 Mar 2023 07:52:29 -0400
Received: from [2001:470:142:3::10] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2Rf-0004D6-G0
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 07:52:27 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2RZ-0007jY-RS
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 07:52:24 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-177ca271cb8so4466131fac.2
 for <qemu-devel@nongnu.org>; Sat, 25 Mar 2023 04:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/7CakJiw3FQaq9CQRWEMSVcA4vdqDdKzHfEhTBS4YSs=;
 b=gopGEyhaaZwI3LHRzdeS2jLZ/U5biUqM1u8DRng/Bs2DsWQEObLloIPoh4r7djr4iu
 /EzwWaQw9rQkUu+evpJI52+FhcTXul0qmBjcSFtg6EbbQD4Kzl88Ldd+WFzjRN3N8rfn
 IJQeBJ/gu40eWBfy7+NHkIoIlbmx1RzbEFCO3lZa3WplcqtsYmVhh4Xf4yv0OyyHyDKl
 7QIojW35hPnMoZlJk5pqIr8Kji7fU73JgLCsjKnUtndzcdFRpOyr1V6RE91PMtndsmOg
 MYFwocp6znuTGviKG3PRrCfd5NKNqXnI6HN4TWq4Sl1+ZBYLxKj39LybY7PF/a+s1aVb
 MiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/7CakJiw3FQaq9CQRWEMSVcA4vdqDdKzHfEhTBS4YSs=;
 b=vjQKXxfYhNrw2MZVQ2nvrZKwXONTKwVviiiTzomfu+yfBdbiyhi73yHVVKaOjTVlBu
 xzrVmqStmUr06nSqmGRl88jl3eQ3OsEC2Dzg8DdSXjRNkE8YflIlc0RT19PmrGkrcntf
 18w1cXLctfZjrhdG0k2SewlrkNMnCeUagw75GqEfpAHPLKQB2RUweJQYotBE6OYSSv71
 8KxMy0Rd0egGTz5y1CZS0lMvhiKzbIf3IpxBl/KXEP920zh4SlsO7wqNTAGY4GmXN+rq
 fo7S+k6IGbGIm1P7geVLZteBTSKxpHqwQJrSgeZJM8eYIPgZm+uIgsqtpIr0EJ+uvxbj
 zs1w==
X-Gm-Message-State: AAQBX9d5ya/EAPp7ah1lUZiyJEpqgFFOD64rfbulbplORvYGRU5Q6Ltm
 wwZswc689h+sLllLmOnRGwUlUTViaSehABDcd/U=
X-Google-Smtp-Source: AKy350bUMtBO4/F2yR0lv6X0fjoYzf+2BCfWMM5kkQzdwXjGxGeZce/jh8Byn0yU0maVjSkawsK3yA==
X-Received: by 2002:a17:90b:38cc:b0:23d:4e0e:cf34 with SMTP id
 nn12-20020a17090b38cc00b0023d4e0ecf34mr6017114pjb.34.1679741682165; 
 Sat, 25 Mar 2023 03:54:42 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 13/25] target/riscv: Introduce mmuidx_priv
Date: Sat, 25 Mar 2023 03:54:17 -0700
Message-Id: <20230325105429.1142530-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2f.google.com
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

Use the priv level encoded into the mmu_idx, rather than
starting from env->priv.  We have already checked MPRV+MPP
in riscv_cpu_mmu_index -- no need to repeat that.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
index 7e6cd8e0fd..cb260b88ea 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -771,7 +771,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
      * (riscv_cpu_do_interrupt) is correct */
     MemTxResult res;
     MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
-    int mode = env->priv;
+    int mode = mmuidx_priv(mmu_idx);
     bool use_background = false;
     hwaddr ppn;
     RISCVCPU *cpu = env_archcpu(env);
@@ -793,10 +793,6 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
        instructions, HLV, HLVX, and HSV. */
     if (riscv_cpu_two_stage_lookup(mmu_idx)) {
         mode = get_field(env->hstatus, HSTATUS_SPVP);
-    } else if (mode == PRV_M && access_type != MMU_INST_FETCH) {
-        if (get_field(env->mstatus, MSTATUS_MPRV)) {
-            mode = get_field(env->mstatus, MSTATUS_MPP);
-        }
     }
 
     if (first_stage == false) {
-- 
2.34.1


