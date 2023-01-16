Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B23C166D1AC
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 23:20:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHXpQ-0007OT-25; Mon, 16 Jan 2023 17:19:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fb0b8ce1ba8490165fd5+7085+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pHXpH-0007Nv-Cd
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 17:19:35 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fb0b8ce1ba8490165fd5+7085+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pHXpE-00070Y-TC
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 17:19:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=rsdrX7wuH8dGMAzQn883Z83z0g8iVQdiVLtw1JjxZKQ=; b=Yz7Tpkq/PCL0QqHmHSUBjj3/K9
 Xupf7nDGeWcE7Vr5VYz+Zdp5kHa5se58id2sPIAhUNwPZy75FSg2j8NUMFwqEZJZvhLcT3GxfPPdj
 Nrv5GyIvlJZ9V0jgfTu/kCd2iBty4GRiDpvwXDYkrl9GK7akqQctgsc2bwRBR0ZjLxmQu+jmdmnyo
 XF+AoFxe/FdOCgV3js5VdJesOvZD4yqahGp0z+mNeWCWyfwvxWZeqnp9/JMfPrEYqRb81WtqyjhD0
 F+wHSvh2GzduA++xXn6jPiq+9bLFquFhWeYuJpVa5ofamE02LIfGpRDdniWdSLCzzF0M7U3tYdMjv
 dh2v0jrw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pHXpL-0098Uy-K6; Mon, 16 Jan 2023 22:19:40 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pHXp7-004iXv-2u; Mon, 16 Jan 2023 22:19:25 +0000
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
Subject: [RFC PATCH v7bis 11/19] hw/xen: Map guest XENSTORE_PFN grant in
 emulated Xenstore
Date: Mon, 16 Jan 2023 22:19:11 +0000
Message-Id: <20230116221919.1124201-12-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116221919.1124201-1-dwmw2@infradead.org>
References: <20230116215805.1123514-1-dwmw2@infradead.org>
 <20230116221919.1124201-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+fb0b8ce1ba8490165fd5+7085+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
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
 hw/i386/kvm/xen_xenstore.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index 6369e29f59..6e712816d3 100644
--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -21,6 +21,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/xen/xen.h"
+#include "hw/xen/xen_backend_ops.h"
 #include "xen_overlay.h"
 #include "xen_evtchn.h"
 #include "xen_xenstore.h"
@@ -30,13 +31,11 @@
 
 #include "standard-headers/xen/io/xs_wire.h"
 #include "standard-headers/xen/event_channel.h"
+#include "standard-headers/xen/grant_table.h"
 
 #define TYPE_XEN_XENSTORE "xen-xenstore"
 OBJECT_DECLARE_SIMPLE_TYPE(XenXenstoreState, XEN_XENSTORE)
 
-#define XEN_PAGE_SHIFT 12
-#define XEN_PAGE_SIZE (1ULL << XEN_PAGE_SHIFT)
-
 #define ENTRIES_PER_FRAME_V1 (XEN_PAGE_SIZE / sizeof(grant_entry_v1_t))
 #define ENTRIES_PER_FRAME_V2 (XEN_PAGE_SIZE / sizeof(grant_entry_v2_t))
 
@@ -59,6 +58,8 @@ struct XenXenstoreState {
     evtchn_port_t guest_port;
     evtchn_port_t be_port;
     struct xenevtchn_handle *eh;
+    struct xengntdev_handle *gt;
+    void *granted_xs;
 };
 
 struct XenXenstoreState *xen_xenstore_singleton;
@@ -461,5 +462,11 @@ int xen_xenstore_reset(void)
     }
     s->be_port = err;
 
+    s->gt = qemu_xen_gnttab_open();
+    uint32_t xs_gntref = GNTTAB_RESERVED_XENSTORE;
+    s->granted_xs = qemu_xen_gnttab_map_refs(s->gt, 1, xen_domid,
+                                             &xs_gntref, PROT_READ|PROT_WRITE);
+    printf("Granted XS %p\n", s->granted_xs);
+
     return 0;
 }
-- 
2.39.0


