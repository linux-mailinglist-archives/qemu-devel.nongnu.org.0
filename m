Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7771E7FA5
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 16:05:18 +0200 (CEST)
Received: from localhost ([::1]:39200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jefdN-0000CR-O6
	for lists+qemu-devel@lfdr.de; Fri, 29 May 2020 10:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jefKZ-0003Dy-MK
 for qemu-devel@nongnu.org; Fri, 29 May 2020 09:45:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51321
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jefKM-00077h-TE
 for qemu-devel@nongnu.org; Fri, 29 May 2020 09:45:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590759937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DTrIcuQ18T+jDyxi7QCSDcn8mAWENmPoI1+nC0vw6KI=;
 b=SJQTl5EStzU6DsxxbrWFqKeZyMF/tv91aFij5oikOFdAX3AULhaRM61f2IA4u7f6h+uHyr
 zp5I+Wn9U8tLeR+BGyqoghM8U1nY649DtOW6S9g8mHwntB/0z+392qgJRDKAD9ojjIgpwx
 qWhkk7lwejv/fNjzHO5CLTJMjwzHgDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-w3WCv-nmNWip3Lk-TV8ehA-1; Fri, 29 May 2020 09:45:33 -0400
X-MC-Unique: w3WCv-nmNWip3Lk-TV8ehA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BB7E1007271;
 Fri, 29 May 2020 13:45:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B11D060C80;
 Fri, 29 May 2020 13:45:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 120BF11358CB; Fri, 29 May 2020 15:45:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/58] pci: Convert uses of pci_create() etc. manually
Date: Fri, 29 May 2020 15:44:41 +0200
Message-Id: <20200529134523.8477-17-armbru@redhat.com>
In-Reply-To: <20200529134523.8477-1-armbru@redhat.com>
References: <20200529134523.8477-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/29 01:34:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Same transformation as in the previous commit.  Manual, because
convincing Coccinelle to transform these cases is not worthwhile.

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/sparc64/sun4u.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 6f29a013ca..0b898d6e3d 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -635,24 +635,28 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
     memset(&macaddr, 0, sizeof(MACAddr));
     onboard_nic = false;
     for (i = 0; i < nb_nics; i++) {
+        PCIBus *bus;
         nd = &nd_table[i];
 
         if (!nd->model || strcmp(nd->model, "sunhme") == 0) {
             if (!onboard_nic) {
-                pci_dev = pci_create_multifunction(pci_busA, PCI_DEVFN(1, 1),
+                pci_dev = pci_new_multifunction(PCI_DEVFN(1, 1),
                                                    true, "sunhme");
+                bus = pci_busA;
                 memcpy(&macaddr, &nd->macaddr.a, sizeof(MACAddr));
                 onboard_nic = true;
             } else {
-                pci_dev = pci_create(pci_busB, -1, "sunhme");
+                pci_dev = pci_new(-1, "sunhme");
+                bus = pci_busB;
             }
         } else {
-            pci_dev = pci_create(pci_busB, -1, nd->model);
+            pci_dev = pci_new(-1, nd->model);
+            bus = pci_busB;
         }
 
         dev = &pci_dev->qdev;
         qdev_set_nic_properties(dev, nd);
-        qdev_init_nofail(dev);
+        pci_realize_and_unref(pci_dev, bus, &error_fatal);
     }
 
     /* If we don't have an onboard NIC, grab a default MAC address so that
-- 
2.21.3


