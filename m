Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB777693EB8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:09:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRSxD-0000PV-W4; Mon, 13 Feb 2023 02:08:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSxB-0000Ou-Rt
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:08:45 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSxA-0001lq-6D
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:08:45 -0500
Received: by mail-wr1-x431.google.com with SMTP id k3so3422625wrv.5
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kdvTBIlDDxD/zp1XWppgssK6e1Eedl76M1G0yZJNLN8=;
 b=nz/6EonH8MuEfjox7EOv7zUF+Fn4NI7c/Y7qQfyoJOjns0ZmhtE5loZOROmseqKbl0
 fiQAVBAS0uyf6zGOZhXjKwvpXA2Z6nujpC0BkcRZhPgVim/Regy02xfktG6r9xiRTaB4
 P0cfMJ67YG6UMGh+Tjcopdeo8byWqOHBApVe9piwtCD8UZ/bVrOCeuDzdlxvpieU4WO4
 rOKU165f7qIinX8VbzK44cUC84z3sitWM0zsgL0vgB9vGRgD0QLfaDxMh6idc7G6sAym
 kpP95YW/Fc4bJ5i5q86DOmGssGWJIIrsn19KwrBaWQzVbFdncsp5kce/WE3K61MdiZlz
 g1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kdvTBIlDDxD/zp1XWppgssK6e1Eedl76M1G0yZJNLN8=;
 b=w2c5oNwbG4tjL/3kODzHwbItnDFF2k8DC5agYhTJ96MubetH6FsxIvxSLAKwf3vgaF
 EGN3e2yXcsPsjW/sXN4Bk5s28cDC2eeEqAZwr48XD0MsMjWhboWt3HBVbIIcaPUyqKNo
 3sd6nkrRVccZCIFfbzW8J4HpqZPzWu/9s3nx6iy7kjqVmIhCos0xUWrmjQlBMl2YuIem
 aN1F9TevE8PbujBLyinhm0Al4yAwGBsXHKo8mU0TbbI/0EMAZiO5VOePqYbaipGrkb2H
 rQuhQxk1QOP6hFFmA34qg4lBOyVvWyXXcdeY7tYBQCFhCUW8f1KB67/HCkkURWli7AKY
 Tr8Q==
X-Gm-Message-State: AO0yUKXFPvRhyqVI8Goquo8Iq42Hiy9e22cimS4nywgHN4J7rvKTSA2x
 akku+Eos6WQfXm7vaLB31o4wMWkqN1bV4jUK
X-Google-Smtp-Source: AK7set+tpioTFO19dUvuSwJMn01qUuDuQSxLy/VYB3L1mCpq3OVg0hEsceFqyYcOr9S8HakNArNNkw==
X-Received: by 2002:adf:f851:0:b0:2c5:598a:dd05 with SMTP id
 d17-20020adff851000000b002c5598add05mr1144701wrq.2.1676272123284; 
 Sun, 12 Feb 2023 23:08:43 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a5d4d85000000b002c54b0e1405sm7287242wru.88.2023.02.12.23.08.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:08:42 -0800 (PST)
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
Subject: [PATCH v2 04/19] hw/char/serial-pci-multi: Factor
 multi_serial_class_initfn() out
Date: Mon, 13 Feb 2023 08:08:05 +0100
Message-Id: <20230213070820.76881-5-philmd@linaro.org>
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

Extract code common to multi_2x_serial_pci_class_initfn() and
multi_4x_serial_pci_class_initfn() to multi_serial_class_initfn().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/serial-pci-multi.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/hw/char/serial-pci-multi.c b/hw/char/serial-pci-multi.c
index faeb0a9476..cd5af24bd2 100644
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


