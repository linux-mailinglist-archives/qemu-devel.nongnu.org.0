Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273BD3C79A4
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:28:09 +0200 (CEST)
Received: from localhost ([::1]:60198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Qsq-00026r-7S
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QcS-00089b-2O
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:11:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QcQ-0008DW-Do
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:11:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626214269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cem/scxwfuu8t6UBmBGhZX6mWJ6otnXd6jtrNMLMn2M=;
 b=UOllR5ay5BUej4yOF8gcAHw4Yh/e/tOM1nbQVET4PtKHV8Myp8mbsttdKJiEtcyxpyC8Fw
 XGkIkqdSmQKfg2aUh9G78sVFM4dtR8Wg49Dw6Ap9+KtQaepIODN68Yb+E/onAjmkpSk1nW
 JCPO0SGQPLXjyyqxUw4YRb/vfh/90hY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-VVDjhnYpPMKy9YlynQmhDA-1; Tue, 13 Jul 2021 18:11:08 -0400
X-MC-Unique: VVDjhnYpPMKy9YlynQmhDA-1
Received: by mail-wr1-f69.google.com with SMTP id
 k3-20020a5d52430000b0290138092aea94so308122wrc.20
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Cem/scxwfuu8t6UBmBGhZX6mWJ6otnXd6jtrNMLMn2M=;
 b=uQnP2ECXal95ed6h7hWxadc5U3ShPZqGDvPpaWMCFukdubUVbtukDfjFRG2/sUcINt
 XY0cLDnXcGrKf7j9vp9sr8WJRriBUgZMK/c5qZndR+QUQphCJYdLH/n+on1ybcwLTHcJ
 4rzFzoOqnn3zceBGWMFyOcc0GryclhfUeDnIHmjssg25DzzWPTqaYPdW64MsGKL2vlms
 xg2DI8pOoSBh3o90CIa7l3DRGC8hjkZ0S2A+pNV3vrqRHuUbblrx0zj0zHWGjSdaiiab
 0LWUXfwITVC947X10pbUzsqx67HPo9AHO+0SIjkx4EnfcIsWz/y2D51+kC1iu5DNmRkx
 LLNA==
X-Gm-Message-State: AOAM5315EeSvi5ZSK9OJJnXuKAJo6EgXfcAWNME5+EdBN6gBhObbvKSt
 VmkPWEqOrk/lwxrN77W1f1v240of45IJwVFu3I3IH5Cz7Ta/RYaEdjWq0oZ8tucr1WfI7WaR2P/
 wScUrgjMyPJ5xkpTEa44YuDDrS/Njkx4tzj6fFyAXywYTa4GUPASUuN75UhS/
X-Received: by 2002:a5d:6a05:: with SMTP id m5mr8642708wru.253.1626214267063; 
 Tue, 13 Jul 2021 15:11:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkqv5GQFuX8QmGr6LKnmVhZ5kCYGAXxB9xfdxwNdzSW+56WF01NL+trIFMyyptad6LYRRGcQ==
X-Received: by 2002:a5d:6a05:: with SMTP id m5mr8642683wru.253.1626214266849; 
 Tue, 13 Jul 2021 15:11:06 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id a10sm142944wrm.12.2021.07.13.15.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:11:06 -0700 (PDT)
Date: Tue, 13 Jul 2021 18:11:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/23] hw/pci: Add pci_bus_range() to get PCI bus number range
Message-ID: <20210713220946.212562-19-mst@redhat.com>
References: <20210713220946.212562-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210713220946.212562-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


