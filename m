Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8535092EF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 00:37:58 +0200 (CEST)
Received: from localhost ([::1]:51404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhIxR-0005mN-RE
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 18:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIeC-00010t-LX; Wed, 20 Apr 2022 18:18:04 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:37586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIeB-0006Cn-1U; Wed, 20 Apr 2022 18:18:04 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-e2a00f2cc8so3521911fac.4; 
 Wed, 20 Apr 2022 15:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Iq9s7efEkQYZ64xhj9l6h9FaZ/E0YRqeNeJ+Z+IYDBI=;
 b=Csxpgphg/210241VzIJ3IMZOZoF4vfoL9iMHtAVHpsJUT16Q7OMuO880uIQ8bHa0KC
 /ZdWo3AhTY1+oviujAeP9A+s7PXHppIrxBTb44i4S4VEm7jYtv+nJpDxw+09asu9iSjT
 vfm69CIEx6FOW2GhbRP4DiskEEn5+6Hg1lfnE7hVXrhlKkA+TRWlihrq6esJVpLqgTYx
 ImOTlZ2VBpjucRGqzxWv+J3/PxbZsnsK6VlqIQaX+fyYBpr0cSUVIXBmqW0bbIILkSxV
 +TjmnKXgEz0VYdy2HDh2Ken9UEkrWxT4wuBSR+WJmYlIYraamCEz20typwI+2zZqcAx/
 P7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iq9s7efEkQYZ64xhj9l6h9FaZ/E0YRqeNeJ+Z+IYDBI=;
 b=BLoY/TmU4Ug5n2itpLC2KRLP1Cp4xg1cul356eFvYOUPqOM6SWGUHTDslfmMTy44lp
 WjZaKDitZt3FGyMKJ6MODYmVhIGlLRaDQq6ZAaKXd9oBhu49DSW4ha+r6aF0QZ9rl8Uz
 Olbjdb+zjEbXvfTrOlmx1gjQKzOxQeFVgvSQUuyaUrLBc1KMupO0I9mGwnKeb3jNrd7U
 afw8lswqJ12mXwMl6kA7yRVCsbJvxQStQaRJ4a0mphGNKu2XO5OI2jbD1lHJwKWP1Jav
 hOhrKnt/xb3FHHDIxdX0C2yKoQ1zeMPTPPrkor0KAoPlaoJt/Sc7bC9+aCss79QHtl3G
 1UMQ==
X-Gm-Message-State: AOAM530DlloPnJvmhxog3NcU5zjOmEBdHLK96uwhfbRfk7w5d6C1Frs5
 lEzZX22YlHl2JxgfXKivk13mW0W9950=
X-Google-Smtp-Source: ABdhPJwXF1YZqxyBC698L/hm8OcnE+Rr19YWb5lwyuXNbkpgSiKCSSKpRX1JTJgd6lwvQLJso77rAg==
X-Received: by 2002:a05:6871:b22:b0:e6:49ed:4af0 with SMTP id
 fq34-20020a0568710b2200b000e649ed4af0mr2099051oab.102.1650493081470; 
 Wed, 20 Apr 2022 15:18:01 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:486c:c4fd:c4aa:a799:60c2])
 by smtp.gmail.com with ESMTPSA id
 14-20020aca110e000000b00322847e6f53sm3876082oir.46.2022.04.20.15.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 15:18:01 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/23] pcie: Don't try triggering a LSI when not defined
Date: Wed, 20 Apr 2022 19:13:26 -0300
Message-Id: <20220420221329.169755-21-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420221329.169755-1-danielhb413@gmail.com>
References: <20220420221329.169755-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, "Michael S . Tsirkin" <mst@redhat.com>,
 danielhb413@gmail.com, richard.henderson@linaro.org, qemu-ppc@nongnu.org,
 Frederic Barrat <fbarrat@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frederic Barrat <fbarrat@linux.ibm.com>

This patch skips [de]asserting a LSI interrupt if the device doesn't
have any LSI defined. Doing so would trigger an assert in
pci_irq_handler().

The PCIE root port implementation in qemu requests a LSI (INTA), but a
subclass may want to change that behavior since it's a valid
configuration. For example on the POWER8/POWER9/POWER10 systems, the
root bridge doesn't request any LSI.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20220408131303.147840-2-fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci/pcie.c     | 5 +++--
 hw/pci/pcie_aer.c | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 67a5d67372..68a62da0b5 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -353,7 +353,7 @@ static void hotplug_event_notify(PCIDevice *dev)
         msix_notify(dev, pcie_cap_flags_get_vector(dev));
     } else if (msi_enabled(dev)) {
         msi_notify(dev, pcie_cap_flags_get_vector(dev));
-    } else {
+    } else if (pci_intx(dev) != -1) {
         pci_set_irq(dev, dev->exp.hpev_notified);
     }
 }
@@ -361,7 +361,8 @@ static void hotplug_event_notify(PCIDevice *dev)
 static void hotplug_event_clear(PCIDevice *dev)
 {
     hotplug_event_update_event_status(dev);
-    if (!msix_enabled(dev) && !msi_enabled(dev) && !dev->exp.hpev_notified) {
+    if (!msix_enabled(dev) && !msi_enabled(dev) && pci_intx(dev) != -1 &&
+        !dev->exp.hpev_notified) {
         pci_irq_deassert(dev);
     }
 }
diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
index e1a8a88c8c..92bd0530dd 100644
--- a/hw/pci/pcie_aer.c
+++ b/hw/pci/pcie_aer.c
@@ -290,7 +290,7 @@ static void pcie_aer_root_notify(PCIDevice *dev)
         msix_notify(dev, pcie_aer_root_get_vector(dev));
     } else if (msi_enabled(dev)) {
         msi_notify(dev, pcie_aer_root_get_vector(dev));
-    } else {
+    } else if (pci_intx(dev) != -1) {
         pci_irq_assert(dev);
     }
 }
-- 
2.35.1


