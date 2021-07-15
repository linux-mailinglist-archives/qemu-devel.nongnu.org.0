Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9A23CABFB
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 21:34:09 +0200 (CEST)
Received: from localhost ([::1]:56356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m477Y-0001vP-2s
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 15:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m4766-0001GD-1S
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 15:32:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m4762-0001GR-7V
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 15:32:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626377552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vSMFXMNlRRFbjnDQFCNp0/FfqBco0cZ6Rr6PL72tMek=;
 b=Ek5xTo5WxWS0wxWFS0EJFFjTf8Ptwav2NUgLfQZuVbov6+wYzpyH7fu2yUkFRWp7zZMzBV
 i/nIYHcae1UFP/m3KDcMX9O2fotXMBh3RkBc88z+iQrwZkRGiXs0nt6PSCnEguMciCYn+5
 MmFmmYSGQ2sNr6RGFwGY3GY/QXifKv4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-hRXmonejN4-6dziP69Qfjg-1; Thu, 15 Jul 2021 15:32:29 -0400
X-MC-Unique: hRXmonejN4-6dziP69Qfjg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81832100CA96;
 Thu, 15 Jul 2021 19:32:23 +0000 (UTC)
Received: from thuth.com (ovpn-113-128.ams2.redhat.com [10.36.113.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53FBF752A8;
 Thu, 15 Jul 2021 19:32:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>
Subject: [PATCH] hw/net/net_tx_pkt: Fix crash detected by fuzzer
Date: Thu, 15 Jul 2021 21:32:19 +0200
Message-Id: <20210715193219.1132571-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU currently crashes when it's started like this:

cat << EOF | ./qemu-system-i386 -device vmxnet3 -nodefaults -qtest stdio
outl 0xcf8 0x80001014
outl 0xcfc 0xe0001000
outl 0xcf8 0x80001018
outl 0xcf8 0x80001004
outw 0xcfc 0x7
outl 0xcf8 0x80001083
write 0x0 0x1 0xe1
write 0x1 0x1 0xfe
write 0x2 0x1 0xbe
write 0x3 0x1 0xba
writeq 0xe0001020 0xefefff5ecafe0000
writeq 0xe0001020 0xffff5e5ccafe0002
EOF

It hits this assertion:

qemu-system-i386: ../qemu/hw/net/net_tx_pkt.c:453: net_tx_pkt_reset:
 Assertion `pkt->raw' failed.

This happens because net_tx_pkt_init() is called with max_frags == 0 and
thus the allocation

    p->raw = g_new(struct iovec, max_frags);

results in a NULL pointer that cause the

    assert(pkt->raw);

in net_tx_pkt_reset() to fail later. To fix this issue we can check
that max_raw_frags was not zero before asserting that pkt->raw is
a non-NULL pointer.

Buglink: https://bugs.launchpad.net/qemu/+bug/1890157
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/net/net_tx_pkt.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index 1f9aa59eca..1cb1125d9f 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -450,11 +450,13 @@ void net_tx_pkt_reset(struct NetTxPkt *pkt)
     pkt->payload_len = 0;
     pkt->payload_frags = 0;
 
-    assert(pkt->raw);
-    for (i = 0; i < pkt->raw_frags; i++) {
-        assert(pkt->raw[i].iov_base);
-        pci_dma_unmap(pkt->pci_dev, pkt->raw[i].iov_base, pkt->raw[i].iov_len,
-                      DMA_DIRECTION_TO_DEVICE, 0);
+    if (pkt->max_raw_frags > 0) {
+        assert(pkt->raw);
+        for (i = 0; i < pkt->raw_frags; i++) {
+            assert(pkt->raw[i].iov_base);
+            pci_dma_unmap(pkt->pci_dev, pkt->raw[i].iov_base,
+                          pkt->raw[i].iov_len, DMA_DIRECTION_TO_DEVICE, 0);
+        }
     }
     pkt->raw_frags = 0;
 
-- 
2.27.0


