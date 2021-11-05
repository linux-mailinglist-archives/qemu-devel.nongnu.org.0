Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA9A445F19
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 05:22:07 +0100 (CET)
Received: from localhost ([::1]:58604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miqju-0002x9-BW
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 00:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1miqg8-0008Vv-Qn
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 00:18:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1miqg6-0001W9-8Z
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 00:18:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636085888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yZQQSxBgWGguXmL7A57WCwaRS++XbW5c6tJZMBK92kY=;
 b=bhZVf0ZJhAPhUU8VIpNX52So4M9nKhkFd6MobkXVQrWSZCbypsCJJyzH7AzEecoXS38feV
 vd3L+h1AymDYruaPgn6jiWtkF2iTVQ598iOuKTt9KhkeRZt8cHIJz92U7Xgwu3g3ja//GZ
 Hewcr5xK8N2zrxLKMAlBTWwVBzVEvMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-x5qUWBFKNymSlhMLP9_jAw-1; Fri, 05 Nov 2021 00:18:05 -0400
X-MC-Unique: x5qUWBFKNymSlhMLP9_jAw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43D4E10A8E00;
 Fri,  5 Nov 2021 04:18:04 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-79.pek2.redhat.com [10.72.12.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8932B6784F;
 Fri,  5 Nov 2021 04:18:02 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 1/2] e1000: fix tx re-entrancy problem
Date: Fri,  5 Nov 2021 12:17:47 +0800
Message-Id: <20211105041748.1681-2-jasowang@redhat.com>
In-Reply-To: <20211105041748.1681-1-jasowang@redhat.com>
References: <20211105041748.1681-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Jon Maloy <jmaloy@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jon Maloy <jmaloy@redhat.com>

The fact that the MMIO handler is not re-entrant causes an infinite
loop under certain conditions:

Guest write to TDT ->  Loopback -> RX (DMA to TDT) -> TX

We now eliminate the effect of this problem locally in e1000, by adding
a boolean in struct E1000State indicating when the TX side is busy. This
will cause any entering new call to return early instead of interfering
with the ongoing work, and eliminates any risk of looping.

This is intended to address CVE-2021-20257.

Signed-off-by: Jon Maloy <jmaloy@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index a30546c..f5bc812 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -107,6 +107,7 @@ struct E1000State_st {
         e1000x_txd_props props;
         e1000x_txd_props tso_props;
         uint16_t tso_frames;
+        bool busy;
     } tx;
 
     struct {
@@ -763,6 +764,11 @@ start_xmit(E1000State *s)
         return;
     }
 
+    if (s->tx.busy) {
+        return;
+    }
+    s->tx.busy = true;
+
     while (s->mac_reg[TDH] != s->mac_reg[TDT]) {
         base = tx_desc_base(s) +
                sizeof(struct e1000_tx_desc) * s->mac_reg[TDH];
@@ -789,6 +795,7 @@ start_xmit(E1000State *s)
             break;
         }
     }
+    s->tx.busy = false;
     set_ics(s, 0, cause);
 }
 
-- 
2.7.4


