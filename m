Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 898E06E228D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:48:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHmW-0003ZA-8c; Fri, 14 Apr 2023 07:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHmE-0002dE-5F
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:39 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHmB-0001RV-8H
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:37 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 l9-20020a17090a3f0900b0023d32684e7fso8351399pjc.1
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472374; x=1684064374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iGGkpOeRoMnbppxreVdfShoqcfQT5nlYtzSOOL7DPQ4=;
 b=acsr918Bt52Wj9N3nNpoi2gUZB0ik2QJFt03n0RlXHSJcpZbBRnducJQc+oL1A7ztB
 7ws+xrNTR3M74U/zW7BwGG15L7xbZayYOvUEUIizoojnZChN69mvd4dbf/myb4qa8Ypy
 0JQkcxsB3yRcCkG6ng/qCf1maUicEtoHP6HxYYKpyMhgfyB23cSLQLsZCm8yXnGCma+M
 R01dHo5r7MNx3VkzrnUDviueoO+8MWyx4NA1GuhrR48waDsZz7LTRHhxaI3RvHo7oNzP
 wgwxfQTlYKvdNJW0dlwK73BRzT7EFQwDNlsKH8RGCEljD7y8QVywM9GWRszOv68tcQdC
 S1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472374; x=1684064374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iGGkpOeRoMnbppxreVdfShoqcfQT5nlYtzSOOL7DPQ4=;
 b=UTwRdIt4thaIOGfvm1PmjWovyzbJv4SDpGsIKPxZWjWGmG2I2ZmPwLad7TIRPkQfdL
 g3+RA3XMwleldFz6wwfw5x79mIrbHJd2WkvTL9ylBisPiWaIeKqPwSk9wqVpdh1OQHjx
 JqvIEgu9h5sOd7dc+9OSvLccoqrHjzrP5sc39v430nAiu70qDXtH3QFyo3xwurl/K630
 M9rZCi2sTykBtMrYyCJRXUn9hh1e5FvG0Kwa76CAoKmPtSQyGwsVtqAUt03aU6GOuRRG
 n+J5LjwYO2aM357vu21KwDQMcDyZLqJYII/mw/0VDXHHuesYkrAxl61vft7AhuSTy6Ie
 F2PQ==
X-Gm-Message-State: AAQBX9fuRPVF8laSdvsKFinpHlXlJkXnpur5nkkfDw/xiD8wEHIBMSJg
 QH5JO8mJ1lHWgmKAzA8W8lAAOw==
X-Google-Smtp-Source: AKy350Zat4OuoZjXRvMjJ2s3CPRzFkGNJcUoCEYGOczkIRhFMDYOIIO7IcXgnuRLb3glPiMYBqomGA==
X-Received: by 2002:a17:902:f706:b0:19f:3b86:4715 with SMTP id
 h6-20020a170902f70600b0019f3b864715mr3057406plo.8.1681472374608; 
 Fri, 14 Apr 2023 04:39:34 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:39:34 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 23/40] igb: Share common VF constants
Date: Fri, 14 Apr 2023 20:37:20 +0900
Message-Id: <20230414113737.62803-24-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102c.google.com
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
---
 hw/net/igb.c        | 10 +++++-----
 hw/net/igb_common.h |  8 ++++++++
 hw/net/igbvf.c      |  7 -------
 3 files changed, 13 insertions(+), 12 deletions(-)

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


