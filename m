Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE326EABA5
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:29:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqnu-0001vH-Gp; Fri, 21 Apr 2023 09:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppqns-0001pn-7Q
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:27:56 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppqni-0003rW-8o
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:27:55 -0400
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-38e465291bbso1197096b6e.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 06:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682083665; x=1684675665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4z5nSP6wx63l1Rp9Hr9zkEzifzCs+qe4SgWrFzg7RYU=;
 b=AmorOf94AHEelimvKn+1/SZwde5W8YZtZ1xChnng6YVHHnbdm7MbAIRDwm0yqImwC7
 uTEvjCxSaMrj3GdlNvzmdV7qSlE7lS67CYWIHQHqpT4gsNphgl742ajFFP9RNHaJ+l1y
 bOgCkSYBdlTdq7M6r+4/N38N/lMPRSjWXG0XYs8aVmI59CfMiVY/yO29bst0z4l9tsm1
 dLGWJ5mThD2EUtTt9ITSt7HPNHYjqSmnVgSUdkkVN3cvonrYRjqdZt53Hh/9+5q5Ntf8
 2nwbdKUXPr6TPp5CuNkddHy2+2ll8fsR36qLs9muYlNTVvsFpYZ69uBtPVPLwvRX9Cy0
 gUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682083665; x=1684675665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4z5nSP6wx63l1Rp9Hr9zkEzifzCs+qe4SgWrFzg7RYU=;
 b=JxLec5mltKjSVaPH6eFK8X35QBHutAi8yOYLVohDJ95jgA/cPdjrCjT3urx3sDS0E5
 7RYfsdfqIB6w3tG38BTq5DSAq7VP31zDPX44fK+0EcOvMp8xxvjWy/K+R/OTrfRdFr4w
 2RXXNww82wQ/rorGrDHOIC8yUCe6edlpEcIjqQy7BMvuM8hpkeznyw9xat/eeIwGeYKV
 5iAsKjUO/Y68hGbPbRPJ9wK4xJYtxsZZtgPvS9pqDVlkghurpoalOrXN+u0m9H+rDhvx
 WB08MpCbs6SbBCtfLG6FzwKdEvOmRmuzRh8JsLddukgeVuGQOHNnZQRsnQXc7GcVMHco
 GcEg==
X-Gm-Message-State: AAQBX9fDcpeOTFi/r/rISBSi7JsLGeqF/ieA0U+gcu+PzA7FGsqmSFkx
 3j/GleQSlyoSxmBNKl23dEwi3mDYpXLSOQG52v4=
X-Google-Smtp-Source: AKy350awfq7vX0hpIpm2W6WmNaOnWOCe0uxAE4ky8i84FkfiX4Ke7Yz65Ho3Yem5xCV9WX40ol5lSw==
X-Received: by 2002:a05:6808:13c8:b0:38b:eb6b:315b with SMTP id
 d8-20020a05680813c800b0038beb6b315bmr3242107oiw.46.1682083664917; 
 Fri, 21 Apr 2023 06:27:44 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 r84-20020acada57000000b003895430852dsm1623359oig.54.2023.04.21.06.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 06:27:44 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v8 04/11] target/riscv: add PRIV_VERSION_LATEST
Date: Fri, 21 Apr 2023 10:27:20 -0300
Message-Id: <20230421132727.121462-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421132727.121462-1-dbarboza@ventanamicro.com>
References: <20230421132727.121462-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 8 ++++----
 target/riscv/cpu.h | 2 ++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index bec60fe585..dd35cf378f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -345,7 +345,7 @@ static void riscv_any_cpu_init(Object *obj)
         VM_1_10_SV32 : VM_1_10_SV57);
 #endif
 
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 }
 
 #if defined(TARGET_RISCV64)
@@ -356,7 +356,7 @@ static void rv64_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, 0);
     riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -425,7 +425,7 @@ static void rv128_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV128, 0);
     riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -438,7 +438,7 @@ static void rv32_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, 0);
     riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index de7e43126a..15423585d0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -61,6 +61,8 @@ enum {
     PRIV_VERSION_1_10_0 = 0,
     PRIV_VERSION_1_11_0,
     PRIV_VERSION_1_12_0,
+
+    PRIV_VERSION_LATEST = PRIV_VERSION_1_12_0,
 };
 
 #define VEXT_VERSION_1_00_0 0x00010000
-- 
2.40.0


