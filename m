Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38DD6CC96C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 19:37:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phDEv-00089Q-NC; Tue, 28 Mar 2023 13:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phDEt-000893-DQ
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:36:07 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phDEr-0005MC-Uh
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:36:07 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-17786581fe1so13493990fac.10
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 10:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680024965;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WOGslirMLBk4tm9faQsGEqmRXTsjgllDNHucBeLo/+s=;
 b=HDOelelsPEZGAxZ4RDnO0J/zcmFS1FKHMU7WmYi4wrxTlXepe9SzedAlMFxxTiwis3
 kruMdOFhvmZoQ3t3lQOr/GlIrGx/KBWH+OVTAWvSQcsebfzMl+nnx6azju5cZaX/kaVe
 M5SzYr3sKlhdGsD3yO40DkBDhzjBdMkei6TUPQtSfH76c3lDlsCZ1EYPXfbd/Tipf9/9
 LaqmcsZmGJHYDpM42IJ3ll8QEcFD1HefyETcGBal7GQeI7E1m2t3m6CVMSrhlPpZJDrv
 1QVrj5GYqlAvdEUkWide0OFT5L4/gPaHa5o0oUtA0ZpZxDtClak06CgN2kEgTKJo9obc
 BoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680024965;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WOGslirMLBk4tm9faQsGEqmRXTsjgllDNHucBeLo/+s=;
 b=zOzZ1gMWWpvgL5uoVvvOhSFEIf2TzShTtn4JAetoroUxnQowsGKMaKcb52R4f4OAOi
 8e72FxLIGJlZa2ePUKMFHid/Do6qbHwEvPhRh49nR9njAfkc64kZcvFxi+iLFPNl0RFl
 KIG16CJpGT+sS/OtTWb6Mv4NmpAuJ5xEkWhUy8HFqQ1m5+CKB7Gi/qwU00oGqSJPfxho
 wodUXopWHP4hEfabeSmBaXeShUrh1CMVkvOu/gIUgsFe9vQSjEZb57bdCu96ydwvHGeu
 hKgM+HPEmXooVFWxjrKD3MXTxXc52o+TTMWtrPSxVThqACMOB2Dfr6Bi7lkGuaNpX4FN
 4yDg==
X-Gm-Message-State: AAQBX9cWpDR1y35kFwdq6Q7/XzPdpo97WV6L2d9KlvEeWzbB9qjCTis6
 FLN9sPIuKo5Gq1mIHShPitNXbvaYBy9tsRnT/z0=
X-Google-Smtp-Source: AKy350ZLyaEbLwcPySu2Zx1sFBsb62tuaPxvAplOgVLq68/IgF/kS6RjqSZnees1Mt+TCQmfOwPNJw==
X-Received: by 2002:a05:6870:89a3:b0:17e:da36:665a with SMTP id
 f35-20020a05687089a300b0017eda36665amr9114356oaq.8.1680024964913; 
 Tue, 28 Mar 2023 10:36:04 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 m2-20020a9d6442000000b0069f0a85fa36sm11635654otl.57.2023.03.28.10.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 10:36:04 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 4/9] target/riscv: add PRIV_VERSION_LATEST
Date: Tue, 28 Mar 2023 14:35:38 -0300
Message-Id: <20230328173543.431342-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230328173543.431342-1-dbarboza@ventanamicro.com>
References: <20230328173543.431342-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
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
index b40d76fcb9..e13528d932 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -339,7 +339,7 @@ static void riscv_any_cpu_init(Object *obj)
                                     VM_1_10_SV32 : VM_1_10_SV57);
 #endif
 
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 }
 
 #if defined(TARGET_RISCV64)
@@ -350,7 +350,7 @@ static void rv64_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, 0);
     riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -419,7 +419,7 @@ static void rv128_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV128, 0);
     riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
-    env->priv_ver = PRIV_VERSION_1_12_0;
+    env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -432,7 +432,7 @@ static void rv32_base_cpu_init(Object *obj)
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


