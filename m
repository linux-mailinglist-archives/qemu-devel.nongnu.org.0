Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B60E56109FE
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:57:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooIFT-0007Mb-J4; Fri, 28 Oct 2022 01:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIFR-0007Lw-NV
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:49:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIFQ-0007Zi-B0
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:49:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666936179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kPkUk+XTf5S5f62r7jByoijVhrTx0tFKffgGIgE65YM=;
 b=OznvFx0sZUcI8eIZE+i6Cjj6+AY8RBPVo0tL5kYwpy06HNyrJvY2lldawMdET2OihZ/gPC
 6D2Fxm3/o6Evo9hLLpq/BNRpUNlWskZXV19MR2HpVdYjJ5FTumc6tGYA+JgfTxV+t1Ax1U
 bVQ2HsByKE3w7k+vwlfgpW723AL29/g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-MSEXXmE7NsS9aPaEs7TkKQ-1; Fri, 28 Oct 2022 01:49:37 -0400
X-MC-Unique: MSEXXmE7NsS9aPaEs7TkKQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D1951C08796;
 Fri, 28 Oct 2022 05:49:36 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-50.pek2.redhat.com [10.72.13.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FE71C15BA8;
 Fri, 28 Oct 2022 05:49:33 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: stefanha@redhat.com,
	qemu-devel@nongnu.org
Cc: Stefano Brivio <sbrivio@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 17/26] net: socket: Don't ignore EINVAL on netdev socket
 connection
Date: Fri, 28 Oct 2022 13:48:26 +0800
Message-Id: <20221028054835.29674-18-jasowang@redhat.com>
In-Reply-To: <20221028054835.29674-1-jasowang@redhat.com>
References: <20221028054835.29674-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stefano Brivio <sbrivio@redhat.com>

Other errors are treated as failure by net_socket_connect_init(),
but if connect() returns EINVAL, we'll fail silently. Remove the
related exception.

Signed-off-by: Stefano Brivio <sbrivio@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/socket.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/socket.c b/net/socket.c
index ade1ecf..4944bb7 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -577,8 +577,7 @@ static int net_socket_connect_init(NetClientState *peer,
             if (errno == EINTR || errno == EWOULDBLOCK) {
                 /* continue */
             } else if (errno == EINPROGRESS ||
-                       errno == EALREADY ||
-                       errno == EINVAL) {
+                       errno == EALREADY) {
                 break;
             } else {
                 error_setg_errno(errp, errno, "can't connect socket");
-- 
2.7.4


