Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CFE61DCA7
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:46:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMpQ-0007uD-Lf; Sat, 05 Nov 2022 13:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMmt-0006fQ-HF
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:16:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMms-0007Os-3p
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:16:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z6k8eWzaJQHXE4F1qrV9ZYoibJr1f+k/dRgNKPeQVhg=;
 b=QKeKK3mU2qjDpV9y2rQWsZEgwb72cPd3MAjrbr0l1RfppDkGjW5PT4ziTVySZsuDGyFK8G
 rRH6CFv/R0D47p4mF2Zw0yT8+Sn7WVK7Tpegw4M2Cp0RXcy/MtHg6Eu7cAT0pvrsX52uAK
 pSQJQiS8LYBvRJakIW1wfFdTBAJq6Cs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-458-16dEvV1VMc-1WnsppQIcig-1; Sat, 05 Nov 2022 13:16:51 -0400
X-MC-Unique: 16dEvV1VMc-1WnsppQIcig-1
Received: by mail-wm1-f70.google.com with SMTP id
 1-20020a05600c028100b003cf7833293cso6005637wmk.3
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z6k8eWzaJQHXE4F1qrV9ZYoibJr1f+k/dRgNKPeQVhg=;
 b=KGhUVFnCUGm3xj6rSyeqscBsxoUg6iodrzruvHTzDTQw0YX+xQGkLvcgPhTSJpXTEr
 k9qKfg3hbqSUkeBkNeleWSjDH5RQMJEg0tJtI/nARP9PZp0dOveMnb4/Fsqev+uVe2wB
 SbCsOz8tavKtJcBi1j99ihdti3PNmmSZtINckwofiH/gh6wP+Hss2yLtk8uKDpfDxdBj
 A0h8UFahtdfmtXLh9Brtq3jUv1RmMIxQ2HMJu2/B1Dr+c697gSooN+mvJzqKY/3oH7du
 ikk1w/kk12ZGuJVHpE0EIN26kYblilsnpFayErlixN0g3BiK5KrvW4VNpNcKzIJKPUSI
 8pzw==
X-Gm-Message-State: ACrzQf3tb74XUyworRTM165/JhXdvbYWPwGE6N8naRf5JJY8qNtmv/fR
 pO9FmyqD4jYJqNla2RvA5d0kDTCPDnc8vUN5DBUGkskss1EyrPZb9ALIvkvCoH0o9vmS51+SEx+
 H2qUuk/UPBVJr+q+kmzY9smrJjIJInvUIqDRf6Pf6sDwIb1S7/TbPvdm6Y4E2
X-Received: by 2002:a05:6000:1702:b0:236:cdc7:c130 with SMTP id
 n2-20020a056000170200b00236cdc7c130mr20940675wrc.253.1667668610038; 
 Sat, 05 Nov 2022 10:16:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM49teyk9zOVEDF+zcOGlmomf4lufoZY0mb9F/++nJ8Krrd0DTzfRGsV4+tMo7gi9bY7wtl8tg==
X-Received: by 2002:a05:6000:1702:b0:236:cdc7:c130 with SMTP id
 n2-20020a056000170200b00236cdc7c130mr20940666wrc.253.1667668609744; 
 Sat, 05 Nov 2022 10:16:49 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 j13-20020a05600c190d00b003b47e8a5d22sm7159610wmq.23.2022.11.05.10.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:16:49 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:16:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL v3 27/81] hw/mem/cxl-type3: Add MSIX support
Message-ID: <20221105171116.432921-28-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

This will be used by several upcoming patch sets so break it out
such that it doesn't matter which one lands first.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20221014151045.24781-3-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/mem/cxl_type3.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index a71bf1afeb..568c9d62f5 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -13,6 +13,7 @@
 #include "qemu/rcu.h"
 #include "sysemu/hostmem.h"
 #include "hw/cxl/cxl.h"
+#include "hw/pci/msix.h"
 
 /*
  * Null value of all Fs suggested by IEEE RA guidelines for use of
@@ -146,6 +147,8 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     ComponentRegisters *regs = &cxl_cstate->crb;
     MemoryRegion *mr = &regs->component_registers;
     uint8_t *pci_conf = pci_dev->config;
+    unsigned short msix_num = 1;
+    int i;
 
     if (!cxl_setup_memory(ct3d, errp)) {
         return;
@@ -180,6 +183,12 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
                      PCI_BASE_ADDRESS_SPACE_MEMORY |
                          PCI_BASE_ADDRESS_MEM_TYPE_64,
                      &ct3d->cxl_dstate.device_registers);
+
+    /* MSI(-X) Initailization */
+    msix_init_exclusive_bar(pci_dev, msix_num, 4, NULL);
+    for (i = 0; i < msix_num; i++) {
+        msix_vector_use(pci_dev, i);
+    }
 }
 
 static void ct3_exit(PCIDevice *pci_dev)
-- 
MST


