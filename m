Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 005E73A8A8A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 23:01:45 +0200 (CEST)
Received: from localhost ([::1]:42006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltGBs-0007E6-Up
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 17:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyt-000211-4B
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyq-000134-NL
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eXN+I56T0G8Jc3hHgU/ilIz1SEkkY/e6sb5QI1haj94=;
 b=PHAKoldZroYUEEJlDgMtgo0Yye51dn1QPa76YzCOCdXbAdCJO7iDcYymLBROYovDOic6rO
 P+Sq7g4W8Vky9ScDal8f3qCtugM2JF19r2nGbDAzdSSL08oLeAou78HTcouaux2H6+7y8u
 8o3lTwI46v+FjJShAnBlyrJt1S72WtE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-ElTSs5LiN7auVzl56l8nhw-1; Tue, 15 Jun 2021 16:48:14 -0400
X-MC-Unique: ElTSs5LiN7auVzl56l8nhw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51A02195D560;
 Tue, 15 Jun 2021 20:48:13 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8F585D9CA;
 Tue, 15 Jun 2021 20:48:12 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/34] block/nbd: BDRVNBDState: drop unused connect_err and
 connect_status
Date: Tue, 15 Jun 2021 15:47:33 -0500
Message-Id: <20210615204756.281505-12-eblake@redhat.com>
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
Cc: Roman Kagan <rvkagan@yandex-team.ru>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

These fields are write-only. Drop them.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210610100802.5888-10-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 77b85ca47189..fdfb1ff7a158 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -121,8 +121,6 @@ typedef struct BDRVNBDState {
     bool wait_drained_end;
     int in_flight;
     NBDClientState state;
-    int connect_status;
-    Error *connect_err;
     bool wait_in_flight;

     QEMUTimer *reconnect_delay_timer;
@@ -578,7 +576,6 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs)
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
     int ret;
-    Error *local_err = NULL;

     if (!nbd_client_connecting(s)) {
         return;
@@ -619,14 +616,14 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }

-    if (nbd_co_establish_connection(s->bs, &local_err) < 0) {
+    if (nbd_co_establish_connection(s->bs, NULL) < 0) {
         ret = -ECONNREFUSED;
         goto out;
     }

     bdrv_dec_in_flight(s->bs);

-    ret = nbd_client_handshake(s->bs, &local_err);
+    ret = nbd_client_handshake(s->bs, NULL);

     if (s->drained) {
         s->wait_drained_end = true;
@@ -641,11 +638,6 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
     bdrv_inc_in_flight(s->bs);

 out:
-    s->connect_status = ret;
-    error_free(s->connect_err);
-    s->connect_err = NULL;
-    error_propagate(&s->connect_err, local_err);
-
     if (ret >= 0) {
         /* successfully connected */
         s->state = NBD_CLIENT_CONNECTED;
-- 
2.31.1


