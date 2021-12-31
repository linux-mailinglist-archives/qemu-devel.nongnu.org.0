Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94591482125
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 02:05:36 +0100 (CET)
Received: from localhost ([::1]:42202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n36MR-0007HW-DX
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 20:05:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36Dr-0001oQ-5b
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:56:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36Dp-0003Z6-K1
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:56:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640912201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z4OtSfjPggV0SCf5NnhwjZXBrLozwaJfQy6f5j8NafY=;
 b=Zrgp9t7Ji4j/XlIFuvIjgx7oSBRuOexH4pEL8JarUbod4t8PIbOFjg70AhCouG8uQUMnzb
 34ztmAaZwOEKAoX7cC9qWDR3nEY6en0koOcXxW9Yc1BWViYj0XMlgUI5uESQGE7O1Ar0GM
 +o6cibtQyDTUJw7CR4nL+w3QLaBXiFw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-5udcILMZNXCw7V5rw9UFNA-1; Thu, 30 Dec 2021 19:56:38 -0500
X-MC-Unique: 5udcILMZNXCw7V5rw9UFNA-1
Received: by mail-ed1-f69.google.com with SMTP id
 s7-20020a056402520700b003f841380832so18008169edd.5
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 16:56:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z4OtSfjPggV0SCf5NnhwjZXBrLozwaJfQy6f5j8NafY=;
 b=STLK8b+NV60eL0RkhW/NWRs6zuMg3vOTf2YvvzFBt5uYI+s3zqi9WSfVYkKTvqeysZ
 mNxeevy0Eus81A6wxGqW0BgSObuM6hlidI8qf2vI3yizs+ehB1bDSebWx8/xdi01jG3d
 0FvH2WjYK+Rm0pkWseqNrxQmCjrlfHHPt9qsiFeLSnCoCJ5mqLiPO6MK4KGF6L2dGYvK
 mL0F3sRciM+ZFhifFzMvFK661xSAUsZ6UN8hz/xIvVHjc6heOOoYD59jgadEU6Uz2Y/i
 D+MDzOD8YpHlSH2qLFW2NaJYFjzVxRpkv2l7AWrdRr/gqu43v0vkdbgXeDGC+z+qxrXV
 iQaQ==
X-Gm-Message-State: AOAM532IwNp7WfIWD4nS+nphe9kgvnq7PauJWo2BsVALFFmOxddqHIxp
 byH1rZD4pQ/JKIglByv9Jv+XsqS1Y4XQsKA1K8UtoPeJcQzhdiUI3gH9ELkdqxonfK6qyyhIMGp
 VDWgysr+YSRAfUTxhk5OKojrfyA38W+zg2iIzSD6wz1Tt9z2ywRsdbHlSSOlnx34d
X-Received: by 2002:a17:906:e208:: with SMTP id
 gf8mr27494717ejb.11.1640912196545; 
 Thu, 30 Dec 2021 16:56:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzwm/MFkHrHxXFXDXVh5wiUwXrDGoQLkKEB2u+8BtoVlRyo3LVMmZr/dpH2brlpmEN/60DAQ==
X-Received: by 2002:a17:906:e208:: with SMTP id
 gf8mr27494699ejb.11.1640912196305; 
 Thu, 30 Dec 2021 16:56:36 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id u21sm10054371eds.8.2021.12.30.16.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 16:56:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/22] pci: Let pci_dma_rw() take MemTxAttrs argument
Date: Fri, 31 Dec 2021 01:55:34 +0100
Message-Id: <20211231005546.723396-11-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231005546.723396-1-philmd@redhat.com>
References: <20211231005546.723396-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let devices specify transaction attributes when calling pci_dma_rw().

Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211223115554.3155328-10-philmd@redhat.com>
---
 include/hw/pci/pci.h | 10 ++++++----
 hw/audio/intel-hda.c |  3 ++-
 hw/scsi/esp-pci.c    |  2 +-
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 1acefc2a4c3..a751ab5a75d 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -806,10 +806,10 @@ static inline AddressSpace *pci_get_address_space(PCIDevice *dev)
  */
 static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
                                      void *buf, dma_addr_t len,
-                                     DMADirection dir)
+                                     DMADirection dir, MemTxAttrs attrs)
 {
     return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
-                         dir, MEMTXATTRS_UNSPECIFIED);
+                         dir, attrs);
 }
 
 /**
@@ -827,7 +827,8 @@ static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
 static inline MemTxResult pci_dma_read(PCIDevice *dev, dma_addr_t addr,
                                        void *buf, dma_addr_t len)
 {
-    return pci_dma_rw(dev, addr, buf, len, DMA_DIRECTION_TO_DEVICE);
+    return pci_dma_rw(dev, addr, buf, len,
+                      DMA_DIRECTION_TO_DEVICE, MEMTXATTRS_UNSPECIFIED);
 }
 
 /**
@@ -845,7 +846,8 @@ static inline MemTxResult pci_dma_read(PCIDevice *dev, dma_addr_t addr,
 static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
                                         const void *buf, dma_addr_t len)
 {
-    return pci_dma_rw(dev, addr, (void *) buf, len, DMA_DIRECTION_FROM_DEVICE);
+    return pci_dma_rw(dev, addr, (void *) buf, len,
+                      DMA_DIRECTION_FROM_DEVICE, MEMTXATTRS_UNSPECIFIED);
 }
 
 #define PCI_DMA_DEFINE_LDST(_l, _s, _bits)                              \
diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index 8ce9df64e3e..fb3d34a4a0c 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -427,7 +427,8 @@ static bool intel_hda_xfer(HDACodecDevice *dev, uint32_t stnr, bool output,
         dprint(d, 3, "dma: entry %d, pos %d/%d, copy %d\n",
                st->be, st->bp, st->bpl[st->be].len, copy);
 
-        pci_dma_rw(&d->pci, st->bpl[st->be].addr + st->bp, buf, copy, !output);
+        pci_dma_rw(&d->pci, st->bpl[st->be].addr + st->bp, buf, copy, !output,
+                   MEMTXATTRS_UNSPECIFIED);
         st->lpib += copy;
         st->bp += copy;
         buf += copy;
diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
index dac054aeed4..1792f84cea6 100644
--- a/hw/scsi/esp-pci.c
+++ b/hw/scsi/esp-pci.c
@@ -280,7 +280,7 @@ static void esp_pci_dma_memory_rw(PCIESPState *pci, uint8_t *buf, int len,
         len = pci->dma_regs[DMA_WBC];
     }
 
-    pci_dma_rw(PCI_DEVICE(pci), addr, buf, len, dir);
+    pci_dma_rw(PCI_DEVICE(pci), addr, buf, len, dir, MEMTXATTRS_UNSPECIFIED);
 
     /* update status registers */
     pci->dma_regs[DMA_WBC] -= len;
-- 
2.33.1


