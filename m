Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE397290455
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 13:49:22 +0200 (CEST)
Received: from localhost ([::1]:39068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTOEb-0000I6-T9
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 07:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kTO9B-0002P2-52
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 07:43:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kTO99-0002F8-5B
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 07:43:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602848622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GemyLmzmoFkT3TaMBVYELboTpf28GueT5eyUcjiUWvU=;
 b=LbCOZO8FsAGmHvsoGWpS6xgFxY4tzDnmqKTKVWdGMylb86dSDDUWDN7QdHFwDUMYs1qH46
 YZm4YdqgHeIcXJTTIdWyoaaFXvRIRchoP/O1uTe3Mr5wBpxHLsWOkXWnpaPRWTceWGODSu
 Kv2n3rtUHiFDXzQpneaLZf2l4WGyWaE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-5eLp4XmTNQqSTkqP2g4JqA-1; Fri, 16 Oct 2020 07:43:40 -0400
X-MC-Unique: 5eLp4XmTNQqSTkqP2g4JqA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 862E1186DD39;
 Fri, 16 Oct 2020 11:43:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D67A5D9D5;
 Fri, 16 Oct 2020 11:43:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5B4911753B; Fri, 16 Oct 2020 13:43:28 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] microvm: make pcie irq base runtime configurable
Date: Fri, 16 Oct 2020 13:43:26 +0200
Message-Id: <20201016114328.18835-3-kraxel@redhat.com>
In-Reply-To: <20201016114328.18835-1-kraxel@redhat.com>
References: <20201016114328.18835-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/16 03:57:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/i386/microvm.h |  2 +-
 hw/i386/microvm.c         | 11 ++++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
index 0154ad5bd707..ede9625756b8 100644
--- a/include/hw/i386/microvm.h
+++ b/include/hw/i386/microvm.h
@@ -63,7 +63,6 @@
 #define PCIE_MMIO_SIZE        0x20000000
 #define PCIE_ECAM_BASE        0xe0000000
 #define PCIE_ECAM_SIZE        0x10000000
-#define PCIE_IRQ_BASE         12
 
 /* Machine type options */
 #define MICROVM_MACHINE_PIT                 "pit"
@@ -93,6 +92,7 @@ struct MicrovmMachineState {
     bool auto_kernel_cmdline;
 
     /* Machine state */
+    uint32_t pcie_irq_base;
     uint32_t virtio_irq_base;
     uint32_t virtio_num_transports;
     bool kernel_cmdline_fixed;
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index eaf5da31f7e1..638e95c39e8c 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -180,6 +180,7 @@ static void microvm_devices_init(MicrovmMachineState *mms)
     mms->virtio_irq_base = 5;
     mms->virtio_num_transports = 8;
     if (x86_machine_is_acpi_enabled(x86ms)) {
+        mms->pcie_irq_base = 12;
         mms->virtio_irq_base = 16;
     }
 
@@ -213,12 +214,12 @@ static void microvm_devices_init(MicrovmMachineState *mms)
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


