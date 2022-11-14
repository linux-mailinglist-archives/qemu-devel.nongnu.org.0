Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2D0628F27
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:22:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouie8-0002UN-Ok; Mon, 14 Nov 2022 18:13:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidt-0001X6-Q3
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiEM-0002Cj-Lp
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:47:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cUuI1u+i3cvmWB9fVPbXaz+lkryi7TPySGp8A7zlIVg=;
 b=ALon9Ou5AD6MWEbAjdvaUPxGDzBqcn3kgxIBRd6DiTyoqvfrrUVW1rSJyqxZXCfdl7qcog
 Djk81QLG8GSpNBXSDbHgYMHlyif/n+xwu3l5M3aNmx8ikAVluAZ9pSPtrurNKWzzVHVAnT
 SenbX3SdyhORtRSGaGCFQZvsyG08Qt4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-3Xmdd-qCO4yChnr5xGo6sg-1; Mon, 14 Nov 2022 17:47:02 -0500
X-MC-Unique: 3Xmdd-qCO4yChnr5xGo6sg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3ADBB101AA79;
 Mon, 14 Nov 2022 22:47:02 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C795C2024CC0;
 Mon, 14 Nov 2022 22:47:01 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	libguestfs@redhat.com
Subject: [PATCH v2 6/6] RFC: spec: Introduce NBD_REPLY_TYPE_OFFSET_HOLE_EXT
Date: Mon, 14 Nov 2022 16:46:55 -0600
Message-Id: <20221114224655.2186173-7-eblake@redhat.com>
In-Reply-To: <20221114224655.2186173-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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

Rather than requiring all servers and clients to have a 32-bit limit
on maximum NBD_CMD_READ/WRITE sizes, we can choose to standardize
support for a 64-bit single I/O transaction now.
NBD_REPLY_TYPE_OFFSET_DATA can already handle a large reply, but
NBD_REPLY_TYPE_OFFSET_HOLE needs a 64-bit counterpart.

By standardizing this, all clients must be prepared to support both
types of hole type replies, even though most server implementations of
extended replies are likely to only send one hole type.

---

As this may mean a corner-case that gets less testing, I have
separated it into a separate optional patch.  I implemented it in my
proof-of-concept, but am happy to drop this patch for what actually
goes upstream.

In particular, if we foresee clients and servers that WANT to support
a payload larger than 4G, it may be worth introducing an NBD_INFO_*
that supplies 64-bit block sizing information, rather than our current
inherent 32-bit limit of NBD_INFO_BLOCK_SIZE, at the same time as we
introduce this reply type.
---
 doc/proto.md | 73 ++++++++++++++++++++++++++++------------------------
 1 file changed, 40 insertions(+), 33 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index 645a736..9c04411 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -2008,19 +2008,25 @@ size.
   64 bits: offset (unsigned)  
   32 bits: hole size (unsigned, MUST be nonzero)  

-  At this time, although servers that support extended headers are
-  permitted to accept client requests for `NBD_CMD_READ` with an
-  effect length larger than any advertised maximum block payload size
-  by splitting the reply into multiple chunks, portable clients SHOULD
-  NOT request a read *length* larger than 32 bits (corresponding to
-  the maximum block payload constraint implied by
-  `NBD_INFO_BLOCK_SIZE`), and therefore a 32-bit constraint on the
-  *hole size* does not represent an arbitrary limitation.  Should a
-  future scenario arise where it can be demonstrated that a client and
-  server would benefit from an extension allowing a maximum block
-  payload size to be larger than 32 bits, that extension would also
-  introduce a counterpart reply type that can express a 64-bit *hole
-  size*.
+* `NBD_REPLY_TYPE_OFFSET_HOLE_EXT` (3)
+
+  This chunk type is in the content chunk category.  *length* MUST be
+  exactly 16.  The semantics of this chunk mirror those of
+  `NBD_REPLY_TYPE_OFFSET_HOLE`, other than the use of a larger *hole
+  size* field.  This chunk type MUST NOT be used unless extended
+  headers were negotiated with `NBD_OPT_EXTENDED_HEADERS`.
+
+  The payload is structured as:
+
+  64 bits: offset (unsigned)  
+  64 bits: hole size (unsigned, MUST be nonzero)  
+
+  Note that even though extended headers are in use, a server may
+  enforce a maximum block size that is smaller than 32 bits, in which
+  case no valid `NBD_CMD_READ` will have a *length* large enough to
+  require the use of this chunk type.  However, a client using
+  extended headers MUST be prepared for the server to use either the
+  compact or extended chunk type.

 * `NBD_REPLY_TYPE_BLOCK_STATUS` (5)

@@ -2218,26 +2224,27 @@ The following request types exist:
     the following additional constraints.

     The server MAY split the reply into any number of content chunks
-    (`NBD_REPLY_TYPE_OFFSET_DATA` and `NBD_REPLY_TYPE_OFFSET_HOLE`);
-    each chunk MUST describe at least one byte, although to minimize
-    overhead, the server SHOULD use chunks with lengths and offsets as
-    an integer multiple of 512 bytes, where possible (the first and
-    last chunk of an unaligned read being the most obvious places for
-    an exception).  The server MUST NOT send content chunks that
-    overlap with any earlier content or error chunk, and MUST NOT send
-    chunks that describe data outside the offset and length of the
-    request, but MAY send the content chunks in any order (the client
-    MUST reassemble content chunks into the correct order), and MAY
-    send additional content chunks even after reporting an error
-    chunk.  A server MAY support read requests larger than the maximum
-    block payload size by splitting the response across multiple
-    chunks (in particular, if extended headers are not in use, a
-    request for more than 2^32 - 8 bytes containing data rather than
-    holes MUST be split to avoid overflowing the 32-bit
-    `NBD_REPLY_TYPE_OFFSET_DATA` length field); however, the server is
-    also permitted to reject large read requests up front, so a client
-    should be prepared to retry with smaller requests if a large
-    request fails.
+    (`NBD_REPLY_TYPE_OFFSET_DATA` and `NBD_REPLY_TYPE_OFFSET_HOLE` for
+    structured replies, additionally `NBD_REPLY_TYPE_OFFSET_HOLE_EXT`
+    for extended headers); each chunk MUST describe at least one byte,
+    although to minimize overhead, the server SHOULD use chunks with
+    lengths and offsets as an integer multiple of 512 bytes, where
+    possible (the first and last chunk of an unaligned read being the
+    most obvious places for an exception).  The server MUST NOT send
+    content chunks that overlap with any earlier content or error
+    chunk, and MUST NOT send chunks that describe data outside the
+    offset and length of the request, but MAY send the content chunks
+    in any order (the client MUST reassemble content chunks into the
+    correct order), and MAY send additional content chunks even after
+    reporting an error chunk.  A server MAY support read requests
+    larger than the maximum block payload size by splitting the
+    response across multiple chunks (in particular, if extended
+    headers are not in use, a request for more than 2^32 - 8 bytes
+    containing data rather than holes MUST be split to avoid
+    overflowing the 32-bit `NBD_REPLY_TYPE_OFFSET_DATA` length field);
+    however, the server is also permitted to reject large read
+    requests up front, so a client should be prepared to retry with
+    smaller requests if a large request fails.

     When no error is detected, the server MUST send enough data chunks
     to cover the entire region described by the offset and length of
-- 
2.38.1


