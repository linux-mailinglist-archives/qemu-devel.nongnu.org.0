Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9802BA565
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 10:02:44 +0100 (CET)
Received: from localhost ([::1]:44786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg2JW-0004nW-RX
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 04:02:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kg2CX-00087m-7s
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 03:55:29 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:45292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kg2CV-0002ck-Oc
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 03:55:28 -0500
Received: by mail-ed1-x542.google.com with SMTP id q3so8674848edr.12
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 00:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YEIeM6Ph7qOqVwSlaCHFXLP5jvRYWFl8eXdQzM1WraE=;
 b=jd8as52FUt+Otb7oz+c+xSXBI3L07n82bXOnEc4lrFCCTpzkF6rvHmPPt9Lpc3U1f8
 a0J4XN7AoM5hw7lB1NlFtvX+33MDGvtxzBXEf12wF3ga25oAJG9uqj8RYfUlKu1tZkor
 dskgqhGz9XzuoE0fClZtFIbH53Wf7Z1+OYS16O2fGcQiqgt9yH+T0UEB97/Vi39oe0bx
 OOGi/caHbOoawGFEi2JWoRTPGNrDTmJPM+IlsDTQXtpSvW56ZAEgDyW9bAzgW2t9ag3q
 0jYD6yZBOmtuc6Q/nhr1jgvWuxPQLCG+UYikk5EA7bvrKxQg0yWHN7xUwQwu6igJH+rQ
 F3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=YEIeM6Ph7qOqVwSlaCHFXLP5jvRYWFl8eXdQzM1WraE=;
 b=misJ+Xk0H8qcSEhZ00jPSykqkEdBN4X5b5oiOCnTKKQ2kQ++LT5bt2RRjZxCjFZGS+
 omXvaUKohE9dP4dNkEBpGpQP3jAGODIJCEA9wN+7BbSM1Qq0SeBi21fFfsuvyqE0Tjtq
 riG9gwYsT5jp2IgU1o7IQ2uP0lsbOadi7G8tO1RxftabLAMNz0jA95wTI9S1WGn/T1RB
 9w6L9lIM8M+qqDDtEqiTOnRJQl+nqQh/1QZ0U1DGSySjxi9plXYG4aV+HuVZCpb7UI90
 jQxdi8S5+NppKpt0e0P3vgRu0OOQtZFGMmN/ZN7YKz3SnEsISJE4pTzFwJWpyZcLsL20
 FS6A==
X-Gm-Message-State: AOAM531Lr3laHikWik3dCuLWCeE3DRX5WWYDeFE381vp52tIiKAdp3YF
 6kizAJv8jTwWMJwfUNuj7Mzzb866q4Q=
X-Google-Smtp-Source: ABdhPJy4g9nyYt1qZNUknJcVilGJlzX+pEnq0V4VLHzv+8XibOBU9icNLCWE4gC9JfAO5x1yp15bMw==
X-Received: by 2002:aa7:c94b:: with SMTP id h11mr33118511edt.322.1605862526086; 
 Fri, 20 Nov 2020 00:55:26 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r1sm843977eje.51.2020.11.20.00.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 00:55:25 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2] microvm: fix kconfig for non-default devices
Date: Fri, 20 Nov 2020 09:55:24 +0100
Message-Id: <20201120085524.108200-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x542.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Bruce Rogers <brogers@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PCIe and USB support can be disabled on the command line, and therefore
should not be included if QEMU is configured --without-default-devices.

While at it, also remove the "default y" for USB_XHCI_SYSBUS because
sysbus devices are not user creatable; boards that use them will
specify them manually with "imply" or "select" clauses.

Reported-by: Bruce Rogers <brogers@suse.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/Kconfig | 4 ++--
 hw/usb/Kconfig  | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index eea059ffef..16296dda84 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -96,6 +96,8 @@ config Q35
 
 config MICROVM
     bool
+    imply PCI_EXPRESS_GENERIC_BRIDGE
+    imply USB_XHCI_SYSBUS
     select SERIAL_ISA # for serial_hds_isa_init()
     select ISA_BUS
     select APIC
@@ -104,8 +106,6 @@ config MICROVM
     select MC146818RTC
     select VIRTIO_MMIO
     select ACPI_HW_REDUCED
-    select PCI_EXPRESS_GENERIC_BRIDGE
-    select USB_XHCI_SYSBUS
 
 config X86_IOMMU
     bool
diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index 3b07d9cf68..7fbae18bc8 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -47,7 +47,6 @@ config USB_XHCI_NEC
 
 config USB_XHCI_SYSBUS
     bool
-    default y
     select USB_XHCI
 
 config USB_MUSB
-- 
2.28.0


