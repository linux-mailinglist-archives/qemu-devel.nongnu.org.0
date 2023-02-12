Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F0A693AA1
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 23:53:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRLCW-0005Ex-8s; Sun, 12 Feb 2023 17:52:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLCU-0005Cb-01
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:52:02 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLCS-0003zc-7V
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:52:01 -0500
Received: by mail-wm1-x32d.google.com with SMTP id n33so1533050wms.0
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 14:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iJ+QRHFZYIqXqYbl7DIdWxHc+GN5ZGRCj3hAlbpC3f0=;
 b=BlBwTqLx9F4kMNcRo/5xW0t5FTChw/vNb1Xn1+VeP2/EDIkMbxpndLDQw+znGM1/Jx
 A1fCjgjvlUm/caIA9/ZiuxCdgzea5HgPbcmbFCI3dyEO/BwSLaA3GzByzcVaa9yHzPCs
 H32gCrbrCi+6yhggpfnHNNj41J3TafwTp5b8yf9Z5Z2CjUMkvN93ArYx6oN62OIhccr6
 QzoTHDesj/Sdm9lZZvKxSNX0xpOz52m44NHh4m3X8LESCu8zbrkD91K9KtWmJ+H30NXi
 5hYIzPQKPQZbiQ7rI4ae/bS90QT1b7ugNRY+8muEzrthZm/OIjTOjXkV0MjNyEx40IRy
 R/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iJ+QRHFZYIqXqYbl7DIdWxHc+GN5ZGRCj3hAlbpC3f0=;
 b=Fu1WHgo/3x1Zc5NGL3en7/JMxNSs0un2ewoJHFvGxoAYk8ROzu8hwCyXQFFkQNdenf
 zrI1124NDzutlt809TPGEZA21pGGAEW6QrO4xHWBeg+2f5e6+PwlAP5d22zgA91GASag
 iBsHlvM42tAGQH5d5MVOUhk41D2R/OOZlsqFdqf56GWi6OZrcExkvu7k0nn3Ey1tGxDj
 /8FJfFNY+Dnt41hIGFbjxd8SFQvqD/VzJTl0omdcLfTvd/xMVyUAJ3Sp4QKVp6LZ/U5I
 HXiahZcPbUhQFqQaaA44dJCNeOPDW5DyOQwPBU8IiYPDag2yI33JnedvqEsfpRMkymxD
 jOxQ==
X-Gm-Message-State: AO0yUKXlXoG950pzGIhVSbbdVZZPbt9ErFaRfmhoMwZpgTAEMO+5odDF
 SM3czPXR3v0NPFbwnGP3yvusMQ==
X-Google-Smtp-Source: AK7set+lPjHlTivBxLvb6fTHp//uyw3+txqBQxywZtzimW/O3NSxD7AintItKHIw5lki8ymoT9k+0A==
X-Received: by 2002:a05:600c:180f:b0:3dc:557f:6126 with SMTP id
 n15-20020a05600c180f00b003dc557f6126mr21436610wmp.4.1676242319052; 
 Sun, 12 Feb 2023 14:51:59 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a05600c468600b003dc36981727sm16613013wmo.14.2023.02.12.14.51.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 14:51:58 -0800 (PST)
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
Subject: [PATCH 02/19] hw/char/serial-pci-multi: Batch register types using
 DEFINE_TYPES macro
Date: Sun, 12 Feb 2023 23:51:27 +0100
Message-Id: <20230212225144.58660-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230212225144.58660-1-philmd@linaro.org>
References: <20230212225144.58660-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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


