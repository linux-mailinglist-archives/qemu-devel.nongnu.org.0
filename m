Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7522D5AF9
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:53:27 +0100 (CET)
Received: from localhost ([::1]:56276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knLRm-0002dA-71
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:53:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1knKqE-0003pn-7Y
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:14:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1knKq1-0006w8-HZ
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:14:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607602465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xRH+pjGzGtRjy6FKKl80YM75BEmp/+t5H86RzdzmFUs=;
 b=eYweoNtzta7unfgVRU5mtXEesWlG7fnnbmxuujO/0vAuAK3zhtYsA0Z7e884W/3vuVXL29
 4VcR7nvJGuPuea3zQvkP05O844FEiaRYq/1EqhjNH+71s1spXgWvvYJ6eJDkZspSDguqvq
 0e8lg9NleTHNnCqJtInyiUOl31ye5ho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-JTa9nMeeOHSa2_CgyApFRg-1; Thu, 10 Dec 2020 07:14:22 -0500
X-MC-Unique: JTa9nMeeOHSa2_CgyApFRg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CEF318C8C00;
 Thu, 10 Dec 2020 12:14:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E2F15275D;
 Thu, 10 Dec 2020 12:14:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DF9919D9B; Thu, 10 Dec 2020 13:13:59 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/11] microvm: drop microvm_gsi_handler()
Date: Thu, 10 Dec 2020 13:13:53 +0100
Message-Id: <20201210121359.18320-6-kraxel@redhat.com>
In-Reply-To: <20201210121359.18320-1-kraxel@redhat.com>
References: <20201210121359.18320-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the improved gsi_handler() we don't need
our private version any more.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Message-id: 20201203105423.10431-7-kraxel@redhat.com
---
 hw/i386/microvm.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 5e4182b47464..829b376a1278 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -96,13 +96,6 @@ static void microvm_set_rtc(MicrovmMachineState *mms, ISADevice *s)
     rtc_set_memory(s, 0x5d, val >> 16);
 }
 
-static void microvm_gsi_handler(void *opaque, int n, int level)
-{
-    GSIState *s = opaque;
-
-    qemu_set_irq(s->ioapic_irq[n], level);
-}
-
 static void create_gpex(MicrovmMachineState *mms)
 {
     X86MachineState *x86ms = X86_MACHINE(mms);
@@ -163,12 +156,7 @@ static void microvm_devices_init(MicrovmMachineState *mms)
     /* Core components */
 
     gsi_state = g_malloc0(sizeof(*gsi_state));
-    if (mms->pic == ON_OFF_AUTO_ON || mms->pic == ON_OFF_AUTO_AUTO) {
-        x86ms->gsi = qemu_allocate_irqs(gsi_handler, gsi_state, GSI_NUM_PINS);
-    } else {
-        x86ms->gsi = qemu_allocate_irqs(microvm_gsi_handler,
-                                        gsi_state, GSI_NUM_PINS);
-    }
+    x86ms->gsi = qemu_allocate_irqs(gsi_handler, gsi_state, GSI_NUM_PINS);
 
     isa_bus = isa_bus_new(NULL, get_system_memory(), get_system_io(),
                           &error_abort);
-- 
2.27.0


