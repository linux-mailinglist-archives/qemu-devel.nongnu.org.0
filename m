Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 017CF63CF10
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 07:01:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0G88-000699-Sr; Wed, 30 Nov 2022 00:59:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leixiang@kylinos.cn>)
 id 1p0G82-00068w-EP
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 00:59:31 -0500
Received: from [124.126.103.232] (helo=mailgw.kylinos.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leixiang@kylinos.cn>)
 id 1p0G7y-00017m-Vb
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 00:59:29 -0500
X-UUID: 4b67dd9531db4257890c8bfaf0803694-20221130
X-CPASD-INFO: 1131c7cd861e4f3bb6d27664d017a6c2@eoFtUZBpkZRkVnOxg6l-nIJnlGJnYla
 DpmpRZ49mj1KVhH5xTV5nX1V9gnNXZF5dXFV3dnBQYmBhXVJ3i3-XblBgXoZgUZB3gHNtUZNlkw==
X-CLOUD-ID: 1131c7cd861e4f3bb6d27664d017a6c2
X-CPASD-SUMMARY: SIP:-1, APTIP:-2.0, KEY:0.0, FROMBLOCK:1, OB:0.0, URL:-5,
 TVAL:180.
 0, ESV:0.0, ECOM:-5.0, ML:0.0, FD:0.0, CUTS:74.0, IP:-2.0, MAL:-5.0, PHF:-5.0,
 PHC:-5.
 0, SPF:4.0, EDMS:-5, IPLABEL:4480.0, FROMTO:1, AD:0, FFOB:0.0, CFOB:0.0, SPC:0,
 SIG:-5
 , AUF:1, DUF:9498, ACD:157, DCD:157, SL:0, EISP:0, AG:0, CFC:0.428, CFSR:0.058,
 UAT:0, R
 AF:0, IMG:-5.0, DFA:0, DTA:0, IBL:-2.0, ADI:-5, SBL:0, REDM:0, REIP:0, ESB:0,
 ATTNUM:0, EAF:0,CID:-5.0,VERSION:2.3.17
X-CPASD-ID: 4b67dd9531db4257890c8bfaf0803694-20221130
X-CPASD-BLOCK: 1000
X-CPASD-STAGE: 1
X-UUID: 4b67dd9531db4257890c8bfaf0803694-20221130
X-User: leixiang@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <leixiang@kylinos.cn>) (Generic MTA)
 with ESMTP id 702307408; Wed, 30 Nov 2022 13:54:02 +0800
From: leixiang <leixiang@kylinos.cn>
To: leixiang@kylinos.cn
Cc: mst@redhat.com, qemu-devel@nongnu.org, xieming@kylinos.cn,
 zengchi@kylinos.cn
Subject: [RESEND PATCH] virtio-pci: fix vector_irqfd leak in
 virtio_pci_set_guest_notifiers
Date: Wed, 30 Nov 2022 13:52:40 +0800
Message-Id: <20221130055240.1036842-1-leixiang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220826030646.1003059-1-leixiang@kylinos.cn>
References: <20220826030646.1003059-1-leixiang@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 124.126.103.232 (failed)
Received-SPF: pass client-ip=124.126.103.232; envelope-from=leixiang@kylinos.cn;
 helo=mailgw.kylinos.cn
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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

proxy->vector_irqfd did not free when set guest notifier failed.

Signed-off-by: Lei Xiang <leixiang@kylinos.cn>
Tested-by: Zeng Chi <zengchi@kylinos.cn>
Suggested-by: Xie Ming <xieming@kylinos.cn>
---
 hw/virtio/virtio-pci.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index c6b47a9c..4862f83b 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1038,6 +1038,12 @@ assign_error:
     while (--n >= 0) {
         virtio_pci_set_guest_notifier(d, n, !assign, with_irqfd);
     }
+
+   g_free(proxy->vector_irqfd);
+   proxy->vector_irqfd = NULL;
+
     return r;
 }
 
-- 


No virus found
		Checked by Hillstone Network AntiVirus

