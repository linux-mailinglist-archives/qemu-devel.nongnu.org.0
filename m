Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 048BB6931F4
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 16:24:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQriM-0004np-Ur; Sat, 11 Feb 2023 10:22:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQriK-0004nY-Hh
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 10:22:56 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQriI-00087k-TU
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 10:22:56 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so6056226wms.1
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 07:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oudN0ASg8WpOow+Q4IYDvspGobmx6uMh2/lX2Axv37c=;
 b=tg8p9k4xXfFAKgELEkd7QptgNKlP7d1rqcUd5RmT9AqeXvFCqNuUv1ijiWcRcW9tpR
 +HTZtk+Pc6pewsSvSeCPmmX/Xj0gt6J1ZfSoYvTbRyXW4kFx6uDvr7oFSRMn29sBSZfr
 CyRRqEBFwIoqgerchD9Jq677g9eh1D//a8/k1H1sEa/qiGFmbPuyrtolnmQJNgf7TzED
 JQkMBa1cyaTGigm6/Iw4Ia6oyp810XkfP9nW1TAAOnPWcoH8tXLU67xClkkPzN3xgqF+
 AmUtsn70/PVaQ0RRi8OnfInGs3obtbklyQIbncaK8UrRLaKP1sAqh8l9I3az9YFcAeyS
 +qpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oudN0ASg8WpOow+Q4IYDvspGobmx6uMh2/lX2Axv37c=;
 b=X9yGD0flh87rfjIPG6E1WOK5PyDxudu+9lP528Cie1QDfGlDR9U1TUezl7zzmtLM5b
 MFeawOsvce4LW+ZU1tJ0mZt46Fzy8/rh4Qpj38ZOdH6D4FVGNNBDAwlYIMxwjDWcci4o
 hBdJVUwCczszuikuVYYls65BODE7C6nei1eJCQrGrLAAYhq/c6unVrfzEhQK4IU0HJls
 G8FPd65SLGTCPQH1AnLw9aVaEeiEuX4U3ad9pICVxi76fBJHrT4olCANulD8AU7TxFdv
 L6a9aVSQox2fMhzTfhGEAXvb8fJud6ypNxiS/DQrhwOGXuxqFNPIv3NFr46Y9496oyiV
 j0Jg==
X-Gm-Message-State: AO0yUKWBn/C/dudsDyIuFQBJL8A12Ez7vJYhU+RWO/G/45I/UG5s3xHx
 8p1+bfX7TX0jO1vkETT2yD/7ao9zlccMBS+9
X-Google-Smtp-Source: AK7set+mQZtBIhbbiEbbzYK22hl69rBGku4CD5UBTkfpKHF7hR7r6vUZ+g2tdHHdw8WDV21hMO8yhg==
X-Received: by 2002:a05:600c:1816:b0:3e1:374:8b66 with SMTP id
 n22-20020a05600c181600b003e103748b66mr11234795wmp.40.1676128973415; 
 Sat, 11 Feb 2023 07:22:53 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c3b9300b003daf7721bb3sm12470451wms.12.2023.02.11.07.22.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Feb 2023 07:22:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/2] hw/pci: Trace IRQ routing on PCI topology
Date: Sat, 11 Feb 2023 16:22:39 +0100
Message-Id: <20230211152239.88106-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230211152239.88106-1-philmd@linaro.org>
References: <20230211152239.88106-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Trace how IRQ are rooted from EP to RC.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci/pci.c        | 8 ++++++++
 hw/pci/trace-events | 1 +
 2 files changed, 9 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 805e4b0c68..2e785e3aef 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -279,9 +279,13 @@ static void pci_change_irq_level(PCIDevice *pci_dev, int irq_num, int change)
 {
     PCIBus *bus;
     for (;;) {
+        int dev_irq = irq_num;
         bus = pci_get_bus(pci_dev);
         assert(bus->map_irq);
         irq_num = bus->map_irq(pci_dev, irq_num);
+        trace_pci_route_irq(dev_irq, DEVICE(pci_dev)->canonical_path, irq_num,
+                            pci_bus_is_root(bus) ? "root-complex"
+                                    : DEVICE(bus->parent_dev)->canonical_path);
         if (bus->set_irq)
             break;
         pci_dev = bus->parent_dev;
@@ -1600,8 +1604,12 @@ PCIINTxRoute pci_device_route_intx_to_irq(PCIDevice *dev, int pin)
     PCIBus *bus;
 
     do {
+        int dev_irq = pin;
         bus = pci_get_bus(dev);
         pin = bus->map_irq(dev, pin);
+        trace_pci_route_irq(dev_irq, DEVICE(dev)->canonical_path, pin,
+                            pci_bus_is_root(bus) ? "root-complex"
+                                    : DEVICE(bus->parent_dev)->canonical_path);
         dev = bus->parent_dev;
     } while (dev);
 
diff --git a/hw/pci/trace-events b/hw/pci/trace-events
index aaf46bc92d..42430869ce 100644
--- a/hw/pci/trace-events
+++ b/hw/pci/trace-events
@@ -3,6 +3,7 @@
 # pci.c
 pci_update_mappings_del(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "%s %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
 pci_update_mappings_add(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "%s %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
+pci_route_irq(int dev_irq, const char *dev_path, int parent_irq, const char *parent_path) "IRQ %d @%s -> IRQ %d @%s"
 
 # pci_host.c
 pci_cfg_read(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, unsigned offs, unsigned val) "%s %02x:%02x.%x @0x%x -> 0x%x"
-- 
2.38.1


