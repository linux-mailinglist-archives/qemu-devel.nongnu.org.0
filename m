Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 930B838BC96
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 04:43:10 +0200 (CEST)
Received: from localhost ([::1]:36310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljv81-0008F7-NU
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 22:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ljv7F-0007ZI-2A
 for qemu-devel@nongnu.org; Thu, 20 May 2021 22:42:21 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ljv7D-0006JZ-GZ
 for qemu-devel@nongnu.org; Thu, 20 May 2021 22:42:20 -0400
Received: by mail-wr1-x42e.google.com with SMTP id c14so17728061wrx.3
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 19:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pQOW061I6ggI06cJQz9Q82ngPzUgU5Ye1oYy9HyEIvQ=;
 b=LylVIUa96EC+0RXlRnmZDfhTjqtmIo4Jkm+39siEy8uOA+CkPFzIkhrVPfc5AQtiTW
 g0hDnKrG8M2ebRMBejF3Mb98+XOdtCkJedRfopyeA+MxIdJyoA/7u4neRwpy0ORmThYe
 6H8ObmefNWo6UbxdkX1g6deLZb3N7tuzNBYIhSAkGrRFAK6fbSwb11ySfgXcxKRrx67R
 TvMSLRlj9U4f1qGlJbtFuUR9ehIa/FLPOurF48ACavaS879q383kY9VU+VXRMDo4BvQ/
 7iRWGPrxQVypn4fI+h4S3t0YfR+Kxjw0wsyKtWSShVNs0HCPySKQgZdFdaP0mtGMhMTf
 5VCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pQOW061I6ggI06cJQz9Q82ngPzUgU5Ye1oYy9HyEIvQ=;
 b=dMHXoIMCKm8jKvb3z95ac2hdrgWbSVJS09647XAwWCSIWkeK8JmkkS80zIkT/dHa4z
 YNXTe2y6PapLdDnwMW0SLwC5tc4ibvH9n9Gdc7LG3kooheCCzb1ZHWMNe3foyPj5G8HX
 MMghSM7TUqbqhBxcrVNj0P+ALxQc6lCSIm30ULUIQFcdfgmhAuxzgGC54QOKVbhpln5j
 iwdt4aIMKELje64pm3mJM7z1N46KT5rQCoYw7YUbrt0kj74QJSg+fNSrSY9RdN97ZxJZ
 5SPRm5hoC9RFsoDnrvPv1bfHb7wq2IXSAQVE25OYa2R+5yL0OzeDj2F5PNFpymVkvogB
 bP8Q==
X-Gm-Message-State: AOAM5308FqAKNgGq7RweShtM1TSYtVv4Qkf5yc0jsO/Akluoa2OJ3FyT
 k4L1HREOoDvSUCC/jowTeV0=
X-Google-Smtp-Source: ABdhPJxeKVIcWabe+moCLg8kOkD8iWbYG8rmgcnCy3s1of50EZ5t8aHOLQJWh37OZ4bAvevlqaJExQ==
X-Received: by 2002:a5d:4e91:: with SMTP id e17mr7236162wru.396.1621564938131; 
 Thu, 20 May 2021 19:42:18 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id f20sm4988976wmh.41.2021.05.20.19.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 19:42:17 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/usb: hcd-xhci-pci: Raise MSI/MSI-X interrupts only
 when told to
Date: Fri, 21 May 2021 10:42:23 +0800
Message-Id: <20210521024224.2277634-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>, Ruimei Yan <ruimei.yan@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ruimei Yan <ruimei.yan@windriver.com>

At present MSI / MSI-X interrupts are triggered regardless of the
irq level. We should have checked the level to determine whether
the interrupt needs to be delivered.

The level check logic was present in early versions of the xhci
model, but got dropped later by a rework of interrupt handling
under commit 4c4abe7cc903 ("xhci: rework interrupt handling").

Fixes: 4c4abe7cc903 ("xhci: rework interrupt handling")
Signed-off-by: Ruimei Yan <ruimei.yan@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/usb/hcd-xhci-pci.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
index 9421734d0f..b6acd1790c 100644
--- a/hw/usb/hcd-xhci-pci.c
+++ b/hw/usb/hcd-xhci-pci.c
@@ -67,12 +67,13 @@ static void xhci_pci_intr_raise(XHCIState *xhci, int n, bool level)
          msi_enabled(pci_dev))) {
         pci_set_irq(pci_dev, level);
     }
-    if (msix_enabled(pci_dev)) {
+
+    if (msix_enabled(pci_dev) && level) {
         msix_notify(pci_dev, n);
         return;
     }
 
-    if (msi_enabled(pci_dev)) {
+    if (msi_enabled(pci_dev) && level) {
         msi_notify(pci_dev, n);
         return;
     }
-- 
2.25.1


