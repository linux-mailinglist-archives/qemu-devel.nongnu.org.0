Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EBA642EEE
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:35:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2FKN-0007q5-O9; Mon, 05 Dec 2022 12:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p2FKJ-0007pP-76
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:23 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p2FJx-0007PR-Ni
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=WPvuygaYE8JgkCpxR+GLKqi5ff6Y7i9nhbClHdVbOG8=; b=DwDNkWWgZEw2KuwaSI4K8hEIRM
 TM6bUNy54Dv6r9NrEJqcD7ooFhU3nh/0LGR8TJun4xN4fM4b+aT0iRKTMBgx48dCmcdRX4lhaO+c6
 QHLNQmWqlx6DeBAYneXlp8GRHdmXO6MzQmJEKnQAwGByZTqZvf08utF63FQXCIVVyputdJrIxR4dE
 9y8pBzHf4JyDqR4oLYi7W5W6UfyvGgBt1rl5VYlvpVOAbuhv+0XKq3I0CxuhKcEYF3L5+gdSnZLJC
 daALhBVLoIcY88+CdISNSdyf2kzXIVUak7VH90c4iIf0LFXKLjzeDzj6Qi78n0qaJ8Atnet8fzkjB
 TXSFIKyw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p2FJo-007fzI-OX; Mon, 05 Dec 2022 17:31:52 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p2FJo-002YJo-Ft; Mon, 05 Dec 2022 17:31:52 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>
Subject: [RFC PATCH 04/21] xen-platform-pci: allow its creation with
 XEN_EMULATE mode
Date: Mon,  5 Dec 2022 17:31:20 +0000
Message-Id: <20221205173137.607044-5-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221205173137.607044-1-dwmw2@infradead.org>
References: <20221205173137.607044-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

The only thing we need to handle on KVM side is to change the
pfn from R/W to R/O.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/xen/xen_platform.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index a64265cca0..914619d140 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -271,7 +271,10 @@ static void platform_fixed_ioport_writeb(void *opaque, uint32_t addr, uint32_t v
     case 0: /* Platform flags */ {
         hvmmem_type_t mem_type = (val & PFFLAG_ROM_LOCK) ?
             HVMMEM_ram_ro : HVMMEM_ram_rw;
-        if (xen_set_mem_type(xen_domid, mem_type, 0xc0, 0x40)) {
+        if (xen_mode == XEN_EMULATE) {
+            /* XXX */
+            s->flags = val & PFFLAG_ROM_LOCK;
+        } else if (xen_set_mem_type(xen_domid, mem_type, 0xc0, 0x40)) {
             DPRINTF("unable to change ro/rw state of ROM memory area!\n");
         } else {
             s->flags = val & PFFLAG_ROM_LOCK;
@@ -496,12 +499,6 @@ static void xen_platform_realize(PCIDevice *dev, Error **errp)
     PCIXenPlatformState *d = XEN_PLATFORM(dev);
     uint8_t *pci_conf;
 
-    /* Device will crash on reset if xen is not initialized */
-    if (!xen_enabled()) {
-        error_setg(errp, "xen-platform device requires the Xen accelerator");
-        return;
-    }
-
     pci_conf = dev->config;
 
     pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_IO | PCI_COMMAND_MEMORY);
-- 
2.35.3


