Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E57A44D70A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 14:13:47 +0100 (CET)
Received: from localhost ([::1]:39172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml9ti-0001NX-06
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 08:13:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ml9pa-0006s4-N3
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:09:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ml9pY-00052s-Oa
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:09:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636636168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2aNOMaaJtzgyhyUNUeWLNFN6DP6Ui3pJylVYD+wOpNg=;
 b=RDFW1DnBHZkqwj0vQK1HRetGczAgieNPyDrwFDgbT8x03oPI6kD5MgWFPNPcD/UrIPL0Pu
 R8djIwWPewnfWhKsRnVOihQqnYFnbJAH/q1lSsvANvPbGwocpUlb6D7p7TduIgPygTjCjd
 JX6cEGWdpoHWAlXB5K74qENsre9iaII=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-SyaN220zO6udKGPtpVSKbQ-1; Thu, 11 Nov 2021 08:09:25 -0500
X-MC-Unique: SyaN220zO6udKGPtpVSKbQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46E8E102CB9A;
 Thu, 11 Nov 2021 13:09:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0089280476;
 Thu, 11 Nov 2021 13:09:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E96F718009CC; Thu, 11 Nov 2021 14:08:59 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/6] pcie: add power indicator blink check
Date: Thu, 11 Nov 2021 14:08:56 +0100
Message-Id: <20211111130859.1171890-4-kraxel@redhat.com>
In-Reply-To: <20211111130859.1171890-1-kraxel@redhat.com>
References: <20211111130859.1171890-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 13d11a57c76f..b92dbff11804 100644
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
2.33.1


