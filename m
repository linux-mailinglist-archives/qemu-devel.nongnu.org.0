Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A73D435FBB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 12:52:57 +0200 (CEST)
Received: from localhost ([::1]:53864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdVgu-0005IL-IF
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 06:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdVY1-0002P7-W6
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:43:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdVXz-00031k-8n
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:43:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634813022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FJFzjMvrQujXC/2qJTkLr/Ge40TESEwyA20j1eeaERk=;
 b=PgkjCNloZTlXbsVr9lRECqxXvo/yPyctXJLtj7zi/E8H3sYJpUZnFNLN7k0q537hbUaYQc
 MHqEuMLuHEMDJRtDVZyYEO2c5hDuk4fDLIWSVIDxzmXSKVHlfWT+Chn05E7Vx3yqAXHuw3
 hMM+Dmp/IkyavkKznVJ/QcUDr8/kXFk=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-_jHqtqm2OvW57hg3dcD5Pg-1; Thu, 21 Oct 2021 06:43:41 -0400
X-MC-Unique: _jHqtqm2OvW57hg3dcD5Pg-1
Received: by mail-pj1-f71.google.com with SMTP id
 nk17-20020a17090b195100b001a199d7a415so2069650pjb.7
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 03:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FJFzjMvrQujXC/2qJTkLr/Ge40TESEwyA20j1eeaERk=;
 b=i0vjJMjBOXWATeFyQnLTz7Cn2XP3g4/L3jwPZUpcYmlYmNsDg1XhXDNj6tvf6cLZUE
 DmtmgtnJoS8hR1N/5ep7TODXOZWmWECOsuFSNC//c7LKdFgFe6b2RikXTYdtheYXILHo
 cR+OI9riU5LXh7jSlkrI9cGCinGwClifhmF9x6eC0UhimqM/9YGUKX6vOa1YJfYrpqWb
 c9GFKOcCXOt3ucDxooASjZHKbCZDPqyOTWmRE+XDtSfzG6gHCpG+HFZwatQeCEPD73D2
 drOxzu6hj2VUUS8xbjvx3BJb1mTwLElrTyPzapHKFEAKB8ucBu/U67mWVoxgfIckxXsV
 7y/g==
X-Gm-Message-State: AOAM532poMpE2YzcimkMo53uSqPUtRo7/o4Rv5DgqN/tVUO/pSdtsGy+
 GzOXhfclwQwIwNPZNFuvGGay/kRVV3lgkoHw7KTu8SqczgcB8PtPsosm7iHW7yVhzsrnIAFm1LW
 wE/mdVc0hfH6R1HXBSlzJp/Ve8DjPLXo45EWKDg8QTVTMMyGfML7yxreHfX+qY9mI
X-Received: by 2002:a62:e51a:0:b0:44d:67bd:53ab with SMTP id
 n26-20020a62e51a000000b0044d67bd53abmr5181671pff.86.1634813019909; 
 Thu, 21 Oct 2021 03:43:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0+SJsQ+n6hsr5+enk6reIjf/5lMUL6e+04yFnJI54/8hk0BOFsiWsojOgyXK6/rkZNFYm7A==
X-Received: by 2002:a62:e51a:0:b0:44d:67bd:53ab with SMTP id
 n26-20020a62e51a000000b0044d67bd53abmr5181633pff.86.1634813019571; 
 Thu, 21 Oct 2021 03:43:39 -0700 (PDT)
Received: from localhost.localdomain ([84.17.34.135])
 by smtp.gmail.com with ESMTPSA id e1sm5246893pgi.43.2021.10.21.03.43.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Oct 2021 03:43:38 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] pci: Add pci_for_each_root_bus()
Date: Thu, 21 Oct 2021 18:42:56 +0800
Message-Id: <20211021104259.57754-6-peterx@redhat.com>
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

Add a helper to loop over each root bus of the system, either the default root
bus or extended buses like pxb-pcie.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hw/pci/pci.c         | 26 ++++++++++++++++++++++++++
 include/hw/pci/pci.h |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 4a84e478ce..1623bc9099 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2097,6 +2097,32 @@ void pci_for_each_bus_depth_first(PCIBus *bus, pci_bus_ret_fn begin,
     }
 }
 
+typedef struct {
+    pci_bus_fn fn;
+    void *opaque;
+} pci_root_bus_args;
+
+static int pci_find_root_bus(Object *obj, void *opaque)
+{
+    pci_root_bus_args *args = opaque;
+
+    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
+        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
+
+        if (bus) {
+            args->fn(bus, args->opaque);
+        }
+    }
+
+    return 0;
+}
+
+void pci_for_each_root_bus(pci_bus_fn fn, void *opaque)
+{
+    pci_root_bus_args args = { .fn = fn, .opaque = opaque };
+
+    object_child_foreach_recursive(object_get_root(), pci_find_root_bus, &args);
+}
 
 PCIDevice *pci_find_device(PCIBus *bus, int bus_num, uint8_t devfn)
 {
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index a7e81f04d3..9e490d8969 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -474,6 +474,8 @@ void pci_for_each_device_under_bus_reverse(PCIBus *bus,
                                            void *opaque);
 void pci_for_each_bus_depth_first(PCIBus *bus, pci_bus_ret_fn begin,
                                   pci_bus_fn end, void *parent_state);
+/* Call `fn' for each pci root bus on the system */
+void pci_for_each_root_bus(pci_bus_fn fn, void *opaque);
 PCIDevice *pci_get_function_0(PCIDevice *pci_dev);
 
 /* Use this wrapper when specific scan order is not required. */
-- 
2.32.0


