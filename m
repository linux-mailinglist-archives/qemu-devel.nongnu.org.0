Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF713A8AE0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 23:15:21 +0200 (CEST)
Received: from localhost ([::1]:56918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltGP2-0003Gi-HS
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 17:15:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFzC-0002wj-60
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFz8-0001Eh-1u
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=At05gGlpxt0XLLHVPGyJEHnozEMwh9TIABnm3a/hkVs=;
 b=Y45bHnfbbrlgTHZkWw4L0qimq/kInqXJwT6VD/xA1NOThvck4WK7soCuDfCRo/7eapoFRe
 LVIcuO0+cipCWbUv+nosC8R6HffP0N49AEQL3sr1i5pGXjU+T3uC2tBXzWfTK+tuMXmMwb
 51hCxsmH9RPRUS3ocL6W/+y1Pt/gTTc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-QKFRxjSXNR6lUWZJCbZYoQ-1; Tue, 15 Jun 2021 16:48:29 -0400
X-MC-Unique: QKFRxjSXNR6lUWZJCbZYoQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBC0A8015D0;
 Tue, 15 Jun 2021 20:48:28 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 616AA5D9CA;
 Tue, 15 Jun 2021 20:48:28 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/34] block/nbd: don't touch s->sioc in
 nbd_teardown_connection()
Date: Tue, 15 Jun 2021 15:47:48 -0500
Message-Id: <20210615204756.281505-27-eblake@redhat.com>
In-Reply-To: <20210615204756.281505-1-eblake@redhat.com>
References: <20210615204756.281505-1-eblake@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Negotiation during reconnect is now done in a thread, and s->sioc is
not available during negotiation. Negotiation in thread will be
cancelled by nbd_client_connection_release() called from
nbd_clear_bdrvstate().  So, we don't need this code chunk anymore.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210610100802.5888-25-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 311471644487..2abcedd464c7 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -280,10 +280,6 @@ static void nbd_teardown_connection(BlockDriverState *bs)
     if (s->ioc) {
         /* finish any pending coroutines */
         qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
-    } else if (s->sioc) {
-        /* abort negotiation */
-        qio_channel_shutdown(QIO_CHANNEL(s->sioc), QIO_CHANNEL_SHUTDOWN_BOTH,
-                             NULL);
     }

     s->state = NBD_CLIENT_QUIT;
-- 
2.31.1


