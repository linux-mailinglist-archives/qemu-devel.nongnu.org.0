Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 292A96A7C9F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:28:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeGU-0004yD-9N; Thu, 02 Mar 2023 03:26:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGH-0004Am-BA
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGF-0002P6-Pn
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fpUPnDDHsSgm3zfqQTTpFqcSqwirzmtC8kRA6gtYoj8=;
 b=NDjaHxODxxZasSJwdXGKOJ4vHBx02a/aYu7sbcZm0Dk0Cn2zMLfxZmxHdQjX3AaH5ATGk5
 jzfE0ETcFrVVeWI9dstFmcKpZ+/d8ps7i0hp5HfjUTwBC6QRZzA30RUoaQdaiw6LINj8VQ
 Z/nyjtdd/vzh/+WMAj7zy+4Y0nuoEeA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-NUvgoNOpPvmf-ewx_DHs1A-1; Thu, 02 Mar 2023 03:25:57 -0500
X-MC-Unique: NUvgoNOpPvmf-ewx_DHs1A-1
Received: by mail-wr1-f69.google.com with SMTP id
 i18-20020a05600011d200b002c94d861113so2982683wrx.16
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:25:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745556;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fpUPnDDHsSgm3zfqQTTpFqcSqwirzmtC8kRA6gtYoj8=;
 b=LybUelkhfJwu7MFC/tXZm6El2UWAmjxE3600pfXW0ZWIIrQknLLs+n2GafrFzypRwi
 JYWzOpN5KEpHoWC37yfq9nDsHSWssu/Oa8im7Oq2rsLYE+sYXCKvkN0qll1DnHAGQm5y
 6dHpa9UgF09QUrKF0ZUc4bM2N1ag5K8m5nnRbpIkP0hcmDnSl74ItV52YIdJaIi/yJxD
 kMbUFAU1pJbRz3jISr3nAfCrcPAi25x2rEjB/kRkKVGiro3lfGrsCL+XbAKPv+KrITL1
 /jcXcbhF6oeZZCRXdORk6cnHqMILKJ355Ou9qywt/ov0qjzmS+o/NkJvRfd+UyZNn59l
 37gQ==
X-Gm-Message-State: AO0yUKV6TSzmMMINNW7htBIcgNl0VtVp1vHKsoDS6OHBR5aMfG+HNQrV
 jt3892XjRsvOEzzIqrwxy461Jz+jTHWItGv9slR5RJwZXuvXaJekq79oQEU7l1xSmcr8gENvURK
 serjX+pIFnV9oJ0hUYPgWto4YvAZc0hT+K5GRg9cnMSTUgZHjFJ9mLIx/CFrC/0t9hg==
X-Received: by 2002:a05:6000:1b8f:b0:2cb:72c2:3d12 with SMTP id
 r15-20020a0560001b8f00b002cb72c23d12mr6843458wru.68.1677745556199; 
 Thu, 02 Mar 2023 00:25:56 -0800 (PST)
X-Google-Smtp-Source: AK7set89j5MiQXLK1hV9ICRLkAzw80LO6HVY9IpfOvRRdDV/96a2p33N7JneFIHg/TGCTn3AEQ1KIQ==
X-Received: by 2002:a05:6000:1b8f:b0:2cb:72c2:3d12 with SMTP id
 r15-20020a0560001b8f00b002cb72c23d12mr6843435wru.68.1677745555762; 
 Thu, 02 Mar 2023 00:25:55 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 y1-20020adfdf01000000b002c6d0462163sm14714838wrl.100.2023.03.02.00.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:25:55 -0800 (PST)
Date: Thu, 2 Mar 2023 03:25:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 27/53] pcie_regs: drop duplicated indicator value macros
Message-ID: <20230302082343.560446-28-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

We already have indicator values in
include/standard-headers/linux/pci_regs.h , no reason to reinvent them
in include/hw/pci/pcie_regs.h. (and we already have usage of
PCI_EXP_SLTCTL_PWR_IND_BLINK and PCI_EXP_SLTCTL_PWR_IND_OFF in
hw/pci/pcie.c, so let's be consistent)

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>
Message-Id: <20230216180356.156832-9-vsementsov@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pcie_regs.h |  9 ---------
 hw/pci/pcie.c              | 13 +++++++------
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/include/hw/pci/pcie_regs.h b/include/hw/pci/pcie_regs.h
index 963dc2e170..00b595a82e 100644
--- a/include/hw/pci/pcie_regs.h
+++ b/include/hw/pci/pcie_regs.h
@@ -70,15 +70,6 @@ typedef enum PCIExpLinkWidth {
 #define PCI_EXP_SLTCTL_IND_ON           0x1
 #define PCI_EXP_SLTCTL_IND_BLINK        0x2
 #define PCI_EXP_SLTCTL_IND_OFF          0x3
-#define PCI_EXP_SLTCTL_AIC_SHIFT        ctz32(PCI_EXP_SLTCTL_AIC)
-#define PCI_EXP_SLTCTL_AIC_OFF                          \
-    (PCI_EXP_SLTCTL_IND_OFF << PCI_EXP_SLTCTL_AIC_SHIFT)
-
-#define PCI_EXP_SLTCTL_PIC_SHIFT        ctz32(PCI_EXP_SLTCTL_PIC)
-#define PCI_EXP_SLTCTL_PIC_OFF                          \
-    (PCI_EXP_SLTCTL_IND_OFF << PCI_EXP_SLTCTL_PIC_SHIFT)
-#define PCI_EXP_SLTCTL_PIC_ON                          \
-    (PCI_EXP_SLTCTL_IND_ON << PCI_EXP_SLTCTL_PIC_SHIFT)
 
 #define PCI_EXP_SLTCTL_SUPPORTED        \
             (PCI_EXP_SLTCTL_ABPE |      \
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 82ef723983..ccdb2377e1 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -634,8 +634,8 @@ void pcie_cap_slot_init(PCIDevice *dev, PCIESlot *s)
                                  PCI_EXP_SLTCTL_PIC |
                                  PCI_EXP_SLTCTL_AIC);
     pci_word_test_and_set_mask(dev->config + pos + PCI_EXP_SLTCTL,
-                               PCI_EXP_SLTCTL_PIC_OFF |
-                               PCI_EXP_SLTCTL_AIC_OFF);
+                               PCI_EXP_SLTCTL_PWR_IND_OFF |
+                               PCI_EXP_SLTCTL_ATTN_IND_OFF);
     pci_word_test_and_set_mask(dev->wmask + pos + PCI_EXP_SLTCTL,
                                PCI_EXP_SLTCTL_PIC |
                                PCI_EXP_SLTCTL_AIC |
@@ -679,7 +679,7 @@ void pcie_cap_slot_reset(PCIDevice *dev)
                                  PCI_EXP_SLTCTL_PDCE |
                                  PCI_EXP_SLTCTL_ABPE);
     pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTCTL,
-                               PCI_EXP_SLTCTL_AIC_OFF);
+                               PCI_EXP_SLTCTL_ATTN_IND_OFF);
 
     if (dev->cap_present & QEMU_PCIE_SLTCAP_PCP) {
         /* Downstream ports enforce device number 0. */
@@ -694,7 +694,8 @@ void pcie_cap_slot_reset(PCIDevice *dev)
                                        PCI_EXP_SLTCTL_PCC);
         }
 
-        pic = populated ? PCI_EXP_SLTCTL_PIC_ON : PCI_EXP_SLTCTL_PIC_OFF;
+        pic = populated ?
+                PCI_EXP_SLTCTL_PWR_IND_ON : PCI_EXP_SLTCTL_PWR_IND_OFF;
         pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTCTL, pic);
     }
 
@@ -770,9 +771,9 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
      * control of powered off slots before powering them on.
      */
     if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
-        (val & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PIC_OFF &&
+        (val & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF &&
         (!(old_slt_ctl & PCI_EXP_SLTCTL_PCC) ||
-        (old_slt_ctl & PCI_EXP_SLTCTL_PIC) != PCI_EXP_SLTCTL_PIC_OFF)) {
+        (old_slt_ctl & PCI_EXP_SLTCTL_PIC) != PCI_EXP_SLTCTL_PWR_IND_OFF)) {
         pcie_cap_slot_do_unplug(dev);
     }
     pcie_cap_update_power(dev);
-- 
MST


