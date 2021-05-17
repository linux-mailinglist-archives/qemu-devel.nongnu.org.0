Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142D0383BC8
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:57:20 +0200 (CEST)
Received: from localhost ([::1]:54220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihUU-00049d-RN
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lihNr-0007oP-5I
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:50:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lihNl-00035z-Uh
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:50:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621273821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mwkhq1zzg8MDDjVW8AOR0NelXXYM0Xsfxsfa4jWuzBw=;
 b=KfjQX1Aw5PNWZjnSW3/TcHOjzPL0AKiQ9yi399TzPJGYdFBLiKKXwbY/Kkwn6ysDRSSbi6
 VU1mGj6gIWPuAaFvy12rykqAuJi9BpsEZTZE3Rs886Hz87uLtiIs9zseqfCIGffljW7zy0
 tX5lhvZRp6Y1Uxq9YbELs10NwDQO/bU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-8cOFO2NoPUSpbAqZ-dQqiw-1; Mon, 17 May 2021 13:50:19 -0400
X-MC-Unique: 8cOFO2NoPUSpbAqZ-dQqiw-1
Received: by mail-ej1-f71.google.com with SMTP id
 la2-20020a170906ad82b02903d4bcc8de3bso1348460ejb.4
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 10:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mwkhq1zzg8MDDjVW8AOR0NelXXYM0Xsfxsfa4jWuzBw=;
 b=OQFQ/7jUeE90N8S0atz9iUTfl/PblKmGVTCPEp6qyw3E3tm7r3ymcpzTtBxPiGXwWJ
 yPUq89OUOhR+2wGLDVVdf3/REY9zTxrpUGe3G82R4VxbJTz0+nN0cySwYeNprNyhvJGt
 sTfd8zI163qfGO0q5NX/Aklg+dr0e0vrhJ2BUfO94sznEEj+dxJGzBjwGJWdz3TDHxGJ
 iubioGnM591Nb3sBMptZcNkiM33lbmKfRQHDI2yRlOmRwJfD7RpGxPQfm62Eo4e218IA
 1uxw5ii1GykS2LIxkN7CXZcCBN7/gr6DHk35/fENWljNOEmqTR1Td2gXUdUjjziOl3MZ
 Yx/g==
X-Gm-Message-State: AOAM531b+1kHSgZC066B+XAGAqY7/udONBa9u306R7Wbb8gcJ8dIIYvy
 22TDqFhqkLPDKVDNXOz4dokYQ2cCo8kHaaIAVtYFLj0IzMNbYVcmVAL4jRIMnxrdqXnmoXUF4Pi
 7ye/TVIjQGrgl2IAnxhmdU9lVFFZyeMfl7nn/+g5Yp677NavYE/URjEGMmN/n85p/
X-Received: by 2002:a05:6402:cb8:: with SMTP id
 cn24mr1421530edb.325.1621273817450; 
 Mon, 17 May 2021 10:50:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyryAMoN9Q8R4kGyfjyAIC1fA08fGqs1LrNVL4jLrkRuggitFpYC7RHtuzgrCcuEGMY4ZiS+A==
X-Received: by 2002:a05:6402:cb8:: with SMTP id
 cn24mr1421499edb.325.1621273817235; 
 Mon, 17 May 2021 10:50:17 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id f7sm11693938edd.5.2021.05.17.10.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 10:50:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v3 6/8] hw/sparc/sun4m: Inline sun4m_fdctrl_init()
Date: Mon, 17 May 2021 19:49:45 +0200
Message-Id: <20210517174947.1199649-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517174947.1199649-1-philmd@redhat.com>
References: <20210517174947.1199649-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is only one call site for sun4m_fdctrl_init(), and this
function is specific to the sun4m machines, not part of the
SYSBUS_FDC API. Move it locally with the machine code, and
remove its declaration in "hw/block/fdc.h".

Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/block/fdc.h |  2 --
 hw/block/fdc-sysbus.c  | 16 ----------------
 hw/sparc/sun4m.c       | 16 ++++++++++++++++
 3 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/include/hw/block/fdc.h b/include/hw/block/fdc.h
index 52e45c53078..06612218630 100644
--- a/include/hw/block/fdc.h
+++ b/include/hw/block/fdc.h
@@ -14,8 +14,6 @@ void isa_fdc_init_drives(ISADevice *fdc, DriveInfo **fds);
 void sysbus_fdc_init_drives(SysBusDevice *dev, DriveInfo **fds);
 void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
                         hwaddr mmio_base, DriveInfo **fds);
-void sun4m_fdctrl_init(qemu_irq irq, hwaddr io_base,
-                       DriveInfo **fds, qemu_irq *fdc_tc);
 
 FloppyDriveType isa_fdc_get_drive_type(ISADevice *fdc, int i);
 int cmos_get_fd_drive_type(FloppyDriveType fd0);
diff --git a/hw/block/fdc-sysbus.c b/hw/block/fdc-sysbus.c
index 1163e53165d..8f94c2efb63 100644
--- a/hw/block/fdc-sysbus.c
+++ b/hw/block/fdc-sysbus.c
@@ -123,22 +123,6 @@ void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
     sysbus_fdc_init_drives(sbd, fds);
 }
 
-void sun4m_fdctrl_init(qemu_irq irq, hwaddr io_base,
-                       DriveInfo **fds, qemu_irq *fdc_tc)
-{
-    DeviceState *dev;
-    SysBusDevice *sbd;
-
-    dev = qdev_new("sun-fdtwo");
-    sbd = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(sbd, &error_fatal);
-    sysbus_connect_irq(sbd, 0, irq);
-    sysbus_mmio_map(sbd, 0, io_base);
-    *fdc_tc = qdev_get_gpio_in(dev, 0);
-
-    sysbus_fdc_init_drives(sbd, fds);
-}
-
 static void sysbus_fdc_common_initfn(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 42e139849ed..c08c650da72 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -816,6 +816,22 @@ static void dummy_fdc_tc(void *opaque, int irq, int level)
 {
 }
 
+static void sun4m_fdctrl_init(qemu_irq irq, hwaddr io_base,
+                              DriveInfo **fds, qemu_irq *fdc_tc)
+{
+    DeviceState *dev;
+    SysBusDevice *sbd;
+
+    dev = qdev_new("sun-fdtwo");
+    sbd = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(sbd, &error_fatal);
+    sysbus_connect_irq(sbd, 0, irq);
+    sysbus_mmio_map(sbd, 0, io_base);
+    *fdc_tc = qdev_get_gpio_in(dev, 0);
+
+    sysbus_fdc_init_drives(sbd, fds);
+}
+
 static void sun4m_hw_init(MachineState *machine)
 {
     const struct sun4m_hwdef *hwdef = SUN4M_MACHINE_GET_CLASS(machine)->hwdef;
-- 
2.26.3


