Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512512D32CC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:50:22 +0100 (CET)
Received: from localhost ([::1]:60644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmj09-0001cy-Bi
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:50:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmika-000521-BO
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:34:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmikY-0004nE-8E
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:34:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aC7Cd6TYlILALJJv5OMkXJYmgQWD2IPIt7fFj22zuwI=;
 b=YbvXTbtFBVE+fTRH31zIwORxM87g4oFORSIy12vGXXFH37OaFzqbtDcmea37pQ7Y7Z5Rzw
 VEA+Rq/yaHwXUBdI/zsudN7pEjxmtIpc0b4EYxHDghckkbx06N8k0fRkhxuPHFFtruxo+s
 NkYrjCmTgdeK5RNThLKDiB/xMAsonyE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-XUeoZOlUOxiclB0kmDNSQA-1; Tue, 08 Dec 2020 14:34:11 -0500
X-MC-Unique: XUeoZOlUOxiclB0kmDNSQA-1
Received: by mail-wr1-f71.google.com with SMTP id b8so168275wrv.14
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:34:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aC7Cd6TYlILALJJv5OMkXJYmgQWD2IPIt7fFj22zuwI=;
 b=HoVxhId3dxakEeMEhQ8956UxmhA3xksDZItnGbiKq1gSnwvju4T/5u1Xv/PzBS3bye
 1lN0Wgqx0/cNuVjKPK7izmE14pURtKkKWl10XTWMtcuQSd0UBW/2FX1Ldnbmw0bfh1IN
 JyuWDBm07bPmRGjtahiE7mBuimqGOdjoHQW+gZzQZ8M8nT0uA5ncXKbcXPPHmKLeQcUJ
 xs9FPYtbHdS8rgfvbJLpUl+P6w2muC41ck/dL5QYxTslNG5tuDCFm0oDO7iV7fpFhO3l
 +2/BVZ376ya11jfEyw2+HISQK6PaXJT7+KCReHZsxCV8hRuKjHGRIr2Fear0pkPeNJi3
 PTUg==
X-Gm-Message-State: AOAM531Fi0wtdZFGkVEvstOwatrTR7zVzKplUH0NXIRxH0m5ivPP6Jnh
 GJtDJ5S6wx+ODKpzHf8z9zPX7oacWSC12Bf8xUokkpqrt79mXtPMa2ojW/5QtARfGWn3OHVRohq
 peWy3PcmSxglJWep7qHqyH7cPEkCOuLAveGuyiuCLCmy0/NrQo3kXvelAVk6J
X-Received: by 2002:a5d:4242:: with SMTP id s2mr18182188wrr.187.1607456050291; 
 Tue, 08 Dec 2020 11:34:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKWSf5jl2S5s+Ef2KaxVbGTWXTmq1ATNdZuPx2h4e6O1vDcF3sPVW+tYTLAMhwOnnvY0mj7w==
X-Received: by 2002:a5d:4242:: with SMTP id s2mr18182162wrr.187.1607456050070; 
 Tue, 08 Dec 2020 11:34:10 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id m4sm5057108wmi.41.2020.12.08.11.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:34:09 -0800 (PST)
Date: Tue, 8 Dec 2020 14:34:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/66] fw_cfg: Refactor extra pci roots addition
Message-ID: <20201208193307.646726-10-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jiahui Cen <cenjiahui@huawei.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yubo Miao <miaoyubo@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiahui Cen <cenjiahui@huawei.com>

Extract extra pci roots addition from pc machine, which could be used by
other machines.

In order to make uefi get the extra roots, it is necessary to write extra
roots into fw_cfg. And only if the uefi knows there are extra roots,
the config spaces of devices behind the root could be obtained.

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Signed-off-by: Yubo Miao <miaoyubo@huawei.com>
Message-Id: <20201119014841.7298-3-cenjiahui@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/nvram/fw_cfg.h |  9 +++++++++
 hw/i386/pc.c              | 18 +-----------------
 hw/nvram/fw_cfg.c         | 23 +++++++++++++++++++++++
 3 files changed, 33 insertions(+), 17 deletions(-)

diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index 8a9f5738bf..0e7a8bc7af 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -308,6 +308,15 @@ void *fw_cfg_modify_file(FWCfgState *s, const char *filename, void *data,
 bool fw_cfg_add_from_generator(FWCfgState *s, const char *filename,
                                const char *gen_id, Error **errp);
 
+/**
+ * fw_cfg_add_extra_pci_roots:
+ * @bus: main pci root bus to be scanned from
+ * @s: fw_cfg device being modified
+ *
+ * Add a new fw_cfg item...
+ */
+void fw_cfg_add_extra_pci_roots(PCIBus *bus, FWCfgState *s);
+
 FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
                                 AddressSpace *dma_as);
 FWCfgState *fw_cfg_init_io(uint32_t iobase);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 17b514d1da..76a846ff9a 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -777,27 +777,11 @@ void pc_machine_done(Notifier *notifier, void *data)
     PCMachineState *pcms = container_of(notifier,
                                         PCMachineState, machine_done);
     X86MachineState *x86ms = X86_MACHINE(pcms);
-    PCIBus *bus = pcms->bus;
 
     /* set the number of CPUs */
     x86_rtc_set_cpus_count(x86ms->rtc, x86ms->boot_cpus);
 
-    if (bus) {
-        int extra_hosts = 0;
-
-        QLIST_FOREACH(bus, &bus->child, sibling) {
-            /* look for expander root buses */
-            if (pci_bus_is_root(bus)) {
-                extra_hosts++;
-            }
-        }
-        if (extra_hosts && x86ms->fw_cfg) {
-            uint64_t *val = g_malloc(sizeof(*val));
-            *val = cpu_to_le64(extra_hosts);
-            fw_cfg_add_file(x86ms->fw_cfg,
-                    "etc/extra-pci-roots", val, sizeof(*val));
-        }
-    }
+    fw_cfg_add_extra_pci_roots(pcms->bus, x86ms->fw_cfg);
 
     acpi_setup();
     if (x86ms->fw_cfg) {
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 08539a1aab..282ba93e2e 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -40,6 +40,7 @@
 #include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "hw/acpi/aml-build.h"
+#include "hw/pci/pci_bus.h"
 
 #define FW_CFG_FILE_SLOTS_DFLT 0x20
 
@@ -1061,6 +1062,28 @@ bool fw_cfg_add_from_generator(FWCfgState *s, const char *filename,
     return true;
 }
 
+void fw_cfg_add_extra_pci_roots(PCIBus *bus, FWCfgState *s)
+{
+    int extra_hosts = 0;
+
+    if (!bus) {
+        return;
+    }
+
+    QLIST_FOREACH(bus, &bus->child, sibling) {
+        /* look for expander root buses */
+        if (pci_bus_is_root(bus)) {
+            extra_hosts++;
+        }
+    }
+
+    if (extra_hosts && s) {
+        uint64_t *val = g_malloc(sizeof(*val));
+        *val = cpu_to_le64(extra_hosts);
+        fw_cfg_add_file(s, "etc/extra-pci-roots", val, sizeof(*val));
+    }
+}
+
 static void fw_cfg_machine_reset(void *opaque)
 {
     MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
-- 
MST


