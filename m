Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C320383BBA
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:55:02 +0200 (CEST)
Received: from localhost ([::1]:46034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihSH-00072N-2r
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lihNj-0007YH-0i
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:50:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lihNg-000330-IA
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:50:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621273815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fhf+AVXUBClcrbXUaAt1JBIAw3G0Rh6YDh+yCprkS/g=;
 b=cndDn0EzXIS8KLGkvcZk1uDN+n7G6rT4lOeuFe+OUbZszQuj+KF2ZYGrOLH9nCA7urT7oB
 heu+HaC0vAV5MU0IkWzbMXu03vtjVGk5hb94sy2SoQC+ojd6ZDLRmANHq9JXy3U9p8lTZ4
 DfhVcGinVoseLwwKTZqNk6+4hfPL1eU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-dPL0RlmmP2eWnIr_eAoIqg-1; Mon, 17 May 2021 13:50:14 -0400
X-MC-Unique: dPL0RlmmP2eWnIr_eAoIqg-1
Received: by mail-ed1-f69.google.com with SMTP id
 d8-20020a0564020008b0290387d38e3ce0so4347081edu.1
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 10:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fhf+AVXUBClcrbXUaAt1JBIAw3G0Rh6YDh+yCprkS/g=;
 b=RbavD+FgLQO8TOgtTBZUi0EvlqRdTLf6KWzQWH9XUCFWTvagO1+qdaXekVRkoiL6S6
 K9P0yFmiecJwdQXd43gwUo9/m4ffTUo4czbLY14cYFkNI0adp6wcsuxQmoMz62T2bjIM
 Z+hPJwRnbxaUD+XCeYRVbQ0OaXEC4cRgeA/9EUd2DOxNjqCkz2/rW56GLAUX7XWsrlDF
 g+DJIztQZRuuXUC6MXd+m0xIUNytJtMvUiv6KRBywxUjCrgMxXdWYACh/EzePMiWV+MK
 ZA4n9lR+S2NtOnVLYSXQJwqEyCM3MvZONyB/ob6A5Kv/CaFEgPynCu9DTsphZsXzfi5y
 eAeQ==
X-Gm-Message-State: AOAM533HPE+6nCsxpsxLYrEOoP1AWzfTpjpTOoeNiDTyl9CLndeM6/KM
 7HT2jjyHBJ5xGJSQHEwoaV6vthmIwIQaoHwtxAV1FWow/P86Wi1IJQl6o6JxnX6qZ0fvpmvzAtI
 2ZEqxQ3qsQe6/G8arQJE68JQnJLMr1dtluB4MI3OTrLeJK8Kv1FzXWSl/yhWD8YpC
X-Received: by 2002:aa7:da8e:: with SMTP id q14mr1499497eds.13.1621273812882; 
 Mon, 17 May 2021 10:50:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCC71n6xVzcfe/mBFv6ZisP9EWYSa0DW+ItSM+g1cIFO6xdp4CvnsHwVj+J3l6lIQmBJTW6g==
X-Received: by 2002:aa7:da8e:: with SMTP id q14mr1499478eds.13.1621273812689; 
 Mon, 17 May 2021 10:50:12 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id cw12sm2703174ejc.17.2021.05.17.10.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 10:50:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v3 5/8] hw/block/fdc: Add sysbus_fdc_init_drives() method
Date: Mon, 17 May 2021 19:49:44 +0200
Message-Id: <20210517174947.1199649-6-philmd@redhat.com>
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


