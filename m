Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 763A852B0B5
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 05:19:17 +0200 (CEST)
Received: from localhost ([::1]:43554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrADU-000704-IH
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 23:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nrA7K-0006vO-9W
 for qemu-devel@nongnu.org; Tue, 17 May 2022 23:12:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nrA7I-0004pQ-PX
 for qemu-devel@nongnu.org; Tue, 17 May 2022 23:12:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652843571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8RbeWMxLZfEDrmmdxD4KNkE6/p5VeCBxWVZML5B9loE=;
 b=hIHk9995EoI3D1T1nAFZJrWTOe3UIlJ5JO3fV31vGSbsYgm+nbBR5qbnIh3hAP7NuGGuv4
 t0pBPIGueDrZ3ZMs0t7/ctpXyc1aw7/0zMRVkPeM9ChvW/gJC/6OCpyOy7u68a35IaLPsj
 pwazptAuX+iiz5EyM2g/k3axQnbW/cs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-QJ7XoeHSPKanNkGZiHfzqw-1; Tue, 17 May 2022 23:12:48 -0400
X-MC-Unique: QJ7XoeHSPKanNkGZiHfzqw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 165462999B46;
 Wed, 18 May 2022 03:12:48 +0000 (UTC)
Received: from localhost.localdomain (ovpn-14-27.pek2.redhat.com [10.72.14.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A198D40C1244;
 Wed, 18 May 2022 03:12:45 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: jasowang@redhat.com,
	qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 8/8] tulip: Assign default MAC address if not specified
Date: Wed, 18 May 2022 11:12:14 +0800
Message-Id: <20220518031214.93760-9-jasowang@redhat.com>
In-Reply-To: <20220518031214.93760-1-jasowang@redhat.com>
References: <20220518031214.93760-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

From: Helge Deller <deller@gmx.de>

The MAC of the tulip card is stored in the EEPROM and at startup
tulip_fill_eeprom() is called to initialize the EEPROM with the MAC
address given on the command line, e.g.:
    -device tulip,mac=00:11:22:33:44:55

In case the mac address was not given on the command line,
tulip_fill_eeprom() initializes the MAC in EEPROM with 00:00:00:00:00:00
which breaks e.g. a HP-UX guest.

Fix this problem by moving qemu_macaddr_default_if_unset() a few lines
up, so that a default mac address is assigned before tulip_fill_eeprom()
initializes the EEPROM.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/tulip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index d5b6cc5ee6..097e905bec 100644
--- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -967,6 +967,8 @@ static void pci_tulip_realize(PCIDevice *pci_dev, Error **errp)
     pci_conf = s->dev.config;
     pci_conf[PCI_INTERRUPT_PIN] = 1; /* interrupt pin A */
 
+    qemu_macaddr_default_if_unset(&s->c.macaddr);
+
     s->eeprom = eeprom93xx_new(&pci_dev->qdev, 64);
     tulip_fill_eeprom(s);
 
@@ -981,8 +983,6 @@ static void pci_tulip_realize(PCIDevice *pci_dev, Error **errp)
 
     s->irq = pci_allocate_irq(&s->dev);
 
-    qemu_macaddr_default_if_unset(&s->c.macaddr);
-
     s->nic = qemu_new_nic(&net_tulip_info, &s->c,
                           object_get_typename(OBJECT(pci_dev)),
                           pci_dev->qdev.id, s);
-- 
2.25.1


