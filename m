Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6044D65B767
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 22:37:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCSTB-0008Fv-Rw; Mon, 02 Jan 2023 16:35:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pCST9-0008FO-Lv
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 16:35:43 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pCST8-00059J-2W
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 16:35:43 -0500
Received: by mail-ej1-x634.google.com with SMTP id t17so69193396eju.1
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 13:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gZDEL8s6HWwEfgKMeGlSAkqHU0n7hORkrqT7smSJTVY=;
 b=GU3AYEhEt5HGHHUhKsuD0ojio6SvhzKD2dSKr64WYZjapbbSIsZnEZNRwIsilTaOUJ
 iGTkrUbs+yhPQyQgY/ZZpAiFqB4ecrRyGNQlNB9jjQAFyfPYYKyIu3p+2LAHxwhgitUL
 LedNWX6Boc+BkDPK3KEqCjyCurW61QmS5JrZOGNzDZwVGaY/3Bu50aDxQPLngHJylhPt
 wdEtW5D2xVHw3Vu4PphFdbdzXJQQT1bvsQyyOKRq9fDe6W81Cvgzz2lFPFByXTJL5t4o
 5CQ8Qo1pNIhYYxhrzpL7P7fjIZnzuZrFuUzHvPYI6ubpnIrjO06SV/rS4zJP0QG7PcyB
 Swaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gZDEL8s6HWwEfgKMeGlSAkqHU0n7hORkrqT7smSJTVY=;
 b=i5TGKR6rQcpRFa0sTBXUWpleapQiDCclIN4QowIm88E6Fvbyjhmu6G3Wy9p6nHh5He
 w1pRYcykNhWolSJatdfv+4dFAuQl4ER8SS2EFcLrYullc9gmYNLjvWaqA4cEL99SYPIp
 nqQzb9yutuoiYuh/CfIJQ6+cTgPQ2JB1iC+I/6h5usGQCbEY7iDRZZOwMRrVjmB5AS8O
 q9b8QQG3ARrtPiRHGVX6s3D/QKzoFUyz45ejNKmMBTA4zqtVi1dftNk4TK1y+lm5wm6L
 saGl9dDzpGGPuYZK1HKagEsfj3UlmpYmeIFcvnMAokhATNGM6LdTZPJsq/Tr7GBdkChY
 1QAQ==
X-Gm-Message-State: AFqh2krdco1aZmRt2tVqhsMgJr3Gx3CzqORf3OlquIPuL8I1d2TYR3wE
 zLBbK3rUXq/0qHVFmPe98CktiysD7dY=
X-Google-Smtp-Source: AMrXdXtC/ibfuSlBrNsQnaQfyhwXLOGrgcrvGa+eum0cbe4JY/6WC6uF8ZpOR32bH9fWmLx0CvyqaQ==
X-Received: by 2002:a17:906:a1d7:b0:815:8942:dde with SMTP id
 bx23-20020a170906a1d700b0081589420ddemr45198684ejb.23.1672695340325; 
 Mon, 02 Jan 2023 13:35:40 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a17090631cb00b0084c465709b7sm10583826ejf.74.2023.01.02.13.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 13:35:39 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 2/6] hw/isa/piix: Reuse piix3_realize() in piix3_xen_realize()
Date: Mon,  2 Jan 2023 22:35:00 +0100
Message-Id: <20230102213504.14646-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102213504.14646-1-shentey@gmail.com>
References: <20230102213504.14646-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
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
index dc6014a4e4..a1281c2d77 100644
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


