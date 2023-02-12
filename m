Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C0A693AAA
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 23:53:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRLDY-0007EY-C4; Sun, 12 Feb 2023 17:53:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLDF-0006yK-Dd
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:52:51 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLDD-00040T-Lx
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:52:49 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 az4-20020a05600c600400b003dff767a1f1so7765007wmb.2
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 14:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fD8XsrjHaA7eijBs8OwmQ3XFemQ30TcP+DXj6h7knEg=;
 b=q0W+X9xbRaw7fVi7Mdp/WWatdkTm+Q+44jmjN9sFJ1HWn89XJMmxLzr/HnzMjIWwTv
 u54H1gvj5F/GHcG3oKpbV93tNUT8XOMxhtwqON8UMuYX+D0T3BbAuKvuRfXHVCAD55Xf
 cq3CCLbGSdyRCdaH+YCxKRzxU+TjXX4BZeVzskhVQbQ/XuyXbgJKz1QHeW6MnZM+MUkN
 e+afSxlsEhxzQBtMmauUEZ925IWr0liNzlqa+13cH7lVxlRfHZOyYYVlCyHhpgIJXawC
 ogeZd9AQNu5BwkdVmVulYWZRHIXZBEC5EGYVhOjLUVkHHZErVTPkXB+at+Q2FlgheGea
 6ZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fD8XsrjHaA7eijBs8OwmQ3XFemQ30TcP+DXj6h7knEg=;
 b=K/jHmBh32hWDgmJIYsN2CHsQp3VMqeOdX6whTzkyeUvjNSagBIoc53kR7qRBCQgm49
 d8dIssHAjNwNlXn29kfqZKfPhyi0m0gZaSuD980bZ2DuKfDh1k3oyjXO5pIpbTrs3J60
 iD/uTSysQW5+aE01XyJ+82Q3ckziHq0vJ31UGyH3FtgSa7IVoLO174Ayido/kexOaCeU
 7lOkRpNSUVvr2FzmwB6EDCNuPtEuAhrJJKp6uXeypdMJswm3DxupcW4tXo0LiWqIjIIi
 p1mOp7vMrF01pJAOCy87iaG99kXeilOKYCLU5SCHYwmgZp6U723c5yjNE8kUk+YXnDgK
 KPvw==
X-Gm-Message-State: AO0yUKV8+R6JzA4ACqlzpakBGotFePb59AU7rNgWcbaHIERcNI/pyID1
 KIy+4I3BpVbxPN50DFpN3oKKLA==
X-Google-Smtp-Source: AK7set/WKgnXdI79rkt8qNX2r2WmUg8gKiBTsR0tN6EH20J1MINOpOAKtXu8U21ZRM8ABx4ljCZT7A==
X-Received: by 2002:a05:600c:30d2:b0:3dc:4fd7:31f7 with SMTP id
 h18-20020a05600c30d200b003dc4fd731f7mr16490756wmn.41.1676242366923; 
 Sun, 12 Feb 2023 14:52:46 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v15-20020adfebcf000000b002c3f81c51b6sm9089746wrn.90.2023.02.12.14.52.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 14:52:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Eduardo Habkost <eduardo@habkost.net>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xiaoqiang zhao <zxq_yx_007@163.com>, Hu Tao <hutao@cn.fujitsu.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Li Qiang <liq3ea@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sven Schnelle <svens@stackframe.org>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH 11/19] hw/net/tulip: Finish QOM conversion
Date: Sun, 12 Feb 2023 23:51:36 +0100
Message-Id: <20230212225144.58660-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230212225144.58660-1-philmd@linaro.org>
References: <20230212225144.58660-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Use the TULIP() and DEVICE() QOM type-checking macros.
Remove uses of DO_UPCAST().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/tulip.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index 915e5fb595..990507859d 100644
--- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -19,7 +19,10 @@
 #include "net/eth.h"
 
 struct TULIPState {
+    /*< private >*/
     PCIDevice dev;
+    /*< public >*/
+
     MemoryRegion io;
     MemoryRegion memory;
     NICConf c;
@@ -959,7 +962,7 @@ static void tulip_fill_eeprom(TULIPState *s)
 
 static void pci_tulip_realize(PCIDevice *pci_dev, Error **errp)
 {
-    TULIPState *s = DO_UPCAST(TULIPState, dev, pci_dev);
+    TULIPState *s = TULIP(pci_dev);
     uint8_t *pci_conf;
 
     pci_conf = s->dev.config;
@@ -967,7 +970,7 @@ static void pci_tulip_realize(PCIDevice *pci_dev, Error **errp)
 
     qemu_macaddr_default_if_unset(&s->c.macaddr);
 
-    s->eeprom = eeprom93xx_new(&pci_dev->qdev, 64);
+    s->eeprom = eeprom93xx_new(DEVICE(pci_dev), 64);
     tulip_fill_eeprom(s);
 
     memory_region_init_io(&s->io, OBJECT(&s->dev), &tulip_ops, s,
@@ -983,27 +986,26 @@ static void pci_tulip_realize(PCIDevice *pci_dev, Error **errp)
 
     s->nic = qemu_new_nic(&net_tulip_info, &s->c,
                           object_get_typename(OBJECT(pci_dev)),
-                          pci_dev->qdev.id, s);
+                          DEVICE(pci_dev)->id, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->c.macaddr.a);
 }
 
 static void pci_tulip_exit(PCIDevice *pci_dev)
 {
-    TULIPState *s = DO_UPCAST(TULIPState, dev, pci_dev);
+    TULIPState *s = TULIP(pci_dev);
 
     qemu_del_nic(s->nic);
     qemu_free_irq(s->irq);
-    eeprom93xx_free(&pci_dev->qdev, s->eeprom);
+    eeprom93xx_free(DEVICE(s), s->eeprom);
 }
 
 static void tulip_instance_init(Object *obj)
 {
-    PCIDevice *pci_dev = PCI_DEVICE(obj);
-    TULIPState *d = DO_UPCAST(TULIPState, dev, pci_dev);
+    TULIPState *s = TULIP(obj);
 
-    device_add_bootindex_property(obj, &d->c.bootindex,
+    device_add_bootindex_property(obj, &s->c.bootindex,
                                   "bootindex", "/ethernet-phy@0",
-                                  &pci_dev->qdev);
+                                  DEVICE(obj));
 }
 
 static Property tulip_properties[] = {
-- 
2.38.1


