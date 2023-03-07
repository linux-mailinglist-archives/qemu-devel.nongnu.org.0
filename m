Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3325F6AE8F9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:20:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZaxB-0002q6-RC; Tue, 07 Mar 2023 12:18:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9298a7250c90fe94fbb7+7135+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pZawu-00023V-1D
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:18:05 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9298a7250c90fe94fbb7+7135+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pZawq-0007SY-DG
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:18:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=XcYyUSsIZ5DPXUpEedwRKiEDlpl47E4QL1UmqvKuII4=; b=jvJ9tQPOuJFebkKg0V5juiyKzZ
 Z18YSLGfJnU9igUISRf0/QJHVt7YjMz3LewFIiIll+SUOvBRWnbnKFf3BLM9yc6AF5pF4xgpI43LY
 efHoDwmsDbrT0iQxWT0h75pdfB6ZnSkHMQT1/zUWOdXz2Mk4wIilc6mTL7s3KKXN9e1FoqscD/BA3
 sPUhcQdD1LcxFmEwE88G8bDG4X3oy2ov26Xt+Th2BpoLudNgSEcDApvZ+QhAHEB2WndhTksTLJulE
 52+f4OX+1PbdaO79BmzslXXqBjQQQqzccx9q4USKSprjMaKzJzFBpe3Kzd1vT6PEtH1RpNkHhjf1y
 MXG/AN1A==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pZawk-006ay6-Bg; Tue, 07 Mar 2023 17:17:54 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pZawk-009chn-1B; Tue, 07 Mar 2023 17:17:54 +0000
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
Subject: [PATCH v2 19/27] hw/xen: Only advertise ring-page-order for xen-block
 if gnttab supports it
Date: Tue,  7 Mar 2023 17:17:42 +0000
Message-Id: <20230307171750.2293175-20-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307171750.2293175-1-dwmw2@infradead.org>
References: <20230307171750.2293175-1-dwmw2@infradead.org>
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

Whem emulating Xen, multi-page grants are distinctly non-trivial and we
have elected not to support them for the time being. Don't advertise
them to the guest.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/block/xen-block.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 87299615e3..f5a744589d 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -83,7 +83,8 @@ static void xen_block_connect(XenDevice *xendev, Error **errp)
             g_free(ring_ref);
             return;
         }
-    } else if (order <= blockdev->props.max_ring_page_order) {
+    } else if (qemu_xen_gnttab_can_map_multi() &&
+               order <= blockdev->props.max_ring_page_order) {
         unsigned int i;
 
         nr_ring_ref = 1 << order;
@@ -255,8 +256,12 @@ static void xen_block_realize(XenDevice *xendev, Error **errp)
     }
 
     xen_device_backend_printf(xendev, "feature-flush-cache", "%u", 1);
-    xen_device_backend_printf(xendev, "max-ring-page-order", "%u",
-                              blockdev->props.max_ring_page_order);
+
+    if (qemu_xen_gnttab_can_map_multi()) {
+        xen_device_backend_printf(xendev, "max-ring-page-order", "%u",
+                                  blockdev->props.max_ring_page_order);
+    }
+
     xen_device_backend_printf(xendev, "info", "%u", blockdev->info);
 
     xen_device_frontend_printf(xendev, "virtual-device", "%lu",
-- 
2.39.0


