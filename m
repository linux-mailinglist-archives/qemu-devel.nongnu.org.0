Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F046628EF7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:13:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouieh-0004JT-CN; Mon, 14 Nov 2022 18:14:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidu-0001o2-7d
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiEJ-0002Bm-M8
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:47:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gby92iyFLBUX8D4aDGzFb6Y56Yr37tYcymxCW49Mvac=;
 b=iTuICV/GYZgtQ92FqgK91lNect5XJqgIZkeCJfy5ohFS1vdhYINtmtUp8lfBd02f/Lgeln
 UAKuLO7nN51dZbgUr1/ORB2/H2zDHHHqHC+ZE6cuvvX+yLwyvhW11pSxCbUUoQjJvXBuNi
 sf2jddHR68R67B8v7zFxSeJ8hJoUzNM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-gfeITTyvNcmYc4o97zyKOg-1; Mon, 14 Nov 2022 17:46:59 -0500
X-MC-Unique: gfeITTyvNcmYc4o97zyKOg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 684D387B2A0;
 Mon, 14 Nov 2022 22:46:59 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E52412024CC0;
 Mon, 14 Nov 2022 22:46:58 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	libguestfs@redhat.com
Subject: [PATCH v2 1/6] spec: Recommend cap on NBD_REPLY_TYPE_BLOCK_STATUS
 length
Date: Mon, 14 Nov 2022 16:46:50 -0600
Message-Id: <20221114224655.2186173-2-eblake@redhat.com>
In-Reply-To: <20221114224655.2186173-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The spec was silent on how many extents a server could reply with.
However, both qemu and nbdkit (the two server implementations known to
have implemented the NBD_CMD_BLOCK_STATUS extension) implement a hard
cap, and will truncate the amount of extents in a reply to avoid
sending a client a reply so large that the client would treat it as a
denial of service attack.  Clients currently have no way during
negotiation to request such a limit of the server, so it is easier to
just document this as a restriction on viable server implementations
than to add yet another round of handshaking.  Also, mentioning
amplification effects is worthwhile.

When qemu first implemented NBD_CMD_BLOCK_STATUS for the
base:allocation context (qemu commit e7b1948d51, Mar 2018), it behaved
as if NBD_CMD_FLAG_REQ_ONE were always passed by the client, and never
responded with more than one extent.  Later, when adding its
qemu:dirty-bitmap:XYZ context extension (qemu commit 3d068aff16, Jun
2018), it added a cap to 128k extents (1M+4 bytes), and that cap was
applied to base:allocation once qemu started sending multiple extents
for that context as well (qemu commit fb7afc797e, Jul 2018).  Qemu
extents are never smaller than 512 bytes (other than an exception at
the end of a file whose size is not aligned to 512), but even so, a
request for just under 4G of block status could produce 8M extents,
resulting in a reply of 64M if it were not capped smaller.

When nbdkit first implemented NBD_CMD_BLOCK_STATUS (nbdkit 4ca66f70a5,
Mar 2019), it did not impose any restriction on the number of extents
in the reply chunk.  But because it allows extents as small as one
byte, it is easy to write a server that can amplify a client's request
of status over 1M of the image into a reply over 8M in size, and it
was very easy to demonstrate that a hard cap was needed to avoid
crashing clients or otherwise killing the connection (a bad server
impacting the client negatively).  So nbdkit enforced a bound of 1M
extents (8M+4 bytes, nbdkit commit 6e0dc839ea, Jun 2019).  [Unrelated
to this patch, but worth noting for history: nbdkit's situation also
has to deal with the fact that it is designed for plugin server
implementations; and not capping the number of extents in a reply also
posed a problem to nbdkit as the server, where a plugin could exhaust
memory and kill the server, unrelated to any size constraints enforced
by a client.]

Since the limit chosen by these two implementations is different, and
since nbdkit has versions that were not limited, add this as a SHOULD
NOT instead of MUST NOT constraint on servers implementing block
status.  It does not matter that qemu picked a smaller limit that it
truncates to, since we have already documented that the server may
truncate for other reasons (such as it being inefficient to collect
that many extents in the first place).  But documenting the limit now
becomes even more important in the face of a future addition of 64-bit
requests, where a client's request is no longer bounded to 4G and
could thereby produce even more than 8M extents for the corner case
when every 512 bytes is a new extent, if it were not for this
recommendation.

---
v2: Add wording about amplification effect
---
 doc/proto.md | 51 +++++++++++++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index 3a96703..8f08583 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -1818,6 +1818,12 @@ MUST initiate a hard disconnect.
   the different contexts need not have the same number of extents or
   cumulative extent length.

+  Servers SHOULD NOT send more than 2^20 extents in a single reply
+  chunk; in other words, the size of
+  `NBD_REPLY_TYPE_BLOCK_STATUS` should not be more than 4 + 8*2^20
+  (8,388,612 bytes), even if this requires that the server truncate
+  the response in relation to the *length* requested by the client.
+
   Even if the client did not use the `NBD_CMD_FLAG_REQ_ONE` flag in
   its request, the server MAY return fewer descriptors in the reply
   than would be required to fully specify the whole range of requested
@@ -2180,26 +2186,31 @@ The following request types exist:
     `NBD_REPLY_TYPE_BLOCK_STATUS` chunk represent consecutive portions
     of the file starting from specified *offset*.  If the client used
     the `NBD_CMD_FLAG_REQ_ONE` flag, each chunk contains exactly one
-    descriptor where the *length* of the descriptor MUST NOT be greater
-    than the *length* of the request; otherwise, a chunk MAY contain
-    multiple descriptors, and the final descriptor MAY extend beyond
-    the original requested size if the server can determine a larger
-    length without additional effort.  On the other hand, the server MAY
-    return less data than requested. However the server MUST return at
-    least one status descriptor (and since each status descriptor has
-    a non-zero length, a client can always make progress on a
-    successful return).  The server SHOULD use different *status*
-    values between consecutive descriptors where feasible, although
-    the client SHOULD be prepared to handle consecutive descriptors
-    with the same *status* value.  The server SHOULD use descriptor
-    lengths that are an integer multiple of 512 bytes where possible
-    (the first and last descriptor of an unaligned query being the
-    most obvious places for an exception), and MUST use descriptor
-    lengths that are an integer multiple of any advertised minimum
-    block size. The status flags are intentionally defined so that a
-    server MAY always safely report a status of 0 for any block,
-    although the server SHOULD return additional status values when
-    they can be easily detected.
+    descriptor where the *length* of the descriptor MUST NOT be
+    greater than the *length* of the request; otherwise, a chunk MAY
+    contain multiple descriptors, and the final descriptor MAY extend
+    beyond the original requested size if the server can determine a
+    larger length without additional effort.  On the other hand, the
+    server MAY return less data than requested.  In particular, a
+    server SHOULD NOT send more than 2^20 status descriptors in a
+    single chunk.  However the server MUST return at least one status
+    descriptor, and since each status descriptor has a non-zero
+    length, a client can always make progress on a successful return.
+
+    The server SHOULD use different *status* values between
+    consecutive descriptors where feasible, although the client SHOULD
+    be prepared to handle consecutive descriptors with the same
+    *status* value.  The server SHOULD use descriptor lengths that are
+    an integer multiple of 512 bytes where possible (the first and
+    last descriptor of an unaligned query being the most obvious
+    places for an exception), in part to avoid an amplification effect
+    where a series of smaller descriptors can cause the server's reply
+    to occupy more bytes than the *length* of the client's request.
+    The server MUST use descriptor lengths that are an integer
+    multiple of any advertised minimum block size. The status flags
+    are intentionally defined so that a server MAY always safely
+    report a status of 0 for any block, although the server SHOULD
+    return additional status values when they can be easily detected.

     If an error occurs, the server SHOULD set the appropriate error
     code in the error field of an error chunk. However, if the error
-- 
2.38.1


