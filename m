Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 824F16A8569
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 16:38:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXkxr-0004K1-26; Thu, 02 Mar 2023 10:35:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9a0490e5ac528e462c30+7130+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pXkxP-0003tN-8f
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 10:34:59 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9a0490e5ac528e462c30+7130+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pXkxN-0001go-4t
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 10:34:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=FnClZ8IFan30fx5D6PHOfap2YeZdQXUEp+XrOHw7NWs=; b=VVkNvJQsV79cgt8bzx+l0ClT+G
 Wiyz5BhL24D12/QkaDakc0ALlSx1i2qok2apG76LwYNEM1pPgmDb1NfTSlVj7wZkqVtHQVBqpujPV
 K1mLrO+C4airr6O55gGcgarHdCX04k4Bsl7YQxlVfXtD4xKx+Jia60goBVqSVetR+CatCGqWNXsPc
 Hkh2FB4jcKSnEwt9c7+CYwLFfwoNISbAUmAKkfx1ZpxeJe/41myBDmH/5c+nMtk3LX5v20ijD+P3c
 fb+EEZ7t4gvEtKdroZBJtbhl42Mqx90Tx1WL+utNfz9glZ4m/cq0szzCSXECcHVSYePfkl7xeKlYy
 t8AX++Ww==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pXkx4-00FL3m-2e; Thu, 02 Mar 2023 15:34:40 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXkx4-004uzR-2J; Thu, 02 Mar 2023 15:34:38 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Subject: [RFC PATCH v1 18/25] hw/xen: Avoid crash when backend watch fires too
 early
Date: Thu,  2 Mar 2023 15:34:28 +0000
Message-Id: <20230302153435.1170111-19-dwmw2@infradead.org>
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


