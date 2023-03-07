Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC736AD82B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 08:16:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZRU5-0006HU-E5; Tue, 07 Mar 2023 02:11:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRTm-0005mg-Ah
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:11:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRTg-0005sM-JM
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:11:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678173076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=upOlGMHWjHNNBfJuoRRwinF5pbnBznfwUp5wdi6JWFY=;
 b=EKzG24Ov5DaTFy2RIJrpm24K98V4vZA9VzBjSiYE3UWvB3Lx+61waRNcVqUxoJbEPHUfoN
 7RjQ1tWDehj5FvVuj7Vjd2i0WLy20hJXfOHYyMXOnjvMeWdYFhtOAZpr9qcACEzpqRFzcs
 NBY7vwP7ka/yoPXSa+MfEKYgwWflag4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-WmsibDdYMnGDBr5Glnqfww-1; Tue, 07 Mar 2023 02:11:12 -0500
X-MC-Unique: WmsibDdYMnGDBr5Glnqfww-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 292002808E60;
 Tue,  7 Mar 2023 07:11:12 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-78.pek2.redhat.com [10.72.12.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3977340C10FA;
 Tue,  7 Mar 2023 07:11:09 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 47/51] hw/net/eepro100: Convert reset handler to DeviceReset
Date: Tue,  7 Mar 2023 15:08:12 +0800
Message-Id: <20230307070816.34833-48-jasowang@redhat.com>
In-Reply-To: <20230307070816.34833-1-jasowang@redhat.com>
References: <20230307070816.34833-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/eepro100.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index 4b5d455..722fb55 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -486,8 +486,9 @@ static void eepro100_fcp_interrupt(EEPRO100State * s)
 }
 #endif
 
-static void e100_pci_reset(EEPRO100State *s, Error **errp)
+static void e100_pci_reset(DeviceState *dev)
 {
+    EEPRO100State *s = EEPRO100(dev);
     E100PCIDeviceInfo *info = eepro100_get_class(s);
     uint32_t device = s->device;
     uint8_t *pci_conf = s->dev.config;
@@ -1847,18 +1848,11 @@ static void e100_nic_realize(PCIDevice *pci_dev, Error **errp)
 {
     EEPRO100State *s = DO_UPCAST(EEPRO100State, dev, pci_dev);
     E100PCIDeviceInfo *info = eepro100_get_class(s);
-    Error *local_err = NULL;
 
     TRACE(OTHER, logout("\n"));
 
     s->device = info->device;
 
-    e100_pci_reset(s, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
     /* Add 64 * 2 EEPROM. i82557 and i82558 support a 64 word EEPROM,
      * i82559 and later support 64 or 256 word EEPROM. */
     s->eeprom = eeprom93xx_new(&pci_dev->qdev, EEPROM_SIZE);
@@ -2076,6 +2070,7 @@ static void eepro100_base_class_init(ObjectClass *klass, void *data)
 
     set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
     device_class_set_props(dc, e100_properties);
+    dc->reset = e100_pci_reset;
     k->vendor_id = PCI_VENDOR_ID_INTEL;
     k->class_id = PCI_CLASS_NETWORK_ETHERNET;
     k->romfile = "pxe-eepro100.rom";
-- 
2.7.4


