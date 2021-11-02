Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C77443007
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:15:03 +0100 (CET)
Received: from localhost ([::1]:39110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuZ4-00047x-SW
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu6w-0005Pc-7s
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:45:58 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu6o-0006Te-Vj
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:45:57 -0400
Received: by mail-wr1-x429.google.com with SMTP id t30so8566970wra.10
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CX4TDYxHmqmiiR24yF6hrsJep+v1xIl7VYK9/UVuiFE=;
 b=bArEW0RPuk8NGIaE6nAs8gLpoqiLIBR+HMim0K8JK5R36RKYCkU/zCXKiRPHC/ZykM
 nkzCx/OkhvhmrAhYE0UNhz0WMiVb2V77Q7w/cBncuq5nRJwxvIERLtQ2E6brWaJtt8oY
 VoYqNT0vnx2wVWCwLl7k7qh2vxwrUnei10WP3zGaD/F6B4X3JMf1RhJsaA4Exg4BM6nd
 1B4AcbpnYoU+mDkxAc33VrPVQ2Wz6Y0RLGQbWPpR946FOXw64OcHroG69T5iRkBIs3ZI
 n2/OvX47hLHh00lkpMIRQb7OG2KSAOexe/ddBoHvkHBQL0EoRW0ZQV4fzt4LvLVqo1Ww
 fF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CX4TDYxHmqmiiR24yF6hrsJep+v1xIl7VYK9/UVuiFE=;
 b=DcHlJOGzP9YXs7VOybj5WGZRUFNyqa2PJWN4nifa3QHet4iH2VVvgXQhCrzCsPwvI7
 MUnqk+HYAipoDVy5xV5fxrbD0kWpcL98i05I9k+R4cugYsBR5C5+kqbOiqZlulsXoYYI
 90FuPEPSqNXICFtiTcECkua8KFUDgONgIFtruqDaz6kzniLl2SK4dCnwurqKmUUg9fHb
 0DGpuBe+McKgMLViGsC5vpHb3cUtQlCzlmRNoJO9BGtwC3SQA1DAnpkM/DuhdwUveMxw
 tAL6fLdF7xFbRAvsU4lh4qD+iJI079iXldpDc/iNLHl9RHsqRuCduVhUTFJtXVyLV1ED
 oKwQ==
X-Gm-Message-State: AOAM5335KuJDjgSiB8Sv6EloJTi9LkiVum1toU+//uHOF7wy+8f2dTS4
 +RQEo+AJdWbTmgUzJGhwXxks+oH0s/E=
X-Google-Smtp-Source: ABdhPJxA7zw8DqffVCkFUuDn588vE7WSlqWk7ccOuqfII328SfFey975t26Tdr0b6buapBDQmxSEqw==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr9305165wrr.365.1635860749445; 
 Tue, 02 Nov 2021 06:45:49 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 z15sm6096355wrr.65.2021.11.02.06.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:45:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 39/41] usb/uhci: Replace pci_set_irq with qemu_set_irq
Date: Tue,  2 Nov 2021 14:42:38 +0100
Message-Id: <20211102134240.3036524-40-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Instead of using pci_set_irq, store the irq in the device state and
use it explicitly so variants having different interrupt handling can
use their own.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <b39066e03c8731f4197d50bc79b403f797599999.1635161629.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/hcd-uhci.h | 2 +-
 hw/usb/hcd-uhci.c | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/usb/hcd-uhci.h b/hw/usb/hcd-uhci.h
index 316693f80bd..c85ab7868ee 100644
--- a/hw/usb/hcd-uhci.h
+++ b/hw/usb/hcd-uhci.h
@@ -60,7 +60,7 @@ typedef struct UHCIState {
     uint32_t frame_bandwidth;
     bool completions_only;
     UHCIPort ports[NB_PORTS];
-
+    qemu_irq irq;
     /* Interrupts that should be raised at the end of the current frame.  */
     uint32_t pending_int_mask;
 
diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index 7d26e351942..d1b5657d722 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -31,6 +31,7 @@
 #include "hw/usb/uhci-regs.h"
 #include "migration/vmstate.h"
 #include "hw/pci/pci.h"
+#include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu/timer.h"
@@ -299,7 +300,7 @@ static void uhci_update_irq(UHCIState *s)
         (s->status & UHCI_STS_HCPERR)) {
         level = 1;
     }
-    pci_set_irq(&s->dev, level);
+    qemu_set_irq(s->irq, level);
 }
 
 static void uhci_reset(DeviceState *dev)
@@ -1170,6 +1171,7 @@ void usb_uhci_common_realize(PCIDevice *dev, Error **errp)
     /* TODO: reset value should be 0. */
     pci_conf[USB_SBRN] = USB_RELEASE_1; /* release number */
     pci_config_set_interrupt_pin(pci_conf, u->info.irq_pin + 1);
+    s->irq = pci_allocate_irq(dev);
 
     if (s->masterbus) {
         USBPort *ports[NB_PORTS];
-- 
2.31.1


