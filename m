Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D2E431DCC
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 15:53:20 +0200 (CEST)
Received: from localhost ([::1]:59848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcT4p-0007JT-Uf
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 09:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mcT3W-0004kW-L4
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:51:59 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:40680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mcT3T-00043R-RH
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:51:58 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A8DD5755F74;
 Mon, 18 Oct 2021 15:51:54 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8AC76748F52; Mon, 18 Oct 2021 15:51:54 +0200 (CEST)
Message-Id: <e7eb4d2dc28604f7d1e8e5cc60525d6cbdd8bf18.1634563652.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1634563652.git.balaton@eik.bme.hu>
References: <cover.1634563652.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 3/6] usb/uhci: Disallow user creating a vt82c686-uhci-pci
 device
Date: Mon, 18 Oct 2021 15:27:32 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Philippe M-D <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because this device only works as part of VIA superio chips set user
creatable to false. Since the class init method is common for UHCI
variants introduce a flag in UHCIInfo for this.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-uhci.c          | 3 +++
 hw/usb/hcd-uhci.h          | 1 +
 hw/usb/vt82c686-uhci-pci.c | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index c557566ec2..7d26e35194 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -1282,6 +1282,9 @@ void uhci_data_class_init(ObjectClass *klass, void *data)
     } else {
         device_class_set_props(dc, uhci_properties_standalone);
     }
+    if (info->notuser) {
+        dc->user_creatable = false;
+    }
     u->info = *info;
 }
 
diff --git a/hw/usb/hcd-uhci.h b/hw/usb/hcd-uhci.h
index e61d8fcb19..316693f80b 100644
--- a/hw/usb/hcd-uhci.h
+++ b/hw/usb/hcd-uhci.h
@@ -85,6 +85,7 @@ typedef struct UHCIInfo {
     uint8_t    irq_pin;
     void       (*realize)(PCIDevice *dev, Error **errp);
     bool       unplug;
+    bool       notuser; /* disallow user_creatable */
 } UHCIInfo;
 
 void uhci_data_class_init(ObjectClass *klass, void *data);
diff --git a/hw/usb/vt82c686-uhci-pci.c b/hw/usb/vt82c686-uhci-pci.c
index b109c21603..ea262e6d70 100644
--- a/hw/usb/vt82c686-uhci-pci.c
+++ b/hw/usb/vt82c686-uhci-pci.c
@@ -25,6 +25,8 @@ static UHCIInfo uhci_info[] = {
         .irq_pin   = 3,
         .realize   = usb_uhci_vt82c686b_realize,
         .unplug    = true,
+        /* Reason: only works as USB function of VT82xx superio chips */
+        .notuser   = true,
     }
 };
 
-- 
2.21.4


