Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9526A44F2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:44:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeYK-0001l1-Gk; Mon, 27 Feb 2023 09:32:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+6644499f1bfadfc93882+7127+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pWeVh-0005nN-N9
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:29:57 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+6644499f1bfadfc93882+7127+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pWeVX-0004Y6-Cs
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:29:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=sk6NkLHg/NyXpwaGLhpt9eKPrlQ9342qqQy1o7hZ17Y=; b=HisXS5BT9JqKjTz9ymxJ0uF2RX
 U+x8lXcAZ6E/NepRbd4Z/ypGEgLqd+MqxBCBvMbLHZpx2zWyk90rojL5GuwRO072jxjyqy5gtLaf5
 DyybL2hYT0Mwgqs+r5Y0AyqORKJFXtT3xHFW8Eii4eqRuXy4IchThD3enNdNffo4DD/y+8KY0f50z
 9N3kwN3o2bPz0r/nRovG9RacVZuU37ktLhHAjaoVlmsKzm3Fz331zkt69L+j7BEfW9s8Q0mN+6iRD
 ZigsLceYBXRTDRjD3qFAOkIEJCK4QJmXevFSBNNYF4Nj6F4m/djZBy7416oWdpV/RbU6I0goHQHk4
 8a6nTS/A==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pWeV5-00EFBe-0j; Mon, 27 Feb 2023 14:29:12 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pWeV5-0027AN-0L; Mon, 27 Feb 2023 14:29:11 +0000
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com
Subject: [PATCH v14 07/60] xen-platform: exclude vfio-pci from the PCI
 platform unplug
Date: Mon, 27 Feb 2023 14:28:15 +0000
Message-Id: <20230227142908.503517-8-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227142908.503517-1-dwmw2@infradead.org>
References: <20230227142908.503517-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+6644499f1bfadfc93882+7127+infradead.org+dwmw2@desiato.srs.infradead.org;
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


