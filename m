Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C700B689C6E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:58:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNxUf-0003jN-K1; Fri, 03 Feb 2023 09:56:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxUe-0003iJ-7a
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:56:48 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxUc-0005uy-96
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:56:47 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so4066579wms.2
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A0e0NEin6/qB1UWKlWtZ3V9I0KbRtGgK0QPchGtumd0=;
 b=UOwBBOx+pSOAx6o+hT9sEcWjZyxdZrjr2CamsYDUfjBVb7aI3AnVNQUIyblDNfTr0Y
 c0vFDlEzUCDqg/JSurVSKPlGi4X8L0tRnVZesraz9IpixZp83xc2LP89dc0aACmI2cx1
 hlZ5BcxLJ+PBKoq+U0SWPBkN+uYIuyrwDnunGbSjRB6rrg4EpnTGO3GVM+aMNFG4Vl/5
 sSaP6LRx55j625wZbQe5LLmEu3JKXWPUweRd6Zq5jRXKhroGIiUyvlJdJ0E4OUQHOeqw
 ey+j91d3dr0XsRh5cFVBR5NQK2HrY5PwKvKS2lzkY91RiCdYCKUmrG8m++XjwgEnAaIz
 J70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A0e0NEin6/qB1UWKlWtZ3V9I0KbRtGgK0QPchGtumd0=;
 b=4iOwghUiyy+61THbr+3nVTZGxIKjiyvY0zCyOM0ven10JxcgfPOH/sGk2Cq0ly5t8+
 HDCp9J/f7UkDcqZzfJxJCigntRj5eDSFaS25HdAejwLxUNRVzTtYkF5YBXtwhB/Im7+O
 57OrHOCCc2nRl9l8N6njWuqZWCHAJSlQSXCB5uXrLH0aFPYbssA8v+Qvoim8ckwwko57
 GTys3ygVZVuHakUXUePU3DdmNx80eB+yfQrRJr9fUtEYZ9JfDUAZZh4VwK6bszHD6gMs
 RZzcPOYFYc6BIx78Ejx+vnkoTCm06CrpTo0/coB909r4V2Iib/iPi99ezyDpqxGRL5+o
 4NjQ==
X-Gm-Message-State: AO0yUKWqYGlhjeXjDllkOnQx4ym4UjByAf12ISWXINoSw4mtufDXs7of
 aC7B6L2+diabt2iLy19tzLOfHYQsHjIueD9v
X-Google-Smtp-Source: AK7set8xrIRk7MmPQ/e1Ax1xPOTInmLVJ6YNklJuPbsHP3w57///fWzywOZou1vYHJM48NW9GXDkaQ==
X-Received: by 2002:a05:600c:c0d:b0:3dd:a4ad:ae45 with SMTP id
 fm13-20020a05600c0c0d00b003dda4adae45mr9636626wmb.12.1675436205411; 
 Fri, 03 Feb 2023 06:56:45 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a7bc851000000b003dc530186e1sm7952124wml.45.2023.02.03.06.56.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 06:56:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 13/15] hw/qdev: Remove DEFINE_PROP_DMAADDR() and
 'hw/qdev-dma.h'
Date: Fri,  3 Feb 2023 15:55:34 +0100
Message-Id: <20230203145536.17585-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203145536.17585-1-philmd@linaro.org>
References: <20230203145536.17585-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

DEFINE_PROP_DMAADDR() is only used once. Since it doesn't
add much value, simply remove it, along with the header
defining it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/hcd-ohci-pci.c |  1 -
 hw/usb/hcd-ohci.c     |  3 +--
 include/hw/qdev-dma.h | 16 ----------------
 3 files changed, 1 insertion(+), 19 deletions(-)
 delete mode 100644 include/hw/qdev-dma.h

diff --git a/hw/usb/hcd-ohci-pci.c b/hw/usb/hcd-ohci-pci.c
index 6b630d35a7..92cc151264 100644
--- a/hw/usb/hcd-ohci-pci.c
+++ b/hw/usb/hcd-ohci-pci.c
@@ -25,7 +25,6 @@
 #include "migration/vmstate.h"
 #include "hw/pci/pci_device.h"
 #include "hw/sysbus.h"
-#include "hw/qdev-dma.h"
 #include "hw/qdev-properties.h"
 #include "trace.h"
 #include "hcd-ohci.h"
diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 9d68036d23..26c377bf1b 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -33,7 +33,6 @@
 #include "hw/usb.h"
 #include "migration/vmstate.h"
 #include "hw/sysbus.h"
-#include "hw/qdev-dma.h"
 #include "hw/qdev-properties.h"
 #include "trace.h"
 #include "hcd-ohci.h"
@@ -2008,7 +2007,7 @@ static Property ohci_sysbus_properties[] = {
     DEFINE_PROP_STRING("masterbus", OHCISysBusState, masterbus),
     DEFINE_PROP_UINT32("num-ports", OHCISysBusState, num_ports, 3),
     DEFINE_PROP_UINT32("firstport", OHCISysBusState, firstport, 0),
-    DEFINE_PROP_DMAADDR("dma-offset", OHCISysBusState, dma_offset, 0),
+    DEFINE_PROP_UINT64("dma-offset", OHCISysBusState, dma_offset, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/qdev-dma.h b/include/hw/qdev-dma.h
deleted file mode 100644
index b00391aa0c..0000000000
--- a/include/hw/qdev-dma.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/*
- * Support for dma_addr_t typed properties
- *
- * Copyright (C) 2012 David Gibson, IBM Corporation.
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef HW_QDEV_DMA_H
-#define HW_QDEV_DMA_H
-
-#define DEFINE_PROP_DMAADDR(_n, _s, _f, _d)                               \
-    DEFINE_PROP_UINT64(_n, _s, _f, _d)
-
-#endif
-- 
2.38.1


