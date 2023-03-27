Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 714466CA45A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 14:45:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgmBl-00084h-RW; Mon, 27 Mar 2023 08:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmBj-00083v-L0
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:43:03 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmBi-00027s-3q
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:43:03 -0400
Received: by mail-oi1-x22c.google.com with SMTP id w133so6222212oib.1
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 05:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679920980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YK09g81E8Kwzpq/ZRgaoIicZXmv7nuC/L4OwvxnL+TA=;
 b=C5DwHfMzJgQifHHAWMIilqKkIP9Z/ZXtQLxKTAcFub/H4XJQzjyXQPI69IiEPRgREq
 ++FQlmdaDm6UD7Bk/ekp8oUNZEMrq+6pzPNEy5C2a7ytzEA8aJcYERN8aWO7PGTMK/Qd
 nEMf6AdKs05AZcGUa4m17AeKjbqlL+Kqhn4wQOmTLmkkwGH+Uo7MqQw1CvVFvDTLAiUg
 RB0dQt2XKlmrGh00ZWd4imohQGIfpFBi74srYq6NO0r6QXuYxJtsHSF6yuYEozvgSqaW
 wxnb9OCgCcEm0XXE6YGOQktyFNRjgKfBVe0i4+kdHwn3f+fakLTFQ3bsBu9/NK0969Hg
 upfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679920980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YK09g81E8Kwzpq/ZRgaoIicZXmv7nuC/L4OwvxnL+TA=;
 b=ZGhJOLHe1JhHngGTBd+U2qWC8BF4MwnfHLKQLBqNRD/fPOcxxEn82wLJ9AU2rwt5kC
 unhIWZtWyZHYqiiBiciz87TdCy40OlOW7fW1ERQNl8ePozBYdbxOYHVj7GBmx9/t1JfW
 ROIM78iBqcImrv4N/EZTcxZNKe5H1UwKzu5U8KRtmRF7RP724oHTvPZjwrxR5AZ5pfws
 V9PsjQXd4gE7rG6sZAzFBDkcCZVqRv9MLejp4l4JsKgNM8wGPTGMS3kbWopXQJGgLe0x
 wcHa68J8Jl9SNgXT8i4MZU8oTZGbO0BiGljCxmdgoWdPlcrE1tiveIscTBChgWq9d92i
 zqXQ==
X-Gm-Message-State: AO0yUKXWHc5vNihNFAztaNU6TXV3+Mww4sf2244mdRhY3bmFJLPgL99E
 z5YRSV+pLZsNppZrQM02LhbSIG65QbI6IvJtZbI=
X-Google-Smtp-Source: AK7set+HerrpDD7icUsWRnknu/DyJ8ISNTzKdRBAYUliQc38h7L8EeTgPEA3ohR7R5x/hNfbA9M+XQ==
X-Received: by 2002:a05:6808:3a84:b0:37b:2252:b94c with SMTP id
 fb4-20020a0568083a8400b0037b2252b94cmr5424634oib.4.1679920979508; 
 Mon, 27 Mar 2023 05:42:59 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 m206-20020acabcd7000000b0037d7f4eb7e8sm11136677oif.31.2023.03.27.05.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 05:42:59 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 02/19] target/riscv: remove MISA properties from
 isa_edata_arr[]
Date: Mon, 27 Mar 2023 09:42:30 -0300
Message-Id: <20230327124247.106595-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327124247.106595-1-dbarboza@ventanamicro.com>
References: <20230327124247.106595-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22c.google.com
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

The code that disables extensions if there's a priv version mismatch
uses cpu->cfg.ext_N properties to do its job.

We're aiming to not rely on cpu->cfg.ext_N props for MISA bits. Split
the MISA related verifications in a new function, removing it from
isa_edata_arr[].

We're also erroring it out instead of disabling, making the cpu_init()
function responsible for running an adequate priv spec for the MISA
extensions it wants to use.

Note that the RVV verification is being ignored since we're always have
at least PRIV_VERSION_1_10_0.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2711d80e16..21c0c637e4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -72,10 +72,11 @@ struct isa_ext_data {
  * 4. Non-standard extensions (starts with 'X') must be listed after all
  *    standard extensions. They must be separated from other multi-letter
  *    extensions by an underscore.
+ *
+ * Single letter extensions are checked in riscv_cpu_validate_misa_priv()
+ * instead.
  */
 static const struct isa_ext_data isa_edata_arr[] = {
-    ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
-    ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_10_0, ext_v),
     ISA_EXT_DATA_ENTRY(zicbom, true, PRIV_VERSION_1_12_0, ext_icbom),
     ISA_EXT_DATA_ENTRY(zicboz, true, PRIV_VERSION_1_12_0, ext_icboz),
     ISA_EXT_DATA_ENTRY(zicond, true, PRIV_VERSION_1_12_0, ext_zicond),
@@ -1131,6 +1132,14 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     env->misa_ext = env->misa_ext_mask = ext;
 }
 
+static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
+{
+    if (riscv_has_ext(env, RVH) && env->priv_ver < PRIV_VERSION_1_12_0) {
+        error_setg(errp, "H extension requires priv spec 1.12.0");
+        return;
+    }
+}
+
 static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -1174,6 +1183,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
      */
     riscv_cpu_sync_misa_cfg(env);
 
+    riscv_cpu_validate_misa_priv(env, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
     /* Force disable extensions if priv spec version does not match */
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
         if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
-- 
2.39.2


