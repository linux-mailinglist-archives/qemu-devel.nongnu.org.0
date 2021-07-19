Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CE53CD1EC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 12:32:09 +0200 (CEST)
Received: from localhost ([::1]:46366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5QZE-0004UE-6Q
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 06:32:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m5QUB-0005lc-Ak
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 06:26:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m5QU9-0007AO-GQ
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 06:26:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626690413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xVmNYp/5hjpvm/fZA1nMnL7SUHmjYy3vIxeWcP9vyZQ=;
 b=aFnlDdfpYnFDczhRC+2bXj++pdaL2GMwtECY47J1kAFjS3vIBXNhmySjO8kx+NA8FVTr5+
 xoNFs2EDg2YTpGbGqoHGf02Fvn77uA7Uh1Q0Qu/IF81tpAjcff45F+eyKSGYSEIFPXUsew
 pI9lVWByqDSfU1TnRWGhG2TkUZrTB4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-r_V6fOWrNKyKqYBy3CYPug-1; Mon, 19 Jul 2021 06:26:49 -0400
X-MC-Unique: r_V6fOWrNKyKqYBy3CYPug-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3D7C804141;
 Mon, 19 Jul 2021 10:26:47 +0000 (UTC)
Received: from thuth.com (ovpn-112-201.ams2.redhat.com [10.36.112.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E392F5D6A1;
 Mon, 19 Jul 2021 10:26:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 3/5] hw/net/vmxnet3: Do not abort if the guest is trying to use
 an invalid TX queue
Date: Mon, 19 Jul 2021 12:26:38 +0200
Message-Id: <20210719102640.2610368-4-thuth@redhat.com>
In-Reply-To: <20210719102640.2610368-1-thuth@redhat.com>
References: <20210719102640.2610368-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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

QEMU should never abort just because the guest is doing something odd.
Let's simply log the error and ignore the bad transmit queue instead.

Buglink: https://bugs.launchpad.net/qemu/+bug/1926111
Message-Id: <20210715103755.1035566-1-thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


