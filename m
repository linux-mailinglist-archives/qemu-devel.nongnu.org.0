Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 543C96CF41D
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 22:11:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phc6i-0006NF-BH; Wed, 29 Mar 2023 16:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phc6g-0006N0-O9
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 16:09:18 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phc6f-0007nQ-3b
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 16:09:18 -0400
Received: by mail-oi1-x236.google.com with SMTP id b19so12543481oib.7
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 13:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680120556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dz94/NiXBxZeIT56JK2x9vttFdPys2crTli6oE6SiOg=;
 b=FmmisVVG3hyCfvUvV4pAuFQXPvICie6q4WHgTZvNiyM1r+J3C9K+mCKwW3hNjb2UU2
 pXqByfwMsMfYnqy5VfIu39YbzQ6v9ptzev1DmlsVmEyQt56CyIYY46/zbhT1ds1jZKiY
 r/azE7htY6zhtn4SvqfScU+r05IJxQMlNPQjEMeiN39J4a1Dh7mOgmvqyrE4PpIESuyb
 C52fAvS/QY96m5SPN1/jTXji159lRgEVACokGK2rkkCxhrjyLo7VZ2hd/LRpbDlDqkRf
 rG8lRLSCnV4tRpbcRaNo2U2hQFIm8/iSUrCH9Owfynj1F3sXyCXFTB4bpOyL08sUGVY0
 yc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680120556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dz94/NiXBxZeIT56JK2x9vttFdPys2crTli6oE6SiOg=;
 b=T1DX4qBT0IZBfiE5JuwuEu5ldqQRAgp9tcty4lVSABP3W6cn6qyBTdzIX4UCcbUKmt
 jP3NAgJpXMvWOYTSYgipQgMY7kTtkmD1hV7rMfqg0bqrX73+Dp8d8OH3utK52oN+NgWn
 OzbTU9hfXQxh1aeYc1kkZlq33lV5NAXAqkqa/PMXaUitqoDnQSS6tfK3SQuylaZRRM8n
 owl0I06SXFg+jOVnjbqvm3bjVKknKMIULCw+N0FE7TfLVuQWdKtIgS+cbEku4fp9z6EF
 zfEgcg/ZhAYcFFnxnlibkA4N9Be128RsPr3YJFSdSwyF4GcAV69a2ArD9ZECFvjj37wi
 KOPA==
X-Gm-Message-State: AAQBX9eztrDpCiDMiVKsm5mOPbBUsCmi/vCFTOap3imbIRQItXkwWfLQ
 7/lPHQjmWFzT5+5bsoeuxQWf7S5WtPt0gm9M7B4=
X-Google-Smtp-Source: AKy350ZyWKzR1rAuUy3KHUk8PUbwhnsrOLiyrxZKD2IE/UnOWqN4Qdk4jwojdojuRZE6PVAsofzSMw==
X-Received: by 2002:a05:6808:7ce:b0:387:50aa:5f3b with SMTP id
 f14-20020a05680807ce00b0038750aa5f3bmr1449628oij.6.1680120556081; 
 Wed, 29 Mar 2023 13:09:16 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 i206-20020acaead7000000b003874e6dfeefsm8195182oih.37.2023.03.29.13.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 13:09:15 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v6 4/9] target/riscv: add PRIV_VERSION_LATEST
Date: Wed, 29 Mar 2023 17:08:51 -0300
Message-Id: <20230329200856.658733-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329200856.658733-1-dbarboza@ventanamicro.com>
References: <20230329200856.658733-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
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

All these generic CPUs are using the latest priv available, at this
moment PRIV_VERSION_1_12_0:

- riscv_any_cpu_init()
- rv32_base_cpu_init()
- rv64_base_cpu_init()
- rv128_base_cpu_init()

Create a new PRIV_VERSION_LATEST enum and use it in those cases. I'll
make it easier to update everything at once when a new priv version is
available.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 8 ++++----
 target/riscv/cpu.h | 2 ++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 75c3d4ed22..1743e9ede3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -338,7 +338,7 @@ static void riscv_any_cpu_init(Object *obj)
                                     VM_1_10_SV32 : VM_1_10_SV57);
 #endif
 
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 }
 
 #if defined(TARGET_RISCV64)
@@ -349,7 +349,7 @@ static void rv64_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, 0);
     riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -418,7 +418,7 @@ static void rv128_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV128, 0);
     riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -431,7 +431,7 @@ static void rv32_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, 0);
     riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 02f26130d5..03b5cc2cf4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -86,6 +86,8 @@ enum {
     PRIV_VERSION_1_10_0 = 0,
     PRIV_VERSION_1_11_0,
     PRIV_VERSION_1_12_0,
+
+    PRIV_VERSION_LATEST = PRIV_VERSION_1_12_0,
 };
 
 #define VEXT_VERSION_1_00_0 0x00010000
-- 
2.39.2


