Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5371E48FCB8
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jan 2022 13:26:13 +0100 (CET)
Received: from localhost ([::1]:55376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n94br-0003Uy-V6
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 07:26:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1n94a1-000281-33; Sun, 16 Jan 2022 07:24:17 -0500
Received: from [2a00:1450:4864:20::332] (port=41854
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1n94Zz-0006E8-Ie; Sun, 16 Jan 2022 07:24:16 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so16133681wme.0; 
 Sun, 16 Jan 2022 04:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O4C2pRJvni3Gkgo7KK/aGfc8VcKGaWX6P4w5eund83w=;
 b=gRg5xwlHROGNr0KfDxYgDC1C9p9CrqDAjhu5KPn2UbCJ1Aw1e0lSR3N8f33Nn+TE4b
 OmW/FUwF9/Oned/vvChK4XlhLomD3Yf1AFcyhlAZniUVOkYLu947UyLeve/AT0WEk2HZ
 sk6yBKVyYAzsWCCDbRq107h5TDbszIPPognoNuiddB608Fox6xsy1PpynRZwAs8v7So3
 GVuBCC/ms0w6sr4GG9aS7CmpGpv6JLB7l9qQ8nAvBS5THfto06oKQdGI9ciX7+nayZ15
 1TjlVUbnUe4wJAxP9JkavxYVmRYQi0FL6nOjnGgSQwl3GJZyADmLYsR+CI6IpryndH/X
 KHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O4C2pRJvni3Gkgo7KK/aGfc8VcKGaWX6P4w5eund83w=;
 b=UjCUcNe68WkDb+unee+yJ6JGX2loykuFZLxYYsGOaeCV549vZYAHx99q3lStpeD9Ge
 iCkTTMvqm/zQwIvyRoSb5qEuy7ifphFdPJJllvhi9K7GYtoHn1Mq37wFRQS2vgKhz+AS
 1cnqKvimazIJ6qs79r0PSghCsno27cXR7IUXO7VFnDPx0kKAjDU3FsIKMomFpIiIO1mD
 lB7C2kBK2pKXK87o7cL+aze7AzqwfQDqhI6/gaiV2CjHbV/5mraIGkEHwRK/WFWHqlSx
 baQfAeqQJ3+XRsP6B60InofCIxw0/zCiQ6nCAvlzydtaFWLM5EArPuOUXasmQ9BdVnRD
 gg3w==
X-Gm-Message-State: AOAM533SmVjO9vkwHTNpqpxQ2h/kKzko3Wy2wm2sgHim/9anI7F+yHF/
 TlCwAsbz4FthYhpHLyJphggta539nNEivLuxsk4=
X-Google-Smtp-Source: ABdhPJx+uGs0uOuicl/C5OfnzycV5DaRbWsjCLOj5LTBjqFoy8PY9MJw+x1VjO+cknrfqnhYn7grdQ==
X-Received: by 2002:a7b:c199:: with SMTP id y25mr15076783wmi.83.1642335853242; 
 Sun, 16 Jan 2022 04:24:13 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-054-082-013.78.54.pool.telefonica.de. [78.54.82.13])
 by smtp.gmail.com with ESMTPSA id s22sm15276288wmc.1.2022.01.16.04.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 04:24:12 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] intc: Unexport InterruptStatsProviderClass-related functions
Date: Sun, 16 Jan 2022 13:23:26 +0100
Message-Id: <20220116122327.73048-1-shentey@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The functions are only used within their respective source files, so no
need for exporting.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/intc/i8259_common.c            | 6 +++---
 hw/intc/ioapic_common.c           | 2 +-
 include/hw/i386/ioapic_internal.h | 1 -
 include/hw/isa/i8259_internal.h   | 3 ---
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/intc/i8259_common.c b/hw/intc/i8259_common.c
index d90b40fe4c..af2e4a2241 100644
--- a/hw/intc/i8259_common.c
+++ b/hw/intc/i8259_common.c
@@ -116,8 +116,8 @@ void pic_stat_update_irq(int irq, int level)
     }
 }
 
-bool pic_get_statistics(InterruptStatsProvider *obj,
-                        uint64_t **irq_counts, unsigned int *nb_irqs)
+static bool pic_get_statistics(InterruptStatsProvider *obj,
+                               uint64_t **irq_counts, unsigned int *nb_irqs)
 {
     PICCommonState *s = PIC_COMMON(obj);
 
@@ -132,7 +132,7 @@ bool pic_get_statistics(InterruptStatsProvider *obj,
     return true;
 }
 
-void pic_print_info(InterruptStatsProvider *obj, Monitor *mon)
+static void pic_print_info(InterruptStatsProvider *obj, Monitor *mon)
 {
     PICCommonState *s = PIC_COMMON(obj);
 
diff --git a/hw/intc/ioapic_common.c b/hw/intc/ioapic_common.c
index 3cccfc1556..aa5f760871 100644
--- a/hw/intc/ioapic_common.c
+++ b/hw/intc/ioapic_common.c
@@ -76,7 +76,7 @@ static void ioapic_irr_dump(Monitor *mon, const char *name, uint32_t bitmap)
     monitor_printf(mon, "\n");
 }
 
-void ioapic_print_redtbl(Monitor *mon, IOAPICCommonState *s)
+static void ioapic_print_redtbl(Monitor *mon, IOAPICCommonState *s)
 {
     static const char *delm_str[] = {
         "fixed", "lowest", "SMI", "...", "NMI", "INIT", "...", "extINT"};
diff --git a/include/hw/i386/ioapic_internal.h b/include/hw/i386/ioapic_internal.h
index 021e715f11..9880443cc7 100644
--- a/include/hw/i386/ioapic_internal.h
+++ b/include/hw/i386/ioapic_internal.h
@@ -112,7 +112,6 @@ struct IOAPICCommonState {
 
 void ioapic_reset_common(DeviceState *dev);
 
-void ioapic_print_redtbl(Monitor *mon, IOAPICCommonState *s);
 void ioapic_stat_update_irq(IOAPICCommonState *s, int irq, int level);
 
 #endif /* QEMU_IOAPIC_INTERNAL_H */
diff --git a/include/hw/isa/i8259_internal.h b/include/hw/isa/i8259_internal.h
index a6ae8a583f..d272d879fb 100644
--- a/include/hw/isa/i8259_internal.h
+++ b/include/hw/isa/i8259_internal.h
@@ -72,8 +72,5 @@ struct PICCommonState {
 void pic_reset_common(PICCommonState *s);
 ISADevice *i8259_init_chip(const char *name, ISABus *bus, bool master);
 void pic_stat_update_irq(int irq, int level);
-bool pic_get_statistics(InterruptStatsProvider *obj,
-                        uint64_t **irq_counts, unsigned int *nb_irqs);
-void pic_print_info(InterruptStatsProvider *obj, Monitor *mon);
 
 #endif /* QEMU_I8259_INTERNAL_H */
-- 
2.34.1


