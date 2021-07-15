Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5A63C9CFA
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 12:39:05 +0200 (CEST)
Received: from localhost ([::1]:48540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3ylk-0000PH-ES
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 06:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m3ykq-00080o-V2
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 06:38:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m3ykn-0001Bl-M8
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 06:38:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626345484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4mifRCI1XLbvgMdhqVwJREBK6wRrka+ufMQje24YWN4=;
 b=PN3Q5HLULZxAiY2K00XGfo32yra5xbxFf1bsNrD1m8izL5NspT6E8Lonxsu/lWJGNUlswD
 6SObc5J6YF6YeFrCfdGJok2+wCNK5dd1R0ZQmrSzXElNVmP7+wh+P6TYLXkf70mP36L7TU
 E4xypWTohgavw+i+odHAxACAVKz7DI4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-o58rALUOMvGbM5e0avNd2g-1; Thu, 15 Jul 2021 06:38:01 -0400
X-MC-Unique: o58rALUOMvGbM5e0avNd2g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4876FC7400;
 Thu, 15 Jul 2021 10:38:00 +0000 (UTC)
Received: from thuth.com (ovpn-113-128.ams2.redhat.com [10.36.113.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E180719C59;
 Thu, 15 Jul 2021 10:37:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>
Subject: [PATCH] hw/net/vmxnet3: Do not abort if the guest is trying to use an
 invalid TX queue
Date: Thu, 15 Jul 2021 12:37:55 +0200
Message-Id: <20210715103755.1035566-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU should never abort just because the guest is doing something odd.
Let's simply log the error and ignore the bad transmit queue instead.

Buglink: https://bugs.launchpad.net/qemu/+bug/1926111
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/net/vmxnet3.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index eff299f629..f6bd8c53b1 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -23,6 +23,7 @@
 #include "net/checksum.h"
 #include "sysemu/sysemu.h"
 #include "qemu/bswap.h"
+#include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/pci/msix.h"
 #include "hw/pci/msi.h"
@@ -1093,8 +1094,12 @@ vmxnet3_io_bar0_write(void *opaque, hwaddr addr,
         int tx_queue_idx =
             VMW_MULTIREG_IDX_BY_ADDR(addr, VMXNET3_REG_TXPROD,
                                      VMXNET3_REG_ALIGN);
-        assert(tx_queue_idx <= s->txq_num);
-        vmxnet3_process_tx_queue(s, tx_queue_idx);
+        if (tx_queue_idx <= s->txq_num) {
+            vmxnet3_process_tx_queue(s, tx_queue_idx);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "vmxnet3: Illegal TX queue %d/%d\n",
+                          tx_queue_idx, s->txq_num);
+        }
         return;
     }
 
-- 
2.27.0


