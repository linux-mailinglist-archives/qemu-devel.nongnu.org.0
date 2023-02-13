Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE36C694F9A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 19:44:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRdo9-0000xo-6Z; Mon, 13 Feb 2023 13:44:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdnv-0000sJ-2R
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:43:56 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdnt-0008OX-9t
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:43:54 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso11991136wms.0
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 10:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iJ+QRHFZYIqXqYbl7DIdWxHc+GN5ZGRCj3hAlbpC3f0=;
 b=hxWM/HalDBWkWTKXW8PAyZ7JCyWlypLHbOkZE+hvCtdPG3AH3ab/kBkDGMzf3r5GIB
 EUJMistvc/Fd7tiDDmng0a2+iab8eed8zx7PvJNIchVZbcj40U246C+ypoY+8dR6TKdP
 Vc3rvmvfvvqtNJk/2yAbdEOjYss4cSOhg0bpvb0dBrUfW3hT3WpunMxoqICJc+P7x1+B
 2AGnXITbPFx4UD1fQ/w770OGmRYY/7QWwYDQqaOIk2vOY4Rb08hZzc43+pNftyJ4zd17
 ZMLmVI12hfYgwWZCvRUoHGlAl1d0lMB5TU+bNA2QS39bxPLMI2aVr86Bx0hptSo8m1Xe
 ihZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iJ+QRHFZYIqXqYbl7DIdWxHc+GN5ZGRCj3hAlbpC3f0=;
 b=lno/aEKqjIzwuw82sqFgT+zs+HPiC3EJrXRgMhh9gQKC8Y1dKn03WddAhLM6hKULR7
 m0QM0lweJ6TEcDY1Q7QdUhxn/ZuGvG5TYAnGvYnnRp6CPgyaeCqqpOVRqz4haLYU0htH
 N/VKwoKSY3mKQ81qE/MOa01IvEOimnEepmXw53xlDumAcmjTjCEbgosNZA4XJkSCSAq0
 d3A6Y7etzWIy2o1iQa1xJvb+ZjJ+0O6wkakRoOrZOuWZpkYX/zdW8Ufv942u6NMkPB/6
 jOddXy0WxXUAMzGlVsiMtB6m+r2BGHi8JBGKNHHfPAT4OwuM/frakRhuHFJBoyLXfNtP
 4J3A==
X-Gm-Message-State: AO0yUKWcPx/Q1tOXA8Uv0cz0zZcA7rpz5DSH35tBlyhmFsoRG7asPZhB
 OB3m+ZG7DE93T47vRAyGtaVMD6VLpkr2qjIE
X-Google-Smtp-Source: AK7set82QTwQEsZquQpE/eYBLM4wg+rjrgrMgkFJsfZWh4VYNtOHMZT1VvEN4FICp37eoZQbCvJTpQ==
X-Received: by 2002:a05:600c:4b1c:b0:3df:eb5d:c583 with SMTP id
 i28-20020a05600c4b1c00b003dfeb5dc583mr19498820wmp.17.1676313831607; 
 Mon, 13 Feb 2023 10:43:51 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a05600c1c9500b003e01493b136sm18406084wms.43.2023.02.13.10.43.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 10:43:51 -0800 (PST)
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
Subject: [PATCH v3 02/14] hw/char/serial-pci-multi: Batch register types using
 DEFINE_TYPES macro
Date: Mon, 13 Feb 2023 19:43:26 +0100
Message-Id: <20230213184338.46712-3-philmd@linaro.org>
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


