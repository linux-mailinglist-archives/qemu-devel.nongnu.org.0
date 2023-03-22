Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F846C5A55
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:29:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf6pw-0006RN-7G; Wed, 22 Mar 2023 18:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6pu-0006R0-1K
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:21:38 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6pi-0006Us-Rw
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:21:37 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-17683b570b8so20842460fac.13
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 15:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679523637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KQVFUIY/tXjKk0i861GofmXXuiJZCtg1HgLexYrjEnI=;
 b=foycRM501N+jy9m0r9jxlWf3qSHzj7PuJIZ8ss8rB3rWuuVnUDNQFVgCQpvP+qn885
 gnXMpUE6BpIoJb285PG6rQo73uXTBght9yZ5V77+2m+1jnGxIk8a7//rqqXGyy3viHV/
 JouwcNFE8nr3718VyOhqftw8UGQ59p46zWg7QlVHzCOnKrG97w17F93r4jpDdQCYX/tj
 Wug3oxWUCu9So+EPxWfDgfCQyEQgCyN3ox3rSgRMpyUGVMnrY3hO6zazm0yiq9LPA6Mr
 PsvZ94/FSK0/tK0+WZ3aEnR0qobZubJhi2kJu40Y3pqENE8A5nrcxzZM/fI+HVW/iNJC
 NoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679523637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KQVFUIY/tXjKk0i861GofmXXuiJZCtg1HgLexYrjEnI=;
 b=Z048AeeXFKgOGavk5iOftlg1pc053cMquK6oV3f2ZStnNzEBGWyBFYivsTe5kkn8JX
 i/j7TwkqCLdUXUd36rsKOAw7ESHhZh9LK9oehUD6YF1UaA8VBJOpieYvzRhhsuURVuVa
 tlSv4PNH0zT4OzJX7gZUYjsLD1comBOyFlIjr6KjGUHpm93kaRMC7vNuyLByN/s7nvSX
 HnefQA8Dw6otQ/sFZptWfrp0jeJyMtz8l9zV4I32fbbzwWecqWVHvQBJiwn4C9LU+j6O
 ezIX4+B9CAbyPci9bNhxErxZz+LDYZREg5WBrLG/9I+nLGM/fyEV5Ybib9rxAqnSugMY
 VlOg==
X-Gm-Message-State: AO0yUKWq/1JWTA05SFPjz5xpJ1dDuXVbFyrjku8mqwl6Fu2xYSjrgN5s
 EK6s78G6RRUZm2Rg9TsaB27PT81oywDIwKCHGlg=
X-Google-Smtp-Source: AKy350ar5mjBg2b94+oGEB9EL/EE7xZJiA4NXJKMRYAfruxgK9agg2LDCXgf/m4PtWjoQJ+0mTahdA==
X-Received: by 2002:a05:6870:2190:b0:17a:bf1b:cab8 with SMTP id
 l16-20020a056870219000b0017abf1bcab8mr1014362oae.4.1679523634984; 
 Wed, 22 Mar 2023 15:20:34 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:20:34 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH for-8.1 v4 04/25] target/riscv: add PRIV_VERSION_LATEST
Date: Wed, 22 Mar 2023 19:19:43 -0300
Message-Id: <20230322222004.357013-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
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
---
 target/riscv/cpu.c | 8 ++++----
 target/riscv/cpu.h | 2 ++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 18032dfd4e..1ee322001b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -338,7 +338,7 @@ static void riscv_any_cpu_init(Object *obj)
                                     VM_1_10_SV32 : VM_1_10_SV57);
 #endif
 
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
     register_cpu_props(obj);
 }
 
@@ -350,7 +350,7 @@ static void rv64_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, 0);
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -426,7 +426,7 @@ static void rv128_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV128, 0);
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -439,7 +439,7 @@ static void rv32_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, 0);
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 638e47c75a..76f81c6b68 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -88,6 +88,8 @@ enum {
     PRIV_VERSION_1_10_0 = 0,
     PRIV_VERSION_1_11_0,
     PRIV_VERSION_1_12_0,
+
+    PRIV_VERSION_LATEST = PRIV_VERSION_1_12_0,
 };
 
 #define VEXT_VERSION_1_00_0 0x00010000
-- 
2.39.2


