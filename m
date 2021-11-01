Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2387D44247F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 01:08:06 +0100 (CET)
Received: from localhost ([::1]:50498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhhLQ-0003c0-Uu
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 20:08:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhgz0-00024V-0i
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:44:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhgyx-0004HN-6K
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:44:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635810288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F4ZtjMfzkzyBWN2bg+JD6SzX6fqnOcm/U8VVQqdvDT8=;
 b=YkIOExOewYsBNsq0oxl9dseyqsMHODydpchu2S5XJl7vxfqY6L46ojhOTogvGk9jdX2sLE
 sENB9YPIXV5smAWjjmHnLeD2rO0gzjE6pFDkPu3U3b5aTH3Lvuj/UfYLi13oK1WoGfmXWx
 SDqOPydsAkJgw+qIQ7tpRUM2o9Q7sAw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-RlQUVO45PeyzvV7JKiG1rA-1; Mon, 01 Nov 2021 19:44:47 -0400
X-MC-Unique: RlQUVO45PeyzvV7JKiG1rA-1
Received: by mail-ed1-f72.google.com with SMTP id
 i9-20020a508709000000b003dd4b55a3caso17101033edb.19
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 16:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F4ZtjMfzkzyBWN2bg+JD6SzX6fqnOcm/U8VVQqdvDT8=;
 b=mpB7F/WNZzCc3G9HBc+SS3YxdW7ejwn65WpsSyKk01DTFuGGTPu2HgxnlHJVXeLQw2
 jAtZCfflP6EaB5NODHg7tQ0ZTI/0Fe3XI6YPZ3ncydr5C/KBf7z4vdSl4MdzrdK82Sox
 uAb+bob0lQJglkXzQLHp2ZFFU9XiJ5qUh8PBLY6OnXmoCmU+xKPhEEfnGw0m70dvnWC7
 oSr9xeqbHN4HUKDqbMNQICTGJ7Jz6cvNgiH4vUtfcfIpBvgNbTfMs55I6NiSyDpCBPO8
 lied++h8ajnWL0GI1gITAihqhik2fVKXcjy+fHAy4b7l7Zex7NRIc2481C+4hdR9vNtQ
 KIKw==
X-Gm-Message-State: AOAM530/wovOJMM43R5Pj64er/4NvKdkJaqSG8YlhduY5ccCVT+6hvoB
 bu3+jrtetaZTy43Ckr+5RG/Kzl0/LH1uAB0HoS++e7HYyM4CIy7k0/4ODaaLFfkn1IM+nimv4Qt
 eyem6eFrdrVvo8jioJHmK5zoIlsm5dnfhiKuHMM9AdbNR6l+CmMpvrYrXCrm0
X-Received: by 2002:a17:907:ea0:: with SMTP id
 ho32mr11792581ejc.191.1635810286354; 
 Mon, 01 Nov 2021 16:44:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzV4ULqIeU5AMd3bmn/W7gMbtX/QpgqCSa8YVbbaL9cRv0XMFuuO0fy/Z9BW67w0NKG08vi6Q==
X-Received: by 2002:a17:907:ea0:: with SMTP id
 ho32mr11792555ejc.191.1635810286113; 
 Mon, 01 Nov 2021 16:44:46 -0700 (PDT)
Received: from redhat.com ([2.55.156.42])
 by smtp.gmail.com with ESMTPSA id e22sm10048998edu.35.2021.11.01.16.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 16:44:45 -0700 (PDT)
Date: Mon, 1 Nov 2021 19:44:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/9] pci: Define pci_bus_dev_fn/pci_bus_fn/pci_bus_ret_fn
Message-ID: <20211101234358.582487-8-mst@redhat.com>
References: <20211101234358.582487-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211101234358.582487-1-mst@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

They're used in quite a few places of pci.[ch] and also in the rest of the code
base.  Define them so that it doesn't need to be defined all over the places.

The pci_bus_fn is similar to pci_bus_dev_fn that only takes a PCIBus* and an
opaque.  The pci_bus_ret_fn is similar to pci_bus_fn but it allows to return a
void* pointer.

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20211028043129.38871-2-peterx@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pci.h | 19 +++++++++----------
 hw/pci/pci.c         | 20 ++++++--------------
 2 files changed, 15 insertions(+), 24 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 7fc90132cf..4a8740b76b 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -401,6 +401,10 @@ typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque, int pin);
 OBJECT_DECLARE_TYPE(PCIBus, PCIBusClass, PCI_BUS)
 #define TYPE_PCIE_BUS "PCIE"
 
+typedef void (*pci_bus_dev_fn)(PCIBus *b, PCIDevice *d, void *opaque);
+typedef void (*pci_bus_fn)(PCIBus *b, void *opaque);
+typedef void *(*pci_bus_ret_fn)(PCIBus *b, void *opaque);
+
 bool pci_bus_is_express(PCIBus *bus);
 
 void pci_root_bus_init(PCIBus *bus, size_t bus_size, DeviceState *parent,
@@ -458,23 +462,18 @@ static inline int pci_dev_bus_num(const PCIDevice *dev)
 
 int pci_bus_numa_node(PCIBus *bus);
 void pci_for_each_device(PCIBus *bus, int bus_num,
-                         void (*fn)(PCIBus *bus, PCIDevice *d, void *opaque),
+                         pci_bus_dev_fn fn,
                          void *opaque);
 void pci_for_each_device_reverse(PCIBus *bus, int bus_num,
-                                 void (*fn)(PCIBus *bus, PCIDevice *d,
-                                            void *opaque),
+                                 pci_bus_dev_fn fn,
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
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 186758ee11..17e59cb3a3 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1655,9 +1655,7 @@ static const pci_class_desc pci_class_descriptions[] =
 };
 
 static void pci_for_each_device_under_bus_reverse(PCIBus *bus,
-                                                  void (*fn)(PCIBus *b,
-                                                             PCIDevice *d,
-                                                             void *opaque),
+                                                  pci_bus_dev_fn fn,
                                                   void *opaque)
 {
     PCIDevice *d;
@@ -1672,8 +1670,7 @@ static void pci_for_each_device_under_bus_reverse(PCIBus *bus,
 }
 
 void pci_for_each_device_reverse(PCIBus *bus, int bus_num,
-                         void (*fn)(PCIBus *b, PCIDevice *d, void *opaque),
-                         void *opaque)
+                                 pci_bus_dev_fn fn, void *opaque)
 {
     bus = pci_find_bus_nr(bus, bus_num);
 
@@ -1683,9 +1680,7 @@ void pci_for_each_device_reverse(PCIBus *bus, int bus_num,
 }
 
 static void pci_for_each_device_under_bus(PCIBus *bus,
-                                          void (*fn)(PCIBus *b, PCIDevice *d,
-                                                     void *opaque),
-                                          void *opaque)
+                                          pci_bus_dev_fn fn, void *opaque)
 {
     PCIDevice *d;
     int devfn;
@@ -1699,8 +1694,7 @@ static void pci_for_each_device_under_bus(PCIBus *bus,
 }
 
 void pci_for_each_device(PCIBus *bus, int bus_num,
-                         void (*fn)(PCIBus *b, PCIDevice *d, void *opaque),
-                         void *opaque)
+                         pci_bus_dev_fn fn, void *opaque)
 {
     bus = pci_find_bus_nr(bus, bus_num);
 
@@ -2078,10 +2072,8 @@ static PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num)
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
-- 
MST


