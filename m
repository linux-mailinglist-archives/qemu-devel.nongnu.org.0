Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ABF66436F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 15:40:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFDug-0007ke-EY; Tue, 10 Jan 2023 07:39:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+6ce08bad6b360d6d5e23+7079+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pFDtF-0007Br-LN
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 07:38:12 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+6ce08bad6b360d6d5e23+7079+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pFDtC-0006Zp-GL
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 07:38:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=59OAoBMwqlb+eOrw8CS/ng81rxF+ejglvyl3aNxfeno=; b=AS0sgUeF6pENPHT/EmrX1672aZ
 ShLamxFLalfQLmeBi3qe5qKRKF3o81JKFrPC5xnncZIJ2OyRXMDTRhUmsKcVkYNGBRbTPKAu402N1
 rNh7t9jVW+YfH8Qb1u7UpbGfNHUWaMZDwGU0KB48TuCP0W2wavHi3RvNe3tTC/Qmvi1nZfe1SHdPE
 AgzusMud1TSGbXpsSPhsgwlt6TyeSpb9Mmke298bgsMNPEfs81Ifzeq5qWVeK+PFeOQiS2M7QfqVU
 PBsSi0y6BRhc8ReyUuzBETPyirbc4WiLfhCe1Qab68z4y1HovnA11tp4o3vUfzBcr1R+HntpbTUCB
 ibRy7dZg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pFDsy-003886-3D; Tue, 10 Jan 2023 12:37:49 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pFDt6-006Z5q-8X; Tue, 10 Jan 2023 12:37:56 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
Subject: [RFC PATCH v1 02/15] hw/xen: Add emulated evtchn ops
Date: Tue, 10 Jan 2023 12:37:41 +0000
Message-Id: <20230110123754.1564465-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230110123754.1564465-1-dwmw2@infradead.org>
References: <20230110122042.1562155-1-dwmw2@infradead.org>
 <20230110123754.1564465-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+6ce08bad6b360d6d5e23+7079+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_evtchn.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 98a47066bc..084249c56d 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -30,6 +30,7 @@
 #include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
 #include "hw/irq.h"
+#include "hw/xen/xen_backend_ops.h"
 
 #include "xen_evtchn.h"
 #include "xen_overlay.h"
@@ -196,6 +197,17 @@ static const TypeInfo xen_evtchn_info = {
     .class_init    = xen_evtchn_class_init,
 };
 
+static struct evtchn_backend_ops emu_evtchn_backend_ops = {
+    .open = xen_be_evtchn_open,
+    .bind_interdomain = xen_be_evtchn_bind_interdomain,
+    .unbind = xen_be_evtchn_unbind,
+    .close = xen_be_evtchn_close,
+    .get_fd = xen_be_evtchn_fd,
+    .notify = xen_be_evtchn_notify,
+    .unmask = xen_be_evtchn_unmask,
+    .pending = xen_be_evtchn_pending,
+};
+
 void xen_evtchn_create(void)
 {
     XenEvtchnState *s = XEN_EVTCHN(sysbus_create_simple(TYPE_XEN_EVTCHN,
@@ -209,6 +221,9 @@ void xen_evtchn_create(void)
     for (i = 0; i < GSI_NUM_PINS; i++) {
         sysbus_init_irq(SYS_BUS_DEVICE(s), &s->gsis[i]);
     }
+
+    /* Set event channel functions for backend drivers to use */
+    xen_evtchn_ops = &emu_evtchn_backend_ops;
 }
 
 void xen_evtchn_connect_gsis(qemu_irq *system_gsis)
-- 
2.35.3


