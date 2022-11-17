Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F1E62E256
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 17:57:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oviBT-0005qT-FE; Thu, 17 Nov 2022 11:56:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oviBR-0005pw-H3
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 11:56:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oviBP-0007mg-KL
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 11:56:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668704171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cvRsKNZ3VNpldatLcxBKIjHbLcpG0HhsYlZYVIVqxAY=;
 b=ag2P7WblVo0Jtbgpj9acgad6sGLjhbR9Z9BNZ+rWjeXISv0LMA+RrY+Thq72I+uPPUu2XA
 dDH2mZAO0LfFjJSc2XM88KRLtcVGuKfXFYvQj+jyK+9ovYZdqaMi4dVhHRhDA/ETzW0jRB
 5m3ZmgxTOkAVWoJ0KCuhSOJD/GyTPzc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-7DSIkwZyNwauGdX44TcgeQ-1; Thu, 17 Nov 2022 11:56:07 -0500
X-MC-Unique: 7DSIkwZyNwauGdX44TcgeQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B058882822;
 Thu, 17 Nov 2022 16:56:07 +0000 (UTC)
Received: from localhost (unknown [10.39.193.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFD7CC1E890;
 Thu, 17 Nov 2022 16:56:06 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Tobias Fiebig <tobias+git@fiebig.nl>, Jason Wang <jasowang@redhat.com>,
 qemu-stable@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH for-7.2 v3 2/3] rtl8139: keep Tx command mode 0 and 1 separate
Date: Thu, 17 Nov 2022 11:55:53 -0500
Message-Id: <20221117165554.1773409-3-stefanha@redhat.com>
In-Reply-To: <20221117165554.1773409-1-stefanha@redhat.com>
References: <20221117165554.1773409-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

There are two Tx Descriptor formats called mode 0 and mode 1. The mode
is determined by the Large Send bit.

CP_TX_IPCS (bit 18) is defined in mode 1 but the code checks the bit
unconditionally. In mode 0 bit 18 is part of the Large Send MSS value.

Explicitly check the Large Send bit to distinguish Tx command modes.
This avoids bugs where modes are confused. Note that I didn't find any
actual bugs aside from needlessly computing the IP checksum when the
Large Send bit is enabled.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/net/rtl8139.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index ffef3789b5..6dd7a8e6e0 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -2135,7 +2135,7 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
             }
             ip_data_len -= hlen;
 
-            if (txdw0 & CP_TX_IPCS)
+            if (!(txdw0 & CP_TX_LGSEN) && (txdw0 & CP_TX_IPCS))
             {
                 DPRINTF("+++ C+ mode need IP checksum\n");
 
@@ -2268,7 +2268,7 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
                 /* Stop sending this frame */
                 saved_size = 0;
             }
-            else if (txdw0 & (CP_TX_TCPCS|CP_TX_UDPCS))
+            else if (!(txdw0 & CP_TX_LGSEN) && (txdw0 & (CP_TX_TCPCS|CP_TX_UDPCS)))
             {
                 DPRINTF("+++ C+ mode need TCP or UDP checksum\n");
 
-- 
2.38.1


