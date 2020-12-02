Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BC52CB688
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:14:59 +0100 (CET)
Received: from localhost ([::1]:50086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNHu-0008BK-9M
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:14:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCA-0002Vq-RQ
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNC6-0003aQ-1M
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rTVoi29gC74acpeb2au0S7K7q6DLOyKwhDxRZ40SR7Q=;
 b=DpY2JzGPdTHWXeDV8uGXzT49N4brCfKbB3wDUJl4ZgMHZPOi4QGdtPn4bmlyClQr4khQ1e
 boWfQk00skxFk2M76bcWCdGuMU1MII2fGuatGf5LkPncaWSEFGnlC3vKEj5+C8h7G7fbTH
 /TE/KmKbiFCkVQH6mxfMFoKJYhbUT7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-JtaeM4p5Mh-YSd2U4mFl_Q-1; Wed, 02 Dec 2020 03:08:56 -0500
X-MC-Unique: JtaeM4p5Mh-YSd2U4mFl_Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1E0C185E486
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:54 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE7595D9C6
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:54 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 011/113] dma: Let dma_memory_write() propagate MemTxResult
Date: Wed,  2 Dec 2020 03:07:07 -0500
Message-Id: <20201202080849.4125477-12-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

dma_memory_rw_relaxed() returns a MemTxResult type.
Do not discard it, return it to the caller.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201023151923.3243652-8-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/sysemu/dma.h | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index df170047eb..a052f7bca3 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -96,8 +96,10 @@ static inline MemTxResult dma_memory_read_relaxed(AddressSpace *as,
     return dma_memory_rw_relaxed(as, addr, buf, len, DMA_DIRECTION_TO_DEVICE);
 }
 
-static inline int dma_memory_write_relaxed(AddressSpace *as, dma_addr_t addr,
-                                           const void *buf, dma_addr_t len)
+static inline MemTxResult dma_memory_write_relaxed(AddressSpace *as,
+                                                   dma_addr_t addr,
+                                                   const void *buf,
+                                                   dma_addr_t len)
 {
     return dma_memory_rw_relaxed(as, addr, (void *)buf, len,
                                  DMA_DIRECTION_FROM_DEVICE);
@@ -143,8 +145,20 @@ static inline MemTxResult dma_memory_read(AddressSpace *as, dma_addr_t addr,
     return dma_memory_rw(as, addr, buf, len, DMA_DIRECTION_TO_DEVICE);
 }
 
-static inline int dma_memory_write(AddressSpace *as, dma_addr_t addr,
-                                   const void *buf, dma_addr_t len)
+/**
+ * address_space_write: Write to address space from DMA controller.
+ *
+ * Return a MemTxResult indicating whether the operation succeeded
+ * or failed (eg unassigned memory, device rejected the transaction,
+ * IOMMU fault).
+ *
+ * @as: #AddressSpace to be accessed
+ * @addr: address within that address space
+ * @buf: buffer with the data transferred
+ * @len: the number of bytes to write
+ */
+static inline MemTxResult dma_memory_write(AddressSpace *as, dma_addr_t addr,
+                                           const void *buf, dma_addr_t len)
 {
     return dma_memory_rw(as, addr, (void *)buf, len,
                          DMA_DIRECTION_FROM_DEVICE);
-- 
2.26.2



