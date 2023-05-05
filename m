Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CFB6F7A46
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:04:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujrA-0007wk-CU; Thu, 04 May 2023 21:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujr7-0007wT-TI
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:03:29 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujr6-0006qw-6p
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:03:29 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1ab01bf474aso8549495ad.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248606; x=1685840606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YPIznLJlFld2/pzlq8rqnzqjocmMSn/cjAgHK7fzxjI=;
 b=OnGVxOQqdO9w6IA0BLy9bXAzeLrJUwDoIYS6tkqNwzfRK9sVboTaDT2JJSpiN+rR0I
 tu16lDNxuBKCbDM7eimwOPUn0zgm/I1bRCs7INVV4vYVf1hL8TDaNbiEsP50MCRk7CvD
 YatVeTuJdfFIT68lr4JBB7ORcMxSg0ZhvakfyiwHHKa6lRMaUf22mD0iAHuo/GCEII4E
 KZblelGiI/W/dNM6SR5dIzUIszPXR/Ts6oNgdFpYkRes5lVT3MXKFxmrKWzkWw47Huz3
 Dws2v7GLS/gybiqK/xkR99qaEa5bLfYwxBppuwy3OR5FfOs22RDPbjKlaUjQ+t4wg/AZ
 XerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248606; x=1685840606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YPIznLJlFld2/pzlq8rqnzqjocmMSn/cjAgHK7fzxjI=;
 b=GRmW34RAMun4qqrlTdfFdCAGwEz2IXzjnAgifT61zLY9K28xlb/5hfHbAm4ivtVtCg
 OuU2Gl844ZZKT7cIeXJzYhhdWgUL/Xt5wC/TprvNNQtj621YUeu+pX/59oerWoc1mHQn
 nr+hICwHX4BVSHWzwzvKoNbSC63poLyECcM5M9FwUta35hjF9q5L6laCCbZNt9pDVSJj
 ixcuoQfvQI8CjqJaBCgX/vVG3v6zFIVtDBYipUlMf5N37EhFdTS43jXatdUAWefK1gmU
 NipldU39MqQUuJEV+TlvhQVfuZBiC99Z2AN3BMTGek+q4Dn31CsJJHmATb3abnowPwG2
 WUSw==
X-Gm-Message-State: AC+VfDxXIyitXtQ0DPaGyny4fJb/wRUuBsvN/MrPwI5XvMWIxNQvXLZe
 aVbt9+CEV5sfFBorzjGIvb+DmomZCqyW3w==
X-Google-Smtp-Source: ACHHUZ5AcJx8EoSADQDuMdRRAyIvnRNLacQXlFfGUNK8+pIwNhcRhyIUBfkiJ6zKGti2OArua8HYSg==
X-Received: by 2002:a17:903:258a:b0:1ab:19db:f2b with SMTP id
 jb10-20020a170903258a00b001ab19db0f2bmr6257527plb.36.1683248606463; 
 Thu, 04 May 2023 18:03:26 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:03:25 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 03/89] target/riscv: Simplify getting RISCVCPU pointer from env
Date: Fri,  5 May 2023 11:01:15 +1000
Message-Id: <20230505010241.21812-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

Use env_archcpu() to get RISCVCPU pointer from env directly.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230309071329.45932-3-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/pmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index b8e56d2b7b..a200741083 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -223,7 +223,7 @@ bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
         return true;
     }
 
-    cpu = RISCV_CPU(env_cpu(env));
+    cpu = env_archcpu(env);
     if (!cpu->pmu_event_ctr_map) {
         return false;
     }
@@ -249,7 +249,7 @@ bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env, uint32_t target_ctr)
         return true;
     }
 
-    cpu = RISCV_CPU(env_cpu(env));
+    cpu = env_archcpu(env);
     if (!cpu->pmu_event_ctr_map) {
         return false;
     }
@@ -289,7 +289,7 @@ int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
                                uint32_t ctr_idx)
 {
     uint32_t event_idx;
-    RISCVCPU *cpu = RISCV_CPU(env_cpu(env));
+    RISCVCPU *cpu = env_archcpu(env);
 
     if (!riscv_pmu_counter_valid(cpu, ctr_idx) || !cpu->pmu_event_ctr_map) {
         return -1;
@@ -390,7 +390,7 @@ int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value, uint32_t ctr_idx)
 {
     uint64_t overflow_delta, overflow_at;
     int64_t overflow_ns, overflow_left = 0;
-    RISCVCPU *cpu = RISCV_CPU(env_cpu(env));
+    RISCVCPU *cpu = env_archcpu(env);
     PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
 
     if (!riscv_pmu_counter_valid(cpu, ctr_idx) || !cpu->cfg.ext_sscofpmf) {
-- 
2.40.0


