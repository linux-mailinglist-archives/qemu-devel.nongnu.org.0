Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F43454B94
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:04:34 +0100 (CET)
Received: from localhost ([::1]:51558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnOML-0007Ic-LQ
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:04:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mnOKb-00053z-5c
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:02:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mnOKW-00047n-2t
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:02:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637168557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gGVOPtBEqvJrdeQyp6+oQnMHMyze/5v7+vSZUhVMg5o=;
 b=BgGBNYFGeaDlRdxKmDEwGGOS7jAK5Xeexcg50yCQYO6s3CN9cKh5iXzwhKXdZrLjXW5G+v
 7vjitj6+RtsrvLofMmmsQUVN3SRw/iAsphl/RKkq6/hn+UZXM58X5LKH4enS8i+eS0j76R
 lUqKJYTVng5ToR8oYhVRf7p0SMyUqXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-QmInAoaiMnujZ52zqszwLA-1; Wed, 17 Nov 2021 12:02:34 -0500
X-MC-Unique: QmInAoaiMnujZ52zqszwLA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92C8E15722;
 Wed, 17 Nov 2021 17:02:33 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-146.phx2.redhat.com [10.3.114.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24A3B1F464;
 Wed, 17 Nov 2021 17:02:33 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 1/2] nbd/server: Don't complain on certain client
 disconnects
Date: Wed, 17 Nov 2021 11:02:29 -0600
Message-Id: <20211117170230.1128262-2-eblake@redhat.com>
In-Reply-To: <20211117170230.1128262-1-eblake@redhat.com>
References: <20211117170230.1128262-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: vsementsov@virtuozzo.com, rjones@redhat.com, qemu-block@nongnu.org,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When a client disconnects abruptly, but did not have any pending
requests (for example, when using nbdsh without calling h.shutdown),
we used to output the following message:

$ qemu-nbd -f raw file
$ nbdsh -u 'nbd://localhost:10809' -c 'h.trim(1,0)'
qemu-nbd: Disconnect client, due to: Failed to read request: Unexpected end-of-file before all bytes were read

Then in commit f148ae7, we refactored nbd_receive_request() to use
nbd_read_eof(); when this returns 0, we regressed into tracing
uninitialized memory (if tracing is enabled) and reporting a
less-specific:

qemu-nbd: Disconnect client, due to: Request handling failed in intermediate state

Note that with Unix sockets, we have yet another error message,
unchanged by the 6.0 regression:

$ qemu-nbd -k /tmp/sock -f raw file
$ nbdsh -u 'nbd+unix:///?socket=/tmp/sock' -c 'h.trim(1,0)'
qemu-nbd: Disconnect client, due to: Failed to send reply: Unable to write to socket: Broken pipe

But in all cases, the error message goes away if the client performs a
soft shutdown by using NBD_CMD_DISC, rather than a hard shutdown by
abrupt disconnect:

$ nbdsh -u 'nbd://localhost:10809' -c 'h.trim(1,0)' -c 'h.shutdown()'

This patch fixes things to avoid uninitialized memory, and in general
avoids warning about a client that does a hard shutdown when not in
the middle of a packet.  A client that aborts mid-request, or which
does not read the full server's reply, can still result in warnings,
but those are indeed much more unusual situations.

CC: qemu-stable@nongnu.org
Fixes: f148ae7d36 (nbd/server: Quiesce coroutines on context switch)
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/server.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index d9164ee6d0da..85877f630533 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1418,6 +1418,9 @@ static int nbd_receive_request(NBDClient *client, NBDRequest *request,
     if (ret < 0) {
         return ret;
     }
+    if (ret == 0) {
+        return -EIO;
+    }

     /* Request
        [ 0 ..  3]   magic   (NBD_REQUEST_MAGIC)
@@ -2285,7 +2288,7 @@ static int nbd_co_receive_request(NBDRequestData *req, NBDRequest *request,
     assert(client->recv_coroutine == qemu_coroutine_self());
     ret = nbd_receive_request(client, request, errp);
     if (ret < 0) {
-        return  ret;
+        return ret;
     }

     trace_nbd_co_receive_request_decode_type(request->handle, request->type,
@@ -2662,7 +2665,7 @@ static coroutine_fn void nbd_trip(void *opaque)
     }

     if (ret < 0) {
-        /* It wans't -EIO, so, according to nbd_co_receive_request()
+        /* It wasn't -EIO, so, according to nbd_co_receive_request()
          * semantics, we should return the error to the client. */
         Error *export_err = local_err;

-- 
2.33.1


