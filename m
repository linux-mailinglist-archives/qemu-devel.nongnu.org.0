Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385696A913D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 07:52:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXzGS-00032P-CI; Fri, 03 Mar 2023 01:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pXzG4-0002zO-5b
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 01:51:13 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pXzG2-0001yH-2A
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 01:51:11 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-173435e0ec4so1950056fac.12
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 22:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1677826269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lZQ2ngJ4sFZYmlYtgi8mO9F5kyakeh7gT4w82Q7qixg=;
 b=F8Mzyz1gnhNaYjMkSQRaxCbKMCUHKVwUyXo521GQnflHmI2HMk9BI2zz9aofFZYc7R
 PkR6JhyB4AFCUQGem+KYylCfaCX8EU73KLpEw/P9IQroB11nrBn4sZTJ7la35EMgqj2F
 /UxZBSqtPA2NRIpnjE1JLpWqne/NCw1ikN+BKwsGtpzk0t6lOFuwiUmHXunWRf4v7qLM
 S4ZgN0NA5jnRrUeEZiH4lwlNC0vvt4hb5jkt7NM/8kjBasOwYZvgORR1ykTOsz4pp0YR
 02M1ryRTCXHjkLvfnT7SjRraRHDaA+YFDDFxIi+lJqiQLttIWtoxHeI+a/JA7dsdZ5iA
 WFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677826269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lZQ2ngJ4sFZYmlYtgi8mO9F5kyakeh7gT4w82Q7qixg=;
 b=axM/VwlOXo/gs/4fVcdAYHb+PeaRiWFxvcwg566J/xFBXSeg2FtzsruPybWeXvRK7j
 Zy0hh2C8Tez6ae70HKQ36G6Num6j6JJJM5jIRTkGMfLoIr3Ux/z6/WX7rvCmDewXqDqy
 W3FfEyIDpIMPX3j+b6xCCkhao0HTq+is/PlAZVm1mTflsrE3Zu0gveFYRDFGfFJnTmvp
 AyVPksKKYzpF6WqyGJVNCR/rxWffI42zsrpgiUgFfLSk+3kA1QjDWxQQum7yw2YA+LOs
 kz/0mfy+5Qv3l1gEyhYNabdsbQ4MUKssJbZAlYRNm++lxM93PHGHOOEpw63hyz07nd0P
 yoWA==
X-Gm-Message-State: AO0yUKVjDDAayMU8nIHi7nCYGenwDNjtOCXKUUe4uYUGGpTXvTjCwa2U
 AZtk+2VaCnyq2rtUP0NXZGgiOzne/Lp9IWL7YzU=
X-Google-Smtp-Source: AK7set8xKUQH1oFYk9k2Oa++6pUOSv5t/kSzC0GKa3jcgjax8ICToUxKJCk+XyHwmwgAOBJ5CE4SPw==
X-Received: by 2002:a05:6870:a687:b0:176:261c:d8a6 with SMTP id
 i7-20020a056870a68700b00176261cd8a6mr305595oam.6.1677826269132; 
 Thu, 02 Mar 2023 22:51:09 -0800 (PST)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 t4-20020a056870e74400b0017293fa734asm675414oak.48.2023.03.02.22.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 22:51:08 -0800 (PST)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>, alistair.francis@wdc.com,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/2] hw: intc: Use cpu_by_arch_id to fetch CPU state
Date: Fri,  3 Mar 2023 12:20:55 +0530
Message-Id: <20230303065055.915652-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303065055.915652-1-mchitale@ventanamicro.com>
References: <20230303065055.915652-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oa1-x2d.google.com
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


Qemu_get_cpu uses the logical CPU id assigned during init to fetch the
CPU state. However APLIC, IMSIC and ACLINT contain registers and states
which are specific to physical hart Ids. The hart Ids in any given system
might be sparse and hence calls to qemu_get_cpu need to be replaced by
cpu_by_arch_id which performs lookup based on the sparse physical hart IDs.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 hw/intc/riscv_aclint.c | 16 ++++++++--------
 hw/intc/riscv_aplic.c  |  4 ++--
 hw/intc/riscv_imsic.c  |  6 +++---
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index eee04643cb..b466a6abaf 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -130,7 +130,7 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
         addr < (mtimer->timecmp_base + (mtimer->num_harts << 3))) {
         size_t hartid = mtimer->hartid_base +
                         ((addr - mtimer->timecmp_base) >> 3);
-        CPUState *cpu = qemu_get_cpu(hartid);
+        CPUState *cpu = cpu_by_arch_id(hartid);
         CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
         if (!env) {
             qemu_log_mask(LOG_GUEST_ERROR,
@@ -173,7 +173,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
         addr < (mtimer->timecmp_base + (mtimer->num_harts << 3))) {
         size_t hartid = mtimer->hartid_base +
                         ((addr - mtimer->timecmp_base) >> 3);
-        CPUState *cpu = qemu_get_cpu(hartid);
+        CPUState *cpu = cpu_by_arch_id(hartid);
         CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
         if (!env) {
             qemu_log_mask(LOG_GUEST_ERROR,
@@ -231,7 +231,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
 
         /* Check if timer interrupt is triggered for each hart. */
         for (i = 0; i < mtimer->num_harts; i++) {
-            CPUState *cpu = qemu_get_cpu(mtimer->hartid_base + i);
+            CPUState *cpu = cpu_by_arch_id(mtimer->hartid_base + i);
             CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
             if (!env) {
                 continue;
@@ -292,7 +292,7 @@ static void riscv_aclint_mtimer_realize(DeviceState *dev, Error **errp)
     s->timecmp = g_new0(uint64_t, s->num_harts);
     /* Claim timer interrupt bits */
     for (i = 0; i < s->num_harts; i++) {
-        RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(s->hartid_base + i));
+        RISCVCPU *cpu = RISCV_CPU(cpu_by_arch_id(s->hartid_base + i));
         if (riscv_cpu_claim_interrupts(cpu, MIP_MTIP) < 0) {
             error_report("MTIP already claimed");
             exit(1);
@@ -372,7 +372,7 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr addr, hwaddr size,
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
 
     for (i = 0; i < num_harts; i++) {
-        CPUState *cpu = qemu_get_cpu(hartid_base + i);
+        CPUState *cpu = cpu_by_arch_id(hartid_base + i);
         RISCVCPU *rvcpu = RISCV_CPU(cpu);
         CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
         riscv_aclint_mtimer_callback *cb =
@@ -407,7 +407,7 @@ static uint64_t riscv_aclint_swi_read(void *opaque, hwaddr addr,
 
     if (addr < (swi->num_harts << 2)) {
         size_t hartid = swi->hartid_base + (addr >> 2);
-        CPUState *cpu = qemu_get_cpu(hartid);
+        CPUState *cpu = cpu_by_arch_id(hartid);
         CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
         if (!env) {
             qemu_log_mask(LOG_GUEST_ERROR,
@@ -430,7 +430,7 @@ static void riscv_aclint_swi_write(void *opaque, hwaddr addr, uint64_t value,
 
     if (addr < (swi->num_harts << 2)) {
         size_t hartid = swi->hartid_base + (addr >> 2);
-        CPUState *cpu = qemu_get_cpu(hartid);
+        CPUState *cpu = cpu_by_arch_id(hartid);
         CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
         if (!env) {
             qemu_log_mask(LOG_GUEST_ERROR,
@@ -545,7 +545,7 @@ DeviceState *riscv_aclint_swi_create(hwaddr addr, uint32_t hartid_base,
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
 
     for (i = 0; i < num_harts; i++) {
-        CPUState *cpu = qemu_get_cpu(hartid_base + i);
+        CPUState *cpu = cpu_by_arch_id(hartid_base + i);
         RISCVCPU *rvcpu = RISCV_CPU(cpu);
 
         qdev_connect_gpio_out(dev, i,
diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index cfd007e629..cd7efc4ad4 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -833,7 +833,7 @@ static void riscv_aplic_realize(DeviceState *dev, Error **errp)
 
         /* Claim the CPU interrupt to be triggered by this APLIC */
         for (i = 0; i < aplic->num_harts; i++) {
-            RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(aplic->hartid_base + i));
+            RISCVCPU *cpu = RISCV_CPU(cpu_by_arch_id(aplic->hartid_base + i));
             if (riscv_cpu_claim_interrupts(cpu,
                 (aplic->mmode) ? MIP_MEIP : MIP_SEIP) < 0) {
                 error_report("%s already claimed",
@@ -966,7 +966,7 @@ DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
 
     if (!msimode) {
         for (i = 0; i < num_harts; i++) {
-            CPUState *cpu = qemu_get_cpu(hartid_base + i);
+            CPUState *cpu = cpu_by_arch_id(hartid_base + i);
 
             qdev_connect_gpio_out_named(dev, NULL, i,
                                         qdev_get_gpio_in(DEVICE(cpu),
diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
index 4d4d5b50ca..fea3385b51 100644
--- a/hw/intc/riscv_imsic.c
+++ b/hw/intc/riscv_imsic.c
@@ -316,8 +316,8 @@ static const MemoryRegionOps riscv_imsic_ops = {
 static void riscv_imsic_realize(DeviceState *dev, Error **errp)
 {
     RISCVIMSICState *imsic = RISCV_IMSIC(dev);
-    RISCVCPU *rcpu = RISCV_CPU(qemu_get_cpu(imsic->hartid));
-    CPUState *cpu = qemu_get_cpu(imsic->hartid);
+    RISCVCPU *rcpu = RISCV_CPU(cpu_by_arch_id(imsic->hartid));
+    CPUState *cpu = cpu_by_arch_id(imsic->hartid);
     CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
 
     imsic->num_eistate = imsic->num_pages * imsic->num_irqs;
@@ -413,7 +413,7 @@ DeviceState *riscv_imsic_create(hwaddr addr, uint32_t hartid, bool mmode,
                                 uint32_t num_pages, uint32_t num_ids)
 {
     DeviceState *dev = qdev_new(TYPE_RISCV_IMSIC);
-    CPUState *cpu = qemu_get_cpu(hartid);
+    CPUState *cpu = cpu_by_arch_id(hartid);
     uint32_t i;
 
     assert(!(addr & (IMSIC_MMIO_PAGE_SZ - 1)));
-- 
2.34.1


