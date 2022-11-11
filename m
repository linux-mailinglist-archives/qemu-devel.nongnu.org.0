Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBD3626145
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 19:36:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otYj0-00089Q-Ej; Fri, 11 Nov 2022 13:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYiv-00086A-4X
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:53 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYin-0005Ev-Qx
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:52 -0500
Received: by mail-wr1-x430.google.com with SMTP id v1so7472295wrt.11
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 10:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5iH61ih5qpB2sELZhsEsE8puEse88yX4jWDb+Zn9fY4=;
 b=KosjgZvQxuwYO+ztPriVkS//QmY46DvRiKGgVCLuH8+8BvfMTiNeAbMLpNjdeEotCx
 i7MhArznbboKBdnhZnYhYT+qF+PopEVGyTb9Y8f0IMuGsIDS8ZzXTfY7iu7iTNNrCwIS
 SIXhpdab+8c1hdoYxGrOl9u/wcPkwAgsGJo2eTn4eCpdGQmbDs1P51ogDqTv/SfM5XaC
 EWzCKHRr7xlQGP+EgFabTG+BA615+1yMQdjh03/GQMtvq8zLdG0K+3G9r5n8kz5XrN9/
 qdrWe2T1s+uKeFFZMjIde4EWGRyCS5qTDflJ32sc++XCKDJnJ1zQ7zCckVv/wvSCWSyW
 O8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5iH61ih5qpB2sELZhsEsE8puEse88yX4jWDb+Zn9fY4=;
 b=GOD1uJ551l0cAERpCoAly2uBY5Mun5L0v6I1FgIaJrotBG6DQG2eoTaNLZnLk1xPx4
 i+CtMx7R/2IN6+2CnbjFNT/P21r7gCKuplNJ2sIFya6rDY1GldH5d2DvAtfhvsDgVFbS
 4/axOasyT2CGerQm8H22T9VwEEmLyplCFBg2R+sg9rfRs9y4E29newFKPOfmJPgcB/so
 8O/SsGLbRLcrn2c6x/A2Wtby46fjWhnGroR8F1XHrnZ1A4KB5ly1aygzsKdX5AWVp/zX
 FAWRNCV78T+D8ZUmKj70V27/2Sxb3DUpLZUBzb1jJia36fWTXLFks8FzCiFp1H7lxeRe
 iGAw==
X-Gm-Message-State: ANoB5pnGSGT3hWkVB29eRe6SZzkUabKW8+cCT4lsSmYFf/PYpe/1vmhf
 6pgFelVb16hZwochq7hpinicUA==
X-Google-Smtp-Source: AA0mqf63ZjuZ5QNuqfcYETAcVF7YYhCGC1QKu+mvfzZeomm1Kj+PEus55JC164ilZeYNRaRGAKIRVg==
X-Received: by 2002:a5d:69d1:0:b0:236:557c:24af with SMTP id
 s17-20020a5d69d1000000b00236557c24afmr2026475wrw.636.1668191145066; 
 Fri, 11 Nov 2022 10:25:45 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b003cf57329221sm10148028wms.14.2022.11.11.10.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 10:25:41 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A90481FFC9;
 Fri, 11 Nov 2022 18:25:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH v5 19/20] hw/isa: derive CPUState from MemTxAttrs in
 apm_ioport_writeb
Date: Fri, 11 Nov 2022 18:25:34 +0000
Message-Id: <20221111182535.64844-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111182535.64844-1-alex.bennee@linaro.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

Some of the callbacks need a CPUState so extend the interface so we
can pass that down rather than relying on current_cpu hacks.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/isa/apm.h |  2 +-
 hw/acpi/ich9.c       |  1 -
 hw/acpi/piix4.c      |  2 +-
 hw/isa/apm.c         | 21 +++++++++++++++++----
 hw/isa/lpc_ich9.c    |  5 ++---
 5 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/include/hw/isa/apm.h b/include/hw/isa/apm.h
index b6e070c00e..eb952e1c1c 100644
--- a/include/hw/isa/apm.h
+++ b/include/hw/isa/apm.h
@@ -6,7 +6,7 @@
 #define APM_CNT_IOPORT  0xb2
 #define ACPI_PORT_SMI_CMD APM_CNT_IOPORT
 
-typedef void (*apm_ctrl_changed_t)(uint32_t val, void *arg);
+typedef void (*apm_ctrl_changed_t)(CPUState *cs, uint32_t val, void *arg);
 
 typedef struct APMState {
     uint8_t apmc;
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index bd9bbade70..70ad1cd1ff 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -30,7 +30,6 @@
 #include "hw/pci/pci.h"
 #include "migration/vmstate.h"
 #include "qemu/timer.h"
-#include "hw/core/cpu.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "hw/acpi/acpi.h"
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 0a81f1ad93..43b78ef8f9 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -70,7 +70,7 @@ static void pm_tmr_timer(ACPIREGS *ar)
     acpi_update_sci(&s->ar, s->irq);
 }
 
-static void apm_ctrl_changed(uint32_t val, void *arg)
+static void apm_ctrl_changed(CPUState *cs, uint32_t val, void *arg)
 {
     PIIX4PMState *s = arg;
     PCIDevice *d = PCI_DEVICE(s);
diff --git a/hw/isa/apm.c b/hw/isa/apm.c
index dfe9020d30..95efbf2457 100644
--- a/hw/isa/apm.c
+++ b/hw/isa/apm.c
@@ -21,6 +21,8 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/core/cpu.h"
 #include "hw/isa/apm.h"
 #include "hw/pci/pci.h"
 #include "migration/vmstate.h"
@@ -30,10 +32,19 @@
 /* fixed I/O location */
 #define APM_STS_IOPORT  0xb3
 
-static void apm_ioport_writeb(void *opaque, hwaddr addr, uint64_t val,
-                              unsigned size)
+static MemTxResult apm_ioport_writeb(void *opaque, hwaddr addr, uint64_t val,
+                                     unsigned size, MemTxAttrs attrs)
 {
     APMState *apm = opaque;
+    CPUState *cs;
+
+    if (attrs.requester_type != MTRT_CPU) {
+        qemu_log_mask(LOG_UNIMP | LOG_GUEST_ERROR,
+                      "%s: saw non-CPU transaction", __func__);
+        return MEMTX_ACCESS_ERROR;
+    }
+    cs = qemu_get_cpu(attrs.requester_id);
+
     addr &= 1;
 
     trace_apm_io_write(addr, val);
@@ -41,11 +52,13 @@ static void apm_ioport_writeb(void *opaque, hwaddr addr, uint64_t val,
         apm->apmc = val;
 
         if (apm->callback) {
-            (apm->callback)(val, apm->arg);
+            (apm->callback)(cs, val, apm->arg);
         }
     } else {
         apm->apms = val;
     }
+
+    return MEMTX_OK;
 }
 
 static uint64_t apm_ioport_readb(void *opaque, hwaddr addr, unsigned size)
@@ -77,7 +90,7 @@ const VMStateDescription vmstate_apm = {
 
 static const MemoryRegionOps apm_ops = {
     .read = apm_ioport_readb,
-    .write = apm_ioport_writeb,
+    .write_with_attrs = apm_ioport_writeb,
     .impl = {
         .min_access_size = 1,
         .max_access_size = 1,
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 0b0a83e080..2700a18a65 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -443,7 +443,7 @@ void ich9_lpc_pm_init(PCIDevice *lpc_pci, bool smm_enabled)
 
 /* APM */
 
-static void ich9_apm_ctrl_changed(uint32_t val, void *arg)
+static void ich9_apm_ctrl_changed(CPUState *cs, uint32_t val, void *arg)
 {
     ICH9LPCState *lpc = arg;
 
@@ -459,12 +459,11 @@ static void ich9_apm_ctrl_changed(uint32_t val, void *arg)
     if (lpc->pm.smi_en & ICH9_PMIO_SMI_EN_APMC_EN) {
         if (lpc->smi_negotiated_features &
             (UINT64_C(1) << ICH9_LPC_SMI_F_BROADCAST_BIT)) {
-            CPUState *cs;
             CPU_FOREACH(cs) {
                 cpu_interrupt(cs, CPU_INTERRUPT_SMI);
             }
         } else {
-            cpu_interrupt(current_cpu, CPU_INTERRUPT_SMI);
+            cpu_interrupt(cs, CPU_INTERRUPT_SMI);
         }
     }
 }
-- 
2.34.1


