Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CB82CD427
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 12:03:00 +0100 (CET)
Received: from localhost ([::1]:42410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmO3-0004Nr-GL
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 06:02:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmG3-0003mp-E2
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:54:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmG1-00021s-OP
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:54:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606992881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BvI0DbZBYX8ldgqmqWJxMYKG0LXHoLlk19yalkNF0zM=;
 b=bTVQxToCOJsqKuRXhAvcwHyzFIkJlRoVN9/LH98BRGzSoll2eJXDbhD0ZQWiGk5Sz4Ernb
 EpTOm8WYrAkC3hXjNQuGY1TkC6+CXU5Xd6C3MhScgho0xvuJghbhUewgGRimBlmyOES1Fl
 Z88ikbcF/2nZw5QvStu7S6LgeXEcnks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-D6Jh6HVkMUyiSjKR3mhzsw-1; Thu, 03 Dec 2020 05:54:36 -0500
X-MC-Unique: D6Jh6HVkMUyiSjKR3mhzsw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12BF96414C;
 Thu,  3 Dec 2020 10:54:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A0AF60854;
 Thu,  3 Dec 2020 10:54:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 637CDA1FB; Thu,  3 Dec 2020 11:54:23 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/12] x86: rewrite gsi_handler()
Date: Thu,  3 Dec 2020 11:54:13 +0100
Message-Id: <20201203105423.10431-3-kraxel@redhat.com>
In-Reply-To: <20201203105423.10431-1-kraxel@redhat.com>
References: <20201203105423.10431-1-kraxel@redhat.com>
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
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
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
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rewrite function to use switch() for IRQ number mapping.
Check i8259_irq exists before raising it so the function
also works in case no i8259 (aka pic) is present.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/x86.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 5944fc44edca..b67e7b789f89 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -588,11 +588,17 @@ void gsi_handler(void *opaque, int n, int level)
     GSIState *s = opaque;
 
     trace_x86_gsi_interrupt(n, level);
-    if (n < ISA_NUM_IRQS) {
-        /* Under KVM, Kernel will forward to both PIC and IOAPIC */
-        qemu_set_irq(s->i8259_irq[n], level);
+    switch (n) {
+    case 0 ... ISA_NUM_IRQS - 1:
+        if (s->i8259_irq[n]) {
+            /* Under KVM, Kernel will forward to both PIC and IOAPIC */
+            qemu_set_irq(s->i8259_irq[n], level);
+        }
+        /* fall through */
+    case ISA_NUM_IRQS ... IOAPIC_NUM_PINS - 1:
+        qemu_set_irq(s->ioapic_irq[n], level);
+        break;
     }
-    qemu_set_irq(s->ioapic_irq[n], level);
 }
 
 void ioapic_init_gsi(GSIState *gsi_state, const char *parent_name)
-- 
2.27.0


