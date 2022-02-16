Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA954B85D1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:33:15 +0100 (CET)
Received: from localhost ([::1]:43470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHcX-0008Ty-QS
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:33:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKHVg-0000jZ-2U; Wed, 16 Feb 2022 05:26:08 -0500
Received: from [2607:f8b0:4864:20::1036] (port=50690
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKHVe-0005IP-86; Wed, 16 Feb 2022 05:26:07 -0500
Received: by mail-pj1-x1036.google.com with SMTP id m7so2046149pjk.0;
 Wed, 16 Feb 2022 02:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HX+E4SlKTXBXvexQNEiFZ99YaVRtlNvtjB/Ya8pt1c0=;
 b=KKnM1XIniWzUBRyOxvpJcXMPqZmbBv3qdINtoD1fsaWHOlyK3VUfxCYLuzYGcHp5i/
 dbDXwONlAEFFRZP6PxzPTQpf18iFkg6RooxQn+xkh26aWIQVafuuONW3R09hybYm12Dq
 gDGetow1Ox0m6ccj4I9BBfApqv6h/YJAbK1mHcrsLWZEll7VFRYUu+tObPYgzIQNIe8T
 9xp8EUIjkBnCVeJfkgztDITJWf/XHVcE5eOaMbpzSJEVAnrYcpjeqGLjWb9DUHu8NTgL
 efmjQT1WygKskY6bY/EK50o0rj5G5LE+X/U/8rBYWy/rP5IhgGJ329P0uoI8PV8e0/2H
 SdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HX+E4SlKTXBXvexQNEiFZ99YaVRtlNvtjB/Ya8pt1c0=;
 b=0iaaU/AajY/N+fTczy8xvSgPS1G6VG7ysq74mD6Tb2hWZ6OnNzXqJG8DO63H53XpOE
 AQWeLAoDy1C0dml1Qc13sDMYqLnmnSAfSUkQAi/XrhnKvzTOSKy0/DesYY2YX32UzLpR
 79AjKEaW6Y5SW3Sa+/vMybAdmlSU1S74bEkdtnCLbMmg4P9lLyf0PdKLXmAiHjdIqERZ
 LWvoujKp47Cttt0hIzqdeGd3CBf3gdRQQkwQQx3enXHT1qa2CiPDoAvQP4LkERlYb1q5
 JDjpETj5SOIaCBMJmFfr2ddZz7ygQoXegMV1ntjLEgrRrx87wXAy7IqBN+XhL+XCUPoW
 ch7g==
X-Gm-Message-State: AOAM5308BSb4Jrb5Yvsa6WVc/YjtSAaltOHRcOaiSteoTsSZOPqdPQ6Q
 maRUDtsJq0h/yLkKvCHsm3QCwfIor+k=
X-Google-Smtp-Source: ABdhPJyQad37S169aA/s1qIbPVwrpuAtBhWIcbLMBZOr1gV00Ni4M2yHfjgjXcdSeGyptIM6AM84Fg==
X-Received: by 2002:a17:90a:fe93:b0:1b8:ca42:5cb5 with SMTP id
 co19-20020a17090afe9300b001b8ca425cb5mr887711pjb.217.1645007164561; 
 Wed, 16 Feb 2022 02:26:04 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-225-41.tpgi.com.au.
 [193.116.225.41])
 by smtp.gmail.com with ESMTPSA id j3sm5214474pgs.0.2022.02.16.02.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 02:26:04 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v2 2/9] spapr: prevent hdec timer being set up under virtual
 hypervisor
Date: Wed, 16 Feb 2022 20:25:38 +1000
Message-Id: <20220216102545.1808018-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220216102545.1808018-1-npiggin@gmail.com>
References: <20220216102545.1808018-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The spapr virtual hypervisor does not require the hdecr timer.
Remove it.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
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


