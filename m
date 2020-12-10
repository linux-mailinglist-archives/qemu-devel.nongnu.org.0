Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 661232D5BB5
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:28:41 +0100 (CET)
Received: from localhost ([::1]:42502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knLzs-0007GF-EE
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:28:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1knKpy-0003iS-Qq
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:14:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1knKpr-0006sm-Gv
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:14:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607602454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Dm4uLkhOhBxPHBrz6/awUBe8bZ/FLYqEi8eUvp/YJ8=;
 b=WgJcslVU7jgG+XG24m540gYBsIBhcbCHnT4FYp2tB+AxHk87MkKJZEGmuoVG3yw+2PBnZ1
 LyyILEqIbPVAnb5PsxaGiMpAOQ6qTlV9JoDQbJF4NhxWffUVJjrtteI2RBlGOWVcIF4XaJ
 udflEH8vdXlNya7zYZbiSt8c6a//fDc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-f35fEnDoMW2Sgpp8d65BaA-1; Thu, 10 Dec 2020 07:14:11 -0500
X-MC-Unique: f35fEnDoMW2Sgpp8d65BaA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B95BA100C664;
 Thu, 10 Dec 2020 12:14:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBF615C26D;
 Thu, 10 Dec 2020 12:14:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AE979A1EE; Thu, 10 Dec 2020 13:13:59 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/11] x86: rewrite gsi_handler()
Date: Thu, 10 Dec 2020 13:13:49 +0100
Message-Id: <20201210121359.18320-2-kraxel@redhat.com>
In-Reply-To: <20201210121359.18320-1-kraxel@redhat.com>
References: <20201210121359.18320-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Rewrite function to use switch() for IRQ number mapping.
Check i8259_irq exists before raising it so the function
also works in case no i8259 (aka pic) is present.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-id: 20201203105423.10431-3-kraxel@redhat.com
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


