Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533B04B5192
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 14:23:58 +0100 (CET)
Received: from localhost ([::1]:36046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJbKe-0001TR-Sx
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 08:23:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJaVs-0006Oh-Us; Mon, 14 Feb 2022 07:31:30 -0500
Received: from [2607:f8b0:4864:20::631] (port=41888
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJaVo-0003l8-I4; Mon, 14 Feb 2022 07:31:26 -0500
Received: by mail-pl1-x631.google.com with SMTP id j4so10389353plj.8;
 Mon, 14 Feb 2022 04:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J7KDr0f1WPj6Sr0ChfXIOnaAVzbzIjHruaSr1U0p5EE=;
 b=ln6Ravd/nRtxVdiVS5md2fJwV/yxNCZIl7wcAiwU2i1uOKSjvQZstjDi+MzbxddH0i
 ON/yOr2xGp3Q+ReixmOXQt5AnftOQOGWcOmcEr/iqu7wahWAONeENIl+F7+ujIE3dDa2
 CIj3lSJSzMoHcC1KI+dmt8prUSfSV1looliyGT6Vav7DReYPeFmA6VQqOCFURejfDlGv
 B4YW63XearR8+oeIoxClrBmV2UjeSvy/bpu+FR9CeiELRaOexgJ7YHyd6u9UeAoXKJM3
 Z1/A2Dqlk02xDyH8diRLM0lXoqVjtjQ5WwL0Dy75Umy6ryuVhVlLz4KGAFg1sNChMs5u
 NN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J7KDr0f1WPj6Sr0ChfXIOnaAVzbzIjHruaSr1U0p5EE=;
 b=hoya5CeCKAQjGj5p19FlevJj/a8UVIecmeh0tBe8XAxw3UOkuvVI+RUY6uBmKZnX6Z
 jckK4tWztF043bYfIK+yfRGYHVm6VNrWnytt+jvLVWBAJPOKbB+Qzm4Y4WmRs62dCMQO
 OmFVGY9lnEL8Hgffi3qsb7jgqyIJVPw4i/dgDmT2jL53H2QPhZ0aBIvymVoin08Sb5QW
 D9VP0ODygEyLrGPyb+3IrhAgttwNUdHQ5c825guv3X4Hz1LN/oNxioIVwiCqbb8dL3MC
 XCFFPKXPL+FCmzEs5d4ny4OaTQBqLkyxTUMZD268qIEhdJ8WxQQ0ZjrOq6CxJtA1LVxa
 cf1g==
X-Gm-Message-State: AOAM530xoGIoccH+odW9p28GN21s/iovESWxnZMbqt1fQLZFkpj18dst
 YbTcXdDsqh29Mt+d4sUpHu1osA1PA7s=
X-Google-Smtp-Source: ABdhPJyr4tgkwNmnQcvLhETqEBiuzGwWgOXcc6cii2pz/BVBouzAlKPDj4LBcuYq4swEMSrrm7WJ4Q==
X-Received: by 2002:a17:90a:e7c3:: with SMTP id
 kb3mr6592446pjb.202.1644841882760; 
 Mon, 14 Feb 2022 04:31:22 -0800 (PST)
Received: from bobo.ibm.com (27-33-251-132.static.tpgi.com.au. [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id pc10sm2087395pjb.4.2022.02.14.04.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 04:31:22 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH] spapr: prevent hdec timer being set up under virtual
 hypervisor
Date: Mon, 14 Feb 2022 22:31:16 +1000
Message-Id: <20220214123116.1546406-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The spapr virtual hypervisor does not require the hdecr timer.
Remove it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/ppc.c            | 2 +-
 hw/ppc/spapr_cpu_core.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 462c87dba8..a7c262db93 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -1072,7 +1072,7 @@ clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq)
     }
     /* Create new timer */
     tb_env->decr_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_ppc_decr_cb, cpu);
-    if (env->has_hv_mode) {
+    if (env->has_hv_mode && !cpu->vhyp) {
         tb_env->hdecr_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_ppc_hdecr_cb,
                                                 cpu);
     } else {
diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index a781e97f8d..ed84713960 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -261,12 +261,12 @@ static bool spapr_realize_vcpu(PowerPCCPU *cpu, SpaprMachineState *spapr,
         return false;
     }
 
-    /* Set time-base frequency to 512 MHz */
-    cpu_ppc_tb_init(env, SPAPR_TIMEBASE_FREQ);
-
     cpu_ppc_set_vhyp(cpu, PPC_VIRTUAL_HYPERVISOR(spapr));
     kvmppc_set_papr(cpu);
 
+    /* Set time-base frequency to 512 MHz. vhyp must be set first. */
+    cpu_ppc_tb_init(env, SPAPR_TIMEBASE_FREQ);
+
     if (spapr_irq_cpu_intc_create(spapr, cpu, errp) < 0) {
         qdev_unrealize(DEVICE(cpu));
         return false;
-- 
2.23.0


