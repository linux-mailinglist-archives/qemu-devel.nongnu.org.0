Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 473516D9F82
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 20:08:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkTxy-0000ui-Qm; Thu, 06 Apr 2023 14:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTxw-0000uP-1k
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 14:04:08 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTxu-0000a4-F7
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 14:04:07 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-17aceccdcf6so43189804fac.9
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 11:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680804245;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ufyvyScFDwHTPmPsfLa8yROo1ql9YOF/CnHfsvDkUMU=;
 b=X0KW4LQ6OysqUHobZwQ3GKGy1zzzyWao4RA1yJEL2mUogk9d1dOnf9Xj+2woDtH+j2
 lAF029ApLDIMNHD3TF3shkU/G4/qoiDn3RtbZW+WzYsdr/TahnyzYMuv1wQgaloTZapx
 IBOiL3Xw9yJ/jMY1wbkoaQ6krlDyEDaLpkbfO7+ogTpfrUdnz3zOueCDijQnRps1+MnO
 tTAzK0VFPRtd1CryiRqZy++IH/B60pAQXhvgcSvm9D9Nrbj9F2Vc8MlH8jvwA6HhQgcO
 TxWkfV+W/cvZ3yIvtrtqDM2Qjw3Gt2a1Ay7Im66PNl5Nd+RZLvETu58TBJ6NiGApwSZC
 nZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680804245;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ufyvyScFDwHTPmPsfLa8yROo1ql9YOF/CnHfsvDkUMU=;
 b=4YIYU9h7sNsY9Ah6eO9fnFFQsjJyz4bKlJUXP+Y4nUXeW4qjdMR/mvG9NgPvOwTBv7
 xFw9AcPsLng/y0tHpI6I9X7si6Txlc5wjLRok/kMN3+oJkn2G68rlNQF5yXAk7dpgeDd
 USo8J9PCgc4WDdtedF87BYpPR4+r3JmBzfInYL95N2jAoyPiQj23+fEZPYyqvrgQKyW1
 a//wnDFFTmA3Fh1GSiMcbgV8VQSaQtHcuIU/2YKJmx2EVtFnvqQhxc3Euiq+LPG6uH5W
 CgplDil7+pQk3Wrw0u0uM0G2iKfjpRDyTg2r6uJWm3PMMPH3KIPfIjCZDfeUdHMcIAlH
 3NIA==
X-Gm-Message-State: AAQBX9dMGH/wo1EDldhuc5bMjSygBpQnGrVuiuf7Y6f/UMlZDRP+HBkF
 2+X1ntUQBe+2IIa6IuQm/kTeKypPpfMklxVNsRc=
X-Google-Smtp-Source: AKy350YIGovIxwIiR1g/r+9m6MrpmXFXEBL7KyQ3GuIxwrKVLhZVxLiplqEqwv+Qv1j3729zyqPe5g==
X-Received: by 2002:a05:6871:9b:b0:177:9e9e:ff47 with SMTP id
 u27-20020a056871009b00b001779e9eff47mr143565oaa.17.1680804245497; 
 Thu, 06 Apr 2023 11:04:05 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056870d20400b0018045663fc5sm906309oac.48.2023.04.06.11.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:04:04 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 02/20] target/riscv: remove MISA properties from
 isa_edata_arr[]
Date: Thu,  6 Apr 2023 15:03:33 -0300
Message-Id: <20230406180351.570807-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406180351.570807-1-dbarboza@ventanamicro.com>
References: <20230406180351.570807-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2e.google.com
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 66de3bb33f..ed8f36c649 100644
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
@@ -1191,6 +1192,14 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
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
@@ -1234,6 +1243,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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


