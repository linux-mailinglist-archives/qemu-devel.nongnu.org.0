Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EF7694FA6
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 19:46:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRdo8-0000tW-52; Mon, 13 Feb 2023 13:44:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdnq-0000r2-2d
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:43:51 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdnn-0008No-Kv
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:43:49 -0500
Received: by mail-wm1-x333.google.com with SMTP id he5so1531754wmb.3
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 10:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nx8Xgm2tW9Gq4Bio8ruD+Zbqqbx7fjg7obd5raLzp9c=;
 b=LjekvQ6JXpGK9dEvBMxMKFxxhnOcCFNY+4jwJOIDh0fLNC0AtqqzbU6VQ1lpfEzSSH
 wlsQsqXnZCz6btSBwVjnYOLogTpKPuHGFiT8IuD07rdmelaZvUrjFbW2yFe4Ubn0PCOl
 UQWm2tAE90R9PJY0yCVLMMl0IdUR8VB7rhsdKMGMNhl4DMYMhDTadDyLkWWhG9q9PkgO
 sc+VNF4y0IWpWhaCLxlr9kcuC5u9z8FAvcmtx4Z5J+RkHpZowPapme2Aes2i9wqOjJzK
 k6EdP16Tj4kEWXDftea8cXGm0x7+Fm2enUun1Csa8T6LIILLHH8k788jfy9ADFqzKrbA
 7dew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nx8Xgm2tW9Gq4Bio8ruD+Zbqqbx7fjg7obd5raLzp9c=;
 b=T9xoR4dLYjlA9OUem8Z6QV2PUOC3qhfaiIQ+AmHxJLKjRzpYgTCce2w+FlPISXAHDa
 hHbpDSiAMZTT7B8Tr2q0t3/DrhGYbOY6G+m8JszS7ejtgwfnhWkek8guKfnyw+Fj5V4L
 mHrY7vL82xVDxpymzVGvd4ich1ZiDsO6G89X0odFDdpjsZT+ebZk11bzyswb9lG60bVw
 J+AfnYt6rrJ5F5BE7mLozzi4TiUyJ4zeJ8uWR5WYd4n7DrFjHdjBuBhFhFQuvgXWy7oE
 nHT/e10fZ3W+MDTEd7eJv896XgVGYvkI+NLzQx4S8uluFOw1qeH7KDTbohsXArfSsgY3
 3QnA==
X-Gm-Message-State: AO0yUKUQKsxSEQ3vj8z1iD1mwOzB/vmnJt5F+4pPWwdO91zw5V0+l9Ok
 AdjlbdbbZ+3he+moL+P4sO6sBQX9GQ3GrmFI
X-Google-Smtp-Source: AK7set+FwJGFsSXEfvfUL0CgboLVrU25L6brOiePRnxkdixl5y2FZ1krjxLy5QYdix4Uc7Pd2AOopA==
X-Received: by 2002:a05:600c:1608:b0:3df:dc0d:f0b3 with SMTP id
 m8-20020a05600c160800b003dfdc0df0b3mr19706716wmn.9.1676313825971; 
 Mon, 13 Feb 2023 10:43:45 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c42c600b003df245cd853sm13850313wme.44.2023.02.13.10.43.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 10:43:45 -0800 (PST)
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
Subject: [PATCH v3 01/14] hw/char/serial-pci: Replace
 DO_UPCAST(PCISerialState) by PCI_SERIAL()
Date: Mon, 13 Feb 2023 19:43:25 +0100
Message-Id: <20230213184338.46712-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213184338.46712-1-philmd@linaro.org>
References: <20230213184338.46712-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Use the PCI_SERIAL() QOM type-checking macro to avoid DO_UPCAST().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/serial-pci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
index 801b769aba..9689645cac 100644
--- a/hw/char/serial-pci.c
+++ b/hw/char/serial-pci.c
@@ -36,7 +36,10 @@
 #include "qom/object.h"
 
 struct PCISerialState {
+    /*< private >*/
     PCIDevice dev;
+    /*< public >*/
+
     SerialState state;
     uint8_t prog_if;
 };
@@ -46,7 +49,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCISerialState, PCI_SERIAL)
 
 static void serial_pci_realize(PCIDevice *dev, Error **errp)
 {
-    PCISerialState *pci = DO_UPCAST(PCISerialState, dev, dev);
+    PCISerialState *pci = PCI_SERIAL(dev);
     SerialState *s = &pci->state;
 
     if (!qdev_realize(DEVICE(s), NULL, errp)) {
@@ -63,7 +66,7 @@ static void serial_pci_realize(PCIDevice *dev, Error **errp)
 
 static void serial_pci_exit(PCIDevice *dev)
 {
-    PCISerialState *pci = DO_UPCAST(PCISerialState, dev, dev);
+    PCISerialState *pci = PCI_SERIAL(dev);
     SerialState *s = &pci->state;
 
     qdev_unrealize(DEVICE(s));
-- 
2.38.1


