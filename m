Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F05693A9F
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 23:53:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRLCg-0005K3-Rk; Sun, 12 Feb 2023 17:52:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLCe-0005Io-Qq
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:52:12 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLCd-00041D-1b
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:52:12 -0500
Received: by mail-wr1-x430.google.com with SMTP id co8so6695713wrb.1
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 14:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kdvTBIlDDxD/zp1XWppgssK6e1Eedl76M1G0yZJNLN8=;
 b=EJRxRY3hKHa/rfUJGZCoJCOVgu23RJ/r3/Y057Zb8/O4CMg83atUO9tLTnLclreGV9
 ZRR0kPasfIFz86dStzCOuzartlgwXN/FmIUGsSvMKKGymnNzQWuEunrSW5NtNgrjXWfu
 eR+/mZHBiZ7pnZ+BmMnlnHCKnmyKkoRZuSCBwHyJR58o+6UGG3MZkmVC+IkYkvb+gITj
 BS6gDQ/8He8DskDgAkoT1/xiPo0uKqs4iUo7gTE3Iz5kaIjoGdp+veoIK+jjUITTS9cO
 7fVD+YQRYc8cDSox1VVgKUMz2Baot4mL4FV390r9ADoQp+ozENWRfkW0v+xdebgct8Es
 OM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kdvTBIlDDxD/zp1XWppgssK6e1Eedl76M1G0yZJNLN8=;
 b=2DxsInK2ohvE8Nv2dyTCo+MoeFzzGCMB8IC5xv4J7DahjMAE4n2P27HMVnZXxguNaU
 5dZcH+7D29rWOAYRNGa3FmvC4SXlPbVwSxsH8tSEBsq7zK9H8DAL7OHccquDwrZ3H4nf
 Qh2SEGXsvrGmr1ZLj6LbR3uvqow4gy3DbjZyFnH8wOd4ld2Ce7cN/McnCVjDawXj5WcC
 AJ2/aH/Oo4QfnkS/HPiVdc1NwfaAJrnIY3c6J++p64aImf1KnEeyx5gNxktRDHdRX897
 89JiG6+4Nc44aUdDNQAlZZmLZE0v4J+JqT9ieIkatOfaeWtF9+VCKmeXvdP3540ZLeRn
 C21Q==
X-Gm-Message-State: AO0yUKUCY3iQH7R7AHTaK7jnyxSSfcp2CS4L1Na4coz04wndxR3IM43j
 X2reQ1wc3icdgld3umy6Z85kzw==
X-Google-Smtp-Source: AK7set+SJAxsXABXefqFPHeeSLX3q7BMcZv4AIfvXUlqJuqZxfgg405F/4YoJbHsHBaaHi6HoyaXjw==
X-Received: by 2002:a5d:6108:0:b0:2c4:3d5:46dc with SMTP id
 v8-20020a5d6108000000b002c403d546dcmr13444357wrt.37.1676242329773; 
 Sun, 12 Feb 2023 14:52:09 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f15-20020adff98f000000b002c5583ab017sm1630002wrr.15.2023.02.12.14.52.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 14:52:09 -0800 (PST)
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
Subject: [PATCH 04/19] hw/char/serial-pci-multi: Factor
 multi_serial_class_initfn() out
Date: Sun, 12 Feb 2023 23:51:29 +0100
Message-Id: <20230212225144.58660-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230212225144.58660-1-philmd@linaro.org>
References: <20230212225144.58660-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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


