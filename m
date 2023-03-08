Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC6D6B0FD5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:08:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZx8f-0004uX-12; Wed, 08 Mar 2023 11:59:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx8T-0004lJ-UH; Wed, 08 Mar 2023 11:59:29 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx8M-00047Y-0Q; Wed, 08 Mar 2023 11:59:29 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id ED271400B9;
 Wed,  8 Mar 2023 19:58:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id BA10092;
 Wed,  8 Mar 2023 19:58:55 +0300 (MSK)
Received: (nullmailer pid 2098369 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:55 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 37/47] virtio-rng-pci: fix transitional migration compat for
 vectors
Date: Wed,  8 Mar 2023 19:57:40 +0300
Message-Id: <20230308165815.2098148-37-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

In bad9c5a516 ("virtio-rng-pci: fix migration compat for vectors") I
fixed the virtio-rng-pci migration compatibility, but it was discovered
that we also need to fix the other aliases of the device for the
transitional cases.

Fixes: 9ea02e8f1 ('virtio-rng-pci: Allow setting nvectors, so we can use MSI-X')
bz: https://bugzilla.redhat.com/show_bug.cgi?id=2162569
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20230207174944.138255-1-dgilbert@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit 62bdb8871512076841f4464f7e26efdc7783f78d)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/core/machine.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 77a0a131d1..035d078a74 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -43,6 +43,8 @@
 GlobalProperty hw_compat_7_1[] = {
     { "virtio-device", "queue_reset", "false" },
     { "virtio-rng-pci", "vectors", "0" },
+    { "virtio-rng-pci-transitional", "vectors", "0" },
+    { "virtio-rng-pci-non-transitional", "vectors", "0" },
 };
 const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
 
-- 
2.30.2


