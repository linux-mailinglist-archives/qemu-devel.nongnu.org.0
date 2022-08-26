Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 939AE5A20B4
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 08:13:29 +0200 (CEST)
Received: from localhost ([::1]:48002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRSao-000707-Ck
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 02:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leixiang@kylinos.cn>)
 id 1oRPlj-0004tJ-Hx
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 23:12:27 -0400
Received: from [124.126.103.232] (port=38458 helo=mailgw.kylinos.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leixiang@kylinos.cn>)
 id 1oRPld-0005qP-So
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 23:12:26 -0400
X-UUID: 974c1789b7d3482bb1e76a18c2d7efce-20220826
X-CPASD-INFO: 1bc0804f8581479697411f402375fbd8@erKdUGViYpZkVXp9g3qEcFloZGFhklR
 _dG1XZZSSkFiVgnxsTV5qXFWCgGpQYWNdYlV3fGtQYmBgZFB5i4Jyj1RgXmCCVHSTgHOcg2BmYA==
X-CLOUD-ID: 1bc0804f8581479697411f402375fbd8
X-CPASD-SUMMARY: SIP:-1, APTIP:-2.0, KEY:0.0, FROMBLOCK:1, OB:0.0, URL:-5,
 TVAL:180.
 0, ESV:0.0, ECOM:-5.0, ML:0.0, FD:0.0, CUTS:74.0, IP:-2.0, MAL:-5.0, PHF:-5.0,
 PHC:-5.
 0, SPF:4.0, EDMS:-5, IPLABEL:4480.0, FROMTO:0, AD:0, FFOB:0.0, CFOB:0.0, SPC:0,
 SIG:-5
 , AUF:0, DUF:3306, ACD:60, DCD:60, SL:0, EISP:0, AG:0, CFC:0.424, CFSR:0.057,
 UAT:0, RAF
 :0, IMG:-5.0, DFA:0, DTA:0, IBL:-2.0, ADI:-5, SBL:0, REDM:0, REIP:0, ESB:0,
 ATTNUM:0, EA F:0,CID:-5.0,VERSION:2.3.17
X-CPASD-ID: 974c1789b7d3482bb1e76a18c2d7efce-20220826
X-CPASD-BLOCK: 1000
X-CPASD-STAGE: 1
X-UUID: 974c1789b7d3482bb1e76a18c2d7efce-20220826
X-User: leixiang@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <leixiang@kylinos.cn>) (Generic MTA)
 with ESMTP id 29936031; Fri, 26 Aug 2022 11:07:17 +0800
From: leixiang <leixiang@kylinos.cn>
To: mst@redhat.com
Cc: qemu-devel@nongnu.org, xieming@kylinos.cn, leixiang <leixiang@kylinos.cn>,
 Zeng Chi <zengchi@kylinos.cn>
Subject: [RESEND PATCH] virtio-pci: fix vector_irqfd leak in
 virtio_pci_set_guest_notifiers
Date: Fri, 26 Aug 2022 11:06:46 +0800
Message-Id: <20220826030646.1003059-1-leixiang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <1660004709-61572-1-git-send-email-ninollx@163.com>
References: <1660004709-61572-1-git-send-email-ninollx@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 124.126.103.232 (failed)
Received-SPF: permerror client-ip=124.126.103.232;
 envelope-from=leixiang@kylinos.cn; helo=mailgw.kylinos.cn
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01, T_SPF_PERMERROR=0.01,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 26 Aug 2022 02:07:08 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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

