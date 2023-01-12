Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4B0667581
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:22:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBR-0002NQ-Mr; Thu, 12 Jan 2023 09:03:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBI-0002G9-F2
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBD-0005zF-Tl
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GVQiKVw6MJBuuGI6pkVSha182xhBXcyZ0y2Q/EzAKJ4=;
 b=gjJk/U0zMEVGySQRl/XCm8cQ+LqfkYFSuu8AcLQ54KaKD7AYj2JG8uVDgvj3mmXAezKius
 XpiU5JzFyimS8GBZeeK6Lr3KRmUUJtRa9HkAgFAmV+Teyh4shslSaNu5nBPZRkdwE0JRzr
 Gu9zltP/ym1TFj4qc0Po2MGzqt27Kdc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-KwPAErGgMtOtMtmHAOlqAA-1; Thu, 12 Jan 2023 09:03:38 -0500
X-MC-Unique: KwPAErGgMtOtMtmHAOlqAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 016341991C55;
 Thu, 12 Jan 2023 14:03:38 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 708DA4085720;
 Thu, 12 Jan 2023 14:03:37 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 30/40] =?UTF-8?q?pci:=20make=20sure=20pci=5Fbus=5Fis=5Fexp?=
 =?UTF-8?q?ress()=20won't=20error=20out=20with=20=20"discards=20=E2=80=98c?=
 =?UTF-8?q?onst=E2=80=99=20qualifier"?=
Date: Thu, 12 Jan 2023 15:03:02 +0100
Message-Id: <20230112140312.3096331-31-imammedo@redhat.com>
In-Reply-To: <20230112140312.3096331-1-imammedo@redhat.com>
References: <20230112140312.3096331-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

function doesn't need RW aceess to passed in bus pointer,
make it const.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/pci/pci.h | 2 +-
 hw/pci/pci.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 7048a373d1..03e8d614ad 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -270,7 +270,7 @@ typedef void (*pci_bus_dev_fn)(PCIBus *b, PCIDevice *d, void *opaque);
 typedef void (*pci_bus_fn)(PCIBus *b, void *opaque);
 typedef void *(*pci_bus_ret_fn)(PCIBus *b, void *opaque);
 
-bool pci_bus_is_express(PCIBus *bus);
+bool pci_bus_is_express(const PCIBus *bus);
 
 void pci_root_bus_init(PCIBus *bus, size_t bus_size, DeviceState *parent,
                        const char *name,
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index c2fb88f9a3..e725a771e3 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -482,7 +482,7 @@ static void pci_bus_uninit(PCIBus *bus)
     pci_host_bus_unregister(BUS(bus)->parent);
 }
 
-bool pci_bus_is_express(PCIBus *bus)
+bool pci_bus_is_express(const PCIBus *bus)
 {
     return object_dynamic_cast(OBJECT(bus), TYPE_PCIE_BUS);
 }
-- 
2.31.1


