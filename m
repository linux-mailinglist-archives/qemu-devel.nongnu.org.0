Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2104B06CA
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 08:06:24 +0100 (CET)
Received: from localhost ([::1]:53746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI3X4-0002WT-WC
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 02:06:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nI3L4-0005aJ-TY; Thu, 10 Feb 2022 01:54:03 -0500
Received: from [2607:f8b0:4864:20::102b] (port=44880
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nI3L0-00049K-PC; Thu, 10 Feb 2022 01:53:55 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 d9-20020a17090a498900b001b8bb1d00e7so4636301pjh.3; 
 Wed, 09 Feb 2022 22:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WLP5sLGXYeodPYoYzna0rSXP46YZlNsgp302cQHV1UE=;
 b=obVYA5tOfFraoWJGretcyMQTHA4iRNmKdVx0goTwe++sgmI6jDLKJF73GMqb1FLTdl
 2WiOTg32W32SpsgpsYHLGQCYlqCyPnwC5Hqw9ZqhRzUknMPJSVuSpgNxHKpPg1QmKngT
 UWTSzJoSNuLL9oQzYnQ2R/mcD58KIo2AEWOAXec0D95yrQLIZhZoRsPdD/RmpsnfHdJx
 Hdbata3Z61BW/Dn/qXWVA7uh1+Z1NcxNRo4Cdm1VVe5Cfl/XUDaI0rOiW8J1Pf0soEwO
 3tqcTEDTUa/pr26QWBh2bTNzOiBtRH8/hq/xpOiggUscWzGd2lDgkF29GuWzH/O7aYLL
 JPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WLP5sLGXYeodPYoYzna0rSXP46YZlNsgp302cQHV1UE=;
 b=R8j9aGQwacQLWsKysU046KmYj8PqOrcdoJWftX43u5KwULS5NXy1Gb/MqPNxScook8
 x+gfDkhildNFQIAueAyz647zMuagHFUM2aqu44cmKJLNH6HrwI6GZ5ATr8LIigRvBV4l
 QtqeNjYGfgUL57daA6/y1E9Dl5Y9vIhWZVFekToJr7ZLdJK6HPkLYr1pr0644/E6iBIt
 QVDiBYeW00rUyseUfqPYTWaRSyJHyO50KcN8iB7eGbqyzX82nouO35agOZO5vNdhKx8z
 GvWPJWCR5uQTlOLEh5F0UGyV9bMXV0FPzecJmSqJRHWuJRoEL98KIv4zV8gsFJrQmvzj
 25Ew==
X-Gm-Message-State: AOAM531mubbUZDl2/oNb0BIrK+jeFg3JQu1lEOFuH8CUpiX8QPtusaRz
 e+T3uTBg3VhV0y9OjIJcURzI2VvXS2Q=
X-Google-Smtp-Source: ABdhPJw6hzUTdyC+BnKP6qbJCmpc7EYOTPm9+iu0hKcUcxaruAEwzfE+9elDH0Qhb38DcKu3tI3uXA==
X-Received: by 2002:a17:90b:188a:: with SMTP id
 mn10mr1281145pjb.186.1644476032938; 
 Wed, 09 Feb 2022 22:53:52 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (121-44-67-214.tpgi.com.au. [121.44.67.214])
 by smtp.gmail.com with ESMTPSA id mw14sm1147729pjb.6.2022.02.09.22.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 22:53:52 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [RFC PATCH 2/3] spapr: prevent hdec timer being set up under virtual
 hypervisor
Date: Thu, 10 Feb 2022 16:53:39 +1000
Message-Id: <20220210065340.1276367-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220210065340.1276367-1-npiggin@gmail.com>
References: <20220210065340.1276367-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

not-yet-Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
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


