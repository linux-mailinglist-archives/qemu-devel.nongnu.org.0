Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C226B65CA
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 13:03:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbKPY-0003NW-A0; Sun, 12 Mar 2023 08:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pbKPS-0003Mn-QN
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 08:02:42 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pbKPP-0000J1-Mi
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 08:02:42 -0400
Received: by mail-ed1-x533.google.com with SMTP id cy23so38018821edb.12
 for <qemu-devel@nongnu.org>; Sun, 12 Mar 2023 05:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678622555;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WWg4LuzaxWFvJH2Cc10WqoexJQmNb/n77OizqFG/hOg=;
 b=CRFIKihiG3gt5U7Bo9POrDRCvKcX7GhlR/4RrRquOq1v4D0aQQphgBlcVb+oKE619W
 Llu9/G1Ybdpw0CxHZULyucDFqERnJjlfCQ6QSuA1DH48U5evIEPeCz1tYTeXxEQicnHO
 IS83yQWd562FDvEzReKeF73BzrnwADN72svQtkzb/68v70DdxCeMuDCqdC1AogFwSo1U
 O7ZqtXNXZY0Lc9inLbJpjv1y5rww93LSySnMpjczQEdd+GZmmPxbYZ2Ncc95uROmaM2L
 e9pKi8P37Qdvbnfo7P80owlzihA6njd0jy1mHWVgE5ERWcrpXZ99qhFWb8leSlBPvvQ9
 GlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678622555;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WWg4LuzaxWFvJH2Cc10WqoexJQmNb/n77OizqFG/hOg=;
 b=au/wVctJ2TDLNEvCZKodvEzPlKYVJoLiH/16AAYdYg+nBcdO4lHA62Em4tp7CEgBBW
 Ca0yl1tGls8N8NLNvy0jaKftdK18Cb6RvrGfxfYYSM3QJe4nmWar0bsKNaUyVJWfaZgc
 jIIidzZ6UbFUbrFcHUbm1ORfnasu6nB4i8T6rBXhSGwAvaWtqu9uw65IeAQIwwLSKWZF
 HSTYaZQJKbsb5qCAQRtC6i8Ck/F1oUu7VWDGHKaBT9l+e0dv1XJRsrV1d9nic0aE/ifE
 SxUWhY/EqFocN9PZfutvev6iq6jhfdlSeKTFIoAOAfW/d64HaUZ1VHaiWiQreONhtmjx
 4Wuw==
X-Gm-Message-State: AO0yUKVvu0UlT507RyzDGMmJhc2RkVkkcamwmA8OO4bUTkv3vvAwskAr
 WPNYXvRDKuu21EBe48FXjMz1LQ+5nJM=
X-Google-Smtp-Source: AK7set+8bU52UZ6EPZu8793oap+FG+WY4eM5GCpxYQgaKRcrzsOTsF85v6SrfshFWBQhYEm6N29wPQ==
X-Received: by 2002:a17:907:1905:b0:8a6:e075:e364 with SMTP id
 ll5-20020a170907190500b008a6e075e364mr30020126ejc.26.1678622555342; 
 Sun, 12 Mar 2023 05:02:35 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-054-022-093.78.54.pool.telefonica.de. [78.54.22.93])
 by smtp.gmail.com with ESMTPSA id
 xj9-20020a170906db0900b009231714b3d4sm1293745ejb.151.2023.03.12.05.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 05:02:34 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 2/6] hw/isa/piix3: Reuse piix3_realize() in
 piix3_xen_realize()
Date: Sun, 12 Mar 2023 13:02:17 +0100
Message-Id: <20230312120221.99183-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312120221.99183-1-shentey@gmail.com>
References: <20230312120221.99183-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This is a preparational patch for the next one to make the following
more obvious:

First, pci_bus_irqs() is now called twice in case of Xen where the
second call overrides the pci_set_irq_fn with the Xen variant.

Second, pci_bus_set_route_irq_fn() is now also called in Xen mode.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/isa/piix3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 1b3e23f0d7..a86cd23ef4 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -394,7 +394,7 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
     PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
 
-    pci_piix3_realize(dev, errp);
+    piix3_realize(dev, errp);
     if (*errp) {
         return;
     }
-- 
2.39.2


