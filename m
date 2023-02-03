Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEB26897E7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 12:40:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNuNo-0008F2-9Z; Fri, 03 Feb 2023 06:37:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNuNm-0008ED-25
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 06:37:30 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNuNk-0001HC-J6
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 06:37:29 -0500
Received: by mail-wr1-x432.google.com with SMTP id j25so847582wrc.4
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 03:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A0e0NEin6/qB1UWKlWtZ3V9I0KbRtGgK0QPchGtumd0=;
 b=DMrWgameUQbjcd64+jNpjO/Qc9YTZNVQ3swQhJPAqBtUV/EmghCwdKjgTj5CEKwj4y
 fRyHuxc7qWci9UnH0yaHbzbtaMWV1iMxTikpF0EmFGbb0bOgHS6VH4pk78Fp7CX+TxzQ
 HBNXOo8l7OivuOBEfps/QVSKdI5YnJWQcW3r+4El74ckF3cDG35H9R6/iDjvDMS+8QlE
 jqpxMpgGpr12J1TufqCTxhlPT8jhMH93Sa+mL76OuBCiJ4jqkaQeIcSqA6qd/uvEtbj6
 c8v3J4AOIoTuDvneYP78cFFycmOtIj7/ApTV/HoEmxPmRa6zJeR7aMWT/5/JNvjamfoz
 P53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A0e0NEin6/qB1UWKlWtZ3V9I0KbRtGgK0QPchGtumd0=;
 b=1JlPR7o8KLw7spGd13SYTabzds/95e0fosrlgAp/OTBB56JmWXHhTN6z+EGT4GNAP+
 j2JMw+yUUHbDtV+pL+Ppm7309ueKk60Zhp+TwBoo6w+0/xnhQgoMqSWJcCoqBO/k4nSj
 TER0DRT814phw7N7sVh+E1V4aNzzcP+G38EJCuw5g41UWGcHEmeFthg9DwcWLvEER6TB
 GPdu1pdJQlUyjBjiCFp/KMIoRAUHpdF49pOMK9YqURbrL+fIZ/YJW+BUfsj0Z0RzA8f6
 I+/1PJl6ppxqubMWZIlMogK3qbHOXvAsaJHxshXi1/MlBdGNJoE50Pamk2Pu4xowfzzG
 3oRQ==
X-Gm-Message-State: AO0yUKWrJNkyYEkIATeTSbBSPht3ENTif8LNsQHKeTW+VLCbFTkKMmjU
 bVNtE9EIbIYVev+NlQsFLdb7g+hDoFmuTKQC
X-Google-Smtp-Source: AK7set8EfbMnJIsFpFwNmUNpTxLcxndG7y7Ce3Ee2jgZidGoVyZrQybcbK1oC1K4dF5IxwkAVPcqdQ==
X-Received: by 2002:adf:f68f:0:b0:2bf:ae17:bf58 with SMTP id
 v15-20020adff68f000000b002bfae17bf58mr9143116wrp.37.1675424247207; 
 Fri, 03 Feb 2023 03:37:27 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 s7-20020adfeb07000000b002bff1de8d4bsm1791560wrn.49.2023.02.03.03.37.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 03:37:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 7/9] hw/qdev: Remove DEFINE_PROP_DMAADDR() and 'hw/qdev-dma.h'
Date: Fri,  3 Feb 2023 12:36:48 +0100
Message-Id: <20230203113650.78146-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203113650.78146-1-philmd@linaro.org>
References: <20230203113650.78146-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


