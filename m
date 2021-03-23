Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788F83468AC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:14:05 +0100 (CET)
Received: from localhost ([::1]:42954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmTc-0005Hi-EM
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOltq-0006ol-JW
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:37:07 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOlto-000812-Uj
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:37:06 -0400
Received: by mail-wr1-x42a.google.com with SMTP id v4so21836732wrp.13
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 11:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/3Rgd50n89nBlTJAH89enCMHBA2u9ibVDP7HX8pUGvs=;
 b=QdCx53TGQbtxHlrIwWs3QhvqOlW9beeMLyvC+pPtY1sm7zhyOh66L8k82wWROq4tw8
 ARzb2Ipw6xLPeRDBMU4S8XicZ3xhE2/Xil5NOpUGuTec9qPEjvLTeGmokU4xP296QaVi
 /SDu/a/tV5L6ODrZ//m/2re57avHH1RQTGhRn9ZVY2UiemukNSR82TdUt17oxadeO1X1
 VYmPjPBddxTXWirhhCkerwQ+as6uRWsRpTbVBLeJB4Q4TuU2IQEiIz+5yZ680wYGIsUI
 EGpNtQlxExzRxzkxBXfF1wlA7g2Xg1tN11i845bqhkohmnRGJR2z31SjXdVg2uZK4RVY
 GNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/3Rgd50n89nBlTJAH89enCMHBA2u9ibVDP7HX8pUGvs=;
 b=gbkLVS3REE+ac2CkPg9qZOd97DC6wP+T/t3UI9AZ43Zu+MKzTMhVFOj4lBYJgIwjnk
 O2n/hUsWIWE+vbdjlBcV9Vu4ICJ7+97HfZW8qmwxNJkdMtZV8eQGPzavEaijwAnGE6Eb
 soeF9yu9sy2FWLfjwzYlvpewLujPgnaj5musZY9n1MF1D2/MPBwuyMiDvEzWn0SABqeY
 83c1kYDrU0Iw8KlesNfjThqy9WnDsJZPGm4siDZfK8ts+b+34lpHIqhxqYat/sXDG7cP
 H7BjJPFM/kDmO8K0RMzTEacvTHe1PGU1m317OzBXwO+V/W9/Wqi2bN8CpR8QMM+le/5/
 bVow==
X-Gm-Message-State: AOAM531FEFnqd8XTJDKBNe8OlWtB9ct18BHIWLjNygVjhOvoTybNZOoF
 2w9f9fN+8R5hnsV1cXjLeJQiYfCpMO3uZQ==
X-Google-Smtp-Source: ABdhPJy22Jmi+JSgfwt2Z+GVCMoDXkLI+T5vxeM+MSGY4pG50/Jy9M24iKFijpwUkAplLhgxYsdZpA==
X-Received: by 2002:a5d:55c4:: with SMTP id i4mr5457945wrw.84.1616524622839;
 Tue, 23 Mar 2021 11:37:02 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id r11sm24684484wrm.26.2021.03.23.11.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 11:37:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/usb/hcd-ehci-sysbus: Free USBPacket on instance finalize()
Date: Tue, 23 Mar 2021 19:37:01 +0100
Message-Id: <20210323183701.281152-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Li Qiang <liq3ea@163.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When building with --enable-sanitizers we get:

  Direct leak of 32 byte(s) in 2 object(s) allocated from:
      #0 0x5618479ec7cf in malloc (qemu-system-aarch64+0x233b7cf)
      #1 0x7f675745f958 in g_malloc (/lib64/libglib-2.0.so.0+0x58958)
      #2 0x561847f02ca2 in usb_packet_init hw/usb/core.c:531:5
      #3 0x561848df4df4 in usb_ehci_init hw/usb/hcd-ehci.c:2575:5
      #4 0x561847c119ac in ehci_sysbus_init hw/usb/hcd-ehci-sysbus.c:73:5
      #5 0x56184a5bdab8 in object_init_with_type qom/object.c:375:9
      #6 0x56184a5bd955 in object_init_with_type qom/object.c:371:9
      #7 0x56184a5a2bda in object_initialize_with_type qom/object.c:517:5
      #8 0x56184a5a24d5 in object_initialize qom/object.c:536:5
      #9 0x56184a5a2f6c in object_initialize_child_with_propsv qom/object.c:566:5
      #10 0x56184a5a2e60 in object_initialize_child_with_props qom/object.c:549:10
      #11 0x56184a5a3a1e in object_initialize_child_internal qom/object.c:603:5
      #12 0x561849542d18 in npcm7xx_init hw/arm/npcm7xx.c:427:5

Similarly to commit d710e1e7bd3 ("usb: ehci: fix memory leak in
ehci"), fix by calling usb_ehci_finalize() to free the USBPacket.

Fixes: 7341ea075c0
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/hcd-ehci-sysbus.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c
index e3758db1b18..a12e2188489 100644
--- a/hw/usb/hcd-ehci-sysbus.c
+++ b/hw/usb/hcd-ehci-sysbus.c
@@ -74,6 +74,14 @@ static void ehci_sysbus_init(Object *obj)
     sysbus_init_mmio(d, &s->mem);
 }
 
+static void ehci_sysbus_finalize(Object *obj)
+{
+    EHCISysBusState *i = SYS_BUS_EHCI(obj);
+    EHCIState *s = &i->ehci;
+
+    usb_ehci_finalize(s);
+}
+
 static void ehci_sysbus_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -94,6 +102,7 @@ static const TypeInfo ehci_type_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(EHCISysBusState),
     .instance_init = ehci_sysbus_init,
+    .instance_finalize = ehci_sysbus_finalize,
     .abstract      = true,
     .class_init    = ehci_sysbus_class_init,
     .class_size    = sizeof(SysBusEHCIClass),
-- 
2.26.2


