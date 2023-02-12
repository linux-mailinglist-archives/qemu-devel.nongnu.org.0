Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90707693AB1
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 23:54:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRLDQ-0006rJ-Q5; Sun, 12 Feb 2023 17:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLDA-0006hK-Lt
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:52:44 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLD8-00046u-VD
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:52:44 -0500
Received: by mail-wm1-x32b.google.com with SMTP id u10so7536732wmj.3
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 14:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VotmsYo6EZx1VvqMFkr1+QDMy3wRb1XAiA9w0UCQyq8=;
 b=Ywlz/uy9Jxzl38ShTUU5KnBeIep9MrDy9Q2HGidtumag+9jQvq+5/fe3Yk6paa7HEP
 4qkuGAr3GMkfEjTjfqankAwmcMsCumxRjumc0e7qrOGS2OzuRDv1Laik5MtWf5kkTB+J
 9HmTTfVFfzhPQmnxiMh3ydpbbqOQrvxj3Fpq6GxC3q3IsSdDsBvgzGU7qsd/2TDFDYvG
 q+X0pQUvlhul+Fy5x3IYIAXKPS7JGU7vVynI+QIoyf1HnmH9cncbk8IsEY35GBb38KHU
 qbEK286zA53KkRWJcHPr1S/jzAbddbIaKH1hokAF/ZDDBON9oqTC2+kB7IdBnkBc2xzt
 JycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VotmsYo6EZx1VvqMFkr1+QDMy3wRb1XAiA9w0UCQyq8=;
 b=e98+OUU8/826FAjcsiS+b8n7GfpJ7Ins+cjNHChmevT8L6IYZQl58yhoEWslDPHz+Y
 KRLtEwXHESZUgXXKVOaL7xXaMLVsHpQtD5f5sNv4wyJtk/3ATun8NIBP3h6IEdtQCARm
 g4lFdIjAmrdGe1Cftm5GRFFHHrpcC+q340xK1jL9arcmts2rRQycEoaC8c/zu7N/8ffN
 bC15jK/rMFqU5SlKPd6YkXah61u5rDHqIsYQuiVEUplLmk8Wa4SMP3qCbr5xA2y+HW5M
 b3IueUVfhVt85MBb6ptFrHcAQtPsdVZWgSMHPKqZo+Glp3JfQ4FrxULl71xafLTI/kPu
 YLuw==
X-Gm-Message-State: AO0yUKVDmt4wfwbo/AqNWSXYvt4ZSXPM37LamLl8tsOhvc4180OOtItD
 oXqW7YtT1z6MVQwi5FRIvoIJcA==
X-Google-Smtp-Source: AK7set/MkRBDwyU2o5NvHsna4T9N9lZrt4alhNmJlxwcMpMATSGkB3xPHQjWOxN4zzJPDydUo3SMDQ==
X-Received: by 2002:a05:600c:a290:b0:3dc:5a9f:1c7a with SMTP id
 hu16-20020a05600ca29000b003dc5a9f1c7amr17931410wmb.30.1676242361653; 
 Sun, 12 Feb 2023 14:52:41 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i14-20020adff30e000000b00241fab5a296sm9102845wro.40.2023.02.12.14.52.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 14:52:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Eduardo Habkost <eduardo@habkost.net>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xiaoqiang zhao <zxq_yx_007@163.com>, Hu Tao <hutao@cn.fujitsu.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Li Qiang <liq3ea@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH 10/19] hw/net/ne2000-pci: Replace DO_UPCAST(PCINE2000State) by
 PCI_NE2000()
Date: Sun, 12 Feb 2023 23:51:35 +0100
Message-Id: <20230212225144.58660-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230212225144.58660-1-philmd@linaro.org>
References: <20230212225144.58660-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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


