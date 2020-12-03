Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8452CD41A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 11:59:12 +0100 (CET)
Received: from localhost ([::1]:33096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmKN-0000GC-FT
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 05:59:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmGD-0003vL-7U
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:54:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmG7-00024l-Q2
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:54:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606992886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bwmOzLKC0Gy/bN6ebf4qyejQHRVbR8Lq2cMR8w17o28=;
 b=gGPRO7iRVUtPeDZsxMH2FFfn6BumQfh+z7Xm+iWdbYhgLio1fNobw529aZWq5f7D8gRmIs
 h/1YcrVcIg/YBXM1pdaTFHFFe/c6YcQxCCf/iMGZadWdQqOUF7JOT9FaFC5VO+R04BG0nS
 AvJgzyIjkrAvx/0fHoVvwYheQf63244=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-R-dT7-61NSKc5NJg8WxweQ-1; Thu, 03 Dec 2020 05:54:45 -0500
X-MC-Unique: R-dT7-61NSKc5NJg8WxweQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0369A1081B23;
 Thu,  3 Dec 2020 10:54:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2935910016F6;
 Thu,  3 Dec 2020 10:54:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 899469D9B; Thu,  3 Dec 2020 11:54:23 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/12] microvm: make pcie irq base runtime changeable
Date: Thu,  3 Dec 2020 11:54:16 +0100
Message-Id: <20201203105423.10431-6-kraxel@redhat.com>
In-Reply-To: <20201203105423.10431-1-kraxel@redhat.com>
References: <20201203105423.10431-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allows to move them in case we have enough
irq lines available.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/i386/microvm.h |  2 +-
 hw/i386/microvm.c         | 11 ++++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
index c5d60bacb5e8..f1e9db059b85 100644
--- a/include/hw/i386/microvm.h
+++ b/include/hw/i386/microvm.h
@@ -66,7 +66,6 @@
 #define PCIE_MMIO_SIZE        0x20000000
 #define PCIE_ECAM_BASE        0xe0000000
 #define PCIE_ECAM_SIZE        0x10000000
-#define PCIE_IRQ_BASE         12
 
 /* Machine type options */
 #define MICROVM_MACHINE_PIT                 "pit"
@@ -96,6 +95,7 @@ struct MicrovmMachineState {
     bool auto_kernel_cmdline;
 
     /* Machine state */
+    uint32_t pcie_irq_base;
     uint32_t virtio_irq_base;
     uint32_t virtio_num_transports;
     bool kernel_cmdline_fixed;
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index e92f236bf442..5e4182b47464 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -181,6 +181,7 @@ static void microvm_devices_init(MicrovmMachineState *mms)
     mms->virtio_irq_base = 5;
     mms->virtio_num_transports = 8;
     if (x86_machine_is_acpi_enabled(x86ms)) {
+        mms->pcie_irq_base = 12;
         mms->virtio_irq_base = 16;
     }
 
@@ -226,12 +227,12 @@ static void microvm_devices_init(MicrovmMachineState *mms)
         mms->gpex.mmio32.size = PCIE_MMIO_SIZE;
         mms->gpex.ecam.base   = PCIE_ECAM_BASE;
         mms->gpex.ecam.size   = PCIE_ECAM_SIZE;
-        mms->gpex.irq         = PCIE_IRQ_BASE;
+        mms->gpex.irq         = mms->pcie_irq_base;
         create_gpex(mms);
-        x86ms->pci_irq_mask = ((1 << (PCIE_IRQ_BASE + 0)) |
-                               (1 << (PCIE_IRQ_BASE + 1)) |
-                               (1 << (PCIE_IRQ_BASE + 2)) |
-                               (1 << (PCIE_IRQ_BASE + 3)));
+        x86ms->pci_irq_mask = ((1 << (mms->pcie_irq_base + 0)) |
+                               (1 << (mms->pcie_irq_base + 1)) |
+                               (1 << (mms->pcie_irq_base + 2)) |
+                               (1 << (mms->pcie_irq_base + 3)));
     } else {
         x86ms->pci_irq_mask = 0;
     }
-- 
2.27.0


