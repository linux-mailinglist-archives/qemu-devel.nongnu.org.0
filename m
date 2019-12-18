Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C50001246F1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 13:35:52 +0100 (CET)
Received: from localhost ([::1]:53550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihYYR-00006u-8W
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 07:35:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50925)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY3Q-0006ft-Cz
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY3P-0001ZE-5X
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:48 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:45885)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ihY3O-0001Vc-R6
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:47 -0500
Received: by mail-wr1-x443.google.com with SMTP id j42so1973769wrj.12
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 04:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=U3vOKBgC/i6K4YScuB6kA+GIuvMW8sSGRrxjWYPsniE=;
 b=cp2WFQZdFjT1tq/07bQw+/SFwFrzH69/UWRF2haQi6dortstS5U4SnMrBmXshgnGln
 qqyNQeDoWg4JUnS2wJIHVozXbKkRcxCvbRufGJvmgc5hqTwgDJBC/hOcz9USKv/SY/mu
 w7939wZhCxPxj3GDRjjzqRk7uBItzWkJeV2Rgft+h4t+ijJhIKiWth3eFO6v4hMrb7RF
 /yV24NbqzwsZPwkiXI5Iobfv1375XnQ6ZEPF/tok8AtvDDsB557/m/WBdxA6eyuMBmd6
 ptZwm716d1o14jT1wUtxRYjZxB0SQcyi8wWdv3dUaRPrQNxbCCk2Zgwema1y4cLo+BLo
 5ONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=U3vOKBgC/i6K4YScuB6kA+GIuvMW8sSGRrxjWYPsniE=;
 b=I99YvWSPBV2ap5TnxzPO3Yq1QYaTZq+2yU/97uxQPxqrOEpS3uU1peYYyMV2OxW3h9
 +6rACVLanWOzHTFC9UQhMzbDDEKt6ndL1wUm4N1T1g/MkO3sHOZ8QiOcii+FdNu1IyMA
 mFPq/xwtc+cD1myOv4WXu0bYNOviNj/swZxYcAhBRD5297KIFN2MtzG+0OKYVq1/86ij
 6+zws+UiVbPQoRm8Was1v1O1lg/c2UQAYPyrAYQrw6CFfftc4r6oY25DMs5xmjmKAvvg
 r+8DMw/iopG5eWgLVI4hDcksd0/Fad1juKLi2jtpVSTNkvLFuqv6Ihb2gcWJPMVwPHne
 21Dw==
X-Gm-Message-State: APjAAAXTfhnyLpFUX6fdJv7K8Nwgq5PEb/b5BksG2XXh0W2RwzvujQjL
 IEvGAzKWhQecvEfuU4umo6vLlgCT
X-Google-Smtp-Source: APXvYqznEiG9Usijk+TmaWMrus2m5qPMDTG36wnvwHtbiZhNoj26YyL4p3N1hngP5Pa6qr6ZW1w1Sg==
X-Received: by 2002:adf:f491:: with SMTP id l17mr2409540wro.149.1576670625640; 
 Wed, 18 Dec 2019 04:03:45 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n67sm2236838wmf.46.2019.12.18.04.03.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Dec 2019 04:03:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 47/87] pci-stub: add more MSI functions
Date: Wed, 18 Dec 2019 13:02:13 +0100
Message-Id: <1576670573-48048-48-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
References: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On x86, KVM needs some function from the PCI subsystem in order to set
up interrupt routes.  Provide some stubs to support x86 machines that
lack PCI.

Reviewed-by: Sergio Lopez <slp@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/pci/pci-stub.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/hw/pci/pci-stub.c b/hw/pci/pci-stub.c
index c04a5df..cc2a2e1 100644
--- a/hw/pci/pci-stub.c
+++ b/hw/pci/pci-stub.c
@@ -26,6 +26,7 @@
 #include "qapi/qmp/qerror.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/msi.h"
+#include "hw/pci/msix.h"
 
 bool msi_nonbroken;
 bool pci_available;
@@ -64,3 +65,29 @@ void msi_notify(PCIDevice *dev, unsigned int vector)
 {
     g_assert_not_reached();
 }
+
+/* Required by target/i386/kvm.c */
+bool msi_is_masked(const PCIDevice *dev, unsigned vector)
+{
+    g_assert_not_reached();
+}
+
+MSIMessage msi_get_message(PCIDevice *dev, unsigned int vector)
+{
+    g_assert_not_reached();
+}
+
+int msix_enabled(PCIDevice *dev)
+{
+    return false;
+}
+
+bool msix_is_masked(PCIDevice *dev, unsigned vector)
+{
+    g_assert_not_reached();
+}
+
+MSIMessage msix_get_message(PCIDevice *dev, unsigned int vector)
+{
+    g_assert_not_reached();
+}
-- 
1.8.3.1



