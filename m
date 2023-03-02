Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D716A8573
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 16:39:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXkxr-0004KV-V1; Thu, 02 Mar 2023 10:35:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9a0490e5ac528e462c30+7130+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pXkxQ-0003ty-Js
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 10:35:05 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9a0490e5ac528e462c30+7130+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pXkxN-0001gr-7T
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 10:35:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=T2ES46G+W4wfRtbGgYULh0xnoiw027E1Epehblpp/UU=; b=Q6PRP+Ok4Y/LWFg5GT2Lo6owKb
 6PzF3X/WY+wW19Qd6c5e2Ldj/TWoSmau5OeSFhd7wqiP14jiannTxtt4NsAXCNdD8DEQ2Q4vjt77f
 c1C7dV9Inqty2v6QOkHysCYsI8AoxZcPBSMIwPhZe13LBja6uDKcNlJpjq3lqQom9f29rGMQY5aBb
 aqwxKMzs4Z15CTvBJmfZWP9bJkeJecSW+v0Ou5CXvmaRMfdChC/4WPTs4/ZQDesOVK+L1NAezIqyO
 lCziKQDGt0ar2rUjdRS4MZstN/4FWKHH/BXG61f9T4ujzOCpzjHTD6q3SQMU89n8J8GEDM7cn6ePo
 I7hERoTw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pXkx5-00FL3u-0c; Thu, 02 Mar 2023 15:34:45 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXkx5-004uzz-0H; Thu, 02 Mar 2023 15:34:39 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Subject: [RFC PATCH v1 25/25] i386/xen: Initialize Xen backends from
 pc_basic_device_init() for emulation
Date: Thu,  2 Mar 2023 15:34:35 +0000
Message-Id: <20230302153435.1170111-26-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230302153435.1170111-1-dwmw2@infradead.org>
References: <20230302153435.1170111-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+9a0490e5ac528e462c30+7130+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: David Woodhouse <dwmw@amazon.co.uk>

Now that all the work is done to enable the PV backends to work without
actual Xen, instantiate the bus from pc_basic_device_init() for emulated
mode.

This allows us finally to launch an emulated Xen guest with PV disk.

   qemu-system-x86_64 -serial mon:stdio -M q35 -cpu host -display none \
     -m 1G -smp 2 -accel kvm,xen-version=0x4000a,kernel-irqchip=split \
     -kernel bzImage -append "console=ttyS0 root=/dev/xvda1" \
     -drive file=/var/lib/libvirt/images/fedora28.qcow2,if=none,id=disk \
     -device xen-disk,drive=disk,vdev=xvda

If we use -M pc instead of q35, we can even add an IDE disk and boot a
guest image normally through grub. But q35 gives us AHCI and that isn't
unplugged by the Xen magic, so the guests ends up seeing "both" disks.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/pc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index fd17ce7a94..3fe028c86c 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -102,6 +102,11 @@
 #include "trace.h"
 #include CONFIG_DEVICES
 
+#ifdef CONFIG_XEN_EMU
+#include "hw/xen/xen-legacy-backend.h"
+#include "hw/xen/xen-bus.h"
+#endif
+
 /*
  * Helper for setting model-id for CPU models that changed model-id
  * depending on QEMU versions up to QEMU 2.4.
@@ -1318,6 +1323,8 @@ void pc_basic_device_init(struct PCMachineState *pcms,
         if (pcms->bus) {
             pci_create_simple(pcms->bus, -1, "xen-platform");
         }
+        xen_bus_init();
+        xen_be_init();
     }
 #endif
 
-- 
2.39.0


