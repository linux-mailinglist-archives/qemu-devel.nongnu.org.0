Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B55678380
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 18:43:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK0pn-0000Bo-Jf; Mon, 23 Jan 2023 12:42:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pK0pl-0000BW-85
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 12:42:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pK0pj-00082S-7H
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 12:42:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674495733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gwc0pc36SkQZSVsGyzGHXtKaUtHfHx0SEDv7fMAvOjo=;
 b=E9kM1LgE94AH+oeGeB8AXoeauTRP4XzvOwHPmBC9s+6l9CW1ehJuG0d5LPfSpE28LzdKCY
 oYQdYEINcYk5N4tB5iU94OM3bfpOEgpysUNKCCDlw7CrBA5Z7D6sTsDwxQ6ZaSLOomWVra
 24S7qRQMjJ5cDP5m6V7gDTMj3G4SVsA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-XJjKeS6gOa-lD3KEul5mgQ-1; Mon, 23 Jan 2023 12:42:10 -0500
X-MC-Unique: XJjKeS6gOa-lD3KEul5mgQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5F33183B3C6;
 Mon, 23 Jan 2023 17:42:09 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0147F492C1B;
 Mon, 23 Jan 2023 17:42:07 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] docs/pcie.txt: Replace ioh3420 with pcie-root-port
Date: Mon, 23 Jan 2023 17:42:05 +0000
Message-Id: <20230123174205.683979-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Marcel Apfelbaum <marcel@redhat.com>

Do not mention ioh3420 in the "how to" doc.
The device still works and can be used by already
existing setups, but no need to be mentioned.

Suggested-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---

This patch was posted 5 years ago:

  https://lore.kernel.org/all/20170802155113.62471-1-marcel@redhat.com/

but seems to have fallen through the cracks and did not get merged.

This just had the obvious/trivial conflict resolution done, along with
trimming hugely excessive whitespace before the '\' line continuation.

 docs/pcie.txt | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/docs/pcie.txt b/docs/pcie.txt
index 89e3502075..df49178311 100644
--- a/docs/pcie.txt
+++ b/docs/pcie.txt
@@ -48,8 +48,8 @@ Place only the following kinds of devices directly on the Root Complex:
         strangely when PCI Express devices are integrated
         with the Root Complex.
 
-    (2) PCI Express Root Ports (ioh3420), for starting exclusively PCI Express
-        hierarchies.
+    (2) PCI Express Root Ports (pcie-root-port), for starting exclusively
+        PCI Express hierarchies.
 
     (3) PCI Express to PCI Bridge (pcie-pci-bridge), for starting legacy PCI
         hierarchies.
@@ -70,7 +70,7 @@ Place only the following kinds of devices directly on the Root Complex:
           -device pxb-pcie,id=pcie.1,bus_nr=x[,numa_node=y][,addr=z]
       PCI Express Root Ports and PCI Express to PCI bridges can be
       connected to the pcie.1 bus:
-          -device ioh3420,id=root_port1[,bus=pcie.1][,chassis=x][,slot=y][,addr=z]                                     \
+          -device pcie-root-port,id=root_port1[,bus=pcie.1][,chassis=x][,slot=y][,addr=z] \
           -device pcie-pci-bridge,id=pcie_pci_bridge1,bus=pcie.1
 
 
@@ -112,14 +112,14 @@ Plug only PCI Express devices into PCI Express Ports.
                                              ------------
 
 2.2.1 Plugging a PCI Express device into a PCI Express Root Port:
-          -device ioh3420,id=root_port1,chassis=x,slot=y[,bus=pcie.0][,addr=z]  \
+          -device pcie-root-port,id=root_port1,chassis=x,slot=y[,bus=pcie.0][,addr=z]  \
           -device <dev>,bus=root_port1
 2.2.2 Using multi-function PCI Express Root Ports:
-      -device ioh3420,id=root_port1,multifunction=on,chassis=x,addr=z.0[,slot=y][,bus=pcie.0] \
-      -device ioh3420,id=root_port2,chassis=x1,addr=z.1[,slot=y1][,bus=pcie.0] \
-      -device ioh3420,id=root_port3,chassis=x2,addr=z.2[,slot=y2][,bus=pcie.0] \
+      -device pcie-root-port,id=root_port1,multifunction=on,chassis=x,addr=z.0[,slot=y][,bus=pcie.0] \
+      -device pcie-root-port,id=root_port2,chassis=x1,addr=z.1[,slot=y1][,bus=pcie.0] \
+      -device pcie-root-port,id=root_port3,chassis=x2,addr=z.2[,slot=y2][,bus=pcie.0] \
 2.2.3 Plugging a PCI Express device into a Switch:
-      -device ioh3420,id=root_port1,chassis=x,slot=y[,bus=pcie.0][,addr=z]  \
+      -device pcie-root-port,id=root_port1,chassis=x,slot=y[,bus=pcie.0][,addr=z]  \
       -device x3130-upstream,id=upstream_port1,bus=root_port1[,addr=x]          \
       -device xio3130-downstream,id=downstream_port1,bus=upstream_port1,chassis=x1,slot=y1[,addr=z1]] \
       -device <dev>,bus=downstream_port1
-- 
2.39.0


