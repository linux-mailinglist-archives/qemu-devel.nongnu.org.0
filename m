Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD246A7C9E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:28:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeHj-0007LY-0u; Thu, 02 Mar 2023 03:27:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeHF-0005hM-S1
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:27:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeHB-0002cl-KC
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9Oa6YLBxIoDgfjENvfUetPLFDxTwoQRGLPSXdNky5K8=;
 b=NcDIs0qvjxuYRf52o56w9hGTVgNQbokhgb9qfimwI9G920G2ANMdznXpRE7Tm5j2lSutBx
 uK0Kp71ubOG6M4lxec9kEBlf1MSYg0avM3V7ZAyzsQ2IAVIWQD6FL6BgsBXoxBHOd/wU+h
 43FEmsUYI2sPBkHdK6MedEv5N735nVc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-314-gYrAdg0lOXSNwEyz7jSvDA-1; Thu, 02 Mar 2023 03:26:55 -0500
X-MC-Unique: gYrAdg0lOXSNwEyz7jSvDA-1
Received: by mail-wm1-f71.google.com with SMTP id
 p22-20020a7bcc96000000b003e2036a1516so920879wma.7
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:26:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745614;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Oa6YLBxIoDgfjENvfUetPLFDxTwoQRGLPSXdNky5K8=;
 b=ebd4kCJ1zq81EGhs8mEkQ6fy7XVSAb6JGSDi0mj3OwvHIK43kpo1Wg1eTB409/W/Y1
 +d3gUmIvH8frjtA5yoCmSBTIPg+LlHiEuy31QWrBTh+Bml9Rj2zG9MR5EbxLii2b4Tm7
 WSoYQd1CPs0T44jsIdW19Z8JhXXfM3YwPhFLanCxcFrED/KU8VwVPDsZrYwY93r9muv+
 wmZz9VP6uVHA4N/YfK3+D1SNWJvU/TK5Pmnolebt18XeLlqnqLOQjZDGmaxSsY1kzmOt
 sejHfMO2pNfHi0CIxeLbRHdHbNU5Y2pHGRoUiA/ju2gL0xFQKji3ddbcQr6To2opSGtx
 rDyA==
X-Gm-Message-State: AO0yUKVztAr7Jmhmgm4uIFZ7U5Wu2rDoEPVnCCi7flh3ewS8mnTHFim3
 Wx2JU165GpPqcGIE53MhA/TABLQSYS6uFtMDWhgwpu15psPDQ0QA6qrnMmx45LX5rLelAI/GlnH
 QLXCqlnRi9VSqEnGU6qRV4dgDk6ieZ8lm8MZ8SviMI3Ac1B/YgRuBgZ8DZBG/I943Cg==
X-Received: by 2002:a05:600c:45d3:b0:3ea:f883:5ac with SMTP id
 s19-20020a05600c45d300b003eaf88305acmr6889191wmo.5.1677745614175; 
 Thu, 02 Mar 2023 00:26:54 -0800 (PST)
X-Google-Smtp-Source: AK7set8TXpwQkoQrmiuWHa+5xCUJ2f3q7lFN2DlYCU8Z93Omodb4E3iDozBY14FqHM214+7ny+qQYw==
X-Received: by 2002:a05:600c:45d3:b0:3ea:f883:5ac with SMTP id
 s19-20020a05600c45d300b003eaf88305acmr6889169wmo.5.1677745613830; 
 Thu, 02 Mar 2023 00:26:53 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 f20-20020a7bc8d4000000b003db03725e86sm2082330wml.8.2023.03.02.00.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:26:53 -0800 (PST)
Date: Thu, 2 Mar 2023 03:26:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gregory Price <gourry.memverge@gmail.com>,
 Davidlohr Bueso <dave@stgolabs.net>, Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gregory.price@memverge.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Fan Ni <fan.ni@samsung.com>, Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL 45/53] hw/cxl: set cxl-type3 device type to PCI_CLASS_MEMORY_CXL
Message-ID: <20230302082343.560446-46-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Gregory Price <gourry.memverge@gmail.com>

Current code sets to STORAGE_EXPRESS and then overrides it.

Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Gregory Price <gregory.price@memverge.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20230206172816.8201-4-Jonathan.Cameron@huawei.com>
Reviewed-by: Fan Ni <fan.ni@samsung.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/mem/cxl_type3.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 252822bd82..217a5e639b 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -408,7 +408,6 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     }
 
     pci_config_set_prog_interface(pci_conf, 0x10);
-    pci_config_set_class(pci_conf, PCI_CLASS_MEMORY_CXL);
 
     pcie_endpoint_cap_init(pci_dev, 0x80);
     if (ct3d->sn != UI64_NULL) {
@@ -627,7 +626,7 @@ static void ct3_class_init(ObjectClass *oc, void *data)
 
     pc->realize = ct3_realize;
     pc->exit = ct3_exit;
-    pc->class_id = PCI_CLASS_STORAGE_EXPRESS;
+    pc->class_id = PCI_CLASS_MEMORY_CXL;
     pc->vendor_id = PCI_VENDOR_ID_INTEL;
     pc->device_id = 0xd93; /* LVF for now */
     pc->revision = 1;
-- 
MST


