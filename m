Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD22620296
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 23:49:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAvu-00081S-9f; Mon, 07 Nov 2022 17:49:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAvs-0007xV-Bb
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:49:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAvq-00039i-Ty
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:49:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z6k8eWzaJQHXE4F1qrV9ZYoibJr1f+k/dRgNKPeQVhg=;
 b=a9mNWPz2JcYSmdRun1ei7GyM6AOM5N+hM0hQrzwpBWaXpfrpFLmCUNAkxqiF81KM5z0e5M
 1SS+X9WMSQ22HTBj+NKxr0XYLc9tFIDIeimaZCazc7o7XYYMRiRXljk5zW1zUssbjn8sbM
 hwQidTi+pGJ6zGgKFZvnpdMXtZwnG2k=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-669-TtFuH4sUM2GAXioo49I00A-1; Mon, 07 Nov 2022 17:49:29 -0500
X-MC-Unique: TtFuH4sUM2GAXioo49I00A-1
Received: by mail-qt1-f199.google.com with SMTP id
 g3-20020ac84b63000000b003a529c62a92so9213006qts.23
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:49:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z6k8eWzaJQHXE4F1qrV9ZYoibJr1f+k/dRgNKPeQVhg=;
 b=iiwhonlrT1tcY0ifWVb2tK59tU1MiLFpjELTggqrMbEcgo6U9azL85rbKxxO+BdVcD
 uFna3SbigCwVd7v7fXU9HGO8ZjvfsGlPCxTn/q1fedd589cXI2WAQhn+oMUL9NQQuR0l
 ag7tOAwfpDDyCP3RRuJyfSFgRIjRf7Hj8OPHpMHWCgxPFpW1jLd0vgAKzutYi42ipgX/
 98ejMJ9k155tFLtyCeQjCDrBHLj+Z5vSdOtCkRhYbDAbOmW1IW9c86vpF8A/mD9BjGT8
 FOCQH3UKiv9jbq3RIUuY7L7/x75VaoV21fMa8BGPGeYhW9VsHNCc8oQIu1wdHeAhK4Zm
 mYFw==
X-Gm-Message-State: ACrzQf2chJcS+fOAvWF8KRSq7R8rVbatoArqu7yy0DVqQkguWURrq4KM
 SsHNdSRDmFLUlsT3HMUdKPpELw3Knyo/XqxrKCsBzhkivrClah6uVHqhkOJztqW4EMmvrxIksKw
 tnH4zU+3G9hyPgkHNreznZfInYVsafEW7Q31P3iGaxieEfbv63HGPDtMiNtnH
X-Received: by 2002:a05:622a:1389:b0:3a5:8195:26a9 with SMTP id
 o9-20020a05622a138900b003a5819526a9mr9405565qtk.346.1667861368744; 
 Mon, 07 Nov 2022 14:49:28 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7gwoB6bgVi6st6AAVQZHkTT6mTXpNn5cbb81QKpgL4yTasq6FSKL36YKx/jz9Jmd8Qnfo6RA==
X-Received: by 2002:a05:622a:1389:b0:3a5:8195:26a9 with SMTP id
 o9-20020a05622a138900b003a5819526a9mr9405548qtk.346.1667861368463; 
 Mon, 07 Nov 2022 14:49:28 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 u17-20020a05622a011100b003a598fcddefsm1520148qtw.87.2022.11.07.14.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:49:28 -0800 (PST)
Date: Mon, 7 Nov 2022 17:49:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL v4 22/83] hw/mem/cxl-type3: Add MSIX support
Message-ID: <20221107224600.934080-23-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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


