Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C796EBD02
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:27:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRCx-0003po-PH; Sun, 23 Apr 2023 00:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRCu-0003eR-Ah
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:20:13 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRCs-00014V-J2
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:20:12 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1a80d827179so28947385ad.3
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223608; x=1684815608;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MrtCRX6iQBVwgwLH2Xil/FY7eqoBzL39/3IOXtgkA6M=;
 b=VCqNVXQm4OUYtbFBsTgqD96siMb6/P2AWR9WJU20piHvCilGDW5FeJocF4GowGlG5v
 ZJkVsWCQiFbccHxfjVNd/T5o3tnv3GCT3V2K0u+tam4eox2B8Pm9s+fRtLE7ogqDjtd7
 /dR5fmK2VwAQpEPImXk3yCkdevUp1gbsSVHeErHGxNKW/7zkZfaTtbn2IqGN4ibiSR8b
 P1L3m6ZGxIeg10Esm0DnKc0jesIHCPsvGL1GQsCUsLkIrg7mV2Bv6yGQrpHHb+YEXWfa
 eXv8m+R1W5mKxX6v1R4f1zcLerM2iI1WD4amRL/lO+lTrmUg8o3vYf3WjRKSGqe3KBX0
 GvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223608; x=1684815608;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MrtCRX6iQBVwgwLH2Xil/FY7eqoBzL39/3IOXtgkA6M=;
 b=fkCHN3MKd3tsKEwiD1SwHnrntDQpQdE5RGrnzviCoMdjMBg+YK6kN4I3gjTBF9WqNq
 ni1gml39AtiD/K1hQgEgPvdUCYtUijK2aLX1CFAwGr/KcWN2+/zL//Nj8LBvbBjYUBad
 XViCGWFv5A6EuBuYkrz0EOoeuFqyb9244VE9PyWfdbFE/P8rihh82TAFjp92OxXjhgsq
 bLNkEkb8T5nZZUKNYlIHLYI5EUrd3EHhlvUljqd5on+JGDQJ/i7mHaX+PPvpQkq30POM
 yOfiE9bCGgpXpSfPwJOIZqrpzs5HTeo5FyW395PwO/L6zy4NQnchFyg3GueYSeMl076G
 YUaA==
X-Gm-Message-State: AAQBX9duII8AEE6wIGpc0D59vPZ7FcHsn0d6aRyYGDVZL40M0sIzivth
 G0qGxeA12pHEKg6kpJMZ/erCIQ==
X-Google-Smtp-Source: AKy350bMr1XSSBhpzPMGNofWi1ey7SHAlBmQVP8Pab0nUL/9Kg0hM+YWpDLFHMIxY19xZni5GOB5wQ==
X-Received: by 2002:a17:903:41ca:b0:1a4:fca9:7f44 with SMTP id
 u10-20020a17090341ca00b001a4fca97f44mr12127634ple.56.1682223608193; 
 Sat, 22 Apr 2023 21:20:08 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:20:07 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 25/47] igb: Share common VF constants
Date: Sun, 23 Apr 2023 13:18:11 +0900
Message-Id: <20230423041833.5302-26-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::632;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The constants need to be consistent between the PF and VF.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_common.h |  8 ++++++++
 hw/net/igb.c        | 10 +++++-----
 hw/net/igbvf.c      |  7 -------
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/hw/net/igb_common.h b/hw/net/igb_common.h
index 69ac490f75..f2a9065791 100644
--- a/hw/net/igb_common.h
+++ b/hw/net/igb_common.h
@@ -28,6 +28,14 @@
 
 #include "igb_regs.h"
 
+#define TYPE_IGBVF "igbvf"
+
+#define IGBVF_MMIO_BAR_IDX  (0)
+#define IGBVF_MSIX_BAR_IDX  (3)
+
+#define IGBVF_MMIO_SIZE     (16 * 1024)
+#define IGBVF_MSIX_SIZE     (16 * 1024)
+
 #define defreg(x) x = (E1000_##x >> 2)
 #define defreg_indexed(x, i) x##i = (E1000_##x(i) >> 2)
 #define defreg_indexeda(x, i) x##i##_A = (E1000_##x##_A(i) >> 2)
diff --git a/hw/net/igb.c b/hw/net/igb.c
index 51a7e9133e..1c989d7677 100644
--- a/hw/net/igb.c
+++ b/hw/net/igb.c
@@ -433,16 +433,16 @@ static void igb_pci_realize(PCIDevice *pci_dev, Error **errp)
 
     pcie_ari_init(pci_dev, 0x150, 1);
 
-    pcie_sriov_pf_init(pci_dev, IGB_CAP_SRIOV_OFFSET, "igbvf",
+    pcie_sriov_pf_init(pci_dev, IGB_CAP_SRIOV_OFFSET, TYPE_IGBVF,
         IGB_82576_VF_DEV_ID, IGB_MAX_VF_FUNCTIONS, IGB_MAX_VF_FUNCTIONS,
         IGB_VF_OFFSET, IGB_VF_STRIDE);
 
-    pcie_sriov_pf_init_vf_bar(pci_dev, 0,
+    pcie_sriov_pf_init_vf_bar(pci_dev, IGBVF_MMIO_BAR_IDX,
         PCI_BASE_ADDRESS_MEM_TYPE_64 | PCI_BASE_ADDRESS_MEM_PREFETCH,
-        16 * KiB);
-    pcie_sriov_pf_init_vf_bar(pci_dev, 3,
+        IGBVF_MMIO_SIZE);
+    pcie_sriov_pf_init_vf_bar(pci_dev, IGBVF_MSIX_BAR_IDX,
         PCI_BASE_ADDRESS_MEM_TYPE_64 | PCI_BASE_ADDRESS_MEM_PREFETCH,
-        16 * KiB);
+        IGBVF_MSIX_SIZE);
 
     igb_init_net_peer(s, pci_dev, macaddr);
 
diff --git a/hw/net/igbvf.c b/hw/net/igbvf.c
index 70beb7af50..284ea61184 100644
--- a/hw/net/igbvf.c
+++ b/hw/net/igbvf.c
@@ -50,15 +50,8 @@
 #include "trace.h"
 #include "qapi/error.h"
 
-#define TYPE_IGBVF "igbvf"
 OBJECT_DECLARE_SIMPLE_TYPE(IgbVfState, IGBVF)
 
-#define IGBVF_MMIO_BAR_IDX  (0)
-#define IGBVF_MSIX_BAR_IDX  (3)
-
-#define IGBVF_MMIO_SIZE     (16 * 1024)
-#define IGBVF_MSIX_SIZE     (16 * 1024)
-
 struct IgbVfState {
     PCIDevice parent_obj;
 
-- 
2.40.0


