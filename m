Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B30D3F1B90
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:25:38 +0200 (CEST)
Received: from localhost ([::1]:36496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGizB-0003w7-70
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:25:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGiuu-0003Wt-M9
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:21:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGiut-0006cM-08
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:21:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629382869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WwxcFzkUhr+SPEjC7KEdcFzv7DLvVmTT/gW/kFoiXv4=;
 b=Ra/pc2k+gd4qPejwVeCr/SWfi3JtOefj9dHA12Yjf9KJK0gjf99M++t0JGEnCIJssDuxW7
 +PBOA+lkCXryK9QSLxssWYIc+pahYk5JwCvA7rMoB4Hd236qsjiEOZjJXhUVMhYgWTkfvt
 ifz6S9W+wi+ydZP+zyqVUpJHri9U2nQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-ZKI1NEybNbad2g7hTygUGw-1; Thu, 19 Aug 2021 10:21:07 -0400
X-MC-Unique: ZKI1NEybNbad2g7hTygUGw-1
Received: by mail-wm1-f71.google.com with SMTP id
 b3-20020a1c80030000b02902e6a7296cb3so1374545wmd.5
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 07:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WwxcFzkUhr+SPEjC7KEdcFzv7DLvVmTT/gW/kFoiXv4=;
 b=ZXK9G+iAlSo/cMdPP/D2UoIm1mWGd6Du2vGdbnW5z0twMicJXtxgRi1oxoxl6k2SKO
 fyY/5FS2jlMRv1gVEGZb1Gjj+qk6Gzc0mWplgSv96/WZdS0h+SYXS8XePUkJLK9Gdylq
 95mGhxRsTxkBbS9jrb41Ezia+Ysxxfkiul86UvIOsn7pzx2mnNIMO5d/J/Dqo2XN37Jd
 HGmjaP/u9jh4vidpALro+/mzQ3rVFdykxYuVYvCz0VBxuJROAu2G44kcD6mohq+XcH/4
 UcG6G9C5/+LZjKKOw+Pfb+TEm6YdUDU2X2hqfPi+o5TCGn0g0Sj1AemXMujPbpnclMBS
 Mf/w==
X-Gm-Message-State: AOAM531eHGmdkmKQJY7QPC4NdZss+PKRImjlf+1LHShsJhw2UnF36BNa
 uoNnleWMQkresJO0WWFmZQuSfiDVFj9rpXwRcwxTHRnP6vroYyzV3UzBBFlFoyRM9XxSw9RP+uE
 5xvGalS/3xqE+cJbddZ1clfsPQiNyc+mnn7VR212AL7kWniOAbYeq8HkH3deovnks
X-Received: by 2002:a1c:2090:: with SMTP id g138mr14014786wmg.98.1629382865480; 
 Thu, 19 Aug 2021 07:21:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjl4adP85e/ASWOoCVCYhPNY8xtrTPIrXPck7e9y+Cm5aHE4fKA3pr9YrjCEboKpsVNMjJnw==
X-Received: by 2002:a1c:2090:: with SMTP id g138mr14014758wmg.98.1629382865260; 
 Thu, 19 Aug 2021 07:21:05 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id j16sm3054713wrr.78.2021.08.19.07.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 07:21:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] hw/usb: Replace alloc() + address_space_init() by
 address_space_create()
Date: Thu, 19 Aug 2021 16:20:38 +0200
Message-Id: <20210819142039.2825366-6-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819142039.2825366-1-philmd@redhat.com>
References: <20210819142039.2825366-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Jianxian Wen <jianxian.wen@verisilicon.com>, Peter Xu <peterx@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace g_malloc0() + address_space_init() by address_space_create().
Release the resource in DeviceUnrealize().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/usb/hcd-xhci-sysbus.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/usb/hcd-xhci-sysbus.c b/hw/usb/hcd-xhci-sysbus.c
index a14e4381960..04ac485e8b3 100644
--- a/hw/usb/hcd-xhci-sysbus.c
+++ b/hw/usb/hcd-xhci-sysbus.c
@@ -43,16 +43,19 @@ static void xhci_sysbus_realize(DeviceState *dev, Error **errp)
     s->irq = g_new0(qemu_irq, s->xhci.numintrs);
     qdev_init_gpio_out_named(dev, s->irq, SYSBUS_DEVICE_GPIO_IRQ,
                              s->xhci.numintrs);
-    if (s->xhci.dma_mr) {
-        s->xhci.as =  g_malloc0(sizeof(AddressSpace));
-        address_space_init(s->xhci.as, s->xhci.dma_mr, NULL);
-    } else {
-        s->xhci.as = &address_space_memory;
-    }
+    s->xhci.as = address_space_create(s->xhci.dma_mr ?: get_system_memory(),
+                                      NULL);
 
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->xhci.mem);
 }
 
+static void xhci_sysbus_unrealize(DeviceState *dev)
+{
+    XHCISysbusState *s = XHCI_SYSBUS(dev);
+
+    address_space_destroy(s->xhci.as);
+}
+
 static void xhci_sysbus_instance_init(Object *obj)
 {
     XHCISysbusState *s = XHCI_SYSBUS(obj);
@@ -103,6 +106,7 @@ static void xhci_sysbus_class_init(ObjectClass *klass, void *data)
 
     dc->reset = xhci_sysbus_reset;
     dc->realize = xhci_sysbus_realize;
+    dc->unrealize = xhci_sysbus_unrealize;
     dc->vmsd = &vmstate_xhci_sysbus;
     device_class_set_props(dc, xhci_sysbus_props);
 }
-- 
2.31.1


