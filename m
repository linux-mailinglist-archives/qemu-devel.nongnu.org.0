Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD5E379E5F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 06:23:26 +0200 (CEST)
Received: from localhost ([::1]:41334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgJvZ-0007TT-TV
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 00:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJrT-0007fR-21; Tue, 11 May 2021 00:19:14 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:43544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJrR-0000dM-K8; Tue, 11 May 2021 00:19:10 -0400
Received: by mail-ej1-x62e.google.com with SMTP id l4so27697810ejc.10;
 Mon, 10 May 2021 21:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Ro9uQRBpJ49CS78Xti8kfKpJL6WmeL7s1iNvRPW0Dw=;
 b=IBTjkJHfNszluJOjk3BVFnR5zPuqOy8Y46bo6LlLWIE8VycTcqrDOP/tUUVG+6JVPt
 IHUiUYLxH6AxkV23faRCLG2/pSvVZU2gJz1t0DjJtdaS30LDvsSyg4m2JprGm4QBbLO9
 vqJNY2V6bMPqBUzE7YI1iDq37KpAdi1thOTx5PGAvjcytZtm2//iALiE7x44rDQCkUfn
 +dkTbp0mz1u/e0v/dSBeb/raoAG8N2yOHkLzr8LkbwAzbJz1j4w2EIK7VjWVzikQ/Vr3
 VWKRz2d5zXLBcBo/OUI6g1NDBOrc8yD4DBZUkM/oSSGuWwneqaKKaNI6v66Y0ga/j5qC
 zyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3Ro9uQRBpJ49CS78Xti8kfKpJL6WmeL7s1iNvRPW0Dw=;
 b=JHFPSNaHWu0qm1h5br5uvC8yI/s7ij3NpKEeVy9ll3Gz6zaICCmQJXEldq+HmMmVOZ
 Z7J+AsBNXKkn0HVRy9EignR2v1i22Uo4aGp1M2B/C8PUJvAOEBkJlSVAHPaywu1w8tYS
 aQgewVjvaUyAf3lCKXNnr/0a45ukiNasLImRGK9gijy0ZNKsPelU2F7E430XkEKH2JT4
 hJdU0pc44Vb3sV1xHsQFO0beNYsKizN3CxpIcH2kzra9Sadzqj5pvU09vVvHo+UBOp5Z
 T5vRXl1GkXSWR/5yBuEGr1/ZmJ8Gl8t4pZbeo3b1ipizcObBMky/2fjyv5R/ucJzjg86
 KQRg==
X-Gm-Message-State: AOAM532+w0Qt2WCP2G56hFUJiXZjC37iXq35XO1J/JDYaH6+x8XUposq
 tQ+vDNWOtuKRAhy6iyEM7991pIRZsP23Uw==
X-Google-Smtp-Source: ABdhPJzUltF6WlzlfavaOC4kF0/uaaCHdulRbVAsemV0EuibVzMH33N8XtUBPU99x2/bRniwTUz00Q==
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr7270012ejb.56.1620706747659; 
 Mon, 10 May 2021 21:19:07 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id z22sm10584940ejo.113.2021.05.10.21.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 21:19:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/6] hw/isa/vt82c686: Let ISA function expose ISA IRQs
Date: Tue, 11 May 2021 06:18:45 +0200
Message-Id: <20210511041848.2743312-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511041848.2743312-1-f4bug@amsat.org>
References: <20210511041848.2743312-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 2 cascaded 8259 PIC are managed by the PCI function #0
(ISA bridge). Expose the 16 IRQs on this function, so other
functions from the same chipset can access them.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 2ce5c6cbb00..388833f4eb1 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -542,6 +542,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(ViaISAState, VIA_ISA)
 struct ViaISAState {
     PCIDevice dev;
     qemu_irq cpu_intr;
+    qemu_irq *pic_irq;
     ViaSuperIOState *via_sio;
 };
 
@@ -601,6 +602,13 @@ static void vt82c686b_isa_reset(DeviceState *dev)
     pci_conf[0x77] = 0x10; /* GPIO Control 1/2/3/4 */
 }
 
+static void vt82c686b_isa_irq(void *opaque, int irq, int level)
+{
+    ViaISAState *s = opaque;
+
+    qemu_set_irq(s->pic_irq[irq], level);
+}
+
 static void vt82c686b_realize(PCIDevice *d, Error **errp)
 {
     ViaISAState *s = VIA_ISA(d);
@@ -611,7 +619,10 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
     qdev_init_gpio_out_named(dev, &s->cpu_intr, "intr", 1);
     isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
                           &error_fatal);
-    isa_bus_irqs(isa_bus, i8259_init(isa_bus, s->cpu_intr));
+    s->pic_irq = i8259_init(isa_bus, s->cpu_intr);
+    isa_bus_irqs(isa_bus, s->pic_irq);
+    qdev_init_gpio_in_named(dev, vt82c686b_isa_irq, "isa-irq", ISA_NUM_IRQS);
+
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
     i8257_dma_init(isa_bus, 0);
     s->via_sio = VIA_SUPERIO(isa_create_simple(isa_bus,
-- 
2.26.3


