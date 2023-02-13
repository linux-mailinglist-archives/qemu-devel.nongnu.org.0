Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 693B2694F9E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 19:45:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRdoE-0000zX-71; Mon, 13 Feb 2023 13:44:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdo7-0000wl-HN
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:44:07 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdo3-0008R1-Si
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:44:06 -0500
Received: by mail-wm1-x331.google.com with SMTP id n33so3340959wms.0
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 10:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fmzU+qV6CluU3J1xGV1AbokblN6ppa6B541b+KpiIv4=;
 b=hhFsKwfl8RPPanqxZ1cHxyJlC3FJrQVRW+AtRh0s31aXN+MrVZi8uM1elzp0JpPIBf
 ExkFH45g/sDVuilF3PL5MUfJKHSQIa3tuzzVCryMyJG2a5u+075Zv1nFk7f3Dan5J4K6
 9ZYANehzrjXAtor9E8q8U0jWkZJs5QflJi+zt/5qwfxpy4d0UASXh9daQgzwR4Fn1nqN
 Nfzbtfb+16vcuZWJXJ43P+1ZcsF1AOlajBuQGEkXjWPvnZpSt3N+J4exbUfGDjpsz7Ac
 AW9oaDeoDPjV6aIK24MgonzHL/vFvBRICQxegVy1F0IYpK9HPLdDcj5KN2JFeK4cXre+
 vQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fmzU+qV6CluU3J1xGV1AbokblN6ppa6B541b+KpiIv4=;
 b=BaHcKSBx6dc8tKMukrgwW7frYtGd7o1rOLFgndmD6Lwrh5gm9MjKYGrSrCO5FG/Vhd
 GCOW0JwFN9P9CHbUUZHu2laZvaJv1lKe2hoJky59ytvzHS0H/pf1y88dS16xqcPDy+Od
 5fLIRnxblB4bcx7YTYv+xDkrJI4d9tNvXX6Y7qs8O53noil9RwXHT7A7qEk0IeETxRkq
 oVq4h3wygUOD5HdJ3lMks979f3PBC1GBgjO9ASZkuppb4XjHg5nWljb8TcE2jE2yeYKb
 AznnE1VWc7iB+gLbAHmYSdbQzb8de210H9fUcMyGYFxFjaF1GK+xvOZxrst4yeQSSfzg
 /x7g==
X-Gm-Message-State: AO0yUKWcAnAkC2iyFXt/+8F3BlwOvcW5/DEmGRxL2HQW5BYVSktD5McW
 0CKejcMeDkbZDwGO3t/sdSWrJSyDjCOGZTez
X-Google-Smtp-Source: AK7set/eEHjVShMKK0yCQbKzE0CZnaPeQ8T3wPxbneoVn1Bv/s9YaSEmz2GFwRn+FU6eCx/180Zpug==
X-Received: by 2002:a05:600c:3299:b0:3dc:496f:ad56 with SMTP id
 t25-20020a05600c329900b003dc496fad56mr18699541wmp.14.1676313842212; 
 Mon, 13 Feb 2023 10:44:02 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 hg8-20020a05600c538800b003e1202744f2sm11839097wmb.31.2023.02.13.10.44.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 10:44:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Hu Tao <hutao@cn.fujitsu.com>,
 Gonglei Arei <arei.gonglei@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Li Qiang <liq3ea@163.com>, Thomas Huth <thuth@redhat.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 04/14] hw/char/serial-pci-multi: Factor
 multi_serial_class_initfn() out
Date: Mon, 13 Feb 2023 19:43:28 +0100
Message-Id: <20230213184338.46712-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213184338.46712-1-philmd@linaro.org>
References: <20230213184338.46712-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

Extract code common to multi_2x_serial_pci_class_initfn() and
multi_4x_serial_pci_class_initfn() to multi_serial_class_initfn().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/serial-pci-multi.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/hw/char/serial-pci-multi.c b/hw/char/serial-pci-multi.c
index e56c0bc841..704be5c294 100644
--- a/hw/char/serial-pci-multi.c
+++ b/hw/char/serial-pci-multi.c
@@ -155,14 +155,14 @@ static Property multi_4x_serial_pci_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void multi_2x_serial_pci_class_initfn(ObjectClass *klass, void *data)
+static void multi_serial_class_initfn(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *pc = PCI_DEVICE_CLASS(klass);
+
     pc->realize = multi_serial_pci_realize;
     pc->exit = multi_serial_pci_exit;
     pc->vendor_id = PCI_VENDOR_ID_REDHAT;
-    pc->device_id = PCI_DEVICE_ID_REDHAT_SERIAL2;
     pc->revision = 1;
     pc->class_id = PCI_CLASS_COMMUNICATION_SERIAL;
     dc->vmsd = &vmstate_pci_multi_serial;
@@ -170,19 +170,22 @@ static void multi_2x_serial_pci_class_initfn(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
+static void multi_2x_serial_pci_class_initfn(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *pc = PCI_DEVICE_CLASS(klass);
+
+    pc->device_id = PCI_DEVICE_ID_REDHAT_SERIAL2;
+    device_class_set_props(dc, multi_2x_serial_pci_properties);
+}
+
 static void multi_4x_serial_pci_class_initfn(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *pc = PCI_DEVICE_CLASS(klass);
-    pc->realize = multi_serial_pci_realize;
-    pc->exit = multi_serial_pci_exit;
-    pc->vendor_id = PCI_VENDOR_ID_REDHAT;
+
     pc->device_id = PCI_DEVICE_ID_REDHAT_SERIAL4;
-    pc->revision = 1;
-    pc->class_id = PCI_CLASS_COMMUNICATION_SERIAL;
-    dc->vmsd = &vmstate_pci_multi_serial;
     device_class_set_props(dc, multi_4x_serial_pci_properties);
-    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
 static void multi_serial_init(Object *o)
@@ -202,6 +205,7 @@ static const TypeInfo multi_serial_pci_types[] = {
         .parent         = TYPE_PCI_DEVICE,
         .instance_size  = sizeof(PCIMultiSerialState),
         .instance_init  = multi_serial_init,
+        .class_init     = multi_serial_class_initfn,
         .abstract       = true,
         .interfaces     = (InterfaceInfo[]) {
             { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-- 
2.38.1


