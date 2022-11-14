Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C72628DBD
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:53:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouiea-00046U-Id; Mon, 14 Nov 2022 18:14:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidu-0001hU-3i
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiEJ-0002Bj-Ku
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:47:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CUp5obJtvpmNtSidYS8qWBe5fkx0ql+rljzG1ZWCr2I=;
 b=esytavvuiWhEgWl3j0WYM9ZA7rADzrwUHW//coCLnHZ6le4/aMnDMyso36D6AN1aO5bePS
 IaP18JZl411ga7NhKvVDC/fcVqUxanPPD2N8yqc74rB51ZkFkQW+wDMTApWlW1UsxKULJq
 z7nwo0ejINCqsf8nOoWQRovqka66gDk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-QZGgsDmWNa2vQyc_I6EgCg-1; Mon, 14 Nov 2022 17:47:00 -0500
X-MC-Unique: QZGgsDmWNa2vQyc_I6EgCg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 928143C01DF3;
 Mon, 14 Nov 2022 22:47:00 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B2692024CC0;
 Mon, 14 Nov 2022 22:47:00 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	libguestfs@redhat.com
Subject: [PATCH v2 3/6] spec: Add NBD_OPT_EXTENDED_HEADERS
Date: Mon, 14 Nov 2022 16:46:52 -0600
Message-Id: <20221114224655.2186173-4-eblake@redhat.com>
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

Add a new negotiation feature where the client and server agree to use
larger packet headers on every packet sent during transmission phase.
This has two purposes: first, it makes it possible to perform
operations like trim, write zeroes, and block status on more than 2^32
bytes in a single command.  For NBD_CMD_READ, replies are still
implicitly capped by the maximum block payload limits (generally 32M);
if you want to know if a hole larger than 32 bits can represent,
you'll use BLOCK_STATUS instead of hoping that a large READ will
either return a hole or report overflow.  But for
NBD_CMD_BLOCK_STATUS, it is very useful to be able to report a status
extent with a size larger than 32-bits, in some cases even if the
client's request was for smaller than 32-bits (such as when it is
known that the entire image is not sparse).  Thus, the wording chosen
here is careful to permit a server to use either flavor status chunk
type in its reply, and clients requesting extended headers must be
prepared for both reply types.

Second, when structured replies are active, clients have to deal with
the difference between 16- and 20-byte headers of simple
vs. structured replies, which impacts performance if the client must
perform multiple syscalls to first read the magic before knowing if
there are even additional bytes to read to learn a payload length.  In
extended header mode, all headers are the same width and there are no
simple replies permitted.  The layout of the reply header is more like
the request header; and including the client's offset in the reply
makes it easier to convert between absolute and relative offsets for
replies to NBD_CMD_READ.  Similarly, by having extended mode use a
power-of-2 sizing, it becomes easier to manipulate arrays of headers
without worrying about an individual header crossing a cache line.
However, note that this change only affects the headers; data payloads
can still be unaligned (for example, a client performing 1-byte reads
or writes).  We would need to negotiate yet another extension if we
wanted to ensure that all NBD transmission packets started on an
8-byte boundary after option haggling has completed.

This spec addition was done in parallel with proof of concept
implementations in qemu (server and client), libnbd (client), and
nbdkit (server).

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 doc/proto.md | 481 ++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 358 insertions(+), 123 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index 53c334a..fde1e70 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -280,34 +280,53 @@ a soft disconnect.

 ### Transmission

-There are three message types in the transmission phase: the request,
-the simple reply, and the structured reply chunk.  The
+There are two general message types in the transmission phase: the
+request (simple or extended), and the reply (simple, structured, or
+extended).  The determination of which message headers to use is
+determined during handshaking phase, based on whether
+`NBD_OPT_STRUCTURED_REPLY` or `NBD_OPT_EXTENDED_HEADERS` was requested
+by the client and given a successful response by the server.  The
 transmission phase consists of a series of transactions, where the
 client submits requests and the server sends corresponding replies
 with either a single simple reply or a series of one or more
-structured reply chunks per request.  The phase continues until
-either side terminates transmission; this can be performed cleanly
-only by the client.
+structured or extended reply chunks per request.  The phase continues
+until either side terminates transmission; this can be performed
+cleanly only by the client.

 Note that without client negotiation, the server MUST use only simple
 replies, and that it is impossible to tell by reading the server
 traffic in isolation whether a data field will be present; the simple
 reply is also problematic for error handling of the `NBD_CMD_READ`
-request.  Therefore, structured replies can be used to create a
-a context-free server stream; see below.
+request.  Therefore, structured or extended replies can be used to
+create a a context-free server stream; see below.
+
+The results of client negotiation also determine whether the client
+and server will utilize only compact requests and replies, or whether
+both sides will use only extended packets.  Compact messages are the
+default, but inherently limit single transactions to a 32-bit window
+starting at a 64-bit offset.  Extended messages make it possible to
+perform 64-bit transactions (although typically only for commands that
+do not include a data payload).  Furthermore, when only structured
+replies have been negotiated, compact messages require the client to
+perform partial reads to determine which reply packet style (16-byte
+simple or 20-byte structured) is on the wire before knowing the length
+of the rest of the reply, which can reduce client performance.  With
+extended messages, all packet headers have a fixed length of 32 bytes,
+and although this results in more traffic over the network, the
+resulting layout is friendlier for performance.

 Replies need not be sent in the same order as requests (i.e., requests
-may be handled by the server asynchronously), and structured reply
-chunks from one request may be interleaved with reply messages from
-other requests; however, there may be constraints that prevent
-arbitrary reordering of structured reply chunks within a given reply.
+may be handled by the server asynchronously), and structured or
+extended reply chunks from one request may be interleaved with reply
+messages from other requests; however, there may be constraints that
+prevent arbitrary reordering of reply chunks within a given reply.
 Clients SHOULD use a handle that is distinct from all other currently
 pending transactions, but MAY reuse handles that are no longer in
 flight; handles need not be consecutive.  In each reply message
-(whether simple or structured), the server MUST use the same value for
-handle as was sent by the client in the corresponding request.  In
-this way, the client can correlate which request is receiving a
-response.
+(whether simple, structured, or extended), the server MUST use the
+same value for handle as was sent by the client in the corresponding
+request.  In this way, the client can correlate which request is
+receiving a response.

 #### Ordering of messages and writes

@@ -344,7 +363,10 @@ may be useful.

 #### Request message

-The request message, sent by the client, looks as follows:
+The compact request message is sent by the client when extended
+transactions are not in use (either the client did not request
+extended headers during negotiation, or the server responded that
+`NBD_OPT_EXTENDED_HEADERS` is unsupported), and looks as follows:

 C: 32 bits, 0x25609513, magic (`NBD_REQUEST_MAGIC`)  
 C: 16 bits, command flags  
@@ -354,19 +376,54 @@ C: 64 bits, offset (unsigned)
 C: 32 bits, length (unsigned)  
 C: (*length* bytes of data if the request is of type `NBD_CMD_WRITE`)  

+In the compact style, the client MUST NOT use the
+`NBD_CMD_FLAG_PAYLOAD_LEN` flag; and the only command where *length*
+represents payload length instead of effect length is `NBD_CMD_WRITE`.
+
+If negotiation agreed on extended transactions with
+`NBD_OPT_EXTENDED_HEADERS`, the client instead uses extended requests:
+
+C: 32 bits, 0x21e41c71, magic (`NBD_EXTENDED_REQUEST_MAGIC`)  
+C: 16 bits, command flags  
+C: 16 bits, type  
+C: 64 bits, handle  
+C: 64 bits, offset (unsigned)  
+C: 64 bits, payload/effect length (unsigned)  
+C: (*length* bytes of data if *flags* includes `NBD_CMD_FLAG_PAYLOAD_LEN`)  
+
+With extended headers, the meaning of the *length* field depends on
+whether *flags* contains `NBD_CMD_FLAG_PAYLOAD_LEN` (that many
+additional bytes of payload are present), or if the flag is absent
+(there is no payload, and *length* instead is an effect length
+describing how much of the image the request operates on).  The
+command `NBD_CMD_WRITE` MUST use the flag `NBD_CMD_FLAG_PAYLOAD_LEN`
+in this mode; while other commands SHOULD avoid the flag if the
+server has not indicated extension suppport for payloads on that
+command.  A server SHOULD initiate hard disconnect if a client sets
+the `NBD_CMD_FLAG_PAYLOAD_LEN` flag and uses a *length* larger than
+a server's advertised or default maximum payload length (capped at
+32 bits by the constraints of `NBD_INFO_BLOCK_SIZE`); in all other
+cases, a server SHOULD gracefully consume *length* bytes of payload
+(even if it then replies with an `NBD_EINVAL` failure because the
+particular command was not expecting a payload), and proceed with
+the next client command.  Thus, only when *length* is used as an
+effective length will it utilize a full 64-bit value.
+
 #### Simple reply message

 The simple reply message MUST be sent by the server in response to all
-requests if structured replies have not been negotiated using
-`NBD_OPT_STRUCTURED_REPLY`. If structured replies have been negotiated, a simple
+requests if neither structured replies (`NBD_OPT_STRUCTURED_REPLY`)
+nor extended headers (`NBD_OPT_EXTENDED_HEADERS`) have been
+negotiated.  If structured replies have been negotiated, a simple
 reply MAY be used as a reply to any request other than `NBD_CMD_READ`,
-but only if the reply has no data payload.  The message looks as
-follows:
+but only if the reply has no data payload.  If extended headers have
+been negotiated, a simple reply MUST NOT be used.  The message looks
+as follows:

 S: 32 bits, 0x67446698, magic (`NBD_SIMPLE_REPLY_MAGIC`; used to be
    `NBD_REPLY_MAGIC`)  
 S: 32 bits, error (MAY be zero)  
-S: 64 bits, handle  
+S: 64 bits, handle (MUST match the request)   
 S: (*length* bytes of data if the request is of type `NBD_CMD_READ` and
     *error* is zero)  

@@ -416,9 +473,9 @@ on the chunks received.
 A structured reply chunk message looks as follows:

 S: 32 bits, 0x668e33ef, magic (`NBD_STRUCTURED_REPLY_MAGIC`)  
-S: 16 bits, flags  
+S: 16 bits, reply flags  
 S: 16 bits, type  
-S: 64 bits, handle  
+S: 64 bits, handle (MUST match the request)  
 S: 32 bits, length of payload (unsigned)  
 S: *length* bytes of payload data (if *length* is nonzero)  

@@ -426,6 +483,45 @@ The use of *length* in the reply allows context-free division of
 the overall server traffic into individual reply messages; the
 *type* field describes how to further interpret the payload.

+#### Extended reply chunk message
+
+One implementation drawback of the original structured replies via
+`NBD_OPT_STRUCTURED_REPLY` is that a client must read the magic number
+to know whether it will then be reading a 16-byte or 20-byte header
+from the server.  Another is that an array of 20-byte structures is
+not always cache-line friendly, compared to power-of-2 sizing.
+Therefore, a client may instead attempt to negotiate extended headers
+via `NBD_OPT_EXTENDED_HEADERS` in place of structured replies.
+
+If extended headers are negotiated, all server replies MUST use an
+extended reply; the server MUST NOT use simple replies even when there
+is no payload.  Most fields in the extended reply have the same
+semantics as their counterparts in structured replies (including the
+use of `NBD_REPLY_FLAG_DONE` to end a sequence of one or more chunks
+comprising the overall reply).  The extended reply has an additional
+field *offset* which MUST match the *offset* of the client's request
+(even in reply types such as `NBD_REPLY_TYPE_OFFSET_DATA` where the
+payload itself contains a different offset representing the middle of
+the buffer).
+
+The other difference between extended replies and structured replies
+is that the *length* field is 64 bits to match the layout of the
+extended request header.  However, note that while the request flags
+determine whether a request uses a 32-bit payload length or a 64-bit
+effect length, at this time the reply length is used solely for
+payload lengths and so in practice will never exceed a 32-bit value
+(see `NBD_INFO_BLOCK_SIZE`).
+
+An extended reply chunk message looks as follows:
+
+S: 32 bits, 0x6e8a278c, magic (`NBD_EXTENDED_REPLY_MAGIC`)  
+S: 16 bits, reply flags  
+S: 16 bits, type  
+S: 64 bits, handle (MUST match the request)  
+S: 64 bits, offset (MUST match the request)  
+S: 64 bits, length of payload (unsigned)  
+S: *length* bytes of payload data (if *length* is nonzero)  
+
 #### Terminating the transmission phase

 There are two methods of terminating the transmission phase:
@@ -838,18 +934,19 @@ that length is larger than the advertised maximum block payload size.

 For commands that require a payload in either direction and where the
 client controls the payload length (`NBD_CMD_WRITE`, or `NBD_CMD_READ`
-without structured replies), the client MUST NOT use a length larger
-than the maximum block size. For replies where the payload length is
-controlled by the server (`NBD_CMD_BLOCK_STATUS` without the flag
-`NBD_CMD_FLAG_REQ_ONE`, or `NBD_CMD_READ`, both when structured
-replies are negotiated), the server MUST NOT send an individual reply
-chunk larger than the maximum payload size, although it may split the
-overall reply among several chunks.  For commands that do not require
-a payload in either direction (such as `NBD_CMD_TRIM`), the client MAY
-request a length larger than the maximum block size; the server SHOULD
-NOT disconnect, but MAY reply with an `NBD_EOVERFLOW` or `NBD_EINVAL`
-error if the oversize request would require more server resources than
-the same command operating on only a maximum block size (such as some
+without structured or extended replies), the client MUST NOT use a
+length larger than the maximum block size. For replies where the
+payload length is controlled by the server (`NBD_CMD_BLOCK_STATUS`
+without the flag `NBD_CMD_FLAG_REQ_ONE`, or `NBD_CMD_READ`, both when
+structured replies or extended headers are negotiated), the server
+MUST NOT send an individual reply chunk larger than the maximum
+payload size, although it may split the overall reply among several
+chunks.  For commands that do not require a payload in either
+direction (such as `NBD_CMD_TRIM`), the client MAY request a length
+larger than the maximum block size; the server SHOULD NOT disconnect,
+but MAY reply with an `NBD_EOVERFLOW` or `NBD_EINVAL` error if the
+oversize request would require more server resources than the same
+command operating on only a maximum block size (such as some
 implementations of `NBD_CMD_WRITE_ZEROES` without the flag
 `NBD_CMD_FLAG_FAST_ZERO`, or `NBD_CMD_CACHE`).

@@ -894,12 +991,11 @@ The procedure works as follows:
 - During transmission, a client can then indicate interest in metadata
   for a given region by way of the `NBD_CMD_BLOCK_STATUS` command,
   where *offset* and *length* indicate the area of interest. On
-  success, the server MUST respond with one structured reply chunk of
-  type `NBD_REPLY_TYPE_BLOCK_STATUS` per metadata context selected
-  during negotiation, where each reply chunk is a list of one or more
-  consecutive extents for that context.  Each extent comes with a
-  *flags* field, the semantics of which are defined by the metadata
-  context.
+  success, the server MUST respond with one status type reply chunk
+  per metadata context selected during negotiation, where each reply
+  chunk is a list of one or more consecutive extents for that context.
+  Each extent comes with a *flags* field, the semantics of which are
+  defined by the metadata context.

 The client's requested *length* is only a hint to the server, so the
 cumulative extent length contained in a chunk of the server's reply
@@ -920,9 +1016,10 @@ same export name for the subsequent `NBD_OPT_GO` (or
 sending `NBD_CMD_BLOCK_STATUS` without selecting at least one metadata
 context.

-The reply to the `NBD_CMD_BLOCK_STATUS` request MUST be sent as a
-structured reply; this implies that in order to use metadata querying,
-structured replies MUST be negotiated first.
+The reply to a successful `NBD_CMD_BLOCK_STATUS` request MUST be sent
+via reply chunks; this implies that in order to use metadata querying,
+either structured replies or extended headers MUST be negotiated
+first.

 Metadata contexts are identified by their names. The name MUST consist
 of a namespace, followed by a colon, followed by a leaf-name.  The
@@ -1097,12 +1194,12 @@ The field has the following format:
 - bit 5, `NBD_FLAG_SEND_TRIM`: exposes support for `NBD_CMD_TRIM`.
 - bit 6, `NBD_FLAG_SEND_WRITE_ZEROES`: exposes support for
   `NBD_CMD_WRITE_ZEROES` and `NBD_CMD_FLAG_NO_HOLE`.
-- bit 7, `NBD_FLAG_SEND_DF`: do not fragment a structured reply. The
-  server MUST set this transmission flag to 1 if the
-  `NBD_CMD_READ` request supports the `NBD_CMD_FLAG_DF` flag, and
-  MUST leave this flag clear if structured replies have not been
-  negotiated. Clients MUST NOT set the `NBD_CMD_FLAG_DF` request
-  flag unless this transmission flag is set.
+- bit 7, `NBD_FLAG_SEND_DF`: do not fragment a structured or extended
+  reply. The server MUST set this transmission flag to 1 if the
+  `NBD_CMD_READ` request supports the `NBD_CMD_FLAG_DF` flag, and MUST
+  leave this flag clear if neither structured replies nor extended
+  headers have been negotiated. Clients MUST NOT set the
+  `NBD_CMD_FLAG_DF` request flag unless this transmission flag is set.
 - bit 8, `NBD_FLAG_CAN_MULTI_CONN`: Indicates that the server operates
   entirely without cache, or that the cache it uses is shared among all
   connections to the given device. In particular, if this flag is
@@ -1212,10 +1309,10 @@ of the newstyle negotiation.

     When this command succeeds, the server MUST NOT preserve any
     negotiation state (such as a request for
-    `NBD_OPT_STRUCTURED_REPLY`, or metadata contexts from
-    `NBD_OPT_SET_META_CONTEXT`) issued before this command.  A client
-    SHOULD defer all stateful option requests until after it
-    determines whether encryption is available.
+    `NBD_OPT_STRUCTURED_REPLY` or `NBD_OPT_EXTENDED_HEADERS`, or
+    metadata contexts from `NBD_OPT_SET_META_CONTEXT`) issued before
+    this command.  A client SHOULD defer all stateful option requests
+    until after it determines whether encryption is available.

     See the section on TLS above for further details.

@@ -1296,6 +1393,10 @@ of the newstyle negotiation.
       `NBD_REP_ERR_BLOCK_SIZE_REQD` error SHOULD ensure it first
       sends an `NBD_INFO_BLOCK_SIZE` information reply in order
       to help avoid a potentially unnecessary round trip.
+    - `NBD_REP_ERR_EXT_HEADER_REQD`: The server requires the client to
+      utilize extended headers.  While this may make it easier to
+      implement a server with fewer considerations for backwards
+      compatibility, it limits connections to only recent clients.

     Additionally, if TLS has not been initiated, the server MAY reply
     with `NBD_REP_ERR_TLS_REQD` (instead of `NBD_REP_ERR_UNKNOWN`) to
@@ -1350,6 +1451,9 @@ of the newstyle negotiation.
       server MUST use structured replies to the `NBD_CMD_READ`
       transmission request.  Other extensions that require structured
       replies may now be negotiated.
+    - `NBD_REP_ERR_EXT_HEADER_REQD`: The client has already
+      successfully negotiated extended headers, which takes precedence
+      over this option.
     - For backwards compatibility, clients SHOULD be prepared to also
       handle `NBD_REP_ERR_UNSUP`; in this case, no structured replies
       will be sent.
@@ -1357,9 +1461,10 @@ of the newstyle negotiation.
     It is envisioned that future extensions will add other new
     requests that may require a data payload in the reply.  A server
     that supports such extensions SHOULD NOT advertise those
-    extensions until the client negotiates structured replies; and a
-    client MUST NOT make use of those extensions without first
-    enabling the `NBD_OPT_STRUCTURED_REPLY` extension.
+    extensions until the client has negotiated either structured
+    replies or extended headers; and a client MUST NOT make use of
+    those extensions without first enabling support for reply
+    payloads.

     If the client requests `NBD_OPT_STARTTLS` after this option, it
     MUST renegotiate structured replies and any other dependent
@@ -1370,9 +1475,10 @@ of the newstyle negotiation.
     Return a list of `NBD_REP_META_CONTEXT` replies, one per context,
     followed by an `NBD_REP_ACK` or an error.

-    This option SHOULD NOT be requested unless structured replies have
-    been negotiated first. If a client attempts to do so, a server
-    MAY send `NBD_REP_ERR_INVALID`.
+    This option SHOULD NOT be requested unless structured replies or
+    extended headers have been negotiated first. If a client attempts
+    to do so, a server MAY send `NBD_REP_ERR_INVALID` or
+    `NBD_REP_ERR_EXT_HEADER_REQD`.

     Data:
     - 32 bits, length of export name.  
@@ -1454,9 +1560,10 @@ of the newstyle negotiation.
     they are interested in are selected with the final query that they
     sent.

-    This option MUST NOT be requested unless structured replies have
-    been negotiated first. If a client attempts to do so, a server
-    SHOULD send `NBD_REP_ERR_INVALID`.
+    This option MUST NOT be requested unless structured replies or
+    extended headers have been negotiated first. If a client attempts
+    to do so, a server SHOULD send `NBD_REP_ERR_INVALID` or
+    `NBD_REP_ERR_EXT_HEADER_REQD`.

     A client MUST NOT send `NBD_CMD_BLOCK_STATUS` unless within the
     negotiation phase it sent `NBD_OPT_SET_META_CONTEXT` at least
@@ -1493,6 +1600,46 @@ of the newstyle negotiation.
     option does not select any metadata context, provided the client
     then does not attempt to issue `NBD_CMD_BLOCK_STATUS` commands.

+* `NBD_OPT_EXTENDED_HEADERS` (11)
+
+    The client wishes to use extended headers during the transmission
+    phase.  The client MUST NOT send any additional data with the
+    option, and the server SHOULD reject a request that includes data
+    with `NBD_REP_ERR_INVALID`.
+
+    When successful, this option takes precedence over structured
+    replies.  A client MAY request structured replies first, although
+    a server SHOULD support this option even if structured replies are
+    not negotiated.
+
+    It is envisioned that future extensions will add other new
+    requests that support a data payload in the request or reply.  A
+    server that supports such extensions SHOULD NOT advertise those
+    extensions until the client has negotiated extended headers; and a
+    client MUST NOT make use of those extensions without first
+    enabling support for reply payloads.
+
+    The server replies with the following, or with an error permitted
+    elsewhere in this document:
+
+    - `NBD_REP_ACK`: Extended headers have been negotiated; the client
+      MUST use the 32-byte extended request header, with proper use of
+      `NBD_CMD_FLAG_PAYLOAD_LEN` for all commands sending a payload;
+      and the server MUST use the 32-byte extended reply header.
+    - For backwards compatibility, clients SHOULD be prepared to also
+      handle `NBD_REP_ERR_UNSUP`; in this case, only the compact
+      transmission headers will be used.
+
+    Note that a response of `NBD_REP_ERR_BLOCK_SIZE_REQD` does not
+    make sense in response to this command, but a server MAY fail with
+    that error for a later `NBD_OPT_GO` without a client request for
+    `NBD_INFO_BLOCK_SIZE`, since the use of extended headers provides
+    more incentive for a client to promise to obey block size
+    constraints.
+
+    If the client requests `NBD_OPT_STARTTLS` after this option, it
+    MUST renegotiate extended headers.
+
 #### Option reply types

 These values are used in the "reply type" field, sent by the server
@@ -1672,6 +1819,16 @@ case that data is an error message string suitable for display to the user.

     The request or the reply is too large to process.

+* `NBD_REP_ERR_EXT_HEADER_REQD` (2^31 + 10)
+
+    The server is unwilling to proceed with the given request (such as
+    `NBD_OPT_GO` or `NBD_OPT_SET_META_CONTEXT`) for a client that has
+    not yet requested extended headers (via
+    `NBD_OPT_EXTENDED_HEADERS`).  This error is also used to indicate
+    that the server is unable to downgrade to structured replies (via
+    `NBD_OPT_STRUCTURED_REPLY`) if extended headers have already been
+    enabled.
+
 ### Transmission phase

 #### Flag fields
@@ -1725,6 +1882,17 @@ valid may depend on negotiation during the handshake phase.
   `NBD_CMD_WRITE`, then the server MUST fail quickly with an error of
   `NBD_ENOTSUP`. The client MUST NOT set this unless the server advertised
   `NBD_FLAG_SEND_FAST_ZERO`.
+- bit 5, `NBD_CMD_FLAG_PAYLOAD_LEN`; only valid if extended headers
+  were negotiated via `NBD_OPT_EXTENDED_HEADERS`.  If set, the
+  *length* field of the header describes a (nonzero) payload length of
+  data to be sent alongside the header; if the flag is clear, the
+  header *length* is instead an effect length for the command's
+  interaction with the export, and there is no payload after the
+  header.  With extended headers, the flag MUST be set for
+  `NBD_CMD_WRITE` (as the write command always sends a payload of the
+  bytes to be written); for other commands, the flag will trigger an
+  `NBD_EINVAL` error unless the server has advertised support for an
+  extension payload form for the command.

 ##### Structured reply flags

@@ -1746,13 +1914,15 @@ unrecognized flags.

 #### Structured reply types

-These values are used in the "type" field of a structured reply.
-Some chunk types can additionally be categorized by role, such as
-*error chunks* or *content chunks*.  Each type determines how to
-interpret the "length" bytes of payload.  If the client receives
-an unknown or unexpected type, other than an *error chunk*, it
-MUST initiate a hard disconnect.  A server MUST NOT send a chunk
-larger than any advertised maximum block payload size.
+These values are used in the "type" field of a structured reply.  Some
+chunk types can additionally be categorized by role, such as *error
+chunks*, *content chunks*, or *status chunks*.  Each type determines
+how to interpret the "length" bytes of payload.  If the client
+receives an unknown or unexpected type, other than an *error chunk*,
+it MAY initiate a hard disconnect on the grounds that the client is
+uncertain whether the server handled the request as desired.  A server
+MUST NOT send a chunk larger than any advertised maximum block payload
+size.

 * `NBD_REPLY_TYPE_NONE` (0)

@@ -1795,13 +1965,28 @@ larger than any advertised maximum block payload size.
   64 bits: offset (unsigned)  
   32 bits: hole size (unsigned, MUST be nonzero)  

+  At this time, although servers that support extended headers are
+  permitted to accept client requests for `NBD_CMD_READ` with an
+  effect length larger than any advertised maximum block payload size
+  by splitting the reply into multiple chunks, portable clients SHOULD
+  NOT request a read *length* larger than 32 bits (corresponding to
+  the maximum block payload constraint implied by
+  `NBD_INFO_BLOCK_SIZE`), and therefore a 32-bit constraint on the
+  *hole size* does not represent an arbitrary limitation.  Should a
+  future scenario arise where it can be demonstrated that a client and
+  server would benefit from an extension allowing a maximum block
+  payload size to be larger than 32 bits, that extension would also
+  introduce a counterpart reply type that can express a 64-bit *hole
+  size*.
+
 * `NBD_REPLY_TYPE_BLOCK_STATUS` (5)

-  *length* MUST be 4 + (a positive integer multiple of 8).  This reply
-  represents a series of consecutive block descriptors where the sum
-  of the length fields within the descriptors is subject to further
-  constraints documented below.  A successful block status request MUST
-  have exactly one status chunk per negotiated metadata context ID.
+  This chunk type is in the status chunk category.  *length* MUST be
+  4 + (a positive integer multiple of 8).  This reply represents a
+  series of consecutive block descriptors where the sum of the length
+  fields within the descriptors is subject to further constraints
+  documented below.  A successful block status request MUST have
+  exactly one status chunk per negotiated metadata context ID.

   The payload starts with:

@@ -1843,6 +2028,43 @@ larger than any advertised maximum block payload size.
   extent information at the first offset not covered by a
   reduced-length reply.

+* `NBD_REPLY_TYPE_BLOCK_STATUS_EXT` (6)
+
+  This chunk type is in the status chunk category.  *length* MUST be
+  8 + (a positive multiple of 16).  The semantics of this chunk mirror
+  those of `NBD_REPLY_TYPE_BLOCK_STATUS`, other than the use of a
+  larger *extent length* field, added padding in each descriptor to
+  ease alignment, and the addition of a *descriptor count* field that
+  can be used for easier client processing.  This chunk type MUST NOT
+  be used unless extended headers were negotiated with
+  `NBD_OPT_EXTENDED_HEADERS`.
+
+  If the *descriptor count* field contains 0, the number of subsequent
+  descriptors is determined solely by the *length* field of the reply
+  header.  However, the server MAY populate the *descriptor count*
+  field with the number of descriptors that follow; when doing this,
+  the server MUST ensure that the header *length* is equal to
+  *descriptor count* * 16 + 8.
+
+  The payload starts with:
+
+  32 bits, metadata context ID  
+  32 bits, descriptor count  
+
+  and is followed by a list of one or more descriptors, each with this
+  layout:
+
+  64 bits, length of the extent to which the status below
+     applies (unsigned, MUST be nonzero)  
+  32 bits, padding (MUST be zero)  
+  32 bits, status flags  
+
+  Note that even when extended headers are in use, the client MUST be
+  prepared for the server to use either the compact or extended chunk
+  type, regardless of whether the client's hinted effect length was
+  more or less than 32 bits; but the server MUST use exactly one of
+  the two chunk types per negotiated metacontext ID.
+
 All error chunk types have bit 15 set, and begin with the same
 *error*, *message length*, and optional *message* fields as
 `NBD_REPLY_TYPE_ERROR`.  If nonzero, *message length* indicates
@@ -1857,8 +2079,9 @@ remaining structured fields at the end.
   and the client MAY NOT make any assumptions about partial
   success. This type SHOULD NOT be used more than once in a
   structured reply.  Valid as a reply to any request.  Note that
-  *message length* MUST NOT exceed the 4096 bytes string length
-  limit.
+  *message length* MUST NOT exceed the 4096 bytes string length limit,
+  and therefore there is no need for a counterpart extended-length
+  error chunk type.

   The payload is structured as:

@@ -1905,19 +2128,21 @@ The following request types exist:

     A read request. Length and offset define the data to be read. The
     server MUST reply with either a simple reply or a structured
-    reply, according to whether the structured replies have been
-    negotiated using `NBD_OPT_STRUCTURED_REPLY`. The client SHOULD NOT
-    request a read length of 0; the behavior of a server on such a
+    reply, according to whether structured replies
+    (`NBD_OPT_STRUCTURED_REPLY`) or extended headers
+    (`NBD_OPT_EXTENDED_HEADERS`) were negotiated.  The client SHOULD
+    NOT request a read length of 0; the behavior of a server on such a
     request is unspecified although the server SHOULD NOT disconnect.

     *Simple replies*

-    If structured replies were not negotiated, then a read request
-    MUST always be answered by a simple reply, as documented above
-    (using magic 0x67446698 `NBD_SIMPLE_REPLY_MAGIC`, and containing
-    length bytes of data according to the client's request), which in
-    turn means any client request with a length larger than the
-    maximum block payload size will fail.
+    If neither structured replies nor extended headers were
+    negotiated, then a read request MUST always be answered by a
+    simple reply, as documented above (using magic 0x67446698
+    `NBD_SIMPLE_REPLY_MAGIC`, and containing length bytes of data
+    according to the client's request), which in turn means any client
+    request with a length larger than the maximum block payload size
+    will fail.

     If an error occurs, the server SHOULD set the appropriate error code
     in the error field. The server MAY then initiate a hard disconnect.
@@ -1930,13 +2155,15 @@ The following request types exist:

     *Structured replies*

-    If structured replies are negotiated, then a read request MUST
-    result in a structured reply with one or more chunks (each using
-    magic 0x668e33ef `NBD_STRUCTURED_REPLY_MAGIC`), where the final
-    chunk has the flag `NBD_REPLY_FLAG_DONE`, and with the following
-    additional constraints.
+    If structured replies or extended headers are negotiated, then a
+    read request MUST result in a reply with one or more structured
+    chunks (each using `NBD_STRUCTURED_REPLY_MAGIC` or
+    `NBD_EXTENDED_REPLY_MAGIC` according to what was negotiated),
+    where the final chunk has the flag `NBD_REPLY_FLAG_DONE`, and with
+    the following additional constraints.

-    The server MAY split the reply into any number of content chunks;
+    The server MAY split the reply into any number of content chunks
+    (`NBD_REPLY_TYPE_OFFSET_DATA` and `NBD_REPLY_TYPE_OFFSET_HOLE`);
     each chunk MUST describe at least one byte, although to minimize
     overhead, the server SHOULD use chunks with lengths and offsets as
     an integer multiple of 512 bytes, where possible (the first and
@@ -1949,12 +2176,13 @@ The following request types exist:
     send additional content chunks even after reporting an error
     chunk.  A server MAY support read requests larger than the maximum
     block payload size by splitting the response across multiple
-    chunks (in particular, a request for more than 2^32 - 8 bytes
-    containing data rather than holes MUST be split to avoid
-    overflowing the `NBD_REPLY_TYPE_OFFSET_DATA` length field);
-    however, the server is also permitted to reject large read
-    requests up front, so a client should be prepared to retry with
-    smaller requests if a large request fails.
+    chunks (in particular, if extended headers are not in use, a
+    request for more than 2^32 - 8 bytes containing data rather than
+    holes MUST be split to avoid overflowing the 32-bit
+    `NBD_REPLY_TYPE_OFFSET_DATA` length field); however, the server is
+    also permitted to reject large read requests up front, so a client
+    should be prepared to retry with smaller requests if a large
+    request fails.

     When no error is detected, the server MUST send enough data chunks
     to cover the entire region described by the offset and length of
@@ -2180,10 +2408,10 @@ The following request types exist:

 * `NBD_CMD_BLOCK_STATUS` (7)

-    A block status query request. Length and offset define the range
-    of interest.  The client SHOULD NOT request a status length of 0;
-    the behavior of a server on such a request is unspecified although
-    the server SHOULD NOT disconnect.
+    A block status query request. The effect length is a hint to the
+    server about the range of interest.  The client SHOULD NOT request
+    a status length of 0; the behavior of a server on such a request
+    is unspecified although the server SHOULD NOT disconnect.

     A client MUST NOT send `NBD_CMD_BLOCK_STATUS` unless within the
     negotiation phase it sent `NBD_OPT_SET_META_CONTEXT` at least
@@ -2191,28 +2419,29 @@ The following request types exist:
     same export name used to enter transmission phase, and where the
     server returned at least one metadata context without an error.
     This in turn requires the client to first negotiate structured
-    replies. For a successful return, the server MUST use a structured
-    reply, containing exactly one chunk of type
-    `NBD_REPLY_TYPE_BLOCK_STATUS` per selected context id, where the
-    status field of each descriptor is determined by the flags field
-    as defined by the metadata context.  The server MAY send chunks in
-    a different order than the context ids were assigned in reply to
-    `NBD_OPT_SET_META_CONTEXT`.
+    replies or extended headers. For a successful return, the server
+    MUST use one reply chunk per selected context id (only
+    `NBD_REPLY_TYPE_BLOCK_STATUS` for structured replies, and either
+    `NBD_REPLY_TYPE_BLOCK_STATUS` or `NBD_REPLY_TYPE_BLOCK_STATUS_EXT`
+    for extended headers).  The status field of each descriptor is
+    determined by the flags field as defined by the metadata context.
+    The server MAY send chunks in a different order than the context
+    ids were assigned in reply to `NBD_OPT_SET_META_CONTEXT`.

-    The list of block status descriptors within the
-    `NBD_REPLY_TYPE_BLOCK_STATUS` chunk represent consecutive portions
-    of the file starting from specified *offset*.  If the client used
-    the `NBD_CMD_FLAG_REQ_ONE` flag, each chunk contains exactly one
-    descriptor where the *length* of the descriptor MUST NOT be
-    greater than the *length* of the request; otherwise, a chunk MAY
-    contain multiple descriptors, and the final descriptor MAY extend
-    beyond the original requested size if the server can determine a
-    larger length without additional effort.  On the other hand, the
-    server MAY return less data than requested.  In particular, a
-    server SHOULD NOT send more than 2^20 status descriptors in a
-    single chunk.  However the server MUST return at least one status
-    descriptor, and since each status descriptor has a non-zero
-    length, a client can always make progress on a successful return.
+    The list of block status descriptors within a given status chunk
+    represent consecutive portions of the file starting from specified
+    *offset*.  If the client used the `NBD_CMD_FLAG_REQ_ONE` flag,
+    each chunk contains exactly one descriptor where the *length* of
+    the descriptor MUST NOT be greater than the *length* of the
+    request; otherwise, a chunk MAY contain multiple descriptors, and
+    the final descriptor MAY extend beyond the original requested size
+    if the server can determine a larger length without additional
+    effort.  On the other hand, the server MAY return less data than
+    requested.  In particular, a server SHOULD NOT send more than 2^20
+    status descriptors in a single chunk.  However the server MUST
+    return at least one status descriptor, and since each status
+    descriptor has a non-zero length, a client can always make
+    progress on a successful return.

     The server SHOULD use different *status* values between
     consecutive descriptors where feasible, although the client SHOULD
@@ -2412,6 +2641,10 @@ implement the following features:
   Clients that do not implement querying for block size constraints
   SHOULD abide by the rules laid out in the section "Block size
   constraints", above.
+- Servers that implement extended headers but desire interoperability
+  with older client implementations SHOULD NOT use the
+  `NBD_REP_ERR_EXT_HEADER_REQD` error response to `NBD_OPT_GO`, but
+  should gracefully support compact headers.

 ### Future considerations

@@ -2421,6 +2654,8 @@ implementations are not yet ready to support them:

 - Structured replies; the Linux kernel currently does not yet implement
   them.
+- Extended headers; these are similar to structured replies, but is
+  new enough that many clients and servers do not yet implement them.

 ## About this file

-- 
2.38.1


