Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1AD4B408C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 05:01:36 +0100 (CET)
Received: from localhost ([::1]:52688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJSYR-0004iI-Gf
	for lists+qemu-devel@lfdr.de; Sun, 13 Feb 2022 23:01:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJSVC-0001uO-Uy
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 22:58:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJSVB-0008Dg-Cf
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 22:58:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644811092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=19jVFjmoMn/fQKpqT/w5xtZ5txLPD6BW0ehLZ75oRpA=;
 b=B/jW40LMBKkmgfV2aWt+U2zg6sef9rSBU9aBBtyJ+K9/2b61OcK9qfeRNe/TuUwkTJDswP
 MGFGPaUbcWR1Nf9LT5afdxNKNbwddUyowyOwBEWuI7DHbQYdiJ1SWXtHeT9It70sfjiRsU
 EQPUbj6zLegEEL7YZN3XHQsCShpJCmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-3De7JfXgNwOSubtjFW4FDw-1; Sun, 13 Feb 2022 22:58:09 -0500
X-MC-Unique: 3De7JfXgNwOSubtjFW4FDw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91A522F46;
 Mon, 14 Feb 2022 03:58:08 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-241.pek2.redhat.com
 [10.72.13.241])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F11035DB8B;
 Mon, 14 Feb 2022 03:58:06 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH 7/8] hw/net: e1000e: Clear ICR on read when using non MSI-X
 interrupts
Date: Mon, 14 Feb 2022 11:57:40 +0800
Message-Id: <20220214035741.70990-7-jasowang@redhat.com>
In-Reply-To: <20220214035741.70990-1-jasowang@redhat.com>
References: <20220214035741.70990-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Nick Hudson <skrll@netbsd.org>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nick Hudson <skrll@netbsd.org>

In section 7.4.3 of the 82574 datasheet it states that

    "In systems that do not support MSI-X, reading the ICR
     register clears it's bits..."

Some OSes rely on this.

Signed-off-by: Nick Hudson <skrll@netbsd.org>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000e_core.c | 5 +++++
 hw/net/trace-events  | 1 +
 2 files changed, 6 insertions(+)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 8ae6fb7e14..2c51089a82 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -2607,6 +2607,11 @@ e1000e_mac_icr_read(E1000ECore *core, int index)
         core->mac[ICR] = 0;
     }
 
+    if (!msix_enabled(core->owner)) {
+        trace_e1000e_irq_icr_clear_nonmsix_icr_read();
+        core->mac[ICR] = 0;
+    }
+
     if ((core->mac[ICR] & E1000_ICR_ASSERTED) &&
         (core->mac[CTRL_EXT] & E1000_CTRL_EXT_IAME)) {
         trace_e1000e_irq_icr_clear_iame();
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 643338f610..4c0ec3fda1 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -221,6 +221,7 @@ e1000e_irq_write_ics(uint32_t val) "Adding ICR bits 0x%x"
 e1000e_irq_icr_process_iame(void) "Clearing IMS bits due to IAME"
 e1000e_irq_read_ics(uint32_t ics) "Current ICS: 0x%x"
 e1000e_irq_read_ims(uint32_t ims) "Current IMS: 0x%x"
+e1000e_irq_icr_clear_nonmsix_icr_read(void) "Clearing ICR on read due to non MSI-X int"
 e1000e_irq_icr_read_entry(uint32_t icr) "Starting ICR read. Current ICR: 0x%x"
 e1000e_irq_icr_read_exit(uint32_t icr) "Ending ICR read. Current ICR: 0x%x"
 e1000e_irq_icr_clear_zero_ims(void) "Clearing ICR on read due to zero IMS"
-- 
2.32.0 (Apple Git-132)


