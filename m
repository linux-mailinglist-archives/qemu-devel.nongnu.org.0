Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 320AC61687A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:22:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGJI-0004Z5-OP; Wed, 02 Nov 2022 12:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJD-0004B4-Ct
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:09:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJB-0002UQ-WE
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:09:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z6k8eWzaJQHXE4F1qrV9ZYoibJr1f+k/dRgNKPeQVhg=;
 b=E2RZHUD0zivFnKOlGGnX28q8kv/QBcWDDsTI94DUH1Mf8x+xkvLNlQEoF3B0aygK0ZaDET
 HHD5RybfmjkdPYw0rElzPxQqYlZHa+/fK5ksEHXFaXx8rVFMbTGuy00a1ynog9Y8ce5qsk
 M5ahVcoAUOxsgwro79r3fXr78nYnY8Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-156-FI7IlyRcNoiFJ692v5YvFA-1; Wed, 02 Nov 2022 12:09:39 -0400
X-MC-Unique: FI7IlyRcNoiFJ692v5YvFA-1
Received: by mail-wr1-f70.google.com with SMTP id
 l16-20020adfc790000000b00230c2505f96so4977942wrg.4
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z6k8eWzaJQHXE4F1qrV9ZYoibJr1f+k/dRgNKPeQVhg=;
 b=gtQeBJ/dphmFBDkEdrn49TaiJqjTM0cnRhwXai3Bq/t9bFpYoAgaCDn8YRKZ/JSI+B
 rTSoeFzIH+1rHevNXXdo3anr+L6MNi0Jz6tpiSb1wD1PRlPxoqM5pOSZKcfYoYiiCRaR
 kMf7MhBDyYuijO/rMSzz4yL3iepTS1m582JrYc0fNAN1+3EWQEP4lvIspNqwgAJ0G+dM
 ZXR75JuFyH0d4xZURwg7NltWiSCVK76eQHaNJDIOExcUxD8bReneVzKE0KFmQn/qRp30
 jVeuosd/ZGgWchhF6iaFv5iM9JHl0GtZetwCNAS8M8vsfd4H2JWRCB3N9oNdFjS1+mUF
 NmSQ==
X-Gm-Message-State: ACrzQf0KQ18q2C72DWgnj5oVwDN3MvJiOkeLJgqKt5DxZgqzthbrwE0g
 FFKjVJDz4a592k0xEYYMgKF+iec3f/yYpldhF+VaLbtTAA4rVUsq9s289lukciaNXiS6j2dEyTK
 OcAUGbLPj3d3NlmcelVEAPVBjTSdbYqbOuPoZkwa6Siu4biDjHVncvlLsmT4j
X-Received: by 2002:a05:600c:4fd2:b0:3c6:db8a:4d2a with SMTP id
 o18-20020a05600c4fd200b003c6db8a4d2amr15937494wmq.178.1667405377874; 
 Wed, 02 Nov 2022 09:09:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7GcprwA/61+h3h5ky2fFgVaU9REYzjKOKSmyogcgAAYI8p8W+lE5l4TiJSaDoNefcpOCLZLA==
X-Received: by 2002:a05:600c:4fd2:b0:3c6:db8a:4d2a with SMTP id
 o18-20020a05600c4fd200b003c6db8a4d2amr15937469wmq.178.1667405377620; 
 Wed, 02 Nov 2022 09:09:37 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 m29-20020a05600c3b1d00b003b47b913901sm2270824wms.1.2022.11.02.09.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:09:37 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:09:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL v2 27/82] hw/mem/cxl-type3: Add MSIX support
Message-ID: <20221102160336.616599-28-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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


