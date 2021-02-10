Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA286316987
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 15:56:57 +0100 (CET)
Received: from localhost ([::1]:47200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9qvI-0006NK-O0
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 09:56:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l9qtf-0005rU-UI
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 09:55:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l9qtb-0002pw-9J
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 09:55:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612968909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+udZjA1UY3OqeCZ80mbbgAGzN4Wh0uK8gDwRxo/IVkQ=;
 b=SKRXwrAlxMIJE6yh3XPXXBQG3EXV88wOP9pqaJgoMf6S7EtPOynQ+99jBFgoaPB38ievJK
 tHPLrHWwA5L2XzKeXNolQ5LTFsts52UNSgZDrmdjhbxYi7HKr5NC5WsTYqlDZlui+QrkqE
 htCyMNm2ijY8KLzZgWZxpQ41eCne38Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-jB2t9vJkPlmtYnxL_2a7Jg-1; Wed, 10 Feb 2021 09:55:07 -0500
X-MC-Unique: jB2t9vJkPlmtYnxL_2a7Jg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF6A979EC0;
 Wed, 10 Feb 2021 14:55:05 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.74.9.254])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD89D1A838;
 Wed, 10 Feb 2021 14:55:02 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: [PATCH] net: e1000: check transmit descriptor field values
Date: Wed, 10 Feb 2021 20:22:58 +0530
Message-Id: <20210210145258.143131-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Cheolwoo Myung <cwmyung@snu.ac.kr>,
 Ruhr-University Bochum <bugs-syssec@rub.de>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

While processing transmit (tx) descriptors in process_tx_desc()
various descriptor fields are not checked properly. This may lead
to infinite loop like issue. Add checks to avoid them.

Reported-by: Alexander Bulekov <alxndr@bu.edu>
Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
Reported-by: Ruhr-University Bochum <bugs-syssec@rub.de>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/net/e1000.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index d8da2f6528..15949a3d64 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -667,9 +667,11 @@ process_tx_desc(E1000State *s, struct e1000_tx_desc *dp)
 
     addr = le64_to_cpu(dp->buffer_addr);
     if (tp->cptse) {
+        assert(tp->tso_props.hdr_len);
         msh = tp->tso_props.hdr_len + tp->tso_props.mss;
         do {
             bytes = split_size;
+            assert(msh > tp->size);
             if (tp->size + bytes > msh)
                 bytes = msh - tp->size;
 
@@ -681,22 +683,26 @@ process_tx_desc(E1000State *s, struct e1000_tx_desc *dp)
                 memmove(tp->header, tp->data, tp->tso_props.hdr_len);
             }
             tp->size = sz;
+            assert(tp->size);   /* sz may get truncated */
             addr += bytes;
             if (sz == msh) {
                 xmit_seg(s);
                 memmove(tp->data, tp->header, tp->tso_props.hdr_len);
                 tp->size = tp->tso_props.hdr_len;
             }
+            assert(split_size >= bytes);
             split_size -= bytes;
         } while (bytes && split_size);
     } else {
         split_size = MIN(sizeof(tp->data) - tp->size, split_size);
+        assert(tp->size && split_size);
         pci_dma_read(d, addr, tp->data + tp->size, split_size);
         tp->size += split_size;
     }
 
     if (!(txd_lower & E1000_TXD_CMD_EOP))
         return;
+    assert(tp->size && tp->tso_props.hdr_len);
     if (!(tp->cptse && tp->size < tp->tso_props.hdr_len)) {
         xmit_seg(s);
     }
-- 
2.29.2


