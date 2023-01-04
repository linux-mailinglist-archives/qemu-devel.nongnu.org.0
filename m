Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCE465D673
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 15:46:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD51X-0005Hh-0s; Wed, 04 Jan 2023 09:45:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pD51D-0005F5-Lw
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:45:30 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pD51C-0002pA-3b
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:45:27 -0500
Received: by mail-wr1-x436.google.com with SMTP id w1so21082973wrt.8
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 06:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=skngD2C07lkAR57VFiC9hSpSkRXE8QLpJkhdrtzHaoE=;
 b=fglIPWzWe7OF+ReYiVQjbIlqvtMvTu/HBo031zXX2Dmr6PoRqVzCCMudfgPYd4aGRi
 ZzXHYC+LUG8aYoxMQ2QopDZUsHWe8+I3MBPfz33YHbBlA0wpSiPunpMSxDNEQu3gic8o
 tjY9LXxtHVjsr5RFAPk3J091DyzHz40da+k0hi4YR2NRpwGdMpmrPobxn+rII4pfszR+
 ABmHKixdWzp6dCP+vGUOG1X6vLOHELWO4oX1VeVkM5l0HNpdBbKdWd/OSHzgbTTCC2Ov
 ZZVVZUIoXft/7/vDq3sRETSoVxCTNiDIkVm5XL0QJYkZbABRQHyxfDTifj0y4vNNeuN2
 dMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=skngD2C07lkAR57VFiC9hSpSkRXE8QLpJkhdrtzHaoE=;
 b=tG2r3dr5xSadbfHkrAc1sE9z7zf4jotZyElyjHRSqRD4gDg9BZJadCT+PxlRY7XwzV
 kLr5HcUF2Bgtbm3qqSSCrZYCA2UZnld8lHHNe051Dltm63qZ+1/nNUr3685p1qhiQ9B0
 En2zIcRsMmrHwR5K6ZkSWjVw7GkLgkRbn050m0DPTVRwn5/HSvhrShV6SHXNPlsN7x9m
 F7dhVvKOD5aiVa0eDnT/D7PQFBbFomFuzjNczeOTL9uxr2xILdh1gXRmTqE+0OZmhIZW
 TNwgysSiRbhlTVeEfdP+ENjbhs0FmYr7R3rh7YMXqLKMuGfzEA/mkk1Sd7bht+VPy68j
 LJVw==
X-Gm-Message-State: AFqh2kqoFyg5xIDgqgycH2DnMM+q7e8w55H+VMBTcVF0T6zg3jjiRlG6
 MrXlTKAuMk+tQKJU7AvuA5ngoOUhfgU9ig==
X-Google-Smtp-Source: AMrXdXsN3egZuow7sNDCctPG+VunNJGlKj4E12ZlT9Um1FBGzDz97HrRjJAVFxuMN8+oPIQ6UyZajQ==
X-Received: by 2002:adf:fa0f:0:b0:28f:b480:f4 with SMTP id
 m15-20020adffa0f000000b0028fb48000f4mr12954011wrr.12.1672843524496; 
 Wed, 04 Jan 2023 06:45:24 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a5d594a000000b0028663fc8f4csm21168241wri.30.2023.01.04.06.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 06:45:24 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 2/6] hw/isa/piix: Reuse piix3_realize() in
 piix3_xen_realize()
Date: Wed,  4 Jan 2023 15:44:33 +0100
Message-Id: <20230104144437.27479-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230104144437.27479-1-shentey@gmail.com>
References: <20230104144437.27479-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x436.google.com
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
---
 hw/isa/piix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index a7a4eec206..25707479eb 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -493,7 +493,7 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
     PIIXState *piix3 = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
 
-    pci_piix_realize(dev, TYPE_PIIX3_USB_UHCI, errp);
+    piix3_realize(dev, errp);
     if (*errp) {
         return;
     }
-- 
2.39.0


