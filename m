Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D6241A2C7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 00:13:40 +0200 (CEST)
Received: from localhost ([::1]:42362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUysV-0007WL-Uc
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 18:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybk-0002iQ-55
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybi-00030x-Bk
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632779777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5qJkNWxgCdSvtca0kiCyehbqTU5dpRbBVer+mbjjHqg=;
 b=NfxMIYXDdD9PTPAcc8HYgfRRH0uoluQ27gIL9I2RifpY3TugBTxu7JnipHSJTO88PW/p/Y
 wRLhWViZevuMhND7lgkRr3GlkuXeQyTGEctkG6STMGBkT0Lx1kvJe2maeu8RD7wYKpI3ol
 wnvITaAWeYm0RWV2AwzoUycB062CypU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-3Ber0sAXNgmYLp18541dRw-1; Mon, 27 Sep 2021 17:56:16 -0400
X-MC-Unique: 3Ber0sAXNgmYLp18541dRw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13B6B824FA6;
 Mon, 27 Sep 2021 21:56:15 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-87.phx2.redhat.com [10.3.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7F7C5D9D5;
 Mon, 27 Sep 2021 21:56:14 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/20] nbd/client-connection: nbd_co_establish_connection():
 fix non set errp
Date: Mon, 27 Sep 2021 16:55:39 -0500
Message-Id: <20210927215545.3930309-15-eblake@redhat.com>
In-Reply-To: <20210927215545.3930309-1-eblake@redhat.com>
References: <20210927215545.3930309-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

When we don't have a connection and blocking is false, we return NULL
but don't set errp. That's wrong.

We have two paths for calling nbd_co_establish_connection():

1. nbd_open() -> nbd_do_establish_connection() -> ...
  but that will never set blocking=false

2. nbd_reconnect_attempt() -> nbd_co_do_establish_connection() -> ...
  but that uses errp=NULL

So, we are safe with our wrong errp policy in
nbd_co_establish_connection(). Still let's fix it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210906190654.183421-2-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/client-connection.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 7123b1e18900..695f85575414 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -318,6 +318,7 @@ nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
         }

         if (!blocking) {
+            error_setg(errp, "No connection at the moment");
             return NULL;
         }

-- 
2.31.1


