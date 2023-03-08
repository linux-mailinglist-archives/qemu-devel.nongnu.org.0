Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCE66AFC12
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:19:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiNu-0004Z6-GI; Tue, 07 Mar 2023 20:14:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNs-0004U1-Tg
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:14:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNr-00023n-8n
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:14:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678238062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TI0QwX5R2AUisoNDQLeEN83k4qGzeGJatZpv9QZn/bA=;
 b=IBLGlNCPmSNqmIF1PULx31eg2diakeixFV6Yj597Oahr1XJ7lGyXg5kNIPoPggh+Pmd4m/
 9DS1+6UmCXRJIlYlI3PlivY5aSKNkednz5UbjTr3nMZHdC81gESFNWGG95e9Y6EdKNyQDm
 42KFw69wdTMP/xFKUkPQVmC+kPpOCTQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-iHm3Sk7AM8WX-ybBbXMv-Q-1; Tue, 07 Mar 2023 20:14:21 -0500
X-MC-Unique: iHm3Sk7AM8WX-ybBbXMv-Q-1
Received: by mail-ed1-f72.google.com with SMTP id
 ec11-20020a0564020d4b00b004e2cb85c8bcso12393275edb.16
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:14:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678238060;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TI0QwX5R2AUisoNDQLeEN83k4qGzeGJatZpv9QZn/bA=;
 b=FI3E8uSLC97JsXNqSEgGk026FAS+WD5DEsdjODyVUSh13gfiB+4oa6YKNH/ttxOKdV
 ep+nTcbHwuwK0nQpP8L/dWknLtpUxjj83lnnE7T33ewtEGsbLms3cAGftBNNLHEONeo2
 yONYlgxAKzcBTzwReHOmqHuF+RcNM/nViMjtwyTAVR4z+5K/Yn7B7t5tS/mcHFzVePjT
 J1jAstpobTFzE3xlMAgLYh/Szh09f3pKi3oOPMsr9M/XlneMQ1CURWzupwvmn2cWwlvL
 her/vCIYDgfjEU9VETkv8C9rWrZG12w0wIkEcJTixMZBCuC0PEdBP8Zj7jHUdzro/ntQ
 J71w==
X-Gm-Message-State: AO0yUKXxQSlv1MK7wZFKT2UxOJ3A4lax+L9vG8LXvO65Wzt/ZalB4Ngu
 FWFDtk6F9kw6IIhHJAjWouia5Ox4K4rub1Qb/0LOoXzuWbzdfMKYHg4DSIDhQlIbaygoCT4B96N
 CnoGcq7Z6lsmIczkSf9YN8qv1XeOpwPMjGvowD7zbd1qp8qJlIs8r0Lvpa0bXtgFW/f8f
X-Received: by 2002:a17:907:a602:b0:8f1:939b:9701 with SMTP id
 vt2-20020a170907a60200b008f1939b9701mr17353400ejc.66.1678238060200; 
 Tue, 07 Mar 2023 17:14:20 -0800 (PST)
X-Google-Smtp-Source: AK7set/u/Uz1q+glNH11POot4im1LjgXUh7t2SMDSLiGnbdntTqKeIeR0Wzqrnl9dJW3sgPtKOqDVw==
X-Received: by 2002:a17:907:a602:b0:8f1:939b:9701 with SMTP id
 vt2-20020a170907a60200b008f1939b9701mr17353380ejc.66.1678238059839; 
 Tue, 07 Mar 2023 17:14:19 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 j6-20020a17090686c600b008c44438734csm6790766ejy.113.2023.03.07.17.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:14:19 -0800 (PST)
Date: Tue, 7 Mar 2023 20:14:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 69/73] hw/pci: Add pcie_count_ds_port() and
 pcie_find_port_first() helpers
Message-ID: <84344ee2da1f8a23819c15361298d997d9e69dbf.1678237635.git.mst@redhat.com>
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

These two helpers enable host bridges to operate differently depending on
the number of downstream ports, in particular if there is only a single
port.

Useful for CXL where HDM address decoders are allowed to be implicit in
the host bridge if there is only a single root port.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20230227153128.8164-2-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pcie_port.h |  2 ++
 hw/pci/pcie_port.c         | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
index 6c40e3733f..90e6cf45b8 100644
--- a/include/hw/pci/pcie_port.h
+++ b/include/hw/pci/pcie_port.h
@@ -41,6 +41,8 @@ struct PCIEPort {
 void pcie_port_init_reg(PCIDevice *d);
 
 PCIDevice *pcie_find_port_by_pn(PCIBus *bus, uint8_t pn);
+PCIDevice *pcie_find_port_first(PCIBus *bus);
+int pcie_count_ds_ports(PCIBus *bus);
 
 #define TYPE_PCIE_SLOT "pcie-slot"
 OBJECT_DECLARE_SIMPLE_TYPE(PCIESlot, PCIE_SLOT)
diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
index 000633fec1..20ff2b39e8 100644
--- a/hw/pci/pcie_port.c
+++ b/hw/pci/pcie_port.c
@@ -161,6 +161,44 @@ PCIDevice *pcie_find_port_by_pn(PCIBus *bus, uint8_t pn)
     return NULL;
 }
 
+/* Find first port in devfn number order */
+PCIDevice *pcie_find_port_first(PCIBus *bus)
+{
+    int devfn;
+
+    for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
+        PCIDevice *d = bus->devices[devfn];
+
+        if (!d || !pci_is_express(d) || !d->exp.exp_cap) {
+            continue;
+        }
+
+        if (object_dynamic_cast(OBJECT(d), TYPE_PCIE_PORT)) {
+            return d;
+        }
+    }
+
+    return NULL;
+}
+
+int pcie_count_ds_ports(PCIBus *bus)
+{
+    int dsp_count = 0;
+    int devfn;
+
+    for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
+        PCIDevice *d = bus->devices[devfn];
+
+        if (!d || !pci_is_express(d) || !d->exp.exp_cap) {
+            continue;
+        }
+        if (object_dynamic_cast(OBJECT(d), TYPE_PCIE_PORT)) {
+            dsp_count++;
+        }
+    }
+    return dsp_count;
+}
+
 static bool pcie_slot_is_hotpluggbale_bus(HotplugHandler *plug_handler,
                                           BusState *bus)
 {
-- 
MST


