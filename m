Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832156AF03D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:29:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZc2C-0006kv-9g; Tue, 07 Mar 2023 13:27:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9298a7250c90fe94fbb7+7135+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pZc23-0006gW-Ds
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:27:28 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9298a7250c90fe94fbb7+7135+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pZc1t-0005xv-CM
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:27:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=clpLW6t7rNTbn75BmNqsky8pta5BOUHGruM/9tE0I6Y=; b=oxyb0Zc977dL6HDYla/xb0jmRi
 wicc0b/PnADcjdbWq2Dk/p9BVwuybP+MgbvTevS8Wu1FoJTEwbavQ13D2W+BBHxm+zK8nU/h1jxsg
 vVzDOE4ufdCkp2mrCNM8aG7dTVuAYypKE1NizOKfOinHlUNtHRNqvM/pTY3BhNamgAGnjeL8aE9X5
 FNir07g/WsS3D4nqKatrbdKx/Bae+dfF4z076qYPgkvWfxI4QsBlajXd0RqQcunzJ2bd7vaqGx1c4
 Z28jdK/WW4iFZpHSOKJLthh+YQrw5+84C7cY/59OWc6GSDs1ysuXHiyD0rtSmNCnhAJ2fLHy30tDH
 Fqb//PVg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pZc1o-006deP-3K; Tue, 07 Mar 2023 18:27:12 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pZc1o-009e9p-0L; Tue, 07 Mar 2023 18:27:12 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 23/27] hw/xen: Map guest XENSTORE_PFN grant in emulated Xenstore
Date: Tue,  7 Mar 2023 18:27:03 +0000
Message-Id: <20230307182707.2298618-24-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307182707.2298618-1-dwmw2@infradead.org>
References: <20230307182707.2298618-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+9298a7250c90fe94fbb7+7135+infradead.org+dwmw2@casper.srs.infradead.org;
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

We don't actually access the guest's page through the grant, because
this isn't real Xen, and we can just use the page we gave it in the
first place. Map the grant anyway, mostly for cosmetic purposes so it
*looks* like it's in use in the guest-visible grant table.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_xenstore.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index bf466c71ed..2cadafd56a 100644
--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -21,6 +21,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/xen/xen.h"
+#include "hw/xen/xen_backend_ops.h"
 #include "xen_overlay.h"
 #include "xen_evtchn.h"
 #include "xen_xenstore.h"
@@ -34,6 +35,7 @@
 
 #include "hw/xen/interface/io/xs_wire.h"
 #include "hw/xen/interface/event_channel.h"
+#include "hw/xen/interface/grant_table.h"
 
 #define TYPE_XEN_XENSTORE "xen-xenstore"
 OBJECT_DECLARE_SIMPLE_TYPE(XenXenstoreState, XEN_XENSTORE)
@@ -66,6 +68,9 @@ struct XenXenstoreState {
 
     uint8_t *impl_state;
     uint32_t impl_state_size;
+
+    struct xengntdev_handle *gt;
+    void *granted_xs;
 };
 
 struct XenXenstoreState *xen_xenstore_singleton;
@@ -1453,6 +1458,17 @@ int xen_xenstore_reset(void)
     }
     s->be_port = err;
 
+    /*
+     * We don't actually access the guest's page through the grant, because
+     * this isn't real Xen, and we can just use the page we gave it in the
+     * first place. Map the grant anyway, mostly for cosmetic purposes so
+     * it *looks* like it's in use in the guest-visible grant table.
+     */
+    s->gt = qemu_xen_gnttab_open();
+    uint32_t xs_gntref = GNTTAB_RESERVED_XENSTORE;
+    s->granted_xs = qemu_xen_gnttab_map_refs(s->gt, 1, xen_domid, &xs_gntref,
+                                             PROT_READ | PROT_WRITE);
+
     return 0;
 }
 
-- 
2.39.0


