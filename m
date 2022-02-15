Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F144B619A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 04:26:34 +0100 (CET)
Received: from localhost ([::1]:54930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJoU5-0006Ng-Fo
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 22:26:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJoKq-0006iB-4N; Mon, 14 Feb 2022 22:17:00 -0500
Received: from [2607:f8b0:4864:20::42c] (port=44806
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJoKo-0002eb-9r; Mon, 14 Feb 2022 22:16:59 -0500
Received: by mail-pf1-x42c.google.com with SMTP id f6so11599000pfj.11;
 Mon, 14 Feb 2022 19:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kaHoREzEqHDqw8Mybfr42TDbH9kFt+kopLFvy6hlUuc=;
 b=evyfRHpPXFAjU02e7zeqA1RwPlwujhH6atkz+FTP5NNFK1ujyPxhWVH92ZnQzUW8iK
 W/89Xst0JoNSg/sEbK2WvsYfw/k2VCdxcfcTBHiK+ChZTPAnDt5PN+TwG0v/42oS/x/M
 TBnghkUa4Ua0JMqdzSACiYulyNkWoQD1Iun5t+fz4deBNU2i1N8DShGHmtRQyGSyVa6R
 GWLx9sMkY1R/QaZgpkn13Mqc0jkqjoioHoUvWsNRVu0BcI7KrGu34bi1IkQCYZxSb8Hr
 3CJUemcjEMiAxGqeBRakfEIV+wdC09w5vUTuIKAqGWVLyml0kJwZRl+au4MvEFHI2Q/r
 tvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kaHoREzEqHDqw8Mybfr42TDbH9kFt+kopLFvy6hlUuc=;
 b=vEhD9ocQ7+e76Bb+9x2CuvJo1iW1QusAyVcEs/k2mGLAwC9cxkBr8CN8asQsA8+Ofg
 ujDduHEIW9x5TBsVyrRVAX86OxJnPKKQQ/6H4+RC+WtXt/5O3c+qguOuV7l9+M+cHC0u
 Hn1R8HI44LiIclsL2zDi5UmRfbZgka/ZFUbFmmiZhFu5j6f33eiV27oE/5e1RE9tX4aM
 njnQGvhE2GxkuoARWoQA6AR1Fkw0I4w/nSwQ/nLnrFr+Dv/jcA4XDv2WHBcPGlnH88CL
 fATR5Ws/kbE8rVTLwXxUToNq6ckAtuH4vZzNyDsnnm+pUinv/nzLv/ZgxcHCbs1LRZi3
 EjXQ==
X-Gm-Message-State: AOAM533plUKrQR/dUw+18bEOAphmqkUe2z91onybvcPNqncfF3y4x38t
 NgVmuyDmWH2fWNlmT7tY+jY1gdOkzQw=
X-Google-Smtp-Source: ABdhPJxomcDhre1ZXktxxKQ2qcxq60HrYwFj975UFOOVNFKPeBBxv5qKfbwXrluYKFFZnU3KE2rvNQ==
X-Received: by 2002:a63:d14a:: with SMTP id c10mr1788300pgj.355.1644895015953; 
 Mon, 14 Feb 2022 19:16:55 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-33-251-132.static.tpgi.com.au.
 [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id f22sm38667399pfj.206.2022.02.14.19.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 19:16:55 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH 2/9] spapr: prevent hdec timer being set up under virtual
 hypervisor
Date: Tue, 15 Feb 2022 13:16:35 +1000
Message-Id: <20220215031642.1691873-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220215031642.1691873-1-npiggin@gmail.com>
References: <20220215031642.1691873-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x42c.google.com
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
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
index ba7fa0f3b5..c6dfc5975f 100644
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


