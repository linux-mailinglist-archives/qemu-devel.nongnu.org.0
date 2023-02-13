Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0232E694FAB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 19:47:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRdoW-0001Nh-2E; Mon, 13 Feb 2023 13:44:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdoR-0001Hj-SC
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:44:27 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdoP-0008Tc-Jn
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:44:27 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso11954767wmp.3
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 10:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VotmsYo6EZx1VvqMFkr1+QDMy3wRb1XAiA9w0UCQyq8=;
 b=gP9ewFH4awNxF2vi0b8jkzWKJ0I8idDoCPVWlFgHGp/VCPiDRsWJZEo/czC6DNh9wv
 iAZnHPe7ZusDLdDCCjbTBoUhmqMmzfGNK/m6/KPRttR6zVV7zbcqSUlq+674DTqlzQsr
 uTW6xLj/x220CydgFWuPc/YqthaVbmaQMIa7lMg6z1opRP86nPA7zDXhZ7pXc+sSdnLa
 FiLFiFUG1gm+rlqYjtxGHI+305ZxxY6CSGN1hTmGCgrYT5h7nMo0S1zmzjTa8MOrKUN2
 ClSOO+Ly2qWes3kWcTbRUoUg70BZs7WWeR0X+fzE3vaJ1qEJN+pLBi/3mYhT6i8JiH2S
 26yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VotmsYo6EZx1VvqMFkr1+QDMy3wRb1XAiA9w0UCQyq8=;
 b=2oKIaAx8GyuikKGHzkzr5nOmR5ykhI24OaxDnU+UTCXn78sTQUpbhTzxDJ62D3spJL
 /o+l29FCVfKglbnFE1ue10hZ4I46kwAmunvWTk60VQo6lTwNVItRMyfXqgV/AH3Qb+oG
 iRF1zDNge+IuEnJ+HMjfWjlWBzf8nqEF7jRsUOpmxKPH7qWVBF2liOP/MfGVnEd5pMXR
 acBVHn62CZnFRIDeFM3rng9/s9rgkRthmqKwHDeQHEhnJpj1WKo5MXEaApymnVm8x3rf
 ewYdRlhqyYSAKE1Hy6ZccpmgMaE4cD7E6OH+VHtMyZsFOr9Z4HnCvsf5kascPnDXheK9
 pwhQ==
X-Gm-Message-State: AO0yUKWAkCZ/enuGqAaujqw9PlAW15IurQf9i5oGzyCoM1TUTU/t153n
 OYKJPjkSvScQ6bdHQ49lrNIQhXoQFp1aI5S8
X-Google-Smtp-Source: AK7set+ttktzTE0funo+iFA5a2T8gBjUoqvrzkcZ/Ca8lK9NiXCf5sXy+/grsVOUzSNomaTkYfeJ5Q==
X-Received: by 2002:a05:600c:491d:b0:3da:2a78:d7a4 with SMTP id
 f29-20020a05600c491d00b003da2a78d7a4mr19705810wmp.21.1676313863858; 
 Mon, 13 Feb 2023 10:44:23 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a1c7305000000b003dc4baaedd3sm17223550wmb.37.2023.02.13.10.44.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 10:44:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Hu Tao <hutao@cn.fujitsu.com>,
 Gonglei Arei <arei.gonglei@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Li Qiang <liq3ea@163.com>, Thomas Huth <thuth@redhat.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH v3 08/14] hw/net/ne2000-pci: Replace DO_UPCAST(PCINE2000State)
 by PCI_NE2000()
Date: Mon, 13 Feb 2023 19:43:32 +0100
Message-Id: <20230213184338.46712-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213184338.46712-1-philmd@linaro.org>
References: <20230213184338.46712-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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


