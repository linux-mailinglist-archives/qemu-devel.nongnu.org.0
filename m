Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CD83B6200
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:38:50 +0200 (CEST)
Received: from localhost ([::1]:56298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxsPR-0005uN-N4
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxsMe-0007c6-1C
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:35:56 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:43006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxsMc-0000aC-4f
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:35:55 -0400
Received: by mail-pl1-x62c.google.com with SMTP id v13so9037360ple.9
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 07:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0RIZcAGtf2wk/6EK7iE6Gu5hPUTlpTApAXivA9sXxo8=;
 b=pYJuM5EJDJ729E3hLZOpJevEVDKWLhVasz/blIA2qljmlaegNewTdQt1tB/srC3ScQ
 aa1G/kpTh2T2wLNuupq0DJl335gE53nbx6KsRqCFhqHHncg9q1CaIGpJCSlGWPGmMxum
 vTYsR1Pv5dYmnx+Rs4TmDUle1d1uOcMPhqzqxplDzJ3N0yleugx4w8RIg/TkFHimUdwY
 p7PaMeXVWaothqR4zKT7cKJPQHRcFNcYc5bpuqS9XUn6idYVfNkYRumQI8ia/dkHCHDU
 tqK+i9vzSVIBQz+hOo+fjYlwug2r1oQ1O65Ky6tbmQDJsquVWRDkvpFKANvOjGkZT32h
 BHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0RIZcAGtf2wk/6EK7iE6Gu5hPUTlpTApAXivA9sXxo8=;
 b=fGDz5DGwGi6HHWHYnfj29iud7k++0zJI0TQeM33oBs/u4zrQVKSeLlHmQw7B8b0FG6
 1qQsIc+8wPHFzCkfTyqb/X2flwnoCfWh3No7HyDJZjQ0Y8HJBM/aW4NxmkkzmM4EctH1
 kV7U2PvoEDgV5BQ+EiVqB7xWcJSNdVMYBvp/GTiRSCKazNkd5xZ/WEzivjCNfDEfBdfJ
 Ysf0Z3F7bF+YahtKuMzXgRU5HaVB3QZG2iv0C3t6FE1buB1Ppz55oIkXLEz0HtB88yqa
 zy4OEWj2AeD3xNissME8CuXTmeIFHJMEdBvgqjkTs7DYpWHpanuaISbQtf0X7OSD3ulq
 94Zw==
X-Gm-Message-State: AOAM532GyXQLF6U0PxqN9RlLEGZnG0skIuoWE0jnTYeBYgWJvoSsvcFw
 De/b/gfBznWjO5xzloWJ0J1YVu7yCvT0vA==
X-Google-Smtp-Source: ABdhPJxPNmRB2fFWmDqarz1CqekWQ/iOmympp/Wk42PGua5bnBokhHTZTLyqfSINBIdxY0oplAn6tQ==
X-Received: by 2002:a17:90a:d3d2:: with SMTP id
 d18mr38272250pjw.102.1624890952883; 
 Mon, 28 Jun 2021 07:35:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k13sm72779pgh.82.2021.06.28.07.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 07:35:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] hw/alpha: Set minimum PCI device ID to 1 to match Clipper
 IRQ mappings
Date: Mon, 28 Jun 2021 07:35:47 -0700
Message-Id: <20210628143551.2870006-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628143551.2870006-1-richard.henderson@linaro.org>
References: <20210628143551.2870006-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Jason Thorpe <thorpej@me.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Thorpe <thorpej@me.com>

Since we are emulating a Clipper device topology, we need to set the
minimum PCI device ID to 1, as there is no IRQ mapping for a device
at ID 0 (see sys_dp264.c:clipper_map_irq()).

- Add a 'devfn_min' argument to typhoon_init().  Pass that argument
  along to pci_register_root_bus().
- In clipper_init(), pass PCI_DEVFN(1, 0) as the minimum PCI device
  ID/function.

Signed-off-by: Jason Thorpe <thorpej@me.com>
Message-Id: <20210613211549.18094-3-thorpej@me.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/alpha/alpha_sys.h | 2 +-
 hw/alpha/dp264.c     | 7 +++++--
 hw/alpha/typhoon.c   | 5 +++--
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/alpha/alpha_sys.h b/hw/alpha/alpha_sys.h
index e2c02e2bbe..4835b3d5ee 100644
--- a/hw/alpha/alpha_sys.h
+++ b/hw/alpha/alpha_sys.h
@@ -11,7 +11,7 @@
 
 
 PCIBus *typhoon_init(MemoryRegion *, ISABus **, qemu_irq *, AlphaCPU *[4],
-                     pci_map_irq_fn);
+                     pci_map_irq_fn, uint8_t devfn_min);
 
 /* alpha_pci.c.  */
 extern const MemoryRegionOps alpha_pci_ignore_ops;
diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index 1017ecf330..010d22476b 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -76,9 +76,12 @@ static void clipper_init(MachineState *machine)
     cpus[0]->env.trap_arg1 = 0;
     cpus[0]->env.trap_arg2 = smp_cpus;
 
-    /* Init the chipset.  */
+    /*
+     * Init the chipset.  Because we're using CLIPPER IRQ mappings,
+     * the minimum PCI device IdSel is 1.
+     */
     pci_bus = typhoon_init(machine->ram, &isa_bus, &rtc_irq, cpus,
-                           clipper_pci_map_irq);
+                           clipper_pci_map_irq, PCI_DEVFN(1, 0));
 
     /* Since we have an SRM-compatible PALcode, use the SRM epoch.  */
     mc146818_rtc_init(isa_bus, 1900, rtc_irq);
diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index 87020cbe0d..fa31a2f286 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -815,7 +815,8 @@ static void typhoon_alarm_timer(void *opaque)
 }
 
 PCIBus *typhoon_init(MemoryRegion *ram, ISABus **isa_bus, qemu_irq *p_rtc_irq,
-                     AlphaCPU *cpus[4], pci_map_irq_fn sys_map_irq)
+                     AlphaCPU *cpus[4], pci_map_irq_fn sys_map_irq,
+                     uint8_t devfn_min)
 {
     MemoryRegion *addr_space = get_system_memory();
     DeviceState *dev;
@@ -885,7 +886,7 @@ PCIBus *typhoon_init(MemoryRegion *ram, ISABus **isa_bus, qemu_irq *p_rtc_irq,
     b = pci_register_root_bus(dev, "pci",
                               typhoon_set_irq, sys_map_irq, s,
                               &s->pchip.reg_mem, &s->pchip.reg_io,
-                              0, 64, TYPE_PCI_BUS);
+                              devfn_min, 64, TYPE_PCI_BUS);
     phb->bus = b;
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
-- 
2.25.1


