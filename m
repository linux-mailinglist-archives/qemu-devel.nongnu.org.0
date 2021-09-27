Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 482C841A2BC
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 00:09:58 +0200 (CEST)
Received: from localhost ([::1]:33322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUyou-0001Gj-L1
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 18:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybo-0002nf-HI
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybk-000333-1k
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632779779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tv592j8nE0eDGBLj7h5GztvPkezcCSs+Fyejz5ZWsGQ=;
 b=bma45o2MufA6w+9g2mVHFZDPblZkZP4WfiSSJP0++CVlsXU1VcSVZ8NoL9eHJQMoiR2FWS
 2X7zamsMaZppwIYSe+mdl1kXVLorMPPd7hecEO5xkaE705QqvKF1w9cvA9JxjMg4OyEwS9
 KjpCBJ0qRufRAKp1GYjGURWU52MTkF4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-EUlYHKVHNI-sfoxyj-LKWg-1; Mon, 27 Sep 2021 17:56:18 -0400
X-MC-Unique: EUlYHKVHNI-sfoxyj-LKWg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED1C81006AA2;
 Mon, 27 Sep 2021 21:56:16 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-87.phx2.redhat.com [10.3.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 829CE5D9D5;
 Mon, 27 Sep 2021 21:56:16 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/20] block/nbd: refactor nbd_recv_coroutines_wake_all()
Date: Mon, 27 Sep 2021 16:55:42 -0500
Message-Id: <20210927215545.3930309-18-eblake@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Split out nbd_recv_coroutine_wake_one(), as it will be used
separately.
Rename the function and add a possibility to wake only first found
sleeping coroutine.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210902103805.25686-4-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[eblake: grammar tweak]
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 2842e6263fe4..709c2499e33c 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -127,16 +127,24 @@ static bool nbd_client_connected(BDRVNBDState *s)
     return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED;
 }

-static void nbd_recv_coroutines_wake_all(BDRVNBDState *s)
+static bool nbd_recv_coroutine_wake_one(NBDClientRequest *req)
+{
+    if (req->receiving) {
+        req->receiving = false;
+        aio_co_wake(req->coroutine);
+        return true;
+    }
+
+    return false;
+}
+
+static void nbd_recv_coroutines_wake(BDRVNBDState *s, bool all)
 {
     int i;

     for (i = 0; i < MAX_NBD_REQUESTS; i++) {
-        NBDClientRequest *req = &s->requests[i];
-
-        if (req->coroutine && req->receiving) {
-            req->receiving = false;
-            aio_co_wake(req->coroutine);
+        if (nbd_recv_coroutine_wake_one(&s->requests[i]) && !all) {
+            return;
         }
     }
 }
@@ -415,7 +423,7 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)

     while (s->in_flight > 0) {
         qemu_co_mutex_unlock(&s->send_mutex);
-        nbd_recv_coroutines_wake_all(s);
+        nbd_recv_coroutines_wake(s, true);
         s->wait_in_flight = true;
         qemu_coroutine_yield();
         s->wait_in_flight = false;
@@ -558,7 +566,7 @@ static coroutine_fn void nbd_connection_entry(void *opaque)
     }

     qemu_co_queue_restart_all(&s->free_sema);
-    nbd_recv_coroutines_wake_all(s);
+    nbd_recv_coroutines_wake(s, true);
     bdrv_dec_in_flight(s->bs);

     s->connection_co = NULL;
@@ -1035,7 +1043,7 @@ static coroutine_fn int nbd_co_receive_one_chunk(
     if (s->connection_co && !s->wait_in_flight) {
         /*
          * We must check s->wait_in_flight, because we may entered by
-         * nbd_recv_coroutines_wake_all(), in this case we should not
+         * nbd_recv_coroutines_wake(), in this case we should not
          * wake connection_co here, it will woken by last request.
          */
         aio_co_wake(s->connection_co);
-- 
2.31.1


