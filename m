Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB199383CFD
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:11:40 +0200 (CEST)
Received: from localhost ([::1]:45860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liieR-0006ZC-Or
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1liiAK-00069i-Nk
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:40:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1liiAH-000252-Cu
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621276828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fhf+AVXUBClcrbXUaAt1JBIAw3G0Rh6YDh+yCprkS/g=;
 b=LexeYyRaQvmW4sZ9jeoXIeIr7SMXdQCu1M9VGD7+rmfvjku6g/NGW9qdl9L5pyiLVv1XvX
 3dexVbPreZSloM1fVKyilUIHBBkLah0QBLDnvayMWhcPdQbfW2VHdWhAv0bDPDIPq0nauu
 +2w9kGcWmxtJmZNMPsJ1Q3dr4x6AZUg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-mANtlKcPO7aeH3-4FeOvUQ-1; Mon, 17 May 2021 14:40:27 -0400
X-MC-Unique: mANtlKcPO7aeH3-4FeOvUQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 x20-20020a1709061354b02903cff4894505so1385942ejb.14
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 11:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fhf+AVXUBClcrbXUaAt1JBIAw3G0Rh6YDh+yCprkS/g=;
 b=WoViVIHdohIF5XkVU110Owlkknl9tITVejAuC+Pe9GTLRkkvQwZm9OuIMZXVXM235T
 cvxW1nZP/75ql15UW0yGhA15aJWwj5uoXdPxuiWCe63kieEOsKoB4H/9KvGF18Hdd31R
 qpaCROkvic0UYQAEU29Iztw7QiqVd2ZrIQj4FZTTtvF8abh9fO19u0y8pH/H2UtpRqdq
 CiiivYELbOdDTgthMOALRhtnbZdBjNA+4weP+SHpfzpPB/55qp749L1XZZ/r45rFwBTN
 VodWEsoh600lTe/U78m0N8y5Bb0TuCOmmD+CAvNwj4kwQ7vLqjVjVMR1HiEsOja3ItNE
 I2kg==
X-Gm-Message-State: AOAM533UdsVqTLsdvYHO9e6BSjTr6pzAQ2aW3b7ItxZHAnV64ds3SPTM
 /YdOxshQ4ZD6YS2JdQalgygudG5PdHEu/if1bOoqXizcLfPUltyVDuMvMUlpjbYdddyycKg5tzM
 p9oN3v5LfppXsu82pnq4/ZVhqiTpjkUkhGMUTfCasmsOpc6dFaRKQwTbAJgKlmgaO
X-Received: by 2002:a17:906:8504:: with SMTP id
 i4mr1341121ejx.515.1621276826063; 
 Mon, 17 May 2021 11:40:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwI25QZdGx5K5036VJZ1wQnYc07b3av8RE1OIQJVkNO3YY4aybrEVSrm5HkmE2BY8Ws/E5S8Q==
X-Received: by 2002:a17:906:8504:: with SMTP id
 i4mr1341094ejx.515.1621276825893; 
 Mon, 17 May 2021 11:40:25 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id by20sm8910082ejc.74.2021.05.17.11.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 11:40:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v4 6/9] hw/block/fdc: Add sysbus_fdc_init_drives() method
Date: Mon, 17 May 2021 20:39:51 +0200
Message-Id: <20210517183954.1223193-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517183954.1223193-1-philmd@redhat.com>
References: <20210517183954.1223193-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FDCtrlSysBus's FDCtrl state is a private field. However it is
accessed by the public fdctrl_init_sysbus() and sun4m_fdctrl_init()
methods. To be able to move them out of fdc-sysbus.c, first add
the sysbus_fdc_init_drives() method and use it in these 2 functions.

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/block/fdc.h |  2 ++
 hw/block/fdc-sysbus.c  | 23 ++++++++++++++++-------
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/include/hw/block/fdc.h b/include/hw/block/fdc.h
index 1ecca7cac7f..52e45c53078 100644
--- a/include/hw/block/fdc.h
+++ b/include/hw/block/fdc.h
@@ -3,6 +3,7 @@
 
 #include "exec/hwaddr.h"
 #include "qapi/qapi-types-block.h"
+#include "hw/sysbus.h"
 
 /* fdc.c */
 #define MAX_FD 2
@@ -10,6 +11,7 @@
 #define TYPE_ISA_FDC "isa-fdc"
 
 void isa_fdc_init_drives(ISADevice *fdc, DriveInfo **fds);
+void sysbus_fdc_init_drives(SysBusDevice *dev, DriveInfo **fds);
 void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
                         hwaddr mmio_base, DriveInfo **fds);
 void sun4m_fdctrl_init(qemu_irq irq, hwaddr io_base,
diff --git a/hw/block/fdc-sysbus.c b/hw/block/fdc-sysbus.c
index 71755fd6ae4..1163e53165d 100644
--- a/hw/block/fdc-sysbus.c
+++ b/hw/block/fdc-sysbus.c
@@ -94,6 +94,15 @@ static void fdctrl_handle_tc(void *opaque, int irq, int level)
     trace_fdctrl_tc_pulse(level);
 }
 
+void sysbus_fdc_init_drives(SysBusDevice *dev, DriveInfo **fds)
+{
+    FDCtrlSysBus *fdc;
+
+    fdc = SYSBUS_FDC(dev);
+
+    fdctrl_init_drives(&fdc->state.bus, fds);
+}
+
 void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
                         hwaddr mmio_base, DriveInfo **fds)
 {
@@ -111,23 +120,23 @@ void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
     sysbus_connect_irq(sbd, 0, irq);
     sysbus_mmio_map(sbd, 0, mmio_base);
 
-    fdctrl_init_drives(&sys->state.bus, fds);
+    sysbus_fdc_init_drives(sbd, fds);
 }
 
 void sun4m_fdctrl_init(qemu_irq irq, hwaddr io_base,
                        DriveInfo **fds, qemu_irq *fdc_tc)
 {
     DeviceState *dev;
-    FDCtrlSysBus *sys;
+    SysBusDevice *sbd;
 
     dev = qdev_new("sun-fdtwo");
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sys = SYSBUS_FDC(dev);
-    sysbus_connect_irq(SYS_BUS_DEVICE(sys), 0, irq);
-    sysbus_mmio_map(SYS_BUS_DEVICE(sys), 0, io_base);
+    sbd = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(sbd, &error_fatal);
+    sysbus_connect_irq(sbd, 0, irq);
+    sysbus_mmio_map(sbd, 0, io_base);
     *fdc_tc = qdev_get_gpio_in(dev, 0);
 
-    fdctrl_init_drives(&sys->state.bus, fds);
+    sysbus_fdc_init_drives(sbd, fds);
 }
 
 static void sysbus_fdc_common_initfn(Object *obj)
-- 
2.26.3


