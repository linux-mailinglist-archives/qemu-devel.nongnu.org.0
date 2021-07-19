Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CD33CD1F6
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 12:33:30 +0200 (CEST)
Received: from localhost ([::1]:48546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5QaX-00064x-CL
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 06:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m5QUC-0005qa-Oe
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 06:26:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m5QUA-0007Bm-NU
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 06:26:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626690414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K/XzqQivXMgR7242lB3IzydHkbbJMWsu4GMJHjtzP/U=;
 b=APK8yLnfDYJSYt+U+Sk+NzEebxr5nHY5E7KUU6mL5vjL/b07B3XcTXEd0I9k/e38jAQrD7
 sa2GCAMDjSvE2c3+QGn3b67zA7+WWicYgfJPteXXuOz+HwnTBEI4k55RtN9GurOyCL3AMZ
 cFXGEtGMdS3IAEx0tma/P63rz3BkRzM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-pR5WyMmWMlyGdI7ksP6-WQ-1; Mon, 19 Jul 2021 06:26:50 -0400
X-MC-Unique: pR5WyMmWMlyGdI7ksP6-WQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75193804142;
 Mon, 19 Jul 2021 10:26:49 +0000 (UTC)
Received: from thuth.com (ovpn-112-201.ams2.redhat.com [10.36.112.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54D5B5D6A1;
 Mon, 19 Jul 2021 10:26:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 4/5] hw/net/net_tx_pkt: Fix crash detected by fuzzer
Date: Mon, 19 Jul 2021 12:26:39 +0200
Message-Id: <20210719102640.2610368-5-thuth@redhat.com>
In-Reply-To: <20210719102640.2610368-1-thuth@redhat.com>
References: <20210719102640.2610368-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.466,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>
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

results in a NULL pointer that causes the

    assert(pkt->raw);

in net_tx_pkt_reset() to fail later. To fix this issue we can check
that max_raw_frags was not zero before asserting that pkt->raw is
a non-NULL pointer.

Buglink: https://bugs.launchpad.net/qemu/+bug/1890157
Message-Id: <20210715193219.1132571-1-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
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


