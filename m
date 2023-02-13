Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8413E694F9F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 19:46:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRdoA-0000y6-0x; Mon, 13 Feb 2023 13:44:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdo0-0000tq-U8
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:44:01 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdny-0008P1-BW
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:44:00 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 m20-20020a05600c3b1400b003e1e754657aso3520756wms.2
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 10:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xzELhgE3er5tMNQ9I7jJncHCuwtWilKXAa2ONw84yPk=;
 b=M21viOpHSiCy0/ZKOZq0RXEE4xTGLz5+ydd2Mf8zV77TFadu504ztwdREBGwdgwnW4
 IG2/RbyCPcw3K1584adJg5/nAAGdzwFdJaiCkiWZwOa4dsxGNB2VALCKOPOfk27B3gSk
 xMq7LPElYcQXPGw3OmT9fcGKYUBh1Oj9aKzck7gTMDsfXrTsNW6vUTAizeXs4v+sud1r
 t+UtepaqnAQb+TFDieh3v6WO2kjv+EV0hiq7wVPQLDEpIKpxzIyZT0IiP6ip9K1s0bbI
 J9B3jcryhcBHPV1NKkW3oHbPyAqS+BiayDap5beGM984GTWvjI87jn9+9FNw3Vb3Ry9U
 J2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xzELhgE3er5tMNQ9I7jJncHCuwtWilKXAa2ONw84yPk=;
 b=zEzBg93nwUgBJIOGLC9/W2+BN7bFT9sML9SKkk2CXMd0R4NBedV4DnErHXxJ+w622c
 EnwFlaQ9M/VwFZ654t8olpCISmBZL8dYURT01RyrZYxAZTVh8Yy9NzlJ9pxp1aAGHeGM
 Rqqs3fEXd/rSiaE+IrKAOa9odRn8J/1Plg2vfekOwL3tOCPJfXX4ozp+kxNTVl/OQfwj
 4dAaLB+2qmfeO6Ejx7bPWySukLjhh1MICcDs94A7+9brAZqd92AICFKxy6uAPl9WzMsp
 M3amgqI1VBCrMl5KbGekFxfBnVcnwZxU8hux6MZWUhCjzlWwrbrX0PfVcGUQT01fBgKv
 F3Uw==
X-Gm-Message-State: AO0yUKUM43684r7VGgMe1laKHdUdSqRNRfhtHfpGT0ouqZVQNdml3Bvf
 Wz8d2UQipShiwQtdcJSX4T8EO2kOgODMolil
X-Google-Smtp-Source: AK7set869JzSwWbaUjraUvTkfaSo6qECxTObZB+u5E4mKPQzEdZIX8MnxlsoRG65zs23nQV6woe2tA==
X-Received: by 2002:a05:600c:4d0a:b0:3dc:50c1:5fd4 with SMTP id
 u10-20020a05600c4d0a00b003dc50c15fd4mr24174441wmp.15.1676313836939; 
 Mon, 13 Feb 2023 10:43:56 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j37-20020a05600c1c2500b003daf6e3bc2fsm25423793wms.1.2023.02.13.10.43.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 10:43:56 -0800 (PST)
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
Subject: [PATCH v3 03/14] hw/char/serial-pci-multi: Introduce PCI_MULTISERIAL
 QOM abstract parent
Date: Mon, 13 Feb 2023 19:43:27 +0100
Message-Id: <20230213184338.46712-4-philmd@linaro.org>
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

Introduce PCI_MULTISERIAL ("pci-serial"), QOM abstract parent of
"pci-serial-2x" and "pci-serial-4x".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/serial-pci-multi.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/hw/char/serial-pci-multi.c b/hw/char/serial-pci-multi.c
index 54768d3d53..e56c0bc841 100644
--- a/hw/char/serial-pci-multi.c
+++ b/hw/char/serial-pci-multi.c
@@ -38,8 +38,15 @@
 
 #define PCI_SERIAL_MAX_PORTS 4
 
-typedef struct PCIMultiSerialState {
+#define TYPE_PCI_MULTISERIAL  "pci-serial-multi"
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


