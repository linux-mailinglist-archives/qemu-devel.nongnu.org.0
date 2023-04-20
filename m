Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 712026E89C4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:51:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppNAY-00011T-SI; Thu, 20 Apr 2023 01:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNAM-0008Ss-9U
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:49:11 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNAJ-0001JS-Hb
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:49:10 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-63b73203e0aso4474091b3a.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969741; x=1684561741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MrtCRX6iQBVwgwLH2Xil/FY7eqoBzL39/3IOXtgkA6M=;
 b=V/mApj3NrUVRrw9q+bIRNF9QUJYkYtYPH3D+c4wehAFEEXVynEbQCeod0fluwAQSNl
 h8QrYLHiSVb2OifNfdDnvrf3+52GN5p0Zrn3SCz+htlJkV1EHuDPOHNEBPu0uTijwtND
 K+Fx4T6HMTCbsctI+KzGDsxU38b0U92kswNo1GVwW8Yir+fCg5YaJoisbpxiJBJwBdP5
 lRmh8tfGGLkzPdMSHAeMFcRYH18WgyjVYX5EOw+w/omM5rQuwEdFwn82gBzFipAJ37Ud
 M6hvLvxwdEtKqwdKOYF7SYx4yQ7GHzgB+IpCn9hN9/PFZ0I2TQq1hs5m8JDG9pFJVUVH
 GTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969741; x=1684561741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MrtCRX6iQBVwgwLH2Xil/FY7eqoBzL39/3IOXtgkA6M=;
 b=HVjeXyEz8OQIhMiJn1bkyU8vK08yoQGoCMpRfUN5dXLqjkb/dDwuwChK3M/WviJZ6c
 zWlAfN3ZNUGoe6OUHpwlkBMDv7YMQuBBNSA6qUyyb6oy47njt7N3JGKHuzq8TjJPRA0G
 h7kGopy+lPwQ4bNkaqH2Ab35q//f5OEKwNYCfbnThm/Eaq53ZLMQ8avKf9sm7FsjWBZU
 WRLdd0nf9wOvPhj9/i8OHTI26ujoCaMJWkJ+m8J6g4vIQDCYzVbkHmTrZSwHudESzHEC
 2g2k7vbq2NTP2eMejtxp+lCcRdr7OXhGr8x4Fg2MHcqIvj+Ays+rmzILnLD2SjcFbdPP
 ZXNA==
X-Gm-Message-State: AAQBX9e4qn0O+L9R+GzuzbRrcMevalJd2fV9MQr1s67X3HoXwiY71CvD
 AACiPZq5WOETsNMVVSYmMmL2Hw==
X-Google-Smtp-Source: AKy350Y6CsGLWgftZumOq6/rIi0CcxUQ89ttVrfCUFwdbkhmfNJLENeqV7ALDcsrx5Z/pOdCX6C0cQ==
X-Received: by 2002:a17:90a:c708:b0:246:aeee:e61c with SMTP id
 o8-20020a17090ac70800b00246aeeee61cmr313061pjt.11.1681969741039; 
 Wed, 19 Apr 2023 22:49:01 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:49:00 -0700 (PDT)
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
Subject: [PATCH v2 24/41] igb: Share common VF constants
Date: Thu, 20 Apr 2023 14:46:40 +0900
Message-Id: <20230420054657.50367-25-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42d.google.com
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


