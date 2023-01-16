Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6A166D1B1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 23:21:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHXps-0007YX-Cv; Mon, 16 Jan 2023 17:20:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+491b11caf3ce55304f6a+7085+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pHXpL-0007Oy-RC
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 17:19:40 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+491b11caf3ce55304f6a+7085+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pHXpE-00070k-VO
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 17:19:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=K5XxJD54Zd0lwqvbWiyfb3mU6ZCyT+95J3M3f2q6NJA=; b=AwZ364XZkL6EsfAjkVYlCH9h0o
 LN8UZFs0EHXYgzpRGfl0cppUlxQEbzvVptGgmIbgZhtBvmnpmtcZDAAkQk5pbKD/UBVwKGpqcaSDd
 5SXady0RR88VbNoamJW1/xk/DyrKWLPsc7t+GkVqvL9IB77bgbHQwj2wOOoYJbf+V9Vn6LJ1wv/JF
 6Q9HLHtXitlC5U5kXvIw6tqrEexWlxPmRQGWCNyK0M2hX+/fwt366A+xYPQAevy3L9mZKli5V+rjX
 zhOgyjR04UBjOZD1u2VbdmsfPigh5DkLQNu/6yxeJsos9PiaFqcky62JQG4Hwbeu/WMz65UMR2zs9
 7ayZHIEQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pHXox-005juY-3D; Mon, 16 Jan 2023 22:19:16 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pHXp7-004iXL-1I; Mon, 16 Jan 2023 22:19:25 +0000
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
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [RFC PATCH v7bis 02/19] hw/xen: Add emulated evtchn ops
Date: Mon, 16 Jan 2023 22:19:02 +0000
Message-Id: <20230116221919.1124201-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116221919.1124201-1-dwmw2@infradead.org>
References: <20230116215805.1123514-1-dwmw2@infradead.org>
 <20230116221919.1124201-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+491b11caf3ce55304f6a+7085+infradead.org+dwmw2@desiato.srs.infradead.org;
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
index b23bb71abb..b571517b2c 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -30,6 +30,7 @@
 #include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
 #include "hw/irq.h"
+#include "hw/xen/xen_backend_ops.h"
 
 #include "xen_evtchn.h"
 #include "xen_overlay.h"
@@ -198,6 +199,17 @@ static const TypeInfo xen_evtchn_info = {
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
@@ -220,6 +232,9 @@ void xen_evtchn_create(void)
     for (i = 0; i < GSI_NUM_PINS; i++) {
         sysbus_init_irq(SYS_BUS_DEVICE(s), &s->gsis[i]);
     }
+
+    /* Set event channel functions for backend drivers to use */
+    xen_evtchn_ops = &emu_evtchn_backend_ops;
 }
 
 void xen_evtchn_connect_gsis(qemu_irq *system_gsis)
-- 
2.39.0


