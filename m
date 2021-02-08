Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 264B2314354
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:57:01 +0100 (CET)
Received: from localhost ([::1]:60532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FSm-0007eo-6K
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:57:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCs-0003jJ-Hl
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:18 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:50955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCp-0006Nm-Ao
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:17 -0500
Received: by mail-wm1-x32e.google.com with SMTP id 190so64671wmz.0
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YrjPSlBHnaJRqA8v7XrPCR75uFzsE6U/RqfZMqsmDSE=;
 b=P/rvsv0rE7R5ZgzxoM2z1ouH0HpdHgMGoQzqPlLkmdiJxlVAYSPsPrYKO+o4k1wpaE
 FXyWmkypKwkbDeWtX2RPDS+ds68kncZeKNTBRP7C9fQgIthOM0E/fxLPrJi152FtguCi
 mNkqoDZ7UakjXdex4kQ2CkifGApdjyY6QkIxFv9UD3xJPneTVyNWK/YhiCHPbFHDy05R
 /Em0cmNWCgLjNg52Bn6eR5wNjQ6+mc9QBsYtid2BJgYPfn2YSvLWXQWUdKee4ZimnHGe
 54u5fDMVTYHT6wm2hTXqmayUDlRMGBJfQE7ZVmPRIx2JFxu/yDQInA2k6YWGudtWnpp4
 HFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YrjPSlBHnaJRqA8v7XrPCR75uFzsE6U/RqfZMqsmDSE=;
 b=kbRtqk6WN8onj12KaFcuqoglxI7c97t/I1nay7i9+JUkcNsFmd6q6ZYPpstIwq2iuV
 9B/HW0jIgwAH/34Zclcvcka2Bem/kEQqTDMPT5yfHDj2YuPlcSshcm8q5WttjGlxN3ST
 OrOIouS6/KAaMHVxDjXJLFwSqr4AQnkIvihYibuyfrcOBxfl1Za6LCHdxkRsMnnfD0o+
 d9t8WJwjcJGgvMqf00+YPVsMyQ3kA2n6BnackA0kBOJ3sMfnfXW+gIK2ddjqIFPO0y1q
 rMzF0P1gA6MDfwzG6QBB8Z8UXdGi9StaYbAF4Suej/vbP0kkURglRR/D2DqNS2H2Bb27
 TczA==
X-Gm-Message-State: AOAM532TAtHHQtYq3uH33SX4EJ0cYycf+J3oH9kp2N0AE3wn4lORrnYw
 pFY7p3Go9fMjPXMk+Fdi1YOXwlbUi7FrZQ==
X-Google-Smtp-Source: ABdhPJwZfjYwMSsG914oP84zj+ueLyHnkmQjeHu/LeW7dVh4CxOplufHqMt7frmU2QzAbc3RE0iY6Q==
X-Received: by 2002:a7b:c215:: with SMTP id x21mr59941wmi.61.1612808653337;
 Mon, 08 Feb 2021 10:24:13 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:24:12 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 42/46] spapr_pci: add spapr msi read method
Date: Mon,  8 Feb 2021 19:23:27 +0100
Message-Id: <20210208182331.58897-43-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
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
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

Add spapr msi mmio read method to avoid NULL pointer dereference
issue.

Reported-by: Lei Sun <slei.casper@gmail.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
Message-Id: <20200811114133.672647-7-ppandit@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/ppc/spapr_pci.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 76d7c91e9c..b89f810034 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -53,6 +53,7 @@
 #include "sysemu/hostmem.h"
 #include "sysemu/numa.h"
 #include "hw/ppc/spapr_numa.h"
+#include "qemu/log.h"
 
 /* Copied from the kernel arch/powerpc/platforms/pseries/msi.c */
 #define RTAS_QUERY_FN           0
@@ -739,6 +740,12 @@ static PCIINTxRoute spapr_route_intx_pin_to_irq(void *opaque, int pin)
     return route;
 }
 
+static uint64_t spapr_msi_read(void *opaque, hwaddr addr, unsigned size)
+{
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid access\n", __func__);
+    return 0;
+}
+
 /*
  * MSI/MSIX memory region implementation.
  * The handler handles both MSI and MSIX.
@@ -756,8 +763,11 @@ static void spapr_msi_write(void *opaque, hwaddr addr,
 }
 
 static const MemoryRegionOps spapr_msi_ops = {
-    /* There is no .read as the read result is undefined by PCI spec */
-    .read = NULL,
+    /*
+     * .read result is undefined by PCI spec.
+     * define .read method to avoid assert failure in memory_region_init_io
+     */
+    .read = spapr_msi_read,
     .write = spapr_msi_write,
     .endianness = DEVICE_LITTLE_ENDIAN
 };
-- 
2.29.2



