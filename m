Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4A261373A
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:59:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUHt-0007Tq-Em; Mon, 31 Oct 2022 08:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHH-0003Js-9H
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUGy-0002Zq-H4
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z6k8eWzaJQHXE4F1qrV9ZYoibJr1f+k/dRgNKPeQVhg=;
 b=By2Yj0i8J7GgzzyneR9lOD6guBhbtNIyGq82DFG5+kBjtl8228Me/ICy0vP6sz8AiBuVVS
 V+iUnkeA+FGcB7QoSjBTUEvkgOy2WjxZfW5ctyMqjBAltbhLmNR0GFSnUqyOL1CLlE+D0u
 +sEwn+qxjkqsXQGJI+lQZ6KB6boXcI4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-38-_TWURQDVPLGWJ9QHNF85fA-1; Mon, 31 Oct 2022 08:52:07 -0400
X-MC-Unique: _TWURQDVPLGWJ9QHNF85fA-1
Received: by mail-wr1-f71.google.com with SMTP id
 g4-20020adfbc84000000b0022fc417f87cso3040770wrh.12
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:52:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z6k8eWzaJQHXE4F1qrV9ZYoibJr1f+k/dRgNKPeQVhg=;
 b=sRqC+BBomzBmurzEc0Vrn4LRc7zDPWVwH4a51j5oT8FdVc4TrcZKOEiWVpFC03NpRS
 Yb7zLhg+l7DASi+CrUpRNG+tR+20+LhVDbgquVoqxa8InYTHR3DXD09T02GDF8ut5gR1
 DkaVmebqysGslKOHdJSpRjvvsUfYUyPlJABVbxJXUyrMYvSNMFPX/u5Qimg2QbR68GU9
 MozsrA7P8+5QbrCLQ6UPdnptd0mpWhIKmudFMRjO7NZrznoFCMLEX6XEuDz8yMEhoMxW
 OTZ0wI2f8xQnHiZhM7J2A9y3ZfyQ/tI0Gh8XC+0WeP2WhTScCqWPx8IvBuqAyX1QddEk
 f61A==
X-Gm-Message-State: ACrzQf1d/dX4jYwfpAQbieAAsp14jUq9qeYCLnEWYFEU9jPqQ9hCqI51
 G7ma6NXWqn4lIUlnY7Dg5/EKVFAHrNJgcxZ51gWmiKznBbLuQoAoFpXtnozrIz4i9hfZymDB4vn
 gpMudC00hEoPcuORH3icKUaGlI0fu5GAM5HHcfThC075Jfmxh0GoCYNOVMo/n
X-Received: by 2002:a05:600c:35cf:b0:3c6:e957:b403 with SMTP id
 r15-20020a05600c35cf00b003c6e957b403mr18938582wmq.162.1667220726072; 
 Mon, 31 Oct 2022 05:52:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6varnUyn4I1IlG1+qQd9LuoiXRVKxsISeZlXMQ/J+Mjf8gub7hjZ7Rt5SYPQ7hUWnGA3na4g==
X-Received: by 2002:a05:600c:35cf:b0:3c6:e957:b403 with SMTP id
 r15-20020a05600c35cf00b003c6e957b403mr18938567wmq.162.1667220725812; 
 Mon, 31 Oct 2022 05:52:05 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 b9-20020a5d45c9000000b0022e36c1113fsm6837141wrs.13.2022.10.31.05.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:52:05 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:52:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL 28/86] hw/mem/cxl-type3: Add MSIX support
Message-ID: <20221031124928.128475-29-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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


