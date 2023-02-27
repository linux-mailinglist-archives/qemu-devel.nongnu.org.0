Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AB66A4459
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:27:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe8A-0004Ls-97; Mon, 27 Feb 2023 09:05:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe7y-0004Eu-AZ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:05:19 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe7w-0008FX-Ma
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:05:18 -0500
Received: by mail-wr1-x435.google.com with SMTP id j2so6330434wrh.9
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hsqxNNnhQ7gTxIdnokXihLeuCOxh7TyQaqkWOyOK8ME=;
 b=sysjHBe10hz+V51SritdZTcs1CRGP9d/nPK4pl09u+eHDG3ijBjlZd2EiBE47fXGqI
 lmSmWucTLJpSxplEkYEKyISxyW/7TerUNVw0yNSj/ebNownzUkb1Om+OjRo7W9UHIyd6
 JPU0udsPVgT7Sf1fAVGD250FUqh4G13U4FFHiBtQu3b+a9/kicALM4ZbdeWfQ6YhtRwh
 5p1hrjkxKgS1XfCXW7ASwdN3oqp0jtnDXqUASCgqxT63IUDhGZSaFR5zUZ7YwiPtldhJ
 FBw0oLTN9n2saa4Fuqz+VblVM0mpXs0oloy9NgG8fFL80LDNdS8ZAh+TWFbBMDJ9FEak
 P/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hsqxNNnhQ7gTxIdnokXihLeuCOxh7TyQaqkWOyOK8ME=;
 b=C4KhNFEn3bNpCsmnuAcLd6zWucTh3gdht8P2fichxmxAYFtyH24J6CfZuHb/6ILLCA
 LjXTA9xGJJKVfq7Vg50VkJIHFzkGXWkPG7i1a3no9g/wPBy2eF2mM/5nSSV9aI5IDbgS
 WmIvC5mSC53oTxqDPxtmWoCzLP1hbGZbpakdOEQt3wY8iB8l4Z2p0dWCEtuTM2+5pij7
 oHldC4nHhphhxFr8Hz6CO7h8l8FLbqq38TgIpQ+C+5U8AK/Q8M45ZhaH5wyFN7uxLQlK
 2x8t2ocyebdYulz9/9psShBqlwCQBmt0t8seiJ2EQ/IF3kdBFHQoQCymzuJ6UZdfALEL
 VSCA==
X-Gm-Message-State: AO0yUKUCXYxLEEU1xTVwEil5J/vGKxq/QStdG8V1Jmb2Q7x2mfeGL3C2
 VMKz2wRSLAvRcWp4nobbCQbYh9y06UQByUTN
X-Google-Smtp-Source: AK7set/rVG2p0vP1jqa3mwxsEt9Tr187OXBcyzOSXxNAJFRuA+sv4q+twFg6fY4ir8+PkORKbI3x3w==
X-Received: by 2002:adf:ec03:0:b0:2c9:850c:6b15 with SMTP id
 x3-20020adfec03000000b002c9850c6b15mr6041808wrn.41.1677506715237; 
 Mon, 27 Feb 2023 06:05:15 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n31-20020a05600c3b9f00b003e8dcc67bdesm14299032wms.30.2023.02.27.06.05.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:05:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 043/126] hw/i2c/smbus_ich9: Move ich9_smb_set_irq() in front of
 ich9_smbus_realize()
Date: Mon, 27 Feb 2023 15:00:50 +0100
Message-Id: <20230227140213.35084-34-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

From: Bernhard Beschow <shentey@gmail.com>

This is a preparation for the next commit to make it cleaner.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230213173033.98762-5-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i2c/smbus_ich9.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
index 52ba77f3fc..d29c0f6ffa 100644
--- a/hw/i2c/smbus_ich9.c
+++ b/hw/i2c/smbus_ich9.c
@@ -80,6 +80,18 @@ static void ich9_smbus_write_config(PCIDevice *d, uint32_t address,
     }
 }
 
+static void ich9_smb_set_irq(PMSMBus *pmsmb, bool enabled)
+{
+    ICH9SMBState *s = pmsmb->opaque;
+
+    if (enabled == s->irq_enabled) {
+        return;
+    }
+
+    s->irq_enabled = enabled;
+    pci_set_irq(&s->dev, enabled);
+}
+
 static void ich9_smbus_realize(PCIDevice *d, Error **errp)
 {
     ICH9SMBState *s = ICH9_SMB_DEVICE(d);
@@ -125,18 +137,6 @@ static void ich9_smb_class_init(ObjectClass *klass, void *data)
     adevc->build_dev_aml = build_ich9_smb_aml;
 }
 
-static void ich9_smb_set_irq(PMSMBus *pmsmb, bool enabled)
-{
-    ICH9SMBState *s = pmsmb->opaque;
-
-    if (enabled == s->irq_enabled) {
-        return;
-    }
-
-    s->irq_enabled = enabled;
-    pci_set_irq(&s->dev, enabled);
-}
-
 I2CBus *ich9_smb_init(PCIBus *bus, int devfn, uint32_t smb_io_base)
 {
     PCIDevice *d =
-- 
2.38.1


