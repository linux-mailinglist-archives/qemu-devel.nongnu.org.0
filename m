Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DB4681B55
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:24:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMade-00042E-KU; Mon, 30 Jan 2023 15:20:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMad7-0002np-9C
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMad5-0006u4-FK
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675109990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KKRu7aE4HH84foy8wjGs6K2K20mXYm64Vub2yI3hbsU=;
 b=PHO/0G0ZiC6351NzPmxitK+O+0VfdxNrF1qgFBcoxpBLSUZu4YC6vNf74jiA3EU84c0WMG
 vI5pAsEP1/WIcZndb8hfiVPTL/x8AzArFcMOFNeFncMSu4eAy4dgdwcVKOPxIkOyJX97aa
 m5o6tIg2Sa6HQrbfLo+95TFegFO2olg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-35-r86bkvm_MVi3mDvAyufhFw-1; Mon, 30 Jan 2023 15:19:49 -0500
X-MC-Unique: r86bkvm_MVi3mDvAyufhFw-1
Received: by mail-ed1-f71.google.com with SMTP id
 f11-20020a056402354b00b0049e18f0076dso8880011edd.15
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:19:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KKRu7aE4HH84foy8wjGs6K2K20mXYm64Vub2yI3hbsU=;
 b=POn9z2VCMGcVCbPYk6hrZyckeTvQqWrlszPyyM8Qgm3F4Ik0xNI71qyzuxhcT81M95
 z0e1LF8fYpdOk3TgXkWqyP6O7tHToPOLQS3k55psxxOXuHHk5Wv71kZYDWCDoyrfREL5
 7olkAId9IgXUFZPSu981xFv2crfZEC4XVEgIE+PsNU05BgZ/W/f+jtytgLK0bGkQ2daC
 aqjoHflZdUHstMUpuWJ4KNLznc1ViUdpC1AUnavBLRQDk9tQMUALwQniF/zOgJ9G/x6h
 bpteSvU/pCGBhd72EMpG87JWVDvR2YFdicmde82IEDnY4nyu625WkMkra6ycfp6+Rgj6
 5iJQ==
X-Gm-Message-State: AFqh2kpuA8I46OE9HakF6XJ4q5epy3IdSMsH6rsriVtSTPciat8bNm3Q
 vpLHfyn24riu3jtgKP23gdAwurWiVxanqJ9Yxmzqq1ioRtJd3ealaoUAtMweLRGHWZ4aIfN7IWv
 vOyzDuXfmlfLEGJOGWI5g6gQPq1RvtTSlUPO39bKvwAzUoifUztGRpNALfcNB
X-Received: by 2002:a17:906:5214:b0:7c0:f2c5:ac3d with SMTP id
 g20-20020a170906521400b007c0f2c5ac3dmr49108820ejm.15.1675109988037; 
 Mon, 30 Jan 2023 12:19:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsb5p3SBwcb9z7JPXwQSClupppA1knS4A+I7XaVKySb68KOMZxyTKjmnX2qAycWmyem6f9sNQ==
X-Received: by 2002:a17:906:5214:b0:7c0:f2c5:ac3d with SMTP id
 g20-20020a170906521400b007c0f2c5ac3dmr49108801ejm.15.1675109987754; 
 Mon, 30 Jan 2023 12:19:47 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 t2-20020a170906948200b0087bdb44bbc0sm5598611ejx.32.2023.01.30.12.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:19:47 -0800 (PST)
Date: Mon, 30 Jan 2023 15:19:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 19/56] pci: acpi hotplug: rename x-native-hotplug to
 x-do-not-expose-native-hotplug-cap
Message-ID: <20230130201810.11518-20-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Igor Mammedov <imammedo@redhat.com>

When ACPI PCI hotplug for Q35 was introduced (6.1), it was implemented
by hiding HPC capability on PCIE slot. That however led to a number of
regressions and to fix it, it was decided to keep HPC cap exposed
in ACPI PCI hotplug case and force guest in ACPI PCI hotplug mode
by other means [1].

That reduced meaning of x-native-hotplug to a compat knob [2] for
broken 6.1 machine type.
Rename property to match its current purpose.

1) 211afe5c69 (hw/i386/acpi-build: Deny control on PCIe Native Hot-plug in _OSC)
2) c318bef762 (hw/acpi/ich9: Add compat prop to keep HPC bit set for 6.1 machine type)

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-10-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pcie_port.h         | 3 ++-
 hw/i386/pc_q35.c                   | 5 +++--
 hw/pci-bridge/gen_pcie_root_port.c | 7 ++++++-
 hw/pci/pcie.c                      | 6 +++---
 hw/pci/pcie_port.c                 | 3 ++-
 5 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
index fd484afb30..6c40e3733f 100644
--- a/include/hw/pci/pcie_port.h
+++ b/include/hw/pci/pcie_port.h
@@ -63,7 +63,8 @@ struct PCIESlot {
     /* Indicates whether any type of hot-plug is allowed on the slot */
     bool        hotplug;
 
-    bool        native_hotplug;
+    /* broken ACPI hotplug compat knob to preserve 6.1 ABI intact */
+    bool        hide_native_hotplug_cap;
 
     QLIST_ENTRY(PCIESlot) next;
 };
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 83c57c6eb1..66cd718b70 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -257,8 +257,9 @@ static void pc_q35_init(MachineState *machine)
                                                  NULL);
 
     if (!keep_pci_slot_hpc && acpi_pcihp) {
-        object_register_sugar_prop(TYPE_PCIE_SLOT, "x-native-hotplug",
-                                   "false", true);
+        object_register_sugar_prop(TYPE_PCIE_SLOT,
+                                   "x-do-not-expose-native-hotplug-cap",
+                                   "true", true);
     }
 
     /* irq lines */
diff --git a/hw/pci-bridge/gen_pcie_root_port.c b/hw/pci-bridge/gen_pcie_root_port.c
index 20099a8ae3..1ce4e7beba 100644
--- a/hw/pci-bridge/gen_pcie_root_port.c
+++ b/hw/pci-bridge/gen_pcie_root_port.c
@@ -87,7 +87,12 @@ static void gen_rp_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    if (grp->res_reserve.io == -1 && s->hotplug && !s->native_hotplug) {
+    /*
+     * reserving IO space led to worse issues in 6.1, when this hunk was
+     * introduced. (see commit: 211afe5c69b59). Keep this broken for 6.1
+     * machine type ABI compatibility only
+     */
+    if (s->hide_native_hotplug_cap && grp->res_reserve.io == -1 && s->hotplug) {
         grp->res_reserve.io = GEN_PCIE_ROOT_DEFAULT_IO_RANGE;
     }
     int rc = pci_bridge_qemu_reserve_cap_init(d, 0,
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 68a62da0b5..924fdabd15 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -611,11 +611,11 @@ void pcie_cap_slot_init(PCIDevice *dev, PCIESlot *s)
                                PCI_EXP_SLTCAP_ABP);
 
     /*
-     * Enable native hot-plug on all hot-plugged bridges unless
-     * hot-plug is disabled on the slot.
+     * Expose native hot-plug on all bridges if hot-plug is enabled on the slot.
+     * (unless broken 6.1 ABI is enforced for compat reasons)
      */
     if (s->hotplug &&
-        (s->native_hotplug || DEVICE(dev)->hotplugged)) {
+        (!s->hide_native_hotplug_cap || DEVICE(dev)->hotplugged)) {
         pci_long_test_and_set_mask(dev->config + pos + PCI_EXP_SLTCAP,
                                    PCI_EXP_SLTCAP_HPS |
                                    PCI_EXP_SLTCAP_HPC);
diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
index 687e4e763a..65a397ad23 100644
--- a/hw/pci/pcie_port.c
+++ b/hw/pci/pcie_port.c
@@ -173,7 +173,8 @@ static Property pcie_slot_props[] = {
     DEFINE_PROP_UINT8("chassis", PCIESlot, chassis, 0),
     DEFINE_PROP_UINT16("slot", PCIESlot, slot, 0),
     DEFINE_PROP_BOOL("hotplug", PCIESlot, hotplug, true),
-    DEFINE_PROP_BOOL("x-native-hotplug", PCIESlot, native_hotplug, true),
+    DEFINE_PROP_BOOL("x-do-not-expose-native-hotplug-cap", PCIESlot,
+                     hide_native_hotplug_cap, false),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
MST


