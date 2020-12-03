Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCFF2CD3C2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 11:36:44 +0100 (CET)
Received: from localhost ([::1]:51124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kklyd-0008Rv-Aw
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 05:36:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kklwo-0007E4-JU
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:34:50 -0500
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:34387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kklwl-0003Bo-Us
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:34:50 -0500
Received: by mail-lf1-x141.google.com with SMTP id d8so2005439lfa.1
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 02:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mwUYW1H+JzV3/GtHWdM4HHeVaxmgzWJndCsLs+sl1Ng=;
 b=Q2SIu9sQWUTuYn44lhPLVlV9wF4y51ClOqHoHXi46UHV8cBiRkvp0hHUYvhiL0xiwV
 H1L3kqTxDnGW1c8oBCUzTprc5PoDKEA9qNAsvsRizzBnHkEC3hU8sCcL+MDZQwiYZHt1
 LcwRbACpykn2QbeltDuLi5cx9z54j6kbJ18xVSrgzylON7V9K0Gf+aaV3qWPd00u0254
 DLK9WAuNXjLrXxN2njvPakg8gvOU4nq+y9iPV+4AQsybC7z2ea/3+HpFUatQyT23fPCk
 YFi8g3thKZkFi6wk8o6btGVN7TZp2Qpjfg1XxZGNxILT8fNTh2AlhTjZDC+6raxJk5rw
 aloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mwUYW1H+JzV3/GtHWdM4HHeVaxmgzWJndCsLs+sl1Ng=;
 b=ts7EMfsh2DCUNTDUfCN3+B03j64allRfl15CazfRTeai7GdEImyvyzwrxZkYh6UG7G
 e9LB+H2yby8S4Tove6THRFitFOuwgld0BUxw6wbrBYQ1Izg+m5MszFEbUg028yRY4kXQ
 9/wJ+KStfhelhymOsGADatddVjY5EM/tUsHZDp8wSBZxHvcdl519TV3cwNfokDVoP+8r
 z0QsXH8hz9XOGczD6+2X27g/jtx4EWd5LfcCZe4H3KF70UkE2MRjRuUvDNR7d2aS6bFf
 t0VWIOZTxTX9ovOVNV2zC7R8Zix4SmqHkCpnLMr+BcLAqW4TEJIq1VhYsWRH6jskOeWz
 ekXw==
X-Gm-Message-State: AOAM531VKKzE6nXBJYVVgTRFPPbCHJ8JtcRXyukd9WU3ZmAgEs0/ep0N
 z4WWdFF8u5ns7pbKlQQFd2W/PFxchBILIw==
X-Google-Smtp-Source: ABdhPJz5FBIk7d2F1D+AV4sdUL7silgNA5r3GzSzP00IzZPCF0ES7BEWq7yv9So89XHtTB637p32VA==
X-Received: by 2002:ac2:46f3:: with SMTP id q19mr1101289lfo.76.1606991685991; 
 Thu, 03 Dec 2020 02:34:45 -0800 (PST)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id q129sm281361ljb.81.2020.12.03.02.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 02:34:45 -0800 (PST)
From: andrew@daynix.com
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/2] hw/virtio-pci Added counter for pcie capabilities
 offsets.
Date: Thu,  3 Dec 2020 13:07:12 +0200
Message-Id: <20201203110713.204938-2-andrew@daynix.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203110713.204938-1-andrew@daynix.com>
References: <20201203110713.204938-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::141;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x141.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew <andrew@daynix.com>

Removed hardcoded offset for ats. Added cap offset counter
for future capabilities like AER.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 hw/virtio/virtio-pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 36524a5728..ceaa233129 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1798,6 +1798,7 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
 
     if (pcie_port && pci_is_express(pci_dev)) {
         int pos;
+        uint16_t last_pcie_cap_offset = PCI_CONFIG_SPACE_SIZE;
 
         pos = pcie_endpoint_cap_init(pci_dev, 0);
         assert(pos > 0);
@@ -1833,7 +1834,8 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
         }
 
         if (proxy->flags & VIRTIO_PCI_FLAG_ATS) {
-            pcie_ats_init(pci_dev, 256);
+            pcie_ats_init(pci_dev, last_pcie_cap_offset);
+            last_pcie_cap_offset += PCI_EXT_CAP_ATS_SIZEOF;
         }
 
         if (proxy->flags & VIRTIO_PCI_FLAG_INIT_FLR) {
-- 
2.29.2


