Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 510BE612D78
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:35:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGtW-000799-QW; Sun, 30 Oct 2022 18:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGrj-00036l-Ns
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:33:16 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGrh-00009x-WC
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:33:15 -0400
Received: by mail-wr1-x42f.google.com with SMTP id h9so13723487wrt.0
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eFvPEfaDB6rbPJi8ArreGGK+PGu2rKPXlBmfG4xKsf8=;
 b=EFHqq4m4RpvrR7WI1fXTikr0U6aGZoYGIOT1OrfqgLvfHZLDEcleiHg/s2nBJbxTYv
 RoBGy7Tn4vztYhHdYP6mbZuCqlTXPpS/rBKJlyUiC3bdMiDY2rWmAQwX5Eq0+NpNtJLq
 Ay7H/nAqVBXJexZhAx+c18hRvh7WKtWbHJnM8hxiz9hNRA+xCoqSBA84yLEv7nqWwz3P
 vMFPa9fG0DoxI1i9ff8OjOs7rb70WvP4uypY8Zg4eUNAFWtT6BUOufneAkjC98zi+S6Q
 bknzOJxmGNVM/cmwClWYy9DltmxXZXYEvvaAZ5RjgNhAclPXmcMRGbyl3xUEYcBoKMD2
 0GcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eFvPEfaDB6rbPJi8ArreGGK+PGu2rKPXlBmfG4xKsf8=;
 b=R95dt8ZNwPZRIad1ok6f8ZnP8ftZ7Hpzt/x8LETRPSR432/2wtC9sQwfKTiPhSsTri
 8WoVseSZuQ+kgvLFB04DQqNfVoPRMMZlkjj0jg/AjxdwI0sNpvVmolzWh5AtS1d6yRgH
 rBrLvxs9g88rTygP/l+mAfWynscbgTVPzzGgr9vAXwYqdziMm5SHQYb73mbAI6gOQK5E
 2NoEeFaY5ZTWiCANRa1AlSDO39S7jiDTLZeIJgdntytQFCAGVtlugpeBfpsCM5NO2DXD
 2a8D949oF6H8fXWzSlS66GT4Zqc7h3Vh2YfZrsS7fL1AowW5BSCuL6QUM4uB/eUE3P7c
 9pPA==
X-Gm-Message-State: ACrzQf1tjc4xXfjRAefAErFlWXukEkAgE1wOBSS24c19lT1ibZZ5IuQu
 W7YkvhPy0gkHWx9P2LF9ip3xZSF/e/zVsA==
X-Google-Smtp-Source: AMsMyM4fEb/w7aOwvP7CQyVJvY/7EdxsR3EPiSdKAmB/VcRMduqICb4QsF4fsRIqxd+WJbQZjqT1pg==
X-Received: by 2002:adf:dc4a:0:b0:236:5ba2:df2b with SMTP id
 m10-20020adfdc4a000000b002365ba2df2bmr6066592wrj.260.1667169192502; 
 Sun, 30 Oct 2022 15:33:12 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a5d4f82000000b0022b315b4649sm5188291wru.26.2022.10.30.15.33.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:33:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 41/55] hw/isa/piix3: Remove extra ';' outside of functions
Date: Sun, 30 Oct 2022 23:28:27 +0100
Message-Id: <20221030222841.42377-42-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

Fixes the "extra-semi" clang-tidy check.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20221022150508.26830-4-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/piix3.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 44a9998752..04895ce2e5 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -375,7 +375,7 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
     pci_bus_irqs(pci_bus, piix3_set_irq, pci_slot_get_pirq,
                  piix3, PIIX_NUM_PIRQS);
     pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
-};
+}
 
 static void piix3_class_init(ObjectClass *klass, void *data)
 {
@@ -410,7 +410,7 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
      */
     pci_bus_irqs(pci_bus, xen_piix3_set_irq, xen_pci_slot_get_pirq,
                  piix3, XEN_PIIX_NUM_PIRQS);
-};
+}
 
 static void piix3_xen_class_init(ObjectClass *klass, void *data)
 {
@@ -418,7 +418,7 @@ static void piix3_xen_class_init(ObjectClass *klass, void *data)
 
     k->config_write = piix3_write_config_xen;
     k->realize = piix3_xen_realize;
-};
+}
 
 static const TypeInfo piix3_xen_info = {
     .name          = TYPE_PIIX3_XEN_DEVICE,
-- 
2.37.3


