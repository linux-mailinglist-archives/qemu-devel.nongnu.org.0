Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9CE5292D9
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:27:54 +0200 (CEST)
Received: from localhost ([::1]:33032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiFt-00086p-6T
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhhf-0006Hr-75
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:52:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhhd-0006Vq-Hl
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:52:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Le7OIyHzO0FLOiKiXKDvYsiurDem4y4sL/jpgSqTauc=;
 b=ZfqGKVP08vhD+rVrBSws1kYwfjQFGLpK21xU3v3LG3e/0rzJLJNrcQQKTRZPuTq57Sksti
 /+Jle2oWyzvCNYd61VQVt1yPPDVZD/+eHzds6gXQjV6xjb5Qn8f6h13fD1pWmC29dgtP1O
 KOxZCa1fA4+BcIi3qdO6Jg+JBOCoSXU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-vCJZkkqlPIu3HL5sSyzqdw-1; Mon, 16 May 2022 16:52:27 -0400
X-MC-Unique: vCJZkkqlPIu3HL5sSyzqdw-1
Received: by mail-ed1-f72.google.com with SMTP id
 o10-20020aa7c7ca000000b0042a4f08405fso6818518eds.22
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Le7OIyHzO0FLOiKiXKDvYsiurDem4y4sL/jpgSqTauc=;
 b=aBxqwnrHyXBECrniauBehdChY4H8ZS4+N+a842UySDghFA9tvQ0BWSKMCpvjvJufhK
 dsREEStnC57tsofWVeyq8MO17T+ar2VxIy6cClnnbvh3ZBcBMd49i7/NN69K/h/SUELk
 hUzJRwS6+ON/a0wRMa/SgvjTYAbWkieT1HK8wVP5sgGfk/fVfF287761PMHQq9q0niFb
 FYKZY2UBT9aQNGU/FEcPPfitVxVFC90RSwCbWCTzWk9QA51TMp1caZIyfGcpe6PN63nh
 8KAUrz6dFgnBQJxtU65FQyREU55lqNN0psyT+rgEsFlyJ8hUBshFWdeCu2hz0Zzc/Z0/
 iIjA==
X-Gm-Message-State: AOAM533bSMU89HN8ZrXBj6ezVAjF55d/DgefY16IFfQf1kRvNJWRUdvN
 nB2gXbwibqiKpm4xQCm6CAcaaHAMbXeswBoA4ePm2zGnTFHqFGjhrkvNadKX2o57vAKyY8+9T65
 xORyYxKGRtqYtf/gKYS2pFjHGYpaggk20izM3pdzyHCjKai4AzUtc0uJqNDSG
X-Received: by 2002:a17:907:3da4:b0:6f4:ff2b:8299 with SMTP id
 he36-20020a1709073da400b006f4ff2b8299mr17440814ejc.109.1652734346000; 
 Mon, 16 May 2022 13:52:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcn9UHleRJkgMAoTBooBA+Lrqy4qIpo07naSCJ0q5HPuJ/c4dv4yUEWCJHV1dbWAh1TYW/Cw==
X-Received: by 2002:a17:907:3da4:b0:6f4:ff2b:8299 with SMTP id
 he36-20020a1709073da400b006f4ff2b8299mr17440800ejc.109.1652734345701; 
 Mon, 16 May 2022 13:52:25 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 c28-20020a1709063f1c00b006f3ef214e63sm151002ejj.201.2022.05.16.13.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:52:25 -0700 (PDT)
Date: Mon, 16 May 2022 16:52:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v2 32/86] pci/pcie_port: Add pci_find_port_by_pn()
Message-ID: <20220516204913.542894-33-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jonathan Cameron <jonathan.cameron@huawei.com>

Simple function to search a PCIBus to find a port by
it's port number.

CXL interleave decoding uses the port number as a target
so it is necessary to locate the port when doing interleave
decoding.

Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-31-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pcie_port.h |  2 ++
 hw/pci/pcie_port.c         | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
index e25b289ce8..7b8193061a 100644
--- a/include/hw/pci/pcie_port.h
+++ b/include/hw/pci/pcie_port.h
@@ -39,6 +39,8 @@ struct PCIEPort {
 
 void pcie_port_init_reg(PCIDevice *d);
 
+PCIDevice *pcie_find_port_by_pn(PCIBus *bus, uint8_t pn);
+
 #define TYPE_PCIE_SLOT "pcie-slot"
 OBJECT_DECLARE_SIMPLE_TYPE(PCIESlot, PCIE_SLOT)
 
diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
index e95c1e5519..687e4e763a 100644
--- a/hw/pci/pcie_port.c
+++ b/hw/pci/pcie_port.c
@@ -136,6 +136,31 @@ static void pcie_port_class_init(ObjectClass *oc, void *data)
     device_class_set_props(dc, pcie_port_props);
 }
 
+PCIDevice *pcie_find_port_by_pn(PCIBus *bus, uint8_t pn)
+{
+    int devfn;
+
+    for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
+        PCIDevice *d = bus->devices[devfn];
+        PCIEPort *port;
+
+        if (!d || !pci_is_express(d) || !d->exp.exp_cap) {
+            continue;
+        }
+
+        if (!object_dynamic_cast(OBJECT(d), TYPE_PCIE_PORT)) {
+            continue;
+        }
+
+        port = PCIE_PORT(d);
+        if (port->port == pn) {
+            return d;
+        }
+    }
+
+    return NULL;
+}
+
 static const TypeInfo pcie_port_type_info = {
     .name = TYPE_PCIE_PORT,
     .parent = TYPE_PCI_BRIDGE,
-- 
MST


