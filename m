Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F075AB7FD
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 20:11:16 +0200 (CEST)
Received: from localhost ([::1]:45324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUB8I-0002PS-Dc
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 14:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oUAZb-00069n-03
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 13:35:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oUAZY-0007QA-R5
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 13:35:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662140113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6KgkJoHn/bSVIg2u3rluI46s0i80BGKXz+iBihoo/BM=;
 b=L+4PQdpqJOUCxFzeFhf2RC045FczhiP6LpzurjtThOxhysNhAfKIEkaXW05D2pSFHqLBrb
 R45kT0iCQR6WVhKuvqlXRgWuSlgq4S5pjGkllu8RiSfg9DTg4RruHpXLUt8N1lU/7IlOPc
 NCs3bXxR3fKdb7HANUkGEX1wBHSt/Wc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-bBYP_xOyPTmV9GzXVEHc5Q-1; Fri, 02 Sep 2022 13:35:12 -0400
X-MC-Unique: bBYP_xOyPTmV9GzXVEHc5Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD4551C0755D;
 Fri,  2 Sep 2022 17:35:11 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F196C15BB3;
 Fri,  2 Sep 2022 17:35:09 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH 6/8] tests: Make all tests that use q35 depend on it being
 compiled in
Date: Fri,  2 Sep 2022 19:34:50 +0200
Message-Id: <20220902173452.1904-7-quintela@redhat.com>
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/qtest/meson.build | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index e910cb32ca..67b3b678d3 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -51,13 +51,16 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_WDT_IB700') ? ['wdt_ib700-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_PVPANIC_ISA') ? ['pvpanic-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_PVPANIC_PCI') ? ['pvpanic-pci-test'] : []) +          \
-  (config_all_devices.has_key('CONFIG_HDA') ? ['intel-hda-test'] : []) +                    \
+  (config_all_devices.has_key('CONFIG_HDA') ? ['intel-hda-test'] : []) +		    \
   (config_all_devices.has_key('CONFIG_I82801B11') ? ['i82801b11-test'] : []) +             \
   (config_all_devices.has_key('CONFIG_IOH3420') ? ['ioh3420-test'] : []) +                  \
-  (config_all_devices.has_key('CONFIG_LPC_ICH9') ? ['lpc-ich9-test'] : []) +              \
-  (config_all_devices.has_key('CONFIG_USB_UHCI') ? ['usb-hcd-uhci-test'] : []) +            \
+  (config_all_devices.has_key('CONFIG_LPC_ICH9') and
+   config_all_devices.has_key('CONFIG_Q35') ? ['lpc-ich9-test'] : []) +			    \
+  (config_all_devices.has_key('CONFIG_USB_UHCI') and
+   config_all_devices.has_key('CONFIG_Q35') ? ['usb-hcd-uhci-test'] : []) +		    \
   (config_all_devices.has_key('CONFIG_USB_UHCI') and                                        \
-   config_all_devices.has_key('CONFIG_USB_EHCI') ? ['usb-hcd-ehci-test'] : []) +            \
+   config_all_devices.has_key('CONFIG_USB_EHCI') and
+   config_all_devices.has_key('CONFIG_Q35') ? ['usb-hcd-ehci-test'] : []) +		    \
   (config_all_devices.has_key('CONFIG_USB_XHCI_NEC') ? ['usb-hcd-xhci-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_TPM_CRB') ? ['tpm-crb-test'] : []) +                  \
   (config_all_devices.has_key('CONFIG_TPM_CRB') ? ['tpm-crb-swtpm-test'] : []) +            \
@@ -65,10 +68,14 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-swtpm-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
-  (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasas-test'] : []) +    \
-  (config_all_devices.has_key('CONFIG_LSI_SCSI_PCI') ? ['fuzz-lsi53c895a-test'] : []) +     \
-  (config_all_devices.has_key('CONFIG_VIRTIO_SCSI') ? ['fuzz-virtio-scsi-test'] : []) +     \
-  (config_all_devices.has_key('CONFIG_SB16') ? ['fuzz-sb16-test'] : []) +                   \
+  (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') and
+   config_all_devices.has_key('CONFIG_Q35') ? ['fuzz-megasas-test'] : []) +    \
+  (config_all_devices.has_key('CONFIG_LSI_SCSI_PCI') and
+   config_all_devices.has_key('CONFIG_Q35') ? ['fuzz-lsi53c895a-test'] : []) +		    \
+  (config_all_devices.has_key('CONFIG_VIRTIO_SCSI') and
+   config_all_devices.has_key('CONFIG_Q35') ? ['fuzz-virtio-scsi-test'] : []) +		    \
+  (config_all_devices.has_key('CONFIG_SB16') and
+   config_all_devices.has_key('CONFIG_Q35') ? ['fuzz-sb16-test'] : []) +		    \
   (config_all_devices.has_key('CONFIG_SDHCI_PCI') ? ['fuzz-sdcard-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
   (config_host.has_key('CONFIG_POSIX') and                                                  \
@@ -77,6 +84,8 @@ qtests_i386 = \
    config_all_devices.has_key('CONFIG_Q35') and                                             \
    config_all_devices.has_key('CONFIG_VIRTIO_PCI') and                                      \
    slirp.found() ? ['virtio-net-failover'] : []) +                                          \
+  (config_all_devices.has_key('CONFIG_Q35') ? ['q35-test'] : []) +			    \
+  (config_all_devices.has_key('CONFIG_Q35') ? ['tco-test'] : []) +			    \
   (unpack_edk2_blobs ? ['bios-tables-test'] : []) +                                         \
   qtests_pci +                                                                              \
   qtests_cxl +                                                                              \
@@ -89,9 +98,7 @@ qtests_i386 = \
    'fw_cfg-test',
    'device-plug-test',
    'drive_del-test',
-   'tco-test',
    'cpu-plug-test',
-   'q35-test',
    'vmgenid-test',
    'migration-test',
    'test-x86-cpuid-compat',
-- 
2.37.2


