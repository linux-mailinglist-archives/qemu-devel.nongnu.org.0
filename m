Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9165F6A856F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 16:38:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXkxp-0004Ga-Fd; Thu, 02 Mar 2023 10:35:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9a0490e5ac528e462c30+7130+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pXkxN-0003qf-VU
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 10:34:58 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9a0490e5ac528e462c30+7130+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pXkxM-0001f6-Eg
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 10:34:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=7gK7dvxz5pclX0MnciBP6zR++gp8k+vbHhIgn8vIfXk=; b=S4wCJdfuWRVgYPx9kKLk0xA+ko
 e7ZB09+Rs2KKJZoF7A2nmmbx4uXvWmZO8R/FlyeezVVODqEnTf3UGYROuP6Ln2PAMwseYTN+2ylze
 WIfvuHbVTq++w7YQm5Vbz/zeKfYK1n4sx2f5k04ZVAHmCRLfGQwoOYxPP1YEA3GydmIPPuBaH8GNB
 fGb6PBC9kgdipKoQRH374/cqIfbNOBYuXtA8yjW1vqiPTLpcrzZiC75A0JNifqzBbPAFr9ljsFUdh
 KEDDSRCDfn/eyuwne1D+npgC4VoXBRwdD1DixUj1yJ7RIQ1iNcFzRd/3NfjLSX4lq+9xdEeh/ExL5
 gpA4JCLQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pXkx5-00FL3s-0L; Thu, 02 Mar 2023 15:34:42 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXkx4-004uzq-38; Thu, 02 Mar 2023 15:34:38 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Subject: [RFC PATCH v1 23/25] hw/xen: Map guest XENSTORE_PFN grant in emulated
 Xenstore
Date: Thu,  2 Mar 2023 15:34:33 +0000
Message-Id: <20230302153435.1170111-24-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230302153435.1170111-1-dwmw2@infradead.org>
References: <20230302153435.1170111-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+9a0490e5ac528e462c30+7130+infradead.org+dwmw2@desiato.srs.infradead.org;
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
 hw/i386/kvm/xen_xenstore.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index 028f80499e..f9b7387024 100644
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
@@ -1452,6 +1457,17 @@ int xen_xenstore_reset(void)
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


