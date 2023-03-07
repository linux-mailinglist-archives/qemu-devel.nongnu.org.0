Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73B36AE8D2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:19:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZaxJ-0003U0-OY; Tue, 07 Mar 2023 12:18:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9298a7250c90fe94fbb7+7135+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pZaws-00022S-DA
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:18:03 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9298a7250c90fe94fbb7+7135+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pZawq-0007Sj-CA
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:18:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=BHJMHnydR0+hWti+8rkf/Wiysg+WP6PP8ZazFEExUkk=; b=Rmf/g5ViByK25cx3jA6jNlVCTF
 hYIlX4/w8YM91bwd0OrsWETr2r4Rjnr9F5PXvC3pTWwQpqjTPjSrGNEi+7GfZDN7CtUxyVCEqxsSh
 Urhn+NBsyWNjF2BoMEod9No4LyG9TaRjIPijIUKaqYNuBiwPCYPjGZKPzKO+X1dRVrUeREBnNtzb5
 QQKlNzvwyxzjIpUBAdc6Aav/qfAhDSJ+gxfpbNMiMMjhuuimC6arfl8KgCt39x4CRFLtPvj1zL6SO
 ZJKokXooEYMtHZhsRRYMvRrfsTX9apphfYf8B9VfiTqrCaKCE1h0NS/vslha/Wv3fDj9t3m2RSRGf
 22KQyphw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pZawk-006ay5-A0; Tue, 07 Mar 2023 17:17:54 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pZawk-009chi-10; Tue, 07 Mar 2023 17:17:54 +0000
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
Subject: [PATCH v2 18/27] hw/xen: Avoid crash when backend watch fires too
 early
Date: Tue,  7 Mar 2023 17:17:41 +0000
Message-Id: <20230307171750.2293175-19-dwmw2@infradead.org>
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

From: Paul Durrant <pdurrant@amazon.com>

The xen-block code ends up calling aio_poll() through blkconf_geometry(),
which means we see watch events during the indirect call to
xendev_class->realize() in xen_device_realize(). Unfortunately this call
is made before populating the initial frontend and backend device nodes
in xenstore and hence xen_block_frontend_changed() (which is called from
a watch event) fails to read the frontend's 'state' node, and hence
believes the device is being torn down. This in-turn sets the backend
state to XenbusStateClosed and causes the device to be deleted before it
is fully set up, leading to the crash.
By simply moving the call to xendev_class->realize() after the initial
xenstore nodes are populated, this sorry state of affairs is avoided.

Reported-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/xen/xen-bus.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 9fe54967d4..c59850b1de 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -1034,13 +1034,6 @@ static void xen_device_realize(DeviceState *dev, Error **errp)
         goto unrealize;
     }
 
-    if (xendev_class->realize) {
-        xendev_class->realize(xendev, errp);
-        if (*errp) {
-            goto unrealize;
-        }
-    }
-
     xen_device_backend_printf(xendev, "frontend", "%s",
                               xendev->frontend_path);
     xen_device_backend_printf(xendev, "frontend-id", "%u",
@@ -1059,6 +1052,13 @@ static void xen_device_realize(DeviceState *dev, Error **errp)
         xen_device_frontend_set_state(xendev, XenbusStateInitialising, true);
     }
 
+    if (xendev_class->realize) {
+        xendev_class->realize(xendev, errp);
+        if (*errp) {
+            goto unrealize;
+        }
+    }
+
     xendev->exit.notify = xen_device_exit;
     qemu_add_exit_notifier(&xendev->exit);
     return;
-- 
2.39.0


