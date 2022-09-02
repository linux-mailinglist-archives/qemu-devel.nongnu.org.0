Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1455AB7F0
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 20:07:48 +0200 (CEST)
Received: from localhost ([::1]:51060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUB51-0007VU-Kp
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 14:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oUAZe-0006AD-5w
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 13:35:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oUAZa-0007QT-Nx
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 13:35:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662140118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fk3F9oow0JLNj4MheLtLX2iFlt6wm4+Z+wXu7QWIBsQ=;
 b=Ecta8MyjB97H8NuwBiNTpNTn51TdDCOYODyDm2U6fgagKFp2RF6TjhnVPKtsBxb4uG7EhZ
 EVRSDu5u/Om1k6MnCy7yLpLlkssOHfyqeKjrvXdTMIBOb6vLQIV4uMZYDNqzLgAXD0D1Wn
 Crggh7x1hri4j/3o1rjiACI2IfxIuJY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-TYiUhEr5N_ubu3zYx2I4ig-1; Fri, 02 Sep 2022 13:35:17 -0400
X-MC-Unique: TYiUhEr5N_ubu3zYx2I4ig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B691785A585;
 Fri,  2 Sep 2022 17:35:16 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CD2CC15BB3;
 Fri,  2 Sep 2022 17:35:14 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH 8/8] tests: Make all tests that depend on I440FX state that
Date: Fri,  2 Sep 2022 19:34:52 +0200
Message-Id: <20220902173452.1904-9-quintela@redhat.com>
In-Reply-To: <20220902173452.1904-1-quintela@redhat.com>
References: <20220902173452.1904-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

All the tests that I have put in qtests_i386_require_default
work with either "pc" or "q35".

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/qtest/meson.build | 67 +++++++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 32 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 6f17d901ba..11bf970400 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -35,34 +35,48 @@ endif
 qtests_cxl = \
   (config_all_devices.has_key('CONFIG_CXL') ? ['cxl-test'] : [])
 
+qtests_i386_require_default = \
+  (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : []) +		    \
+  (config_host.has_key('CONFIG_POSIX') and
+   config_all_devices.has_key('CONFIG_ACPI_ERST') ? ['erst-test'] : []) +		    \
+  (config_all_devices.has_key('CONFIG_SDHCI_PCI') ? ['fuzz-sdcard-test'] : []) +	    \
+  (config_host.has_key('CONFIG_LINUX') and
+   config_all_devices.has_key('CONFIG_ISA_IPMI_BT') ? ['ipmi-bt-test'] : []) +		    \
+  (config_all_devices.has_key('CONFIG_ISA_IPMI_KCS') ? ['ipmi-kcs-test'] : []) +	    \
+  (config_all_devices.has_key('CONFIG_PVPANIC_ISA') ? ['pvpanic-test'] : []) + 		    \
+  (config_all_devices.has_key('CONFIG_PVPANIC_PCI') ? ['pvpanic-pci-test'] : []) +	    \
+  (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +	 	    \
+  (config_all_devices.has_key('CONFIG_WDT_IB700') ? ['wdt_ib700-test'] : []) +              \
+  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +			    \
+  (config_all_devices.has_key('CONFIG_USB_UHCI') ? ['usb-hcd-uhci-test'] : []) +	    \
+  (config_all_devices.has_key('CONFIG_USB_XHCI_NEC') ? ['usb-hcd-xhci-test'] : []) +	    \
+  ['boot-order-test',
+   'fw_cfg-test',
+   'migration-test',
+   'numa-test',
+   'rtc-test',
+   'test-filter-redirector',
+   'test-x86-cpuid-compat',
+   'vmgenid-test'
+  ]
+
 qtests_i386 = \
   (slirp.found() ? ['pxe-test', 'test-netfilter'] : []) +             \
-  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +                     \
   (have_tools ? ['ahci-test'] : []) +                                                       \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +           \
   (config_all_devices.has_key('CONFIG_SGA') ? ['boot-serial-test'] : []) +                  \
-  (config_all_devices.has_key('CONFIG_ISA_IPMI_KCS') ? ['ipmi-kcs-test'] : []) +            \
-  (config_host.has_key('CONFIG_LINUX') and                                                  \
-   config_all_devices.has_key('CONFIG_ISA_IPMI_BT') ? ['ipmi-bt-test'] : []) +              \
-  (config_all_devices.has_key('CONFIG_WDT_IB700') ? ['wdt_ib700-test'] : []) +              \
-  (config_all_devices.has_key('CONFIG_PVPANIC_ISA') ? ['pvpanic-test'] : []) +              \
-  (config_all_devices.has_key('CONFIG_PVPANIC_PCI') ? ['pvpanic-pci-test'] : []) +          \
   (config_all_devices.has_key('CONFIG_HDA') ? ['intel-hda-test'] : []) +		    \
   (config_all_devices.has_key('CONFIG_I82801B11') ? ['i82801b11-test'] : []) +             \
   (config_all_devices.has_key('CONFIG_IOH3420') ? ['ioh3420-test'] : []) +                  \
   (config_all_devices.has_key('CONFIG_LPC_ICH9') and
    config_all_devices.has_key('CONFIG_Q35') ? ['lpc-ich9-test'] : []) +			    \
-  (config_all_devices.has_key('CONFIG_USB_UHCI') and
-   config_all_devices.has_key('CONFIG_Q35') ? ['usb-hcd-uhci-test'] : []) +		    \
   (config_all_devices.has_key('CONFIG_USB_UHCI') and                                        \
    config_all_devices.has_key('CONFIG_USB_EHCI') and
    config_all_devices.has_key('CONFIG_Q35') ? ['usb-hcd-ehci-test'] : []) +		    \
-  (config_all_devices.has_key('CONFIG_USB_XHCI_NEC') ? ['usb-hcd-xhci-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_TPM_CRB') ? ['tpm-crb-test'] : []) +                  \
   (config_all_devices.has_key('CONFIG_TPM_CRB') ? ['tpm-crb-swtpm-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-swtpm-test'] : []) +        \
-  (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
   (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') and
    config_all_devices.has_key('CONFIG_Q35') ? ['fuzz-megasas-test'] : []) +    \
@@ -72,36 +86,25 @@ qtests_i386 = \
    config_all_devices.has_key('CONFIG_Q35') ? ['fuzz-virtio-scsi-test'] : []) +		    \
   (config_all_devices.has_key('CONFIG_SB16') and
    config_all_devices.has_key('CONFIG_Q35') ? ['fuzz-sb16-test'] : []) +		    \
-  (config_all_devices.has_key('CONFIG_SDHCI_PCI') ? ['fuzz-sdcard-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
-  (config_host.has_key('CONFIG_POSIX') and                                                  \
-   config_all_devices.has_key('CONFIG_ACPI_ERST') ? ['erst-test'] : []) +                   \
   (config_all_devices.has_key('CONFIG_VIRTIO_NET') and                                      \
    config_all_devices.has_key('CONFIG_Q35') and                                             \
    config_all_devices.has_key('CONFIG_VIRTIO_PCI') and                                      \
    slirp.found() ? ['virtio-net-failover'] : []) +                                          \
-  (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : []) +		    \
-  (config_all_devices.has_key('CONFIG_IVSHMEM_DEVICE') ? ['ivshmem-test'] : []) +	    \
+  (config_all_devices.has_key('CONFIG_IVSHMEM_DEVICE') and
+   config_all_devices.has_key('CONFIG_I440FX') ? ['ivshmem-test'] : []) +		    \
   (config_all_devices.has_key('CONFIG_Q35') ? ['q35-test'] : []) +			    \
   (config_all_devices.has_key('CONFIG_Q35') ? ['tco-test'] : []) +			    \
+  (config_all_devices.has_key('CONFIG_I440FX') ? ['device-plug-test'] : []) +		    \
+  (config_all_devices.has_key('CONFIG_I440FX') ? ['drive_del-test'] : []) +		    \
+  (config_all_devices.has_key('CONFIG_I440FX') ? ['fdc-test'] : []) +			    \
+  (config_all_devices.has_key('CONFIG_I440FX') ? ['hd-geo-test'] : []) +		    \
+  (config_all_devices.has_key('CONFIG_I440FX') ? ['i440fx-test'] : []) +		    \
+  (config_all_devices.has_key('CONFIG_I440FX') ? ['ide-test'] : []) +  			    \
   (unpack_edk2_blobs ? ['bios-tables-test'] : []) +                                         \
+  (config_all_devices.has_key('CONFIG_I440FX') ? qtests_i386_require_default: []) +	    \
   qtests_cxl +                                                                              \
-  ['fdc-test',
-   'ide-test',
-   'hd-geo-test',
-   'boot-order-test',
-   'rtc-test',
-   'i440fx-test',
-   'fw_cfg-test',
-   'device-plug-test',
-   'drive_del-test',
-   'cpu-plug-test',
-   'vmgenid-test',
-   'migration-test',
-   'test-x86-cpuid-compat',
-   'numa-test',
-   'test-filter-redirector'
-  ]
+  ['cpu-plug-test']
 
 if dbus_display
   qtests_i386 += ['dbus-display-test']
-- 
2.37.2


