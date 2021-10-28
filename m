Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6915043DA6C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 06:33:56 +0200 (CEST)
Received: from localhost ([::1]:59996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfx6x-0005xo-8T
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 00:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mfx4x-0003uW-Tx
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:31:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mfx4v-0000Pq-W6
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:31:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635395509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kMuvGj1yvNCOYzU3xwimoAnfIFfyj/RCjotL/X8hM4E=;
 b=goUQR8X+3qSeAV42PfYjIJS51B7ASRUhAbK5RvyGLYH6itLsERfF1Uxz+JjbUoB/6CE1fz
 lxMXeEbnWEr1QQ3BfYspqslCFxvfiP8QoldedRZ/w2OxTN+pz4QPCENOjXOF1W4wcsAzzZ
 838XQxCqN0xHFyS4Vm8Jd+VtCgYSYU8=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-zv3TowQaP_a7PhSvTlnWXQ-1; Thu, 28 Oct 2021 00:31:48 -0400
X-MC-Unique: zv3TowQaP_a7PhSvTlnWXQ-1
Received: by mail-pg1-f197.google.com with SMTP id
 t75-20020a63784e000000b002993a9284b0so2678111pgc.11
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 21:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kMuvGj1yvNCOYzU3xwimoAnfIFfyj/RCjotL/X8hM4E=;
 b=5VainmLWNiS0ZXnphOzr0N1nokCWBSD+HaCTWqN8qX/UL+Bdu6PBIQ9I2Ib33rkrmA
 h6+eMUVHOQh3kUgdL5JRKC7vACDi9gXq0KyWaII7IRGZytqFtdEpsq814aD2QzmehZ3/
 2gggvCHTV2toPytGvlo56u94hsmwRTCMzGQyrKjDbS/TNQhyhyDPgqIGA0dAIKhW0pNj
 Nm4FBL6+3i8pFAzu/iWVmaapTXbYVn5VHNs4iH962fHqyAh1kQbuSgs4quChDnVl2BqH
 /kBWR4Rg57AhSNY8j+gkgbd9jqRJZ57U0b3R924Mkx7oUmv5YOv0DsuH5rHOuTZz/9Hs
 xuKQ==
X-Gm-Message-State: AOAM532udAZNW2I8fwX0/CLgv09xCJ5dQcfygEsqY40Z2ONX81H/3zQR
 NH6XB8gLKy4TeqVCsT8Y095MR7LhQFHxWWr/YMN4/pk/UocWNGtItSgzY4+pPl4sfYgmFhsL/44
 hOjICop50SN/IwWo5MiOEefucIoaQGI0LRefNFFyXaIBT6tEDKzgLB8ex0alsjvmx
X-Received: by 2002:a05:6a00:238d:b0:47c:2232:80d8 with SMTP id
 f13-20020a056a00238d00b0047c223280d8mr1792701pfc.12.1635395506954; 
 Wed, 27 Oct 2021 21:31:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlcA0pqqNn9r0J2KR0THnplcH62KPtET0KGVJ3AQTZoImNgw7y9fr+Ky2ncdcZJpNzjeqZDg==
X-Received: by 2002:a05:6a00:238d:b0:47c:2232:80d8 with SMTP id
 f13-20020a056a00238d00b0047c223280d8mr1792655pfc.12.1635395506583; 
 Wed, 27 Oct 2021 21:31:46 -0700 (PDT)
Received: from localhost.localdomain ([191.101.132.60])
 by smtp.gmail.com with ESMTPSA id k22sm1483074pfi.149.2021.10.27.21.31.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 Oct 2021 21:31:46 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] pci: Define pci_bus_dev_fn/pci_bus_fn/pci_bus_ret_fn
Date: Thu, 28 Oct 2021 12:31:25 +0800
Message-Id: <20211028043129.38871-2-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211028043129.38871-1-peterx@redhat.com>
References: <20211028043129.38871-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
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
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, peterx@redhat.com,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

They're used in quite a few places of pci.[ch] and also in the rest of the code
base.  Define them so that it doesn't need to be defined all over the places.

The pci_bus_fn is similar to pci_bus_dev_fn that only takes a PCIBus* and an
opaque.  The pci_bus_ret_fn is similar to pci_bus_fn but it allows to return a
void* pointer.

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hw/pci/pci.c         | 20 ++++++--------------
 include/hw/pci/pci.h | 19 +++++++++----------
 2 files changed, 15 insertions(+), 24 deletions(-)

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
-- 
2.32.0


