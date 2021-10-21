Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02583435FB2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 12:50:08 +0200 (CEST)
Received: from localhost ([::1]:47576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdVeA-00010p-OR
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 06:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdVXv-0002L4-8F
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:43:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdVXt-0002nK-AV
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:43:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634813016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qA2xR3nTmoE7PUCnmVtIB+SYHwB2jij1XP/u2/ka5O4=;
 b=gjTi8TGQTwdgq5kJNf89S/GDXT+3VG3uFSrNXc/IPE1pitHH76W0r7wv59QqpgAlUWbyqy
 s9ZS7UTt+SEoGK+AwOdjYXi050buqfkxD/t9fU2Z/s8tcno8hTkPa/HbRc0jzvYxlRtn3M
 AXyMFt+5bhJ0kVPIypU0xKnIUr/0cbc=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-iHB6OdCgP02FBE7C-XD45A-1; Thu, 21 Oct 2021 06:43:35 -0400
X-MC-Unique: iHB6OdCgP02FBE7C-XD45A-1
Received: by mail-pj1-f72.google.com with SMTP id
 nk17-20020a17090b195100b001a199d7a415so2069545pjb.7
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 03:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qA2xR3nTmoE7PUCnmVtIB+SYHwB2jij1XP/u2/ka5O4=;
 b=fgJe1iYK4qH30OqoyDgtlKLDRoZW8WgU46iFWXr2Ra2d0kxPoIsjQieKGOGpRp8t4K
 CsVf2nxV3gN2AMl0SWf0A0sZ3ym7dkAztUxV/WPHA6B0TT53KMCUQ74TJpGZmufGyzMA
 1YByr7y0mmJGsC3xVwnX3AfvMi/cixY+cTxLbBq3gNCjtm7QBwTq3Yeb72tzkBznAnXL
 hZ/Rw3zLzJhaXFjF8Bir/7HPgvvrwvDPnV4GBfUroojCu7bCB/+jYzOZsGjXJpR734qh
 z+TQnICDrDroS3x1jLrkJuuTtwmdfjtxOY+vP3Wk+cDzUayGysjZZX/YY/2YzrMly0Ti
 l7VQ==
X-Gm-Message-State: AOAM533dEclQ7s63kfjJD78vHXAQmAcO2tWmRyqE0Ypk6QCnm936f1Rr
 HNtzz04HMk9UwCoA1MIFr013iHmnofIbRgxNzI5jP9i/1O2Hc6xeHDk+67bKVBF7cl9UhKNw9+a
 1kh7CD2u0LbI+JfHl5D9zO8mhZ8Eh2bSSk1ZbmjM7wMVloBiuWjtijuA4VUeBcmD0
X-Received: by 2002:a17:902:6808:b0:13e:a85b:52bd with SMTP id
 h8-20020a170902680800b0013ea85b52bdmr4409793plk.76.1634813013990; 
 Thu, 21 Oct 2021 03:43:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8v0BRfpG3ehB+u+O5Brrn6R6VLFhKQYHp1nJFme6ocetV5ubP/dVr06purwX1ogD9+VjMZA==
X-Received: by 2002:a17:902:6808:b0:13e:a85b:52bd with SMTP id
 h8-20020a170902680800b0013ea85b52bdmr4409755plk.76.1634813013577; 
 Thu, 21 Oct 2021 03:43:33 -0700 (PDT)
Received: from localhost.localdomain ([84.17.34.135])
 by smtp.gmail.com with ESMTPSA id e1sm5246893pgi.43.2021.10.21.03.43.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Oct 2021 03:43:33 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/8] pci: Define pci_bus_fn/pci_bus_ret_fn type
Date: Thu, 21 Oct 2021 18:42:55 +0800
Message-Id: <20211021104259.57754-5-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211021104259.57754-1-peterx@redhat.com>
References: <20211021104259.57754-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, peterx@redhat.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pci_bus_fn is similar to pci_bus_dev_fn that only takes a PCIBus* and an
opaque.  The pci_bus_ret_fn is similar to pci_bus_fn but it allows to return a
void* pointer.

Use them where proper in pci.[ch], and to be used elsewhere.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hw/pci/pci.c         |  6 ++----
 include/hw/pci/pci.h | 12 +++++-------
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 6b834cace5..4a84e478ce 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2072,10 +2072,8 @@ static PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num)
     return NULL;
 }
 
-void pci_for_each_bus_depth_first(PCIBus *bus,
-                                  void *(*begin)(PCIBus *bus, void *parent_state),
-                                  void (*end)(PCIBus *bus, void *state),
-                                  void *parent_state)
+void pci_for_each_bus_depth_first(PCIBus *bus, pci_bus_ret_fn begin,
+                                  pci_bus_fn end, void *parent_state)
 {
     PCIBus *sec;
     void *state;
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 437eabe609..a7e81f04d3 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -402,6 +402,8 @@ OBJECT_DECLARE_TYPE(PCIBus, PCIBusClass, PCI_BUS)
 #define TYPE_PCIE_BUS "PCIE"
 
 typedef void (*pci_bus_dev_fn)(PCIBus *b, PCIDevice *d, void *opaque);
+typedef void (*pci_bus_fn)(PCIBus *b, void *opaque);
+typedef void* (*pci_bus_ret_fn)(PCIBus *b, void *opaque);
 
 bool pci_bus_is_express(PCIBus *bus);
 
@@ -470,17 +472,13 @@ void pci_for_each_device_under_bus(PCIBus *bus,
 void pci_for_each_device_under_bus_reverse(PCIBus *bus,
                                            pci_bus_dev_fn fn,
                                            void *opaque);
-void pci_for_each_bus_depth_first(PCIBus *bus,
-                                  void *(*begin)(PCIBus *bus, void *parent_state),
-                                  void (*end)(PCIBus *bus, void *state),
-                                  void *parent_state);
+void pci_for_each_bus_depth_first(PCIBus *bus, pci_bus_ret_fn begin,
+                                  pci_bus_fn end, void *parent_state);
 PCIDevice *pci_get_function_0(PCIDevice *pci_dev);
 
 /* Use this wrapper when specific scan order is not required. */
 static inline
-void pci_for_each_bus(PCIBus *bus,
-                      void (*fn)(PCIBus *bus, void *opaque),
-                      void *opaque)
+void pci_for_each_bus(PCIBus *bus, pci_bus_fn fn, void *opaque)
 {
     pci_for_each_bus_depth_first(bus, NULL, fn, opaque);
 }
-- 
2.32.0


