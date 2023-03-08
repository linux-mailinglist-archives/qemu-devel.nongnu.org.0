Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F04166AFC1D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:20:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiNX-0003ej-6T; Tue, 07 Mar 2023 20:14:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNV-0003XY-0f
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:14:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNT-0001zi-DC
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:14:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678238038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P/flEEtcx2Nxz0vaaqNrcWx22W07Ea7y0fK3PKtwLFs=;
 b=RbsRi6vNJ3HNwekrDZzY8a5w6h4E2fqnmtUJSyoV9mORnvF2xDKFuU2w4u9nrmiKi2Ud8Z
 EhC2Dq9hb9cpCoacOQsZcHDUGRUnTRpW3JQmYyOTkJZzb988Mv1XwanMM/tE4MvhqEEHrD
 R/++7IkSUJu7OVixCCkr3AQ5kBI76ys=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-SKx21tBXOuy0lUSLSyfkIA-1; Tue, 07 Mar 2023 20:13:57 -0500
X-MC-Unique: SKx21tBXOuy0lUSLSyfkIA-1
Received: by mail-ed1-f72.google.com with SMTP id
 fi8-20020a056402550800b004a26cc7f6cbso21411845edb.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:13:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678238036;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P/flEEtcx2Nxz0vaaqNrcWx22W07Ea7y0fK3PKtwLFs=;
 b=Ir9a3FL/ZJbgw0eTbABlodnF3jUNhtSuYt0gl9h1podYNbI4w1+AJJJqFqjpDjGNE0
 RilvWOHu0nazfdcv1shi1XzbY0UEICg9gzTRr0LA881UYNS/fwp6kCaB/9jhT4DbFvM5
 qN1vetnJu9lxZS0V2i4apuy6g/zLYx6g+ns5q+pgGr5Vn5PGupyIeyGKMSJozeUzcnMB
 IVvPh/7u5weZVK9oRXHsKRKRSEISk2KCFgicY26dbdgkxSEzL0q59zHPjl+G8U7z5gxo
 GEzj+w1xKOqu5zZpLZ0FFOKYfmCVKlWVOTgmflixYgu8sMBqCaX/69tMOe5UMfU+LCw9
 5Odg==
X-Gm-Message-State: AO0yUKXb30VUz695qNLU36/2B4oomKzRrwq16JclaK1xljK25aqMrg9p
 B0DVCf8Lc2V9K0xeufztHVjAmikH3lKfxD1VlyBjvMr1ySDWFSt5wXBbumqPHuYnDZLfcuetKL1
 SDwgUSzbmx1RQkacISkLGNlHA+wZifUD4WCKsdKZYFmq9HauCmJW8cEheaTFDraflcAFQ
X-Received: by 2002:a17:906:a1cc:b0:878:7189:a457 with SMTP id
 bx12-20020a170906a1cc00b008787189a457mr17235267ejb.51.1678238035910; 
 Tue, 07 Mar 2023 17:13:55 -0800 (PST)
X-Google-Smtp-Source: AK7set8BWTnyXRlcm2Zqlw3PKZEvkqcE4NUGdK68J8rBVspLkWY55qZS+UrEk7gxRjAlSksiVj0QuQ==
X-Received: by 2002:a17:906:a1cc:b0:878:7189:a457 with SMTP id
 bx12-20020a170906a1cc00b008787189a457mr17235256ejb.51.1678238035700; 
 Tue, 07 Mar 2023 17:13:55 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 22-20020a508756000000b004c0ac1df341sm7557824edv.50.2023.03.07.17.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:13:55 -0800 (PST)
Date: Tue, 7 Mar 2023 20:13:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>, Fan Ni <fan.ni@samsung.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 61/73] hw/pci/aer: Implement PCI_ERR_UNCOR_MASK register
Message-ID: <010746ae1db7f52700cb2e2c46eb94f299cfa0d2.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
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

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

This register in AER should be both writeable and should
have a default value with a couple of the errors masked
including the Uncorrectable Internal Error used by CXL for
it's error reporting.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Message-Id: <20230302133709.30373-2-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Fan Ni <fan.ni@samsung.com>
---
 include/hw/pci/pcie_regs.h | 3 +++
 hw/pci/pcie_aer.c          | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/include/hw/pci/pcie_regs.h b/include/hw/pci/pcie_regs.h
index 1fe0bdd25b..4972106c42 100644
--- a/include/hw/pci/pcie_regs.h
+++ b/include/hw/pci/pcie_regs.h
@@ -141,6 +141,9 @@ typedef enum PCIExpLinkWidth {
                                          PCI_ERR_UNC_ATOP_EBLOCKED |    \
                                          PCI_ERR_UNC_TLP_PRF_BLOCKED)
 
+#define PCI_ERR_UNC_MASK_DEFAULT        (PCI_ERR_UNC_INTN | \
+                                         PCI_ERR_UNC_TLP_PRF_BLOCKED)
+
 #define PCI_ERR_UNC_SEVERITY_DEFAULT    (PCI_ERR_UNC_DLP |              \
                                          PCI_ERR_UNC_SDN |              \
                                          PCI_ERR_UNC_FCP |              \
diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
index 9a19be44ae..909e027d99 100644
--- a/hw/pci/pcie_aer.c
+++ b/hw/pci/pcie_aer.c
@@ -112,6 +112,10 @@ int pcie_aer_init(PCIDevice *dev, uint8_t cap_ver, uint16_t offset,
 
     pci_set_long(dev->w1cmask + offset + PCI_ERR_UNCOR_STATUS,
                  PCI_ERR_UNC_SUPPORTED);
+    pci_set_long(dev->config + offset + PCI_ERR_UNCOR_MASK,
+                 PCI_ERR_UNC_MASK_DEFAULT);
+    pci_set_long(dev->wmask + offset + PCI_ERR_UNCOR_MASK,
+                 PCI_ERR_UNC_SUPPORTED);
 
     pci_set_long(dev->config + offset + PCI_ERR_UNCOR_SEVER,
                  PCI_ERR_UNC_SEVERITY_DEFAULT);
-- 
MST


