Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CC76CB203
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 00:52:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgvfu-0006Z0-FI; Mon, 27 Mar 2023 18:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvfs-0006Tp-0B
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 18:50:48 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvfq-0008Ao-A6
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 18:50:47 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 n7-20020a4ae1c7000000b0053b61145406so1599857oot.11
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 15:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679957445;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lLEBFLZG9kdylAPz1OG42fgvOtCU19pE/xboUYWQvA8=;
 b=j2lyG2ksOqFBewhIQOCTo4AJeUFT6nqXC0fCnOPs4xHuyKFi9XX2LSl53mEI/cA5xO
 BujAARuMoPJJ/JZEOv9ftNpGShR5PdZi0NoHJsIf85kfwFL1fijDekM633jn1lH7eF6P
 Q2Min+WQ1rQJsY6lJ49Xv+XuElnJejRS9ctXTYlvzhnZxLDXMDNY7w7m0Rs8fuuE0uWq
 thWP7jFtK36Q+jHy41l+6EC/EZIYouyFsgoKg6UPv1/4rOMKlvIylLQrcJvoF0l9TRgX
 Y51X9IgSMIpssK/kKA9rpTnzl371u0rlmSiujn3+txwUE6P0Cvf9ojfBoHrNHe++fvv8
 YnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679957445;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lLEBFLZG9kdylAPz1OG42fgvOtCU19pE/xboUYWQvA8=;
 b=5mCbsSZR9954+76Ojem1xLXOUREF3yPp5enHqbF4bQYV0FiJQ7SgoxJg8FmzmEVneG
 JiGq+prTJeoOlBNY0g5IUaU/LJazEOHCdT8mNX+JJ+MXvyuska8kPNM4/YJalTDciy1Q
 2+oxyxnMl8fAkkl43d0wEKl8fKtlFpCvXfIiFw63ugmmGmQGCv+GYtdNwtCKAaSUQ5PC
 s/7QZKnvkIvmnJlrcyvv/cy7GhemMCT8of1fZ7m3FNlD8R2e2dENdbAeeX4tqwmOFzKa
 L6TOcl7kZG59nQ+s1kY4/ccNt8NDCyN1OSDb39TV0sdSXuoteOZ26WoKcc093VEs8Lpi
 CJNA==
X-Gm-Message-State: AO0yUKVbvUAAiOSEh/iKFJjT5IVFHuUuOfhiswZkYjYvjaR9hqDh1yxy
 Aa7K/ClI0TegjLVsEg+kRhY9xsXukOgNyLz0IFM=
X-Google-Smtp-Source: AK7set/z4atahyP7RfD5G19VFNYOmF2H14I8ftQ08x3A41OL1FfWeTAz86zNS4uPWSMjlp/0+b49HA==
X-Received: by 2002:a4a:2c09:0:b0:53b:4e2c:b77c with SMTP id
 o9-20020a4a2c09000000b0053b4e2cb77cmr6240072ooo.3.1679957445265; 
 Mon, 27 Mar 2023 15:50:45 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 s9-20020a4a9689000000b005255e556399sm11985361ooi.43.2023.03.27.15.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 15:50:44 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 16/19] target/riscv: remove riscv_cpu_sync_misa_cfg()
Date: Mon, 27 Mar 2023 19:49:31 -0300
Message-Id: <20230327224934.363314-17-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327224934.363314-1-dbarboza@ventanamicro.com>
References: <20230327224934.363314-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc31.google.com
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

This function was created to move the sync between cpu->cfg.ext_N bit
changes to env->misa_ext* from the validation step to an ealier step,
giving us a guarantee that we could use either cpu->cfg.ext_N or
riscv_has_ext(env,N) in the validation.

We don't have any cpu->cfg.ext_N left that has an existing MISA bit
(cfg.ext_g will be handled shortly). The function is now a no-op, simply
copying the existing values of misa_ext* back to misa_ext*.

Remove it.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 52 ----------------------------------------------
 1 file changed, 52 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a916252077..fa50aae4a5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1082,50 +1082,6 @@ static void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
 #endif
 }
 
-static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
-{
-    uint32_t ext = 0;
-
-    if (riscv_has_ext(env, RVI)) {
-        ext |= RVI;
-    }
-    if (riscv_has_ext(env, RVE)) {
-        ext |= RVE;
-    }
-    if (riscv_has_ext(env, RVM)) {
-        ext |= RVM;
-    }
-    if (riscv_has_ext(env, RVA)) {
-        ext |= RVA;
-    }
-    if (riscv_has_ext(env, RVF)) {
-        ext |= RVF;
-    }
-    if (riscv_has_ext(env, RVD)) {
-        ext |= RVD;
-    }
-    if (riscv_has_ext(env, RVC)) {
-        ext |= RVC;
-    }
-    if (riscv_has_ext(env, RVS)) {
-        ext |= RVS;
-    }
-    if (riscv_has_ext(env, RVU)) {
-        ext |= RVU;
-    }
-    if (riscv_has_ext(env, RVH)) {
-        ext |= RVH;
-    }
-    if (riscv_has_ext(env, RVV)) {
-        ext |= RVV;
-    }
-    if (riscv_has_ext(env, RVJ)) {
-        ext |= RVJ;
-    }
-
-    env->misa_ext = env->misa_ext_mask = ext;
-}
-
 static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
 {
     if (riscv_has_ext(env, RVH) && env->priv_ver < PRIV_VERSION_1_12_0) {
@@ -1169,14 +1125,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         set_priv_version(env, priv_version);
     }
 
-    /*
-     * We can't be sure of whether we set defaults during cpu_init()
-     * or whether the user enabled/disabled some bits via cpu->cfg
-     * flags. Sync env->misa_ext with cpu->cfg now to allow us to
-     * use just env->misa_ext later.
-     */
-    riscv_cpu_sync_misa_cfg(env);
-
     riscv_cpu_validate_misa_priv(env, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
-- 
2.39.2


