Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F254693EBA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:09:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRSxA-0000OI-5R; Mon, 13 Feb 2023 02:08:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSx7-0000MA-N3
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:08:41 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSx5-0001mt-Ij
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:08:41 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso10562826wms.0
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HT2d2u/vjaA1vHLklOaaqzhfI86GF9Vdz9cSYHww3bI=;
 b=APYH9iN5Yuli2RTervmm7poWJgfdpSWNr20Bc7I0/Ru50f4lng5oJTyPtYcpccs85O
 6ZdRj2Qyh/oVsctPVYGy9W3OVyYfhOhwNaipyUXjuF2/RADbZRgSPy0OQxvF+ayJYeik
 FueHekoNAt9sLAhrA/ZbH3eTJ9hfNKohUjivB2P/8R5Av7u/LdtolUzuKR3rxsyi36bV
 X6tXwydt3wngsoqSyOuvgrxn+MKvcIj1UB0zGf6BOvhv5JwANJxzvfprcDOytVt4UUSw
 P4wTFkZUlkZN8TdWX1uMHexMJ6spjsnDXB/p2QC+3coe3Cmh17PYNNeo956/bEcj5qUH
 6BCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HT2d2u/vjaA1vHLklOaaqzhfI86GF9Vdz9cSYHww3bI=;
 b=SlAkOoxXyJrCAq3yQnxvHMfUQlYDQTJgmitAXlOBBJUej5jDxCYIbHArWhrX+JwDFc
 5rQpO2oQv5WTAr9+lKIIO57MKWSQDr9dRUKbeKcnl2TF7akeRKX1ucCiuG85tl40or1k
 sympjuc/Atc+0Pxdp8k/zB+peH4yzF0zWr9UPDYDGe13nrzMV/al1/xPbI2jdirbYHG3
 D2B3En5PDoIZ1BfG00fVVEDG6AY8IQeLT3Gk0+ABkaN1sgnGQNMYkJOV8FkYAqaZYxgh
 Va1d441gRXCsT3JIZT/kKIBFeOfYloL3PEEuw8QSfqj0GRTLZZITgByQHTQ5zycntqt5
 LPfQ==
X-Gm-Message-State: AO0yUKUmIoul6l++6ESeWP7d4nXT9LQG6Yov2vMgPyQssb7CYU3WZJYs
 nenUjDSnqoHrI/QDK0EcsPeadDXp5SpHBlxX
X-Google-Smtp-Source: AK7set/Dk4VtJlutKXBvIeulGoMdeg5NVNgmi9afCG8NrTSAdkdirmu87YQSQpCLytf22+6Rqy252g==
X-Received: by 2002:a05:600c:2ac8:b0:3db:66e:cfdd with SMTP id
 t8-20020a05600c2ac800b003db066ecfddmr17990179wme.9.1676272118072; 
 Sun, 12 Feb 2023 23:08:38 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a05600c220400b003dfe8c4c497sm16214893wml.39.2023.02.12.23.08.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:08:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Li Qiang <liq3ea@163.com>, qemu-s390x@nongnu.org,
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 03/19] hw/char/serial-pci-multi: Introduce PCI_MULTISERIAL
 QOM abstract parent
Date: Mon, 13 Feb 2023 08:08:04 +0100
Message-Id: <20230213070820.76881-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213070820.76881-1-philmd@linaro.org>
References: <20230213070820.76881-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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


