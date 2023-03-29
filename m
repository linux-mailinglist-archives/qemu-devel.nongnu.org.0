Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E51FB6CF12C
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 19:32:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phZbt-0004K2-2c; Wed, 29 Mar 2023 13:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZbq-0004JW-SM
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:29:18 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZbp-00013L-8o
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:29:18 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-17786581fe1so16944580fac.10
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 10:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680110955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/18X/6sdsTkkrRYidDDyAMzPMAeeu/37rrwjcGh8rjc=;
 b=fmeM3KE2dk9NRJm4cFYK4WJ369NNjyJe6H4ujQWoX95AX9HIh4Xniq7trFZzxhxFPy
 NyQ+JMWFKNF6GCvWXP2VT+akSdU5GKhdZln1Cr0sc40hxWvmMEPrXzWeqyj6reVnCPSm
 rhdMqMDrV9WV767RnokfEGLjZ6eSpFAspnCAOnnXmgZn8/lCLODlOMGqLUQFKImhlhZw
 1S6LCUT0etjw2miS9BkcfLb7u0GZeX1F6g73IXcwYwmUXwpY6Du8R333AhSZiqhvGgeJ
 WxWHgPL/TrzQSnytQJbXuV/rHJj9GIW6Zw06msg+gbWZiHQXVIklXM/mSaBn5weE8WG8
 Xdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680110955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/18X/6sdsTkkrRYidDDyAMzPMAeeu/37rrwjcGh8rjc=;
 b=rgvNDvSaGMo/yt/WaEZR0MBwtQnak8qCO6C0CC7pa2NW51AMvue+K290ZgJ4v/um1q
 2jVHrFNN7UM8oZ/4IZJJ6ewEHuW8tfWh9RK9CdnDml8TmUWt1mvBSmdwuItH/W/k83+m
 13ORDDQtSxFrnwwnejfk4974Nnq6xkSRLnycVvb4gLx+pgl+2OHoJM1JaWh0Ug1OAdBp
 BGtlICImrt1fw73nhCmAkcL/rb5hbrsMNc21QVlIwXHphHsYhVWuwdrHgcNHpAPrqr9g
 eap5Zi4vxmiYS+R+iDP4T1d5LcYqBqZOCSYRBr5GgMlvjZ+WQvlHHiRWIJmN8j24U3as
 HjQA==
X-Gm-Message-State: AAQBX9eFDzCMJc1C4/fBVH6pR1n5wbW7Ki1jmspU/a4f54ensj16t76u
 9AV0OaS+xlJAbHgcQur6zaQVhlLfOZndcAh2D58=
X-Google-Smtp-Source: AKy350aNeaX/VXO8RKfW/HXLAjPPAT4hltMNSk5K6HZjE+8BHHRl/tlXLZq7rMr9HHB3dlX/IYiY3w==
X-Received: by 2002:a05:6870:4306:b0:17e:2f36:3895 with SMTP id
 w6-20020a056870430600b0017e2f363895mr12517369oah.44.1680110955744; 
 Wed, 29 Mar 2023 10:29:15 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 v41-20020a4a8c6c000000b0052532296449sm13866192ooj.20.2023.03.29.10.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 10:29:15 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 02/20] target/riscv: remove MISA properties from
 isa_edata_arr[]
Date: Wed, 29 Mar 2023 14:28:45 -0300
Message-Id: <20230329172903.636383-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329172903.636383-1-dbarboza@ventanamicro.com>
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
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
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
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


