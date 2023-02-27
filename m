Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 781016A43D8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:10:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe50-0001Go-8u; Mon, 27 Feb 2023 09:02:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4K-0000lS-C6
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:34 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4H-0007a0-9R
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:30 -0500
Received: by mail-wr1-x42e.google.com with SMTP id bv17so6337274wrb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KlVlw+pS2hFrB7UptmYDw7cy3LLQizZlFOoz6eLzmsM=;
 b=cxXGaEndh7+OuX+TZ2yTc+x+y7rL/E4bsZJDXjEvRXtTTLJpdBK7JDx8EkeLx9qGwo
 nW22qX0VAK18PSNR4hHGKLFe0UaRaM3FQR5lAebRS60jIVwi7vrif47uurlErnwlwtSM
 aBkVaJrBiNSJWFFJ7fS1AuzJ39NqMID8OWc+levdCR0jbFth3fyuTEfm2zvBfZmagGVl
 U8WltLxFLSZQPw+4vHHEhkxMXbEPvCINVxUtNG+mBJgnHHJiC7k2eAvXQT1Aj6uqBIRs
 DUEtbcXTKVQ7GVo/018Pvh4G2u2A+4mjC7IJIBZZQAgoMX+i3lvPyUWgFjqXJ2b6WKhZ
 93yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KlVlw+pS2hFrB7UptmYDw7cy3LLQizZlFOoz6eLzmsM=;
 b=b1gO9lFfgK2iPs2+HA5ZijCEz8P9AjAiBtlVYV+acu9L11ibB/30/A6f7ahVVQWdcg
 5lBN9uqx/gJszBQwGKl/+OF5v/+qqDmpIJtgj5bo9GFP6CCZVO42tKDf/SW6UBN/vJ1C
 Lq26r8BeoPhG0Wlrag0pY1RnBlNd21O+c9mW92HmceU1Rlh94Uvw4qD/9eKhrcityX2g
 s18C9mCc7azSsBdAZcjHc9EdogK4cO2qeTdrTTY5oosSuRRbxQ8UqgxEaEN/BlyPa3i5
 tsg4XTr8i5Mb57ilyV96rSGnr5U5COSNYluGZjqRc8R9n5B5kvpVAYFlVDBxLMiqLFuz
 xsmg==
X-Gm-Message-State: AO0yUKUSASedaJjlkdbfJOZ2wOsRhLs0W68HQdBjyPAFESMsG9XxkJSN
 vvBSn0I7tvjWITcCYOVefD2lmUS/yEcJIveC
X-Google-Smtp-Source: AK7set8A9yIIi63B44mHDAItgg2IvyeBDxU/tiXUrDYGJIaSi/AlNCdLTG3Ph2EbBU14CmS7vWaYXg==
X-Received: by 2002:a5d:4bc6:0:b0:2ca:7dcd:530 with SMTP id
 l6-20020a5d4bc6000000b002ca7dcd0530mr3957768wrt.37.1677506487343; 
 Mon, 27 Feb 2023 06:01:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d4249000000b002c5598c14acsm7158514wrr.6.2023.02.27.06.01.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 06:01:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/25] hw/char/xilinx_uartlite: Expose XILINX_UARTLITE QOM type
Date: Mon, 27 Feb 2023 14:00:53 +0000
Message-Id: <20230227140102.3712344-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227140102.3712344-1-peter.maydell@linaro.org>
References: <20230227140102.3712344-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230220115114.25237-5-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/char/xilinx_uartlite.h | 6 +++++-
 hw/char/xilinx_uartlite.c         | 4 +---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/hw/char/xilinx_uartlite.h b/include/hw/char/xilinx_uartlite.h
index dd09c068019..753d3a453ec 100644
--- a/include/hw/char/xilinx_uartlite.h
+++ b/include/hw/char/xilinx_uartlite.h
@@ -18,6 +18,10 @@
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "qapi/error.h"
+#include "qom/object.h"
+
+#define TYPE_XILINX_UARTLITE "xlnx.xps-uartlite"
+OBJECT_DECLARE_SIMPLE_TYPE(XilinxUARTLite, XILINX_UARTLITE)
 
 static inline DeviceState *xilinx_uartlite_create(hwaddr addr,
                                         qemu_irq irq,
@@ -26,7 +30,7 @@ static inline DeviceState *xilinx_uartlite_create(hwaddr addr,
     DeviceState *dev;
     SysBusDevice *s;
 
-    dev = qdev_new("xlnx.xps-uartlite");
+    dev = qdev_new(TYPE_XILINX_UARTLITE);
     s = SYS_BUS_DEVICE(dev);
     qdev_prop_set_chr(dev, "chardev", chr);
     sysbus_realize_and_unref(s, &error_fatal);
diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c
index 99b9a6f851e..180bb97202c 100644
--- a/hw/char/xilinx_uartlite.c
+++ b/hw/char/xilinx_uartlite.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "hw/char/xilinx_uartlite.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
@@ -53,9 +54,6 @@
 #define CONTROL_RST_RX    0x02
 #define CONTROL_IE        0x10
 
-#define TYPE_XILINX_UARTLITE "xlnx.xps-uartlite"
-OBJECT_DECLARE_SIMPLE_TYPE(XilinxUARTLite, XILINX_UARTLITE)
-
 struct XilinxUARTLite {
     SysBusDevice parent_obj;
 
-- 
2.34.1


