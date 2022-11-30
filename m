Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A7F63CF12
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 07:03:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0GBA-0007Ew-4Z; Wed, 30 Nov 2022 01:02:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leixiang@kylinos.cn>)
 id 1p0GB8-0007En-1F
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 01:02:42 -0500
Received: from [124.126.103.232] (helo=mailgw.kylinos.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leixiang@kylinos.cn>)
 id 1p0GB4-0001iW-N7
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 01:02:41 -0500
X-UUID: a2b87592d3ba4e708409a8f71ba8ee80-20221130
X-CPASD-INFO: 480c9930cf9646638917193e5fb08562@fYhqg2ZrYWCPhnuCg3mBbVhqYWdhZVO
 0d6CCYWZlYlKVhH5xTV5nX1V9gnNXZF5dXFV3dnBQYmBhXVJ3i3-XblBhXoZgUZB3g3pqg2pnYw==
X-CLOUD-ID: 480c9930cf9646638917193e5fb08562
X-CPASD-SUMMARY: SIP:-1, APTIP:-2.0, KEY:0.0, FROMBLOCK:1, OB:1.0, URL:-5,
 TVAL:180.
 0, ESV:0.0, ECOM:-5.0, ML:0.0, FD:0.0, CUTS:74.0, IP:-2.0, MAL:-5.0, PHF:-5.0,
 PHC:-5.
 0, SPF:4.0, EDMS:-5, IPLABEL:4480.0, FROMTO:0, AD:0, FFOB:1.0, CFOB:1.0, SPC:0,
 SIG:-5
 , AUF:2, DUF:9500, ACD:157, DCD:157, SL:0, EISP:0, AG:0, CFC:0.428, CFSR:0.058,
 UAT:0, R
 AF:0, IMG:-5.0, DFA:0, DTA:0, IBL:-2.0, ADI:-5, SBL:0, REDM:0, REIP:0, ESB:0,
 ATTNUM:0, EAF:0,CID:-5.0,VERSION:2.3.17
X-CPASD-ID: a2b87592d3ba4e708409a8f71ba8ee80-20221130
X-CPASD-BLOCK: 1000
X-CPASD-STAGE: 1
X-UUID: a2b87592d3ba4e708409a8f71ba8ee80-20221130
X-User: leixiang@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <leixiang@kylinos.cn>) (Generic MTA)
 with ESMTP id 1899459991; Wed, 30 Nov 2022 13:57:28 +0800
From: leixiang <leixiang@kylinos.cn>
To: mst@redhat.com
Cc: qemu-devel@nongnu.org, xieming@kylinos.cn, zengchi@kylinos.cn,
 leixiang <leixiang@kylinos.cn>
Subject: [RESEND PATCH] virtio-pci: fix vector_irqfd leak in
 virtio_pci_set_guest_notifiers
Date: Wed, 30 Nov 2022 13:56:11 +0800
Message-Id: <20221130055611.1037023-1-leixiang@kylinos.cn>
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

