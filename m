Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E43B6C8DAF
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 12:57:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pg2Vd-0002gL-9m; Sat, 25 Mar 2023 07:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2Vb-0002c6-6g
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 07:56:31 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2VZ-0001AN-Ir
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 07:56:30 -0400
Received: by mail-qt1-x831.google.com with SMTP id c19so3936140qtn.13
 for <qemu-devel@nongnu.org>; Sat, 25 Mar 2023 04:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745388;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1C7JBeZYsSuK59INs65mEH6x0tpxz6ymfYLghIcQtMo=;
 b=nMz0+sQQgJ37fBeD8S4rFQLNW/X9vGnC9tqiQz1TCTRldvSqpEO/I94B1pw89e9y4R
 7CqDu52zE5WlO1MgbgnIEIzyuLcCiKjGGl6E8MIcD1KL7upLRq18d3GHFPReVshKkWtO
 AcCPRSZ3LikU968iz0ehxeHtLd+mjUhdwVwMm9mAUPNq/XIp32E3DejgOjnp33wBe27H
 mNRKCS4BUfsNx62bAMVWJYc3AwFie7fRg4if+pvHjUmruWHqOIB3kER7Bfp1oIc+pnLQ
 4VRLDrek8G4e4WFYP3yv/NMIAI+CQKZoO67ylCB3vYAV/uZQTIi7IJR3f11O9+0Efk2A
 k/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745388;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1C7JBeZYsSuK59INs65mEH6x0tpxz6ymfYLghIcQtMo=;
 b=JJfitpmm/zxNJ/12/Sqj1c/IX6oRjcCcDiBsq2KGF7znXrhhrjN6cks3i07DUclpFg
 VzsjaVR9TEYVLLGbJUGFNuFIpBl22yNvbnGG+b02WZaWccKhhg5j6qwKy3e6eQ7Vkdux
 B1vIgM8cSwBN5Mxil/SOOiVKlJpMIwvX2lDapIzCP4Jo1M+YyHB5sdss+/ui60/8xDHR
 /q7FZr/6TJ7o2Tpp3v8szj6Ac3l1i5G0XS5Omz5TlDCChZnv9Ad+mt1tChpfiatyqafA
 f03NzsY+oszrJcmuVHvCLJWi1Ihmtt6iyX1wtgJJl/edVEbRATe2oCWfI1CJjHj9opfK
 GiAQ==
X-Gm-Message-State: AO0yUKUQqVvVLUxvwAE2m7DWRdbkwtuXutgooJt4N+SUxBMnMz/A9PXX
 NUBJQo8jcvD8Le50gEXZGUIQ+LuBXMkk1DKs9xg=
X-Google-Smtp-Source: AKy350a7iHLuYtQjT9nTWuNwG2rzKCrE+LgKXPSBmYEY6hnJrlMSP8MFUMiBsNWGnaMxg2aSZQSRjA==
X-Received: by 2002:a17:90b:4a45:b0:23b:d506:226e with SMTP id
 lb5-20020a17090b4a4500b0023bd506226emr5973974pjb.42.1679741680473; 
 Sat, 25 Mar 2023 03:54:40 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 11/25] target/riscv: Rename MMU_HYP_ACCESS_BIT to
 MMU_2STAGE_BIT
Date: Sat, 25 Mar 2023 03:54:15 -0700
Message-Id: <20230325105429.1142530-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
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

We will enable more uses of this bit in the future.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/internals.h  | 6 ++++--
 target/riscv/cpu_helper.c | 2 +-
 target/riscv/op_helper.c  | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index b55152a7dc..7b63c0f1b6 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -27,13 +27,15 @@
  *  - S                 0b001
  *  - S+SUM             0b010
  *  - M                 0b011
- *  - HLV/HLVX/HSV adds 0b100
+ *  - U+2STAGE          0b100
+ *  - S+2STAGE          0b101
+ *  - S+SUM+2STAGE      0b110
  */
 #define MMUIdx_U            0
 #define MMUIdx_S            1
 #define MMUIdx_S_SUM        2
 #define MMUIdx_M            3
-#define MMU_HYP_ACCESS_BIT  (1 << 2)
+#define MMU_2STAGE_BIT      (1 << 2)
 
 /* share data between vector helpers and decode code */
 FIELD(VDATA, VM, 0, 1)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9bb84be4e1..888f7ae0ef 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -605,7 +605,7 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
 
 bool riscv_cpu_two_stage_lookup(int mmu_idx)
 {
-    return mmu_idx & MMU_HYP_ACCESS_BIT;
+    return mmu_idx & MMU_2STAGE_BIT;
 }
 
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 0f81645adf..81362537b6 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -437,7 +437,7 @@ static int check_access_hlsv(CPURISCVState *env, bool x, uintptr_t ra)
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
     }
 
-    return cpu_mmu_index(env, x) | MMU_HYP_ACCESS_BIT;
+    return cpu_mmu_index(env, x) | MMU_2STAGE_BIT;
 }
 
 target_ulong helper_hyp_hlv_bu(CPURISCVState *env, target_ulong addr)
-- 
2.34.1


