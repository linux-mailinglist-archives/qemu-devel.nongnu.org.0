Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E99E26AD812
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 08:13:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZRUR-0006ma-Ss; Tue, 07 Mar 2023 02:12:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRTo-0005nz-1C
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:11:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRTm-0005t4-8h
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:11:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678173081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JcyiYnvGgawhqpXMi/hKtFZZl6mKyXeQycfGfT+K0ZQ=;
 b=jLH6a5SAPZZdPaK6sLXRt6ImW5g40ldogdlwm6L28V27GapHNlP3PAh9Nd/m7++9yjHK6q
 LFAeYTVA0X28PIgRZw+dLEVNw4LwOWJGRbLN3ZwAEigos/2ds7E1q47s1k49yp59zV78do
 jCbOeCIuXDjmyq36xo2LZWJcN8z2Xuw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-q1kpXDBvPrKD7vJS7TzUjw-1; Tue, 07 Mar 2023 02:11:20 -0500
X-MC-Unique: q1kpXDBvPrKD7vJS7TzUjw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07A0B1C08968;
 Tue,  7 Mar 2023 07:11:20 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-78.pek2.redhat.com [10.72.12.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F82F40C10FA;
 Tue,  7 Mar 2023 07:11:17 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 50/51] hw/net/eepro100: Remove instance's EEPRO100State::device
Date: Tue,  7 Mar 2023 15:08:15 +0800
Message-Id: <20230307070816.34833-51-jasowang@redhat.com>
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

'device' is accessed read-only and is present in the class
definition. No need to duplicate it in the instance state.
Directly access the class field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/eepro100.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index d775790..bce3776 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -263,7 +263,6 @@ struct EEPRO100State {
     /* region must not be saved by nic_save. */
     uint16_t mdimem[32];
     eeprom_t *eeprom;
-    uint32_t device;            /* device variant */
     /* (cu_base + cu_offset) address the next command block in the command block list. */
     uint32_t cu_base;           /* CU base address */
     uint32_t cu_offset;         /* CU address offset */
@@ -591,6 +590,9 @@ static void e100_pci_reset(DeviceState *dev)
 
 static void nic_selective_reset(EEPRO100State * s)
 {
+    EEPRO100Class *ek = EEPRO100_GET_CLASS(s);
+    const E100PCIDeviceInfo *info = ek->info;
+
     size_t i;
     uint16_t *eeprom_contents = eeprom93xx_data(s->eeprom);
 #if 0
@@ -598,8 +600,9 @@ static void nic_selective_reset(EEPRO100State * s)
 #endif
     memcpy(eeprom_contents, s->conf.macaddr.a, 6);
     eeprom_contents[EEPROM_ID] = EEPROM_ID_VALID;
-    if (s->device == i82557B || s->device == i82557C)
+    if (info->device == i82557B || info->device == i82557C) {
         eeprom_contents[5] = 0x0100;
+    }
     eeprom_contents[EEPROM_PHY_ID] = 1;
     uint16_t sum = 0;
     for (i = 0; i < EEPROM_SIZE - 1; i++) {
@@ -1794,7 +1797,7 @@ static const VMStateDescription vmstate_eepro100 = {
         VMSTATE_UNUSED(19*4),
         VMSTATE_UINT16_ARRAY(mdimem, EEPRO100State, 32),
         /* The eeprom should be saved and restored by its own routines. */
-        VMSTATE_UINT32(device, EEPRO100State),
+        VMSTATE_UNUSED(sizeof(uint32_t)), /* was device variant */
         /* TODO check device. */
         VMSTATE_UINT32(cu_base, EEPRO100State),
         VMSTATE_UINT32(cu_offset, EEPRO100State),
@@ -1848,12 +1851,9 @@ static NetClientInfo net_eepro100_info = {
 static void e100_nic_realize(PCIDevice *pci_dev, Error **errp)
 {
     EEPRO100State *s = DO_UPCAST(EEPRO100State, dev, pci_dev);
-    EEPRO100Class *ek = EEPRO100_GET_CLASS(s);
 
     TRACE(OTHER, logout("\n"));
 
-    s->device = ek->info->device;
-
     /* Add 64 * 2 EEPROM. i82557 and i82558 support a 64 word EEPROM,
      * i82559 and later support 64 or 256 word EEPROM. */
     s->eeprom = eeprom93xx_new(&pci_dev->qdev, EEPROM_SIZE);
-- 
2.7.4


