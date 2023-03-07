Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6133C6AE8DB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:19:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZaxK-0003bF-Vq; Tue, 07 Mar 2023 12:18:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+98a25f4d4d04c9e21499+7135+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pZawx-00025W-U8
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:18:11 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+98a25f4d4d04c9e21499+7135+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pZawu-0007T7-4e
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:18:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=82Q+BiWXMrz+wFyySB5DKlF6CrKphRlXsFH1yff2od4=; b=PV0iIlvQ0PObvRlCYaPk06cUgT
 TbDC2JYH3cGCMkH7zPjkYjcGSHbaugSG7K/gFzGLdVdnX6ewAqC6LZnyN32NmNanpXAxXHEW70Buw
 +J36U9JBwCFeqgkNwup0cB+HKgoUrMnTx1blyQjSF5pbr8J09w2rbo5iUkKbw5bPighuahZxlxavl
 f2mWehzyELxxrM3ZyxC/5QfPLK6dZI/9UgGhZNNlqTMPIHfb9FpQobHjwf6oP00jkUbIAY5XGdLcC
 bFwkvcBuwu8267gAoFf1w/dLJAtWhEPBnr2U8KAn6OaNmWmGyamIYyiwk9ktGln7WMPgkWVjHIR78
 b52nbg4A==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pZawk-00H60D-1l; Tue, 07 Mar 2023 17:17:54 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pZawk-009chr-1N; Tue, 07 Mar 2023 17:17:54 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 20/27] hw/xen: Hook up emulated implementation for event
 channel operations
Date: Tue,  7 Mar 2023 17:17:43 +0000
Message-Id: <20230307171750.2293175-21-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307171750.2293175-1-dwmw2@infradead.org>
References: <20230307171750.2293175-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+98a25f4d4d04c9e21499+7135+infradead.org+dwmw2@desiato.srs.infradead.org;
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

We provided the backend-facing evtchn functions very early on as part of
the core Xen platform support, since things like timers and xenstore need
to use them.

By what may or may not be an astonishing coincidence, those functions
just *happen* all to have exactly the right function prototypes to slot
into the evtchn_backend_ops table and be called by the PV backends.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_evtchn.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 886fbf6b3b..98a7b85047 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -34,6 +34,7 @@
 #include "hw/pci/msi.h"
 #include "hw/pci/msix.h"
 #include "hw/irq.h"
+#include "hw/xen/xen_backend_ops.h"
 
 #include "xen_evtchn.h"
 #include "xen_overlay.h"
@@ -278,6 +279,17 @@ static const TypeInfo xen_evtchn_info = {
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
 static void gsi_assert_bh(void *opaque)
 {
     struct vcpu_info *vi = kvm_xen_get_vcpu_info_hva(0);
@@ -318,6 +330,9 @@ void xen_evtchn_create(void)
     s->nr_pirq_inuse_words = DIV_ROUND_UP(s->nr_pirqs, 64);
     s->pirq_inuse_bitmap = g_new0(uint64_t, s->nr_pirq_inuse_words);
     s->pirq = g_new0(struct pirq_info, s->nr_pirqs);
+
+    /* Set event channel functions for backend drivers to use */
+    xen_evtchn_ops = &emu_evtchn_backend_ops;
 }
 
 void xen_evtchn_connect_gsis(qemu_irq *system_gsis)
-- 
2.39.0


