Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A6D692A1C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 23:29:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQbrv-0002Gf-9j; Fri, 10 Feb 2023 17:27:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pQbrq-0002Fh-Kj
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 17:27:43 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pQbro-0007jB-Rb
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 17:27:42 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B86EF61E9C;
 Fri, 10 Feb 2023 22:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56E3C4339E;
 Fri, 10 Feb 2023 22:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676068059;
 bh=OA2AgeMCx7RRv0Vx8WIP0aooYg/Xp/x/p0wt5RQQtoU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h8ZbXBMCGQYQXrnTKCFbMyM8HuqL3yFVVbiWrHbEFiOqXQSlC0dxgnnUZfGnrMbo/
 PSo5C++W89CwVzKAUnkkV+TKrIzMLr3pltBDbr8q5wq8YYJ2JdZqOUKf8aVAMt05WC
 ZBvrHov/s82Enw7CUeGj3pGO1SZOgYyP6e7nmq1xS49TiUVpiEDyrC+iFZg0ohHSNM
 eqmeS6lf1eYuPsR4PJdpGP4dEqOBjHQHoiWu2QcofSvQCsEuE8bFJt7GoWrQj0+6Tx
 arKdZHt4B0EnU9p+a49iH+2BjtLi0NP3WSxktNIH2VMuKWothh0kZGCUz6dUFyleRb
 7VowIZkT5SoWw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org, peter.maydell@linaro.org,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Vikram Garhwal <vikram.garhwal@amd.com>, Paul Durrant <paul@xen.org>
Subject: [PULL 06/10] hw/xen/xen-hvm-common: skip ioreq creation on ioreq
 registration failure
Date: Fri, 10 Feb 2023 14:27:25 -0800
Message-Id: <20230210222729.957168-6-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2302101420510.4661@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2302101420510.4661@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=sstabellini@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Stefano Stabellini <stefano.stabellini@amd.com>

On ARM it is possible to have a functioning xenpv machine with only the
PV backends and no IOREQ server. If the IOREQ server creation fails continue
to the PV backends initialization.

Also, moved the IOREQ registration and mapping subroutine to new function
xen_do_ioreq_register().

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/xen/xen-hvm-common.c | 53 ++++++++++++++++++++++++++++-------------
 1 file changed, 36 insertions(+), 17 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index c2e1e08124..5e3c7b073f 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -781,25 +781,12 @@ err:
     exit(1);
 }
 
-void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
-                        MemoryListener xen_memory_listener)
+static void xen_do_ioreq_register(XenIOState *state,
+                                           unsigned int max_cpus,
+                                           MemoryListener xen_memory_listener)
 {
     int i, rc;
 
-    state->xce_handle = xenevtchn_open(NULL, 0);
-    if (state->xce_handle == NULL) {
-        perror("xen: event channel open");
-        goto err;
-    }
-
-    state->xenstore = xs_daemon_open();
-    if (state->xenstore == NULL) {
-        perror("xen: xenstore open");
-        goto err;
-    }
-
-    xen_create_ioreq_server(xen_domid, &state->ioservid);
-
     state->exit.notify = xen_exit_notifier;
     qemu_add_exit_notifier(&state->exit);
 
@@ -863,12 +850,44 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
     QLIST_INIT(&state->dev_list);
     device_listener_register(&state->device_listener);
 
+    return;
+
+err:
+    error_report("xen hardware virtual machine initialisation failed");
+    exit(1);
+}
+
+void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
+                        MemoryListener xen_memory_listener)
+{
+    int rc;
+
+    state->xce_handle = xenevtchn_open(NULL, 0);
+    if (state->xce_handle == NULL) {
+        perror("xen: event channel open");
+        goto err;
+    }
+
+    state->xenstore = xs_daemon_open();
+    if (state->xenstore == NULL) {
+        perror("xen: xenstore open");
+        goto err;
+    }
+
+    rc = xen_create_ioreq_server(xen_domid, &state->ioservid);
+    if (!rc) {
+        xen_do_ioreq_register(state, max_cpus, xen_memory_listener);
+    } else {
+        warn_report("xen: failed to create ioreq server");
+    }
+
     xen_bus_init();
 
     xen_register_backend(state);
 
     return;
+
 err:
-    error_report("xen hardware virtual machine initialisation failed");
+    error_report("xen hardware virtual machine backend registration failed");
     exit(1);
 }
-- 
2.25.1


