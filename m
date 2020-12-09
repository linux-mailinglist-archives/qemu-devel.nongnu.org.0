Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C20352D3F5F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 11:01:40 +0100 (CET)
Received: from localhost ([::1]:58510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmwHz-0001fD-Rv
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 05:01:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmw6I-0005Q2-7V
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:49:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmw6B-0007Rr-DO
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:49:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607507366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0GrfhnuhB5mq6HxiqzqPcElFKnZd9rtGczF8GGT5oac=;
 b=AHljz+Id1/NTOh4KmFc1ZIklYS/t5HAW8JIMtj+7vx59QW6YZOKe6eezyx0xBGbku5W9Ba
 71Vr/leTK3VlpZLoYfRrTXskxOlQSzYCd3nNHSrOGSpFNWMmGqo4RPfJqtW9qzEaFJ1Aw/
 AsVWwBk6u04GOgBdplI/eWpzTpLGSMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-dCP8i7eGN_uOMoTbnIYWVQ-1; Wed, 09 Dec 2020 04:49:21 -0500
X-MC-Unique: dCP8i7eGN_uOMoTbnIYWVQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECD341927800;
 Wed,  9 Dec 2020 09:49:20 +0000 (UTC)
Received: from thuth.com (ovpn-112-183.ams2.redhat.com [10.36.112.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D415E5C23D;
 Wed,  9 Dec 2020 09:49:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 13/13] hw/m68k/mcf5206: Don't leak IRQs in
 mcf5206_mbar_realize()
Date: Wed,  9 Dec 2020 10:48:56 +0100
Message-Id: <20201209094856.17788-14-thuth@redhat.com>
In-Reply-To: <20201209094856.17788-1-thuth@redhat.com>
References: <20201209094856.17788-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Coverity points out that the realize function for the TYPE_MCF5206_MBAR
device leaks the IRQ array it allocates with qemu_allocate_irqs().
Keep a pointer to it in the device state struct to avoid the leak.
(Since it needs to stay around for the life of the simulation there
is no need to actually free it, and the leak was harmless.)

Fixes: Coverity CID 1432412
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201120172314.14725-1-peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/m68k/mcf5206.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
index 51d2e0da1c..92a194dbc4 100644
--- a/hw/m68k/mcf5206.c
+++ b/hw/m68k/mcf5206.c
@@ -164,6 +164,7 @@ typedef struct {
 
     M68kCPU *cpu;
     MemoryRegion iomem;
+    qemu_irq *pic;
     m5206_timer_state *timer[2];
     void *uart[2];
     uint8_t scr;
@@ -588,17 +589,16 @@ static const MemoryRegionOps m5206_mbar_ops = {
 static void mcf5206_mbar_realize(DeviceState *dev, Error **errp)
 {
     m5206_mbar_state *s = MCF5206_MBAR(dev);
-    qemu_irq *pic;
 
     memory_region_init_io(&s->iomem, NULL, &m5206_mbar_ops, s,
                           "mbar", 0x00001000);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
 
-    pic = qemu_allocate_irqs(m5206_mbar_set_irq, s, 14);
-    s->timer[0] = m5206_timer_init(pic[9]);
-    s->timer[1] = m5206_timer_init(pic[10]);
-    s->uart[0] = mcf_uart_init(pic[12], serial_hd(0));
-    s->uart[1] = mcf_uart_init(pic[13], serial_hd(1));
+    s->pic = qemu_allocate_irqs(m5206_mbar_set_irq, s, 14);
+    s->timer[0] = m5206_timer_init(s->pic[9]);
+    s->timer[1] = m5206_timer_init(s->pic[10]);
+    s->uart[0] = mcf_uart_init(s->pic[12], serial_hd(0));
+    s->uart[1] = mcf_uart_init(s->pic[13], serial_hd(1));
     s->cpu = M68K_CPU(qemu_get_cpu(0));
 }
 
-- 
2.18.4


