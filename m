Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 546B8693EC3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:10:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRSx4-0000Hf-6r; Mon, 13 Feb 2023 02:08:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSx2-0000HB-7X
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:08:36 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSx0-0001lq-Ge
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:08:35 -0500
Received: by mail-wr1-x431.google.com with SMTP id k3so3422279wrv.5
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iJ+QRHFZYIqXqYbl7DIdWxHc+GN5ZGRCj3hAlbpC3f0=;
 b=u3Gh+IuxjomrsTNOql+YKiEbzndy9U+yy1HbwkQSwGAJerXhhnqmcnTLwrjVlyRFab
 f7pJBbzQwm4nb01vIXEiKRvW1/D5lY3xYsvr7taAQ91BSFC74BVe5xaMa2u2YpPwImXO
 SaTEmLCNQtxK75TAUNvXxtTlmvjcPOXNODV9+CkieieCYTcn8qwm1mKvkMIH5S37w64Q
 /3mJIQmcBzTefPnXhvn7YN20G4kBOFfu9NPxvZcF/AKlVdr7/Thv3OX0olh4Ryhv1SDw
 RXIEw80tVZP+FJ6A2CQsu81kOSQMwuvgZWOpjvFXS2HsyO5iNsTE2B7zd76c3JCBa+js
 ROFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iJ+QRHFZYIqXqYbl7DIdWxHc+GN5ZGRCj3hAlbpC3f0=;
 b=ScgCj8cRYFmkq1CFC1oU3tpCp7+dEEPNHzDaJG8DnKr/R2f05qkUqFOWZxi03xoXkC
 V9Eh38VNA8jtx7ShzUO5YNTK2vGcNt+jEWRjb2k4LhVhbHTqmlRhE2aX2dBrV+HVVHM+
 UqlEhRYVDuGMng5kbQj6APXFLJXaCFeSvP4x6bdwbt/y1/7LoAUAg2GFyVHSd42+n4q+
 oyz3xse76vMxxb9TujUmTC6Vq4CgBoSh5coUtTYsB9W4CNbWV87+gPdlD18qs3a1Be8O
 RT67qyv0GaTxKJNGRNdymHcxEAbFaHft+XvKRVCWpnHrUs2qefc8Fyd9pK9CO3PMMasQ
 gqpg==
X-Gm-Message-State: AO0yUKV90VzDjUufmuimwgTve7vTxzmk/Q7msEVfKvBL0wd3iny6pFYu
 013WFBaN77oBrKbGjoUePTz6TpL11Yckswas
X-Google-Smtp-Source: AK7set+sVDVs7jd7rASgA9rU4Sv6tXgSKrfsZbpLVkhJt2xO94GgCiHw+RBJAb1GA+vAkssUPlHFOw==
X-Received: by 2002:a05:6000:1091:b0:2c3:e142:5fd0 with SMTP id
 y17-20020a056000109100b002c3e1425fd0mr21131243wrw.49.1676272112763; 
 Sun, 12 Feb 2023 23:08:32 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p3-20020adff203000000b002c3f6d7d5fesm9816027wro.44.2023.02.12.23.08.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:08:32 -0800 (PST)
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
Subject: [PATCH v2 02/19] hw/char/serial-pci-multi: Batch register types using
 DEFINE_TYPES macro
Date: Mon, 13 Feb 2023 08:08:03 +0100
Message-Id: <20230213070820.76881-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213070820.76881-1-philmd@linaro.org>
References: <20230213070820.76881-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

See rationale in commit 38b5d79b2e ("qom: add helper
macro DEFINE_TYPES()").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/serial-pci-multi.c | 52 +++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 29 deletions(-)

diff --git a/hw/char/serial-pci-multi.c b/hw/char/serial-pci-multi.c
index f18b8dcce5..54768d3d53 100644
--- a/hw/char/serial-pci-multi.c
+++ b/hw/char/serial-pci-multi.c
@@ -189,34 +189,28 @@ static void multi_serial_init(Object *o)
     }
 }
 
-static const TypeInfo multi_2x_serial_pci_info = {
-    .name          = "pci-serial-2x",
-    .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PCIMultiSerialState),
-    .instance_init = multi_serial_init,
-    .class_init    = multi_2x_serial_pci_class_initfn,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-        { },
-    },
+static const TypeInfo multi_serial_pci_types[] = {
+    {
+        .name          = "pci-serial-2x",
+        .parent        = TYPE_PCI_DEVICE,
+        .instance_size = sizeof(PCIMultiSerialState),
+        .instance_init = multi_serial_init,
+        .class_init    = multi_2x_serial_pci_class_initfn,
+        .interfaces = (InterfaceInfo[]) {
+            { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+            { },
+        },
+    }, {
+        .name          = "pci-serial-4x",
+        .parent        = TYPE_PCI_DEVICE,
+        .instance_size = sizeof(PCIMultiSerialState),
+        .instance_init = multi_serial_init,
+        .class_init    = multi_4x_serial_pci_class_initfn,
+        .interfaces = (InterfaceInfo[]) {
+            { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+            { },
+        },
+    }
 };
 
-static const TypeInfo multi_4x_serial_pci_info = {
-    .name          = "pci-serial-4x",
-    .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PCIMultiSerialState),
-    .instance_init = multi_serial_init,
-    .class_init    = multi_4x_serial_pci_class_initfn,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-        { },
-    },
-};
-
-static void multi_serial_pci_register_types(void)
-{
-    type_register_static(&multi_2x_serial_pci_info);
-    type_register_static(&multi_4x_serial_pci_info);
-}
-
-type_init(multi_serial_pci_register_types)
+DEFINE_TYPES(multi_serial_pci_types)
-- 
2.38.1


