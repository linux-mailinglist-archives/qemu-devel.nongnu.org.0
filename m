Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AAD693AB0
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 23:54:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRLCR-00059I-8H; Sun, 12 Feb 2023 17:51:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLCO-00058Y-W7
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:51:57 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLCM-0003yQ-ST
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:51:56 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso10046802wmp.3
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 14:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nx8Xgm2tW9Gq4Bio8ruD+Zbqqbx7fjg7obd5raLzp9c=;
 b=avhXU9U3jL6yfb4yRhx0FXLgj6JO0KS8G870YCY8NmHWseTItMhGyl75Zcp5v6wGCm
 d9rcFnYrwQrcFF6h5C6g4OKlQHCCFfnVkCOKgnlMSckRS5K3i76mm+7jufCt4B2Itfdj
 i6klB2bRbz3rT3Iauhw2H2PPdOKVGPONifdeEZIMV5pY5YmQzx/IcmrpWLG9eimAqsIh
 RwLjZKlU0oJrHx5xCBCNuh7gVRAsMrZsLuizP3oi7HSanposQmDvUrVPEnBjg1g6eERf
 y5fX6LAt9ueySB/zGeA/MsZmaRRwsgcSB/4XdZ9rtcRNF0UfIJz8DW0rPznXp1IQqQdy
 Vivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nx8Xgm2tW9Gq4Bio8ruD+Zbqqbx7fjg7obd5raLzp9c=;
 b=KE4UKJyQB8uD0h3QMKli79APlakn7Nwd/i6Xh57trEA0Cwtt9XF/CUGHGC9hUze9iS
 X3Ymtw4+Bs4QYIodhT5+R+Uq2RIMbIH6nqkvOkJjTbShLfolaoPtddQxjxf1rw1f9/+J
 xCtkO2zE/OOeSAmUdka9CoiPwsN2PU6eBhpnv9r0kbx8OQh3v/Pp5klPQC2ZGS9lHfSw
 kWmSjXwonbv3OBwcPrWjqfOlVPYyrBUkJkIGS1Fth/6tL8xjdvJKtgyjRWMYn07bzzDO
 Z/TP6akUMLd7FEQKsTZxaR2XYLYJr88FaJEWeTTWYkfKdDPpVm0kPgXsAsStI2E97E/M
 a5ig==
X-Gm-Message-State: AO0yUKWpx5q4ORdtnVp/bSGF1yC4+0K/F7JFSiBcfSAoovWa4YT2oq51
 tmrm0doft8hvRKqR3LmY7oP1EA==
X-Google-Smtp-Source: AK7set9yvpJQnvPaKQDOWEsyJ0EUrmKIFlppkzlvHZSXyrg735DzZe2ypdEERVB9OBPsj8BEBbSzmQ==
X-Received: by 2002:a05:600c:4a8a:b0:3dc:40a0:3853 with SMTP id
 b10-20020a05600c4a8a00b003dc40a03853mr3202268wmp.11.1676242313682; 
 Sun, 12 Feb 2023 14:51:53 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a05600c3b1100b003df5be8987esm16218119wms.20.2023.02.12.14.51.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 14:51:52 -0800 (PST)
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
Subject: [PATCH 01/19] hw/char/serial-pci: Replace DO_UPCAST(PCISerialState)
 by PCI_SERIAL()
Date: Sun, 12 Feb 2023 23:51:26 +0100
Message-Id: <20230212225144.58660-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230212225144.58660-1-philmd@linaro.org>
References: <20230212225144.58660-1-philmd@linaro.org>
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


