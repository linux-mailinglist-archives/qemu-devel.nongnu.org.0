Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4511E69C638
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 09:01:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU16e-0007OF-OW; Mon, 20 Feb 2023 03:01:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU16R-0007Lr-Q0
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 03:00:51 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU16P-0007J6-Az
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 03:00:50 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 az11-20020a05600c600b00b003dc4fd6e61dso267371wmb.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 00:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yfAOCbOrpz6J6Wxsrdg+3kMQlvdMfu+E0+Y8RNVdPuE=;
 b=MZBvc/ePri99FNYVQiOdAXW3PTCRPuqmM+LKoXF+tkmqwD3oVf9ewenOPfRmgfozwf
 IjU2LAOk5pEPnblsbeb5srpGlMIi4z8wzOSAjVI0ubdqm0zzeHqguIWZAFKrN8o2PwNE
 fimFgOHV58Ndc67mbHNmIK1imqdvGLSEG4EKko3m3A6T9ZfIFMVadpoGORSESPrfwPje
 6uCmKkH/fV8lMhkTwCbSuoDTv9PYdbhWShZDOrS++1zMyaz267II7GlnfuzuAWcU3kgh
 z5y7QlBfQQcS23k8CwwwqioWx5S6GqESgp8IpjdvD4wp2qqddo8F87DejKuuNSafZ562
 KdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yfAOCbOrpz6J6Wxsrdg+3kMQlvdMfu+E0+Y8RNVdPuE=;
 b=UaoFRNLxUs9BkwU2TwO4sNd3NtIHE6JYu7f9wPCzwqPp6hkZPuANpTjuHCrOR3VUMS
 uPnDf+/qjqBNkZV0fsWDiBsIvVTWqOfoETEKLid4vEKcVyLTNBqV/LnGLO0eGj0oAGwu
 u1Qc0Y6hbNgQ1c2A5G8C7CEYssw3Ml5sPUJPfYr0llJ+WSGUs/wJM/B+1sfQzLtEHGf6
 mfr+QmJH8Rdi3ePNoxFnvX7Mbg7e6+qIfXXzyLr/896tX+tijHO3xa5UPm5IZN4pjAvz
 uH35Pw8qkBiY8YDOGcryscxsz+PHoibqtjhcVu3pnlEcE8O+ec6PgHoJn1d7JkqfoYT+
 +SEQ==
X-Gm-Message-State: AO0yUKULKTcVQG7FurEpU11rROLRHsPD4A6CNdnzCgj3CSfxbrVVBvf/
 i179KxNWQ7UxIeOCtKZwzIEz1yamEU3y4rym
X-Google-Smtp-Source: AK7set/m/2dSzDDQzNPwLIL3JU3N74tidwQv8ABObAYxtPd/vcAGAcaaNVmFPlz6OLd/IU5a88G6mg==
X-Received: by 2002:a05:600c:4e41:b0:3e1:feb9:5a2f with SMTP id
 e1-20020a05600c4e4100b003e1feb95a2fmr11261731wmq.2.1676880047575; 
 Mon, 20 Feb 2023 00:00:47 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 1-20020a05600c028100b003e200dc15f5sm13314808wmk.42.2023.02.20.00.00.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 00:00:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 kraxel@redhat.com, mst@redhat.com, qemu-block@nongnu.org,
 hpoussin@reactos.org, richard.henderson@linaro.org, eduardo@habkost.net,
 John Snow <jsnow@redhat.com>, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 06.5/18] hw/ide/piix: Allow using PIIX3-IDE as standalone
 PCI function
Date: Mon, 20 Feb 2023 09:00:44 +0100
Message-Id: <20230220080044.4646-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215161641.32663-1-philmd@linaro.org>
References: <20230215161641.32663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

In order to allow Frankenstein uses such plugging a PIIX3
IDE function on a ICH9 chipset (which already exposes AHCI
ports...) as:

  $ qemu-system-x86_64 -M q35 -device piix3-ide

add a kludge to automatically wires the IDE IRQs on an ISA
bus exposed by a PCI-to-ISA bridge (usually function #0).
Restrict this kludge to the PIIX3.

Reported-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/piix.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 9d876dd4a7..50975a16b3 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -170,6 +170,17 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
 
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
 
+    if (!d->irq[0] && !d->irq[1] && DEVICE_GET_CLASS(d)->user_creatable) {
+        /* kludge specific to TYPE_PIIX3_IDE */
+        Object *isabus = object_resolve_path_type("", TYPE_ISA_BUS, NULL);
+
+        if (!isabus) {
+            error_setg(errp, "Unable to find a unique ISA bus");
+            return;
+        }
+        d->irq[0] = isa_bus_get_irq(ISA_BUS(isabus), 14);
+        d->irq[1] = isa_bus_get_irq(ISA_BUS(isabus), 15);
+    }
     for (unsigned i = 0; i < ARRAY_SIZE(d->irq); i++) {
         if (!pci_piix_init_bus(d, i, errp)) {
             return;
@@ -202,6 +213,13 @@ static void piix3_ide_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_STORAGE_IDE;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     dc->hotpluggable = false;
+    /*
+     * This function is part of a Super I/O chip and shouldn't be user
+     * creatable. However QEMU accepts impossible hardware setups such
+     * plugging a PIIX IDE function on a ICH ISA bridge.
+     * Keep this Frankenstein (ab)use working.
+     */
+    dc->user_creatable = true;
 }
 
 static const TypeInfo piix3_ide_info = {
@@ -225,6 +243,8 @@ static void piix4_ide_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_STORAGE_IDE;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     dc->hotpluggable = false;
+    /* Reason: Part of a Super I/O chip */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo piix4_ide_info = {
-- 
2.38.1


