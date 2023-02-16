Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 841A5698D21
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 07:36:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSXid-0003t2-Dp; Thu, 16 Feb 2023 01:26:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+33d3adc5578b079b0cf9+7116+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pSXhp-0003FG-Nl
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:25:22 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+33d3adc5578b079b0cf9+7116+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pSXhe-0006uz-4g
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:25:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=sk6NkLHg/NyXpwaGLhpt9eKPrlQ9342qqQy1o7hZ17Y=; b=iSbI1bGw81vKG9dKLxS1D9sur6
 jQsHLLfylKbRaLZvzuvmaeyiLuYXoCdMSpZpsF84TMGqIB1QNc/t+iR9BUaMyF2EmrpPAMuy5HLB+
 iH/yHmN+cM267lcowtqjgoGAepHKTYAsrNBFXgHjzuIH001/VRjRK+jauUOt3rSOuBN0b0vmULvaj
 jDeQJvHTmgGbmwUyvdTvyMCVkjLbl9e7RnV3/R4zIxCL1cDvJNtSQEwElqWfEIauaOinQuJNRCHPz
 zGclXh78mMWovbHV/RY3TQo1DqtXjYQzuxGXCkqOthCGkUZm0o6b8taeXgMB14KwsqR/W8odpDkY4
 y6X3iaRg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pSXhG-0089x6-IF; Thu, 16 Feb 2023 06:24:47 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pSXhG-008w6J-1i; Thu, 16 Feb 2023 06:24:46 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [PATCH v11 07/59] xen-platform: exclude vfio-pci from the PCI
 platform unplug
Date: Thu, 16 Feb 2023 06:23:52 +0000
Message-Id: <20230216062444.2129371-8-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230216062444.2129371-1-dwmw2@infradead.org>
References: <20230216062444.2129371-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+33d3adc5578b079b0cf9+7116+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
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

From: Joao Martins <joao.m.martins@oracle.com>

Such that PCI passthrough devices work for Xen emulated guests.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/xen/xen_platform.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 66e6de31a6..d601a5509d 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -109,12 +109,25 @@ static void log_writeb(PCIXenPlatformState *s, char val)
 #define _UNPLUG_NVME_DISKS 3
 #define UNPLUG_NVME_DISKS (1u << _UNPLUG_NVME_DISKS)
 
+static bool pci_device_is_passthrough(PCIDevice *d)
+{
+    if (!strcmp(d->name, "xen-pci-passthrough")) {
+        return true;
+    }
+
+    if (xen_mode == XEN_EMULATE && !strcmp(d->name, "vfio-pci")) {
+        return true;
+    }
+
+    return false;
+}
+
 static void unplug_nic(PCIBus *b, PCIDevice *d, void *o)
 {
     /* We have to ignore passthrough devices */
     if (pci_get_word(d->config + PCI_CLASS_DEVICE) ==
             PCI_CLASS_NETWORK_ETHERNET
-            && strcmp(d->name, "xen-pci-passthrough") != 0) {
+            && !pci_device_is_passthrough(d)) {
         object_unparent(OBJECT(d));
     }
 }
@@ -187,9 +200,8 @@ static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
         !(flags & UNPLUG_IDE_SCSI_DISKS);
 
     /* We have to ignore passthrough devices */
-    if (!strcmp(d->name, "xen-pci-passthrough")) {
+    if (pci_device_is_passthrough(d))
         return;
-    }
 
     switch (pci_get_word(d->config + PCI_CLASS_DEVICE)) {
     case PCI_CLASS_STORAGE_IDE:
-- 
2.39.0


