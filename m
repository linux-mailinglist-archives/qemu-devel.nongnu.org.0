Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8699269CA4A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 12:52:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU4hp-0001kb-Ug; Mon, 20 Feb 2023 06:51:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4hn-0001jo-Vl
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:51:40 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4hm-00056v-E0
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:51:39 -0500
Received: by mail-wr1-x429.google.com with SMTP id t15so968263wrz.7
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 03:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=czXwdqthQ5iacnX5do69zMxtKzZ1dl3WlnS0e9zwEDE=;
 b=b2DjAQfnxzKe3h+ZHHA22LUFtI9mytzQYQysG0K7h+w9xmboePDKh2M9B1k2BOzEO0
 YkSfC5cqUvU9v7E2F4BgcyG44uXVe+ZXvG4vVkZeB45t6fh19w9UXjevYSD8FIXZpfPY
 78D22PzQQtESoOKHkIGF07q/UGkIzXrm86eB7k60m/4rJ8Td7esoRBHZ3ggtfUD//Tv3
 n4B9evQhpc+NVdS70Wpyj4kcEiz+8nZspxzs3ZlaXbQL4AvkwP0onVIDGjtHJZInsMwO
 N0SOMAauxRXy9WUW5oEb2fxoJDiqjX+fXdpdFUTL92By/3RPk0pN63YJ2SzOPgesXs5T
 /SAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=czXwdqthQ5iacnX5do69zMxtKzZ1dl3WlnS0e9zwEDE=;
 b=eEz1ls+kLr+/mYGq1wyCCJUO7RlITorI9C3Z+JULZQm9kW9DorVCPaVfiTatXUG9rJ
 f/Qh+qQ8nuxNanPe9Ipk8u1tr//IOUy/D9Nye5VXs8ELzdp0YHY6zPwgUJ0KL7T58sSV
 jDz22AD0ldThqNUEt+DWG++KOo4JPbrly91zwa7txov0ynn5fT54AwGJ2lgIf255d9Ft
 CXNJlkigy2OMHp/gwh3tov6RHK4KRLcCMnKBNAuRbp7VRVROelVOdp0AjdEjOYK0SH2G
 IOHWb58/hF8CljruOrfelyFMARX203WqojKkrHdsKMuIRcR0LmRCCUsz6FSlDpGAZOHo
 RGlg==
X-Gm-Message-State: AO0yUKVkx9MdDY8/6mbNuDcZRN9BUq3jTV/97Vk0ZrO4ljZS/h4k37ue
 i6dVdjbaNwb0aSr0fFUbc2FKNsH1GR9qo6Bv
X-Google-Smtp-Source: AK7set+H5fqA0/SEBI6do3W1i4gMxS86GIpzpX572wnNvvzNStCLNx5wLBHyTMATON7+1cWv2t6wCw==
X-Received: by 2002:a05:6000:1c5:b0:2c5:941d:26b8 with SMTP id
 t5-20020a05600001c500b002c5941d26b8mr431674wrx.15.1676893896874; 
 Mon, 20 Feb 2023 03:51:36 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l18-20020adfe9d2000000b002bfe08c566fsm2001141wrn.106.2023.02.20.03.51.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 03:51:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/8] hw/char/xilinx_uartlite: Expose XILINX_UARTLITE QOM type
Date: Mon, 20 Feb 2023 12:51:10 +0100
Message-Id: <20230220115114.25237-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220115114.25237-1-philmd@linaro.org>
References: <20230220115114.25237-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/xilinx_uartlite.c         | 4 +---
 include/hw/char/xilinx_uartlite.h | 6 +++++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c
index 99b9a6f851..180bb97202 100644
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
 
diff --git a/include/hw/char/xilinx_uartlite.h b/include/hw/char/xilinx_uartlite.h
index dd09c06801..753d3a453e 100644
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
-- 
2.38.1


