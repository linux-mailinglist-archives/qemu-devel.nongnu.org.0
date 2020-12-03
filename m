Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D4B2CD64C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 14:01:10 +0100 (CET)
Received: from localhost ([::1]:56944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkoEP-0004sG-J1
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 08:01:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kko6K-0004NH-Um
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 07:52:48 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:46686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kko6J-0008L1-9g
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 07:52:48 -0500
Received: by mail-lf1-x142.google.com with SMTP id t6so2506090lfl.13
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 04:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mwUYW1H+JzV3/GtHWdM4HHeVaxmgzWJndCsLs+sl1Ng=;
 b=BgtQsK8CYLko5vgcOxproEXQ+73QQbr4gxZ080r7M9VDB9OnsVvv/yMggb00l9xIJh
 zNtThGLLBVrnx/1zg6n/xQoB5vuWRyY/L1SpPs/mr3lBuTqimQkVdE+1GQNJJE3c7MvU
 4pOY96mx1gfX/XMnhBRGAKpQbGfB7t6PD1jP9DOsJqgmaYSsqN0UpClaj2AC7VBIEQ/G
 mdfiEbU+Qf5C731hM05I4xJdZBRtQPNfk4X8oXvY86cFPFWNTtbAyPJWg8cxgdKIQOYJ
 egr/q/FFnOyjKGOAKRFfJbh+XsmNaAjfV7hc0kBoNC0qH2RXjImLTWTc7zx83sJL9IrN
 tT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mwUYW1H+JzV3/GtHWdM4HHeVaxmgzWJndCsLs+sl1Ng=;
 b=Ac6v0ZCCwISN9RWuiAQJn468bPcaIPChgKd54xEZeED2FtVgWLX6FUSg74dS/QcGQf
 ELJcJvaSDtE/C03iceK+BUwtb2yESmw9Nzooy7fsdHk0WhmFEAit8ySemNlG2hENFP2F
 OsrjdijcNi4LDqWQXIbyIOAh7ZgvGz8BnCuS0t+bj8fggP+lCTNZ8Tw0g715XJEtIi5D
 oeXCxp3lAEMgT+c1PEFnYOysy77JFZjSl9LdF3nVV2YsKC5HGDd1NWwtEcDIzJ4EVOkN
 kMd3TOFa9ljhC7LzRmwHM0kKEBGNdASoslnZ9kKCcR8rUfBH6Lx3DL/xzLNrzlbwnDmn
 tDPA==
X-Gm-Message-State: AOAM533+FGdpZfwhzBiLSJOF4eFRUjEj0q9ecd9SRWSQRxsHvT72Dlr4
 nWaf4A/VRx/MTinzeNnjV3BwUg==
X-Google-Smtp-Source: ABdhPJyN5qjL2Ch9BCOndJjC6c1/mY97x20lmlcEG6wsT8I74Ek4oUXSdyd+jvXvJIWLoyJD26UxVQ==
X-Received: by 2002:a19:404a:: with SMTP id n71mr1248846lfa.493.1606999965731; 
 Thu, 03 Dec 2020 04:52:45 -0800 (PST)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id b17sm499891lfc.93.2020.12.03.04.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 04:52:45 -0800 (PST)
From: Andrew Melnychenko <andrew@daynix.com>
To: mst@redhat.com
Subject: [PATCH v4 1/2] hw/virtio-pci Added counter for pcie capabilities
 offsets.
Date: Thu,  3 Dec 2020 15:25:16 +0200
Message-Id: <20201203132517.220811-2-andrew@daynix.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203132517.220811-1-andrew@daynix.com>
References: <20201203132517.220811-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::142;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x142.google.com
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
Cc: intel-wired-lan@lists.osuosl.org, qemu-devel@nongnu.org,
 alexander.duyck@gmail.com
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


