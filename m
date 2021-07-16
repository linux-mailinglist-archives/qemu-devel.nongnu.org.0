Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2BD3CB9B1
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 17:23:56 +0200 (CEST)
Received: from localhost ([::1]:44766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Pgx-0001Rr-43
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 11:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PZ2-0001Di-F0
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:15:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PYy-0004ME-Ua
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:15:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626448540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cem/scxwfuu8t6UBmBGhZX6mWJ6otnXd6jtrNMLMn2M=;
 b=HnwO9+3U0h8LiMHbeKLNPfU0GnhfhGyN4WRam0KCG0/6Oh2wiLRz+qX8UhiarwwT8baEhr
 9aIlFtFLRkuZzkwC3O+CB3uKHNTl/PYNTgIk1RP9uQ2B9I3eufa+xXyqfXPeknk/TVj6lo
 g9YsEcKLt7AV6dCNTBGw1QdnV6BVcpE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-pjN6kKQyM2Savm3eSedsBA-1; Fri, 16 Jul 2021 11:15:39 -0400
X-MC-Unique: pjN6kKQyM2Savm3eSedsBA-1
Received: by mail-wr1-f71.google.com with SMTP id
 d9-20020adffbc90000b029011a3b249b10so4906821wrs.3
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 08:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Cem/scxwfuu8t6UBmBGhZX6mWJ6otnXd6jtrNMLMn2M=;
 b=jY/sssh1TbSkQRBzALd2LH6XFjy9GQyK2GtarVXVylcHBPzaQ4xX54Pyka0iB8ZaqD
 PSbDaM3fd8EeRi39ykNFTnJObB/leomAXmf7TXBT/unNL5urMBm0Rnchq7WXHIAbRcPk
 +hmciRYai8HbY+fSRBYbXMIesOC7I6uS5WE4aQQcNWH0V+PfiUC1CzhLK5m5lP2bWVMI
 nLmYs/fzeU++aUY+jDSzQeD5n7EgHkk1wAd3FlBZThHsCBM49rLTDsPaCjzGOoUNrZm7
 JFaG3kFJm0bTdNLcCRFe9LJUUZhpIeOrblQXaJDxTTbWrohUagh0tOU1h5z0iXhrxwHX
 W8sg==
X-Gm-Message-State: AOAM532yCbwsXr3tCS/2JodD3hJMzjTpqERHmmK8T0/HT9RzAty0Oq3H
 p0w4TQBOXOrVeiht6YDRw9z6du2DTAu9jCm7GU3uw3he3qG3wVHUDAsTulzg201QzyxdeUJIeED
 NdUjP/G1cfqpkBVJEKvIDG9veyoH6DSuuN4quREZxtHjpKwxKpVH3gep2pNyX
X-Received: by 2002:a05:6000:108:: with SMTP id
 o8mr13349833wrx.154.1626448537637; 
 Fri, 16 Jul 2021 08:15:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1OXg3lLNSv2uzkWcr10JMYz5qrhRpeHPAlJyFQFh7OqZX2iTTrbGVugOlLdinSzdtFWeZKg==
X-Received: by 2002:a05:6000:108:: with SMTP id
 o8mr13349805wrx.154.1626448537427; 
 Fri, 16 Jul 2021 08:15:37 -0700 (PDT)
Received: from redhat.com ([2a10:8004:6ff2:0:a1b1:b3d8:4c4e:4825])
 by smtp.gmail.com with ESMTPSA id b16sm10960152wrs.51.2021.07.16.08.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 08:15:36 -0700 (PDT)
Date: Fri, 16 Jul 2021 11:15:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 14/19] hw/pci: Add pci_bus_range() to get PCI bus number
 range
Message-ID: <20210716151416.155127-15-mst@redhat.com>
References: <20210716151416.155127-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210716151416.155127-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xingang Wang <wangxingang5@huawei.com>, Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

This helps to get the min and max bus number of a PCI bus hierarchy.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <1625748919-52456-6-git-send-email-wangxingang5@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pci.h |  1 +
 hw/pci/pci.c         | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index f4d51b672b..d0f4266e37 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -450,6 +450,7 @@ static inline PCIBus *pci_get_bus(const PCIDevice *dev)
     return PCI_BUS(qdev_get_parent_bus(DEVICE(dev)));
 }
 int pci_bus_num(PCIBus *s);
+void pci_bus_range(PCIBus *bus, int *min_bus, int *max_bus);
 static inline int pci_dev_bus_num(const PCIDevice *dev)
 {
     return pci_bus_num(pci_get_bus(dev));
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 27d588e268..23d2ae2ab2 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -537,6 +537,22 @@ int pci_bus_num(PCIBus *s)
     return PCI_BUS_GET_CLASS(s)->bus_num(s);
 }
 
+/* Returns the min and max bus numbers of a PCI bus hierarchy */
+void pci_bus_range(PCIBus *bus, int *min_bus, int *max_bus)
+{
+    int i;
+    *min_bus = *max_bus = pci_bus_num(bus);
+
+    for (i = 0; i < ARRAY_SIZE(bus->devices); ++i) {
+        PCIDevice *dev = bus->devices[i];
+
+        if (dev && PCI_DEVICE_GET_CLASS(dev)->is_bridge) {
+            *min_bus = MIN(*min_bus, dev->config[PCI_SECONDARY_BUS]);
+            *max_bus = MAX(*max_bus, dev->config[PCI_SUBORDINATE_BUS]);
+        }
+    }
+}
+
 int pci_bus_numa_node(PCIBus *bus)
 {
     return PCI_BUS_GET_CLASS(bus)->numa_node(bus);
-- 
MST


