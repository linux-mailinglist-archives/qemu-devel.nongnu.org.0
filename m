Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D272CB699
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:18:39 +0100 (CET)
Received: from localhost ([::1]:33496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNLS-0004aA-67
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:18:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCB-0002YN-St
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNC6-0003av-Qb
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KnVKXazOKZtzkqfDSO0i8ILeR1uurigLABfT0Bf0yXU=;
 b=bxF0ZVxcI7VPp5thL/pSiWxRthzkWDQKZGvhA5zGjBG+ce8pbIgvozADNgEBnnziY5popU
 IaZAB2txh46YV8q1M9wsXh0UdGYqf1YOI6J3r2/exZ+f62bT/RrM424aVfx1eQginA+i8B
 vKojXomhDent49afAO6Asss7dnYdPDI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-DhMXokChNM6b353JeJsK5A-1; Wed, 02 Dec 2020 03:08:56 -0500
X-MC-Unique: DhMXokChNM6b353JeJsK5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B95D185E48D
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:55 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 680015D9C6
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:55 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 013/113] pci: Let pci_dma_read() propagate MemTxResult
Date: Wed,  2 Dec 2020 03:07:09 -0500
Message-Id: <20201202080849.4125477-14-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

pci_dma_rw() returns a MemTxResult type.
Do not discard it, return it to the caller.

Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201023151923.3243652-10-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/hw/pci/pci.h | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 37ffd73708..a2de236eeb 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -801,8 +801,20 @@ static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
     return dma_memory_rw(pci_get_address_space(dev), addr, buf, len, dir);
 }
 
-static inline int pci_dma_read(PCIDevice *dev, dma_addr_t addr,
-                               void *buf, dma_addr_t len)
+/**
+ * pci_dma_read: Read from an address space from PCI device.
+ *
+ * Return a MemTxResult indicating whether the operation succeeded
+ * or failed (eg unassigned memory, device rejected the transaction,
+ * IOMMU fault).  Called within RCU critical section.
+ *
+ * @dev: #PCIDevice doing the memory access
+ * @addr: address within the #PCIDevice address space
+ * @buf: buffer with the data transferred
+ * @len: length of the data transferred
+ */
+static inline MemTxResult pci_dma_read(PCIDevice *dev, dma_addr_t addr,
+                                       void *buf, dma_addr_t len)
 {
     return pci_dma_rw(dev, addr, buf, len, DMA_DIRECTION_TO_DEVICE);
 }
-- 
2.26.2



