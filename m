Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7205333AE7D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:19:38 +0100 (CET)
Received: from localhost ([::1]:37096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLjNx-0004DE-Bu
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLjJV-0007jr-5g
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:15:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLjJS-0007gQ-Ql
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:15:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615799697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=cHDylX3VDgnAxGpHNhSOXdMfRX+mhcDAqVY6r7JPZHo=;
 b=cxN/nn4/cYBkhee9YsQrI2ebtrEYZwAqYQbLWg6Rev03MNy3GA7MD6djoNu4he8dMn6wBo
 K9fRcg2/vjjxRYhhnZbovWIdhBb0wvcLdESVAuOoTzG5/N/73VSBBTiSnGEdXbHsKsDRMQ
 LynaxmX2RebAPEwluIMJnVhOF2uMfhI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-ghufpY7_NhOCyiAc1_uDjg-1; Mon, 15 Mar 2021 05:14:56 -0400
X-MC-Unique: ghufpY7_NhOCyiAc1_uDjg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E37C8042BE;
 Mon, 15 Mar 2021 09:14:55 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-105.pek2.redhat.com
 [10.72.13.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F70C1007625;
 Mon, 15 Mar 2021 09:14:53 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL V2 04/20] e1000: fail early for evil descriptor
Date: Mon, 15 Mar 2021 17:14:17 +0800
Message-Id: <1615799673-31549-5-git-send-email-jasowang@redhat.com>
In-Reply-To: <1615799673-31549-1-git-send-email-jasowang@redhat.com>
References: <1615799673-31549-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Prasad J Pandit <ppandit@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

During procss_tx_desc(), driver can try to chain data descriptor with
legacy descriptor, when will lead underflow for the following
calculation in process_tx_desc() for bytes:

            if (tp->size + bytes > msh)
                bytes = msh - tp->size;

This will lead a infinite loop. So check and fail early if tp->size if
greater or equal to msh.

Reported-by: Alexander Bulekov <alxndr@bu.edu>
Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
Reported-by: Ruhr-University Bochum <bugs-syssec@rub.de>
Cc: Prasad J Pandit <ppandit@redhat.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index d8da2f6..4345d86 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -670,6 +670,9 @@ process_tx_desc(E1000State *s, struct e1000_tx_desc *dp)
         msh = tp->tso_props.hdr_len + tp->tso_props.mss;
         do {
             bytes = split_size;
+            if (tp->size >= msh) {
+                goto eop;
+            }
             if (tp->size + bytes > msh)
                 bytes = msh - tp->size;
 
@@ -695,6 +698,7 @@ process_tx_desc(E1000State *s, struct e1000_tx_desc *dp)
         tp->size += split_size;
     }
 
+eop:
     if (!(txd_lower & E1000_TXD_CMD_EOP))
         return;
     if (!(tp->cptse && tp->size < tp->tso_props.hdr_len)) {
-- 
2.7.4


