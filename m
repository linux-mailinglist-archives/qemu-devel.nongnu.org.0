Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 596CE314306
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:31:51 +0100 (CET)
Received: from localhost ([::1]:43794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9F4Q-00021X-DR
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:31:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCp-0003hp-GK
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:18 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCk-0006Lu-H6
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:11 -0500
Received: by mail-wr1-x434.google.com with SMTP id u14so18423646wri.3
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jJ6Cu/Beow+uQH9ge+yS//OEx9qNhN8s7bcO3l6ph2s=;
 b=l4wC/xsKiPVD5fsJAxarWAJXjWI+HINbfz0QYI0mK2Ly8O5OKovL/NM03zOpGC75B0
 skidZMBNillj8tWJugHmdCfalPWSuUSYHHs+M6pWnqXYY5hb7HN0gHKDtdlkskXfmjvc
 2VdwDHZNbOils1UgNbufMFsTbSGFxlECrAmS0rm9pMfxiiIXU3e1yRcoPCQ6GHDs3gtl
 Uroy/b7wYuzB29PW3A/15YkeOPqaEcd8tNZT6fjcEIycFesl5bMr1gkWr3TAX4uPfhxt
 AvOGOJtPWhgEdfWYoxQthaOtWUNqh+K3I8f662tBma5s8WAAv75lpeeSFwQz7wTDSlgC
 bEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jJ6Cu/Beow+uQH9ge+yS//OEx9qNhN8s7bcO3l6ph2s=;
 b=SiCA6UIi9VXgsSe7CEjOEt7DVpnK/YKHSvWnDPC4r6Cv5fbkHMA3VIv4oG0Imncr14
 NK3jdD91dNuJROvScXvVrzf1cm5aj/drVojPtJkOdwkAZ7Zimz35bKd+f9U8Jpt+27EP
 JV7pjBXDI9GquVco3ZNpsu/wqT7T+e/Qgifs7RREz4+myf1hSFrJeFZZe4hadfYK6LPa
 RaH3OcRMkMRKC5rzYDBwrLAurO53S1EKHj88DuVWji76uMfNBfUQ6dti6F51WCNQMH0J
 lwsgcxRAmj//k3Z4CQU2099byVkwSgY/TUsVSPZmefpBpQlssF8U7RM/9xEqmu4O9O+a
 6hSQ==
X-Gm-Message-State: AOAM5321JsF0y5Z51UhYTsYW1fisXRU/wqav1/x5BprE9QqUPACe8mPt
 XkCytvpx6S4p4coJ0UZsaTmn4elscF0dKg==
X-Google-Smtp-Source: ABdhPJzPoE1Z4mloz/1dqiDNV3XwBZbld3vIemxYIYHdGGY992ShLRuMlRPK8QAehkj0dtpnX+D/YQ==
X-Received: by 2002:a5d:5549:: with SMTP id g9mr22431632wrw.244.1612808649199; 
 Mon, 08 Feb 2021 10:24:09 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:24:08 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 38/46] pci-host: designware: add pcie-msi read method
Date: Mon,  8 Feb 2021 19:23:23 +0100
Message-Id: <20210208182331.58897-39-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Lei Sun <slei.casper@gmail.com>, Li Qiang <liq3ea@gmail.com>,
 Prasad J Pandit <pjp@fedoraproject.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

Add pcie-msi mmio read method to avoid NULL pointer dereference
issue.

Reported-by: Lei Sun <slei.casper@gmail.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
Message-Id: <20200811114133.672647-3-ppandit@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/pci-host/designware.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index f9fb97a3e3..bde3a343a2 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qemu/log.h"
 #include "hw/pci/msi.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_host.h"
@@ -63,6 +64,23 @@ designware_pcie_root_to_host(DesignwarePCIERoot *root)
     return DESIGNWARE_PCIE_HOST(bus->parent);
 }
 
+static uint64_t designware_pcie_root_msi_read(void *opaque, hwaddr addr,
+                                              unsigned size)
+{
+    /*
+     * Attempts to read from the MSI address are undefined in
+     * the PCI specifications. For this hardware, the datasheet
+     * specifies that a read from the magic address is simply not
+     * intercepted by the MSI controller, and will go out to the
+     * AHB/AXI bus like any other PCI-device-initiated DMA read.
+     * This is not trivial to implement in QEMU, so since
+     * well-behaved guests won't ever ask a PCI device to DMA from
+     * this address we just log the missing functionality.
+     */
+    qemu_log_mask(LOG_UNIMP, "%s not implemented\n", __func__);
+    return 0;
+}
+
 static void designware_pcie_root_msi_write(void *opaque, hwaddr addr,
                                            uint64_t val, unsigned len)
 {
@@ -77,6 +95,7 @@ static void designware_pcie_root_msi_write(void *opaque, hwaddr addr,
 }
 
 static const MemoryRegionOps designware_pci_host_msi_ops = {
+    .read = designware_pcie_root_msi_read,
     .write = designware_pcie_root_msi_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
-- 
2.29.2



