Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A73428CAC
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 14:08:46 +0200 (CEST)
Received: from localhost ([::1]:60500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZu6m-00012p-Tb
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 08:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mZu45-00063E-Ja
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 08:05:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mZu41-0004M0-Sl
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 08:05:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633953952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8KXxjvzwEushWIdcMmb/D4s2ClTPy0CVLK6ZiwQw0b0=;
 b=eRIdu7sMbbRcXFZUmjiNxAE0Ibkgue8lbVHCPVRikWAn181kO2AMk7l/OpetktzEBynUyE
 AKIs0LTraW3ZzQCQwVKv0OePN1alxSXsH7zFPYWTx1Zq2tk9cnrUl48UNJAQwTUl//zLgn
 wdXABl0XIoc/aJzOWtinNBlz1TO47Wo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-ya7YBBqkNb6ToqGSogilCg-1; Mon, 11 Oct 2021 08:05:49 -0400
X-MC-Unique: ya7YBBqkNb6ToqGSogilCg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E83D824FA6;
 Mon, 11 Oct 2021 12:05:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE00260BF4;
 Mon, 11 Oct 2021 12:05:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9863318009E6; Mon, 11 Oct 2021 14:05:04 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] pcie: add power indicator blink check
Date: Mon, 11 Oct 2021 14:05:01 +0200
Message-Id: <20211011120504.254053-4-kraxel@redhat.com>
In-Reply-To: <20211011120504.254053-1-kraxel@redhat.com>
References: <20211011120504.254053-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Refuse to push the attention button in case the guest is busy with some
hotplug operation (as indicated by the power indicator blinking).

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/pci/pcie.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 4a52c250615e..c455f92e16bf 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -506,6 +506,7 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
     PCIDevice *hotplug_pdev = PCI_DEVICE(hotplug_dev);
     uint8_t *exp_cap = hotplug_pdev->config + hotplug_pdev->exp.exp_cap;
     uint32_t sltcap = pci_get_word(exp_cap + PCI_EXP_SLTCAP);
+    uint16_t sltctl = pci_get_word(exp_cap + PCI_EXP_SLTCTL);
 
     /* Check if hot-unplug is disabled on the slot */
     if ((sltcap & PCI_EXP_SLTCAP_HPC) == 0) {
@@ -521,6 +522,12 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
         return;
     }
 
+    if ((sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_BLINK) {
+        error_setg(errp, "Hot-unplug failed: "
+                   "guest is busy (power indicator blinking)");
+        return;
+    }
+
     dev->pending_deleted_event = true;
 
     /* In case user cancel the operation of multi-function hot-add,
-- 
2.31.1


