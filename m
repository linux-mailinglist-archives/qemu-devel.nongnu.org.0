Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A656F5623D1
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 22:06:24 +0200 (CEST)
Received: from localhost ([::1]:58332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o70Qh-0000Ye-HL
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 16:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o704U-0004TY-2o; Thu, 30 Jun 2022 15:43:26 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:39807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o704P-0006G5-SW; Thu, 30 Jun 2022 15:43:25 -0400
Received: by mail-oi1-x22b.google.com with SMTP id s188so411031oib.6;
 Thu, 30 Jun 2022 12:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=giqG0/DFOihR9xiSWhOPyFhGLGt0UUaPt2LvF/Pzfe4=;
 b=egK500E0i8437ho7eWdEdgh8b4o3ku5szQCqGcwETIvH7lPQCHHD3FaoxhvVbSGjYT
 smGXc7qO9Q/GoWSrwQuArwOpaFvY01i38kGS5BxQnc3O7cezZFT9VCTevIp8kI2g35VM
 n9mP6hM8VUKM/fMD6ZJlCkPd4kotGRl6z1Jb+i3f6XX9TAXbtDC9AZmH7Eu2pqaCbYx8
 gAI9HQRNgNn0cetZM4nWueBmrfdGEzpGpz0St2nuUW4/Fs4B/c5Jo4tU6TlmLuHRt+XD
 SoHEVseseMiQU2v2fqzTDrW2Jn9nX6JNMbCgPgfQW+OJsl6GQyQekPFM9CuRNrOVjVj5
 1ang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=giqG0/DFOihR9xiSWhOPyFhGLGt0UUaPt2LvF/Pzfe4=;
 b=7bb9SPg3+PafAYZVzI2fkkpyCVi0kFmTED0G6Tv6y55kzIYxZ2J6jzXpNMzHXorrMd
 q2CNM78nk7iku7R/ldjNU966qtjXIESZ1+cNytjisuQh+I+0agHHYGilw55TnoYKOz9e
 1uAmo626js7IH/s0Rk9NshTXFOa84l1HDeN1pSFif9CDrJMqcmjVweD9awUBRo7ApMbI
 cso+YbYEKSJMR7HbGR8DFHenG1DyyGBWGQyLHYlQrU+WXM3BmAOzNiEjwu2iOljep5q2
 8deNdwPHqwIFmb9NYEJmCZZp/XR7mdZJsi48I5asK+zZo9iujZaCA6E1zYED+Tp6kWbZ
 bYoA==
X-Gm-Message-State: AJIora8xVUDS9Hynmu/+QyROSWPOde+p6eM5T1nwbGbD+dmBYa9enGud
 FnWAylW2VctGVOQw+PEEol5s0iQbudg=
X-Google-Smtp-Source: AGRyM1vBtxYv/0OsJToIELj4nM5sD4sCeDKJp+jHIb3uF1mylEWhlfJ9ShQg8mQSuTWbz5VSjlZarg==
X-Received: by 2002:a05:6808:d53:b0:335:a8e2:6cbc with SMTP id
 w19-20020a0568080d5300b00335a8e26cbcmr6058444oik.9.1656618199589; 
 Thu, 30 Jun 2022 12:43:19 -0700 (PDT)
Received: from balboa.ibmuc.com ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a4aa3c5000000b0035ef3da8387sm11250519ool.4.2022.06.30.12.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 12:43:19 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 5/9] target/ppc: use Error pointer in kvmppc_get_clockfreq()
Date: Thu, 30 Jun 2022 16:42:45 -0300
Message-Id: <20220630194249.886747-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630194249.886747-1-danielhb413@gmail.com>
References: <20220630194249.886747-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Callers will then be able to handle any errors that might happen when
reading the clock frequency.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/e500.c          | 2 +-
 hw/ppc/ppc440_bamboo.c | 2 +-
 hw/ppc/sam460ex.c      | 2 +-
 hw/ppc/spapr.c         | 2 +-
 target/ppc/kvm.c       | 4 ++--
 target/ppc/kvm_ppc.h   | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 7f7f5b3452..4b4e99ef3c 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -405,7 +405,7 @@ static int ppce500_load_device_tree(PPCE500MachineState *pms,
 
     if (kvm_enabled()) {
         /* Read out host's frequencies */
-        clock_freq = kvmppc_get_clockfreq();
+        clock_freq = kvmppc_get_clockfreq(NULL);
         tb_freq = kvmppc_get_tbfreq();
 
         /* indicate KVM hypercall interface */
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index d5973f2484..d23f881d9d 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -107,7 +107,7 @@ static int bamboo_load_device_tree(hwaddr addr,
      * the correct frequencies. */
     if (kvm_enabled()) {
         tb_freq = kvmppc_get_tbfreq();
-        clock_freq = kvmppc_get_clockfreq();
+        clock_freq = kvmppc_get_clockfreq(NULL);
     }
 
     qemu_fdt_setprop_cell(fdt, "/cpus/cpu@0", "clock-frequency",
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 2f24598f55..4d25cb2c2e 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -179,7 +179,7 @@ static int sam460ex_load_device_tree(hwaddr addr,
      * the correct frequencies. */
     if (kvm_enabled()) {
         tb_freq = kvmppc_get_tbfreq();
-        clock_freq = kvmppc_get_clockfreq();
+        clock_freq = kvmppc_get_clockfreq(NULL);
     }
 
     qemu_fdt_setprop_cell(fdt, "/cpus/cpu@0", "clock-frequency",
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index fd4942e881..f66e3cbe38 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -654,7 +654,7 @@ static void spapr_dt_cpu(CPUState *cs, void *fdt, int offset,
                        0xffffffff, 0xffffffff};
     uint32_t tbfreq = kvm_enabled() ? kvmppc_get_tbfreq()
         : SPAPR_TIMEBASE_FREQ;
-    uint32_t cpufreq = kvm_enabled() ? kvmppc_get_clockfreq() : 1000000000;
+    uint32_t cpufreq = kvm_enabled() ? kvmppc_get_clockfreq(NULL) : 1000000000;
     uint32_t page_sizes_prop[64];
     size_t page_sizes_prop_size;
     unsigned int smp_threads = ms->smp.threads;
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index c218380eb7..2accd1f946 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1945,9 +1945,9 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname, Error **errp)
     return kvmppc_read_int_dt(tmp, errp);
 }
 
-uint64_t kvmppc_get_clockfreq(void)
+uint64_t kvmppc_get_clockfreq(Error **errp)
 {
-    return kvmppc_read_int_cpu_dt("clock-frequency", NULL);
+    return kvmppc_read_int_cpu_dt("clock-frequency", errp);
 }
 
 static int kvmppc_get_dec_bits(void)
diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
index ee9325bf9a..b05aedb9f8 100644
--- a/target/ppc/kvm_ppc.h
+++ b/target/ppc/kvm_ppc.h
@@ -14,7 +14,7 @@
 #ifdef CONFIG_KVM
 
 uint32_t kvmppc_get_tbfreq(void);
-uint64_t kvmppc_get_clockfreq(void);
+uint64_t kvmppc_get_clockfreq(Error **errp);
 bool kvmppc_get_host_model(char **buf);
 bool kvmppc_get_host_serial(char **buf);
 int kvmppc_get_hasidle(CPUPPCState *env);
-- 
2.36.1


