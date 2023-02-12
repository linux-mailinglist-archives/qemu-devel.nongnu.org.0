Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C6C693A9E
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 23:52:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRLCb-0005I5-Td; Sun, 12 Feb 2023 17:52:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLCZ-0005HL-UR
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:52:07 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLCX-00040S-J7
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:52:07 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 s13-20020a05600c45cd00b003ddca7a2bcbso2388904wmo.3
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 14:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HT2d2u/vjaA1vHLklOaaqzhfI86GF9Vdz9cSYHww3bI=;
 b=To7i0maSdQHkF9uXA6HVlCbWk4Zx6HP/BVK+JNVFJPBpP4rsJ6kbPH9JjgpSW9xsEU
 HDxRLPss8I2t9X6cMdoieOtbg6j3r2tPHPAXkrkavLY+uM84mvu3Kdx6x+ICMfaQetYY
 jHtjCWNLi6Zmcjv8+wMDL9l9NALBt3Wxg8M5xMDeV2k6f+SnKQufnAp3FexcMiIKyvYG
 cr8Mae14lJdWxW/rWsVw49lO5v7uPuwpzJCCio0D/apmMCD8AJ1IQEufl+Divo7zB8mc
 NnWo2PziOg+TpbYw9Vbz7cvzsXcVQ5UD24+dDFI/IDLG7XkF0pPDrxDIL+5PVlcFbXY9
 Dd7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HT2d2u/vjaA1vHLklOaaqzhfI86GF9Vdz9cSYHww3bI=;
 b=LczvMPJxnjuq4Sus3pMB5v/uCJWHZkLrN/IyKjK8ATUo3mi6OArtbUIa+ac/IvHd/F
 RSZVuoNj/tfAdiR++YYQbqj3yV0gs9RqErR0ten0Qgq/9qO5bqAnTYwEu33FUsKsXobp
 MxKzLCXxu2UcNwdILJHIeomXyIMieOjjxwHaU271CzUwx9KYdWwwdM0KT+pkYgNbE6O/
 x/CWlWMFIty/GGDRHBeP2kcSMsIyUVyWTRdn5hVvEJOYSBK+XbHGcyh/N8pcq1GYomSs
 fj7S7LLWX603gY6ghCGaWuEEnzSyGPJFbJqxGJPyhYm+SMbUO9/Jh7IHPptcqKKg35TD
 gdrA==
X-Gm-Message-State: AO0yUKUCiUfIx7RTRUjMt46JHkw19UEEybljQZXz3Bfzl7xw3m393+Tw
 0q909uEr3wzm2rB27WVJR54KOVspi0o3F2M/
X-Google-Smtp-Source: AK7set9FmfE7cHJ/6Nh+boswals/0GIgDrIWPgYXo+SG/9/8V+No3dBziMihIKJnZgdGDqhwpDAIGA==
X-Received: by 2002:a05:600c:4d20:b0:3e0:9fe:34dd with SMTP id
 u32-20020a05600c4d2000b003e009fe34ddmr17582988wmp.4.1676242324374; 
 Sun, 12 Feb 2023 14:52:04 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p24-20020a05600c1d9800b003dd1bd0b915sm15019053wms.22.2023.02.12.14.52.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 14:52:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Eduardo Habkost <eduardo@habkost.net>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xiaoqiang zhao <zxq_yx_007@163.com>, Hu Tao <hutao@cn.fujitsu.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Li Qiang <liq3ea@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 03/19] hw/char/serial-pci-multi: Introduce PCI_MULTISERIAL QOM
 abstract parent
Date: Sun, 12 Feb 2023 23:51:28 +0100
Message-Id: <20230212225144.58660-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230212225144.58660-1-philmd@linaro.org>
References: <20230212225144.58660-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

Introduce PCI_MULTISERIAL ("pci-serial"), QOM abstract parent of
"pci-serial-2x" and "pci-serial-4x".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/serial-pci-multi.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/hw/char/serial-pci-multi.c b/hw/char/serial-pci-multi.c
index 54768d3d53..faeb0a9476 100644
--- a/hw/char/serial-pci-multi.c
+++ b/hw/char/serial-pci-multi.c
@@ -38,8 +38,15 @@
 
 #define PCI_SERIAL_MAX_PORTS 4
 
-typedef struct PCIMultiSerialState {
+#define TYPE_PCI_MULTISERIAL  "pci-serial"
+
+OBJECT_DECLARE_SIMPLE_TYPE(PCIMultiSerialState, PCI_MULTISERIAL)
+
+struct PCIMultiSerialState {
+    /*< private >*/
     PCIDevice    dev;
+    /*< public >*/
+
     MemoryRegion iobar;
     uint32_t     ports;
     char         *name[PCI_SERIAL_MAX_PORTS];
@@ -47,7 +54,7 @@ typedef struct PCIMultiSerialState {
     uint32_t     level[PCI_SERIAL_MAX_PORTS];
     qemu_irq     *irqs;
     uint8_t      prog_if;
-} PCIMultiSerialState;
+};
 
 static void multi_serial_pci_exit(PCIDevice *dev)
 {
@@ -191,25 +198,23 @@ static void multi_serial_init(Object *o)
 
 static const TypeInfo multi_serial_pci_types[] = {
     {
-        .name          = "pci-serial-2x",
-        .parent        = TYPE_PCI_DEVICE,
-        .instance_size = sizeof(PCIMultiSerialState),
-        .instance_init = multi_serial_init,
-        .class_init    = multi_2x_serial_pci_class_initfn,
-        .interfaces = (InterfaceInfo[]) {
+        .name           = TYPE_PCI_MULTISERIAL,
+        .parent         = TYPE_PCI_DEVICE,
+        .instance_size  = sizeof(PCIMultiSerialState),
+        .instance_init  = multi_serial_init,
+        .abstract       = true,
+        .interfaces     = (InterfaceInfo[]) {
             { INTERFACE_CONVENTIONAL_PCI_DEVICE },
             { },
         },
+    }, {
+        .name          = "pci-serial-2x",
+        .parent        = TYPE_PCI_MULTISERIAL,
+        .class_init    = multi_2x_serial_pci_class_initfn,
     }, {
         .name          = "pci-serial-4x",
-        .parent        = TYPE_PCI_DEVICE,
-        .instance_size = sizeof(PCIMultiSerialState),
-        .instance_init = multi_serial_init,
+        .parent        = TYPE_PCI_MULTISERIAL,
         .class_init    = multi_4x_serial_pci_class_initfn,
-        .interfaces = (InterfaceInfo[]) {
-            { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-            { },
-        },
     }
 };
 
-- 
2.38.1


