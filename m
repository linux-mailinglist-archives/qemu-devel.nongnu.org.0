Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F95693EBE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:09:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRSxk-00024c-EG; Mon, 13 Feb 2023 02:09:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSxh-0001xh-VC
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:09:17 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSxf-0001wA-RW
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:09:17 -0500
Received: by mail-wr1-x42b.google.com with SMTP id by3so9740246wrb.10
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VotmsYo6EZx1VvqMFkr1+QDMy3wRb1XAiA9w0UCQyq8=;
 b=ogaGkjAs5SdqnGs+wckd6uiKcKSFwUUeoWXrNIkRoPX0bYTeVm8G7NRkXpBBqZEYvV
 08t2J2gmL8MoapEEnOrSQYZNDW4uRzsqEzOaHQ82sWtkU2PYNf8cJrCwUo+ceeyJYDHg
 +h28C88vyz4/FlxXgMf2yuFburSPOCRlUc2q9POka4uLOfPu8wq428xZbOFpFgiWMtIS
 x5Ua0zd8MeOk/4GFyjpT8jWz+Y5fyT3kF84JY/4W1HN5eqBLBkvLxXTKQ8JOc4asYN8U
 dviIYfkhIy0Fm9EuAcfO0fEUY8vQnFyV8CqgCgzTyRVGp8AAVheRBFU0K6iIUfcIlrJp
 CRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VotmsYo6EZx1VvqMFkr1+QDMy3wRb1XAiA9w0UCQyq8=;
 b=iffop0a9Sm1tVKqdTSKsgD0tCgTZE1OQKRon7wnEH/iE2SxYOuZnsK+uDSFC+/k25j
 SF7qY4ljYRyWkXqfJi2AUnGemFsoA7jw79AOOx10jCJEiynD/ho14UFp4yFYmnSvAEw1
 IcROfPVfsPtQQntmiE38kyj1mpWmLPdX45CMdUS5/AlWOGS7ji6uUHwf+vTDZjbGKam8
 NGT8kvrbH8Vk7kb5HIOyOZ7LVzhiaWevSKg2P7TLYae2IJrVSv36qqlatnYQ08TYPg2j
 T00djZkdyflYRMiUWxGwrAscJ0Jad0h3D+/fiEX8stjyfX0TQrO0yzjVnf716XjDRZEP
 H/7Q==
X-Gm-Message-State: AO0yUKWpofUk3/7wNLj3HLGYsKf/gvUagplEBIHNim9qSebIQX8FFdxU
 7FchndfP7BmYYiwzDEe4J7g005AQqfyoB8OX
X-Google-Smtp-Source: AK7set/g3kz6xrh5TqgmINqexiuo4KteNsyEcYzA1DsTN8A1u6GX+kxaY62wBsYtMszbd7CfksADfg==
X-Received: by 2002:a5d:6b83:0:b0:2c5:52f9:8e9b with SMTP id
 n3-20020a5d6b83000000b002c552f98e9bmr3302042wrx.29.1676272154325; 
 Sun, 12 Feb 2023 23:09:14 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a5d550f000000b002c55ebe37ddsm416002wrv.115.2023.02.12.23.09.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:09:14 -0800 (PST)
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
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH v2 10/19] hw/net/ne2000-pci: Replace DO_UPCAST(PCINE2000State)
 by PCI_NE2000()
Date: Mon, 13 Feb 2023 08:08:11 +0100
Message-Id: <20230213070820.76881-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213070820.76881-1-philmd@linaro.org>
References: <20230213070820.76881-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

Define TYPE_PCI_NE2000 and the QOM PCI_NE2000() macro.
Use PCI_NE2000() instead of DO_UPCAST().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/ne2000-pci.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/hw/net/ne2000-pci.c b/hw/net/ne2000-pci.c
index edc6689d33..0332e7f616 100644
--- a/hw/net/ne2000-pci.c
+++ b/hw/net/ne2000-pci.c
@@ -30,10 +30,16 @@
 #include "ne2000.h"
 #include "sysemu/sysemu.h"
 
-typedef struct PCINE2000State {
+#define TYPE_PCI_NE2000 "ne2k_pci"
+OBJECT_DECLARE_SIMPLE_TYPE(PCINE2000State, PCI_NE2000)
+
+struct PCINE2000State {
+    /*< private >*/
     PCIDevice dev;
+    /*< public >*/
+
     NE2000State ne2000;
-} PCINE2000State;
+};
 
 static const VMStateDescription vmstate_pci_ne2000 = {
     .name = "ne2000",
@@ -54,7 +60,7 @@ static NetClientInfo net_ne2000_info = {
 
 static void pci_ne2000_realize(PCIDevice *pci_dev, Error **errp)
 {
-    PCINE2000State *d = DO_UPCAST(PCINE2000State, dev, pci_dev);
+    PCINE2000State *d = PCI_NE2000(pci_dev);
     NE2000State *s;
     uint8_t *pci_conf;
 
@@ -77,7 +83,7 @@ static void pci_ne2000_realize(PCIDevice *pci_dev, Error **errp)
 
 static void pci_ne2000_exit(PCIDevice *pci_dev)
 {
-    PCINE2000State *d = DO_UPCAST(PCINE2000State, dev, pci_dev);
+    PCINE2000State *d = PCI_NE2000(pci_dev);
     NE2000State *s = &d->ne2000;
 
     qemu_del_nic(s->nic);
@@ -87,7 +93,7 @@ static void pci_ne2000_exit(PCIDevice *pci_dev)
 static void ne2000_instance_init(Object *obj)
 {
     PCIDevice *pci_dev = PCI_DEVICE(obj);
-    PCINE2000State *d = DO_UPCAST(PCINE2000State, dev, pci_dev);
+    PCINE2000State *d = PCI_NE2000(pci_dev);
     NE2000State *s = &d->ne2000;
 
     device_add_bootindex_property(obj, &s->c.bootindex,
@@ -117,7 +123,7 @@ static void ne2000_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo ne2000_info = {
-    .name          = "ne2k_pci",
+    .name          = TYPE_PCI_NE2000,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PCINE2000State),
     .class_init    = ne2000_class_init,
-- 
2.38.1


