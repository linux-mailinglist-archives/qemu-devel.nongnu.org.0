Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E366CF11A
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 19:31:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phZdF-0005cI-TG; Wed, 29 Mar 2023 13:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZcY-00055H-9b
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:30:02 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZcV-0001BN-SC
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:30:01 -0400
Received: by mail-oi1-x22c.google.com with SMTP id bk5so12159948oib.6
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 10:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680110999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+X5H8wqSen2nQuTYxQUmam9q3Ds0A0b+CewCRPd+rAI=;
 b=cVziLi44QwF9q2s3JplbQdPB098V7VO1w1+7tok4unDGaN6qdpt0Wtjw+2X/L3o6dI
 2oKbW1hzJgKzD0gV0RXwrrO8rFqM9VIaPHgbcVZcFAMVh7tenyhqMPPuK8mbP7ShZQAv
 vtVot2jMbSV6yoWkLAjxAlO8hsAhgTqGROCxXuQ+eQTA2NPk9rUB+1rPgboXGraT2QCJ
 u4H9ofcmFnjvYr8be2y+gDwYsK+o2j7kBEqLcjOoOBE9I1SVOjjlLyCAgsg+proMFtBQ
 g9AtLU08vB0k5fNQAEg+stuFCdY+2XPi45xWNjUSwonEZrF9kkBzZo5i/QE+H9Hsvy8v
 NEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680110999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+X5H8wqSen2nQuTYxQUmam9q3Ds0A0b+CewCRPd+rAI=;
 b=oFeBDxFszqpPl/Kb/G4QAqlNn/2VnsEp0GU2L8mzTBW7qh2iYJPbt4xwr6Ycflrx0C
 TuuM5+Y5q0UeSvO02rvo01nrHjG+KSs5UiW6/3pmQCRRbrO+h+dIXHOHdmsafW1hJPGx
 /XZB5P5yHzIhV08tFjMVAn9IntdAKLHVrDyNGZmw+KA8IxVtMfL60sX2zBPVQsvVaNjC
 MjDlOVARRh5PkspiiPRT6UbwmC8k9ViZ7vdWFJ+9UkNqSkUtr4iE9No8T2RJmtk0fgZr
 78K6uC9HERXarSgZrZLm9GhWEJt8JnDYBIPZw7njmtfLN5NRYZNdH+8xo31c13cls1k4
 bQEw==
X-Gm-Message-State: AO0yUKU8EfuLMnNYm3NWwtSYRDyaTfXgfQRO8B6jxZHHKamR/sEPuZsH
 dDCC40I8Veos3KmLIL0VNXDiiSarYst4yysAv/w=
X-Google-Smtp-Source: AK7set/iJrIcAt93c00whz8xJAFCsXM0QcBl7KBlB4+GsWsGLd9A3vz+n38tiULoidsxPaibmKnKTw==
X-Received: by 2002:a05:6808:20aa:b0:364:5a39:ec53 with SMTP id
 s42-20020a05680820aa00b003645a39ec53mr11210189oiw.22.1680110998823; 
 Wed, 29 Mar 2023 10:29:58 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 v41-20020a4a8c6c000000b0052532296449sm13866192ooj.20.2023.03.29.10.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 10:29:58 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 17/20] target/riscv: remove riscv_cpu_sync_misa_cfg()
Date: Wed, 29 Mar 2023 14:29:00 -0300
Message-Id: <20230329172903.636383-18-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329172903.636383-1-dbarboza@ventanamicro.com>
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
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

This function was created to move the sync between cpu->cfg.ext_N bit
changes to env->misa_ext* from the validation step to an ealier step,
giving us a guarantee that we could use either cpu->cfg.ext_N or
riscv_has_ext(env,N) in the validation.

We don't have any cpu->cfg.ext_N left that has an existing MISA bit
(cfg.ext_g will be handled shortly). The function is now a no-op, simply
copying the existing values of misa_ext* back to misa_ext*.

Remove it.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 52 ----------------------------------------------
 1 file changed, 52 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b40a55bc8d..3eb3b7dc59 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1081,50 +1081,6 @@ static void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
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
@@ -1168,14 +1124,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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


