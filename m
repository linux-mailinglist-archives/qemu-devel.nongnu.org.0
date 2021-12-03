Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8551468034
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:18:09 +0100 (CET)
Received: from localhost ([::1]:47484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtHoe-0000OI-BD
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:18:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHlS-0006PB-UJ
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:14:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHlM-0002mJ-88
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:14:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638573283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9fDho8t5AzIpzqegc9wrGUlVId38U8TLonjG8R3g7c0=;
 b=blhTMoabYzEpecrG8iYus+jp0sH9YUgDaIWh3Mrz1bNPdudMf7qeDeR1lgYXqLExjvIvms
 woI+ok29/76ydHCEQYbK8VajhXG5A1WFUjsW9TzG9JCMaV6UnIr/FaLvFzwf7enqdPBcUg
 iJ95aqMr9Vav/sUde1WH+g8mHyoJ/sM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-wZUI_ZrfN1-b3nT8R0gcCQ-1; Fri, 03 Dec 2021 18:14:40 -0500
X-MC-Unique: wZUI_ZrfN1-b3nT8R0gcCQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26E4885EE61;
 Fri,  3 Dec 2021 23:14:39 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 371A918032;
 Fri,  3 Dec 2021 23:14:35 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Subject: [PATCH] spec: Add NBD_OPT_EXTENDED_HEADERS
Date: Fri,  3 Dec 2021 17:14:34 -0600
Message-Id: <20211203231434.3900824-1-eblake@redhat.com>
In-Reply-To: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: nsoffer@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new negotiation feature where the client and server agree to use
larger packet headers on every packet sent during transmission phase.
This has two purposes: first, it makes it possible to perform
operations like trim, write zeroes, and block status on more than 2^32
bytes in a single command; this in turn requires that some structured
replies from the server also be extended to match.  The wording chosen
here is careful to permit a server to use either flavor in its reply
(that is, a request less than 32-bits can trigger an extended reply,
and conversely a request larger than 32-bits can trigger a compact
reply).

Second, when structured replies are active, clients have to deal with
the difference between 16- and 20-byte headers of simple
vs. structured replies, which impacts performance if the client must
perform multiple syscalls to first read the magic before knowing how
many additional bytes to read.  In extended header mode, all headers
are the same width, so the client can read a full header before
deciding whether the header describes a simple or structured reply.
Similarly, by having extended mode use a power-of-2 sizing, it becomes
easier to manipulate headers within a single cache line, even if it
requires padding bytes sent over the wire.  However, note that this
change only affects the headers; as data payloads can still be
unaligned (for example, a client performing 1-byte reads or writes),
we would need to negotiate yet another extension if we wanted to
ensure that all NBD transmission packets started on an 8-byte boundary
after option haggling has completed.

This spec addition was done in parallel with a proof of concept
implementation in qemu (server and client) and libnbd (client), and I
also have plans to implement it in nbdkit (server).

Signed-off-by: Eric Blake <eblake@redhat.com>
---

Available at https://repo.or.cz/nbd/ericb.git/shortlog/refs/tags/exthdr-v1

 doc/proto.md | 218 +++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 177 insertions(+), 41 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index 3a877a9..46560b6 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -295,6 +295,21 @@ reply is also problematic for error handling of the `NBD_CMD_READ`
 request.  Therefore, structured replies can be used to create a
 a context-free server stream; see below.

+The results of client negotiation also determine whether the client
+and server will utilize only compact requests and replies, or whether
+both sides will use only extended packets.  Compact messages are the
+default, but inherently limit single transactions to a 32-bit window
+starting at a 64-bit offset.  Extended messages make it possible to
+perform 64-bit transactions (although typically only for commands that
+do not include a data payload).  Furthermore, when structured replies
+have been negotiated, compact messages require the client to perform
+partial reads to determine which reply packet style (simple or
+structured) is on the wire before knowing the length of the rest of
+the reply, which can reduce client performance.  With extended
+messages, all packet headers have a fixed length of 32 bytes, and
+although this results in more traffic over the network due to padding,
+the resulting layout is friendlier for performance.
+
 Replies need not be sent in the same order as requests (i.e., requests
 may be handled by the server asynchronously), and structured reply
 chunks from one request may be interleaved with reply messages from
@@ -343,7 +358,9 @@ may be useful.

 #### Request message

-The request message, sent by the client, looks as follows:
+The compact request message, sent by the client when extended
+transactions are not negotiated using `NBD_OPT_EXTENDED_HEADERS`,
+looks as follows:

 C: 32 bits, 0x25609513, magic (`NBD_REQUEST_MAGIC`)  
 C: 16 bits, command flags  
@@ -353,14 +370,26 @@ C: 64 bits, offset (unsigned)
 C: 32 bits, length (unsigned)  
 C: (*length* bytes of data if the request is of type `NBD_CMD_WRITE`)  

+If negotiation agreed on extended transactions with
+`NBD_OPT_EXTENDED_HEADERS`, the client instead uses extended requests:
+
+C: 32 bits, 0x21e41c71, magic (`NBD_REQUEST_EXT_MAGIC`)  
+C: 16 bits, command flags  
+C: 16 bits, type  
+C: 64 bits, handle  
+C: 64 bits, offset (unsigned)  
+C: 64 bits, length (unsigned)  
+C: (*length* bytes of data if the request is of type `NBD_CMD_WRITE`)  
+
 #### Simple reply message

 The simple reply message MUST be sent by the server in response to all
 requests if structured replies have not been negotiated using
-`NBD_OPT_STRUCTURED_REPLY`. If structured replies have been negotiated, a simple
-reply MAY be used as a reply to any request other than `NBD_CMD_READ`,
-but only if the reply has no data payload.  The message looks as
-follows:
+`NBD_OPT_STRUCTURED_REPLY`. If structured replies have been
+negotiated, a simple reply MAY be used as a reply to any request other
+than `NBD_CMD_READ`, but only if the reply has no data payload.  If
+extended headers were not negotiated using `NBD_OPT_EXTENDED_HEADERS`,
+the message looks as follows:

 S: 32 bits, 0x67446698, magic (`NBD_SIMPLE_REPLY_MAGIC`; used to be
    `NBD_REPLY_MAGIC`)  
@@ -369,6 +398,16 @@ S: 64 bits, handle
 S: (*length* bytes of data if the request is of type `NBD_CMD_READ` and
     *error* is zero)  

+If extended headers were negotiated using `NBD_OPT_EXTENDED_HEADERS`,
+the message looks like:
+
+S: 32 bits, 0x60d12fd6, magic (`NBD_SIMPLE_REPLY_EXT_MAGIC`)  
+S: 32 bits, error (MAY be zero)  
+S: 64 bits, handle  
+S: 128 bits, padding (MUST be zero)  
+S: (*length* bytes of data if the request is of type `NBD_CMD_READ` and
+    *error* is zero)  
+
 #### Structured reply chunk message

 Some of the major downsides of the default simple reply to
@@ -410,7 +449,9 @@ considered successful only if it did not contain any error chunks,
 although the client MAY be able to determine partial success based
 on the chunks received.

-A structured reply chunk message looks as follows:
+If extended headers were not negotiated using
+`NBD_OPT_EXTENDED_HEADERS`, a structured reply chunk message looks as
+follows:

 S: 32 bits, 0x668e33ef, magic (`NBD_STRUCTURED_REPLY_MAGIC`)  
 S: 16 bits, flags  
@@ -423,6 +464,17 @@ The use of *length* in the reply allows context-free division of
 the overall server traffic into individual reply messages; the
 *type* field describes how to further interpret the payload.

+If extended headers were negotiated using `NBD_OPT_EXTENDED_HEADERS`,
+the message looks like:
+
+S: 32 bits, 0x6e8a278c, magic (`NBD_STRUCTURED_REPLY_EXT_MAGIC`)  
+S: 16 bits, flags  
+S: 16 bits, type  
+S: 64 bits, handle  
+S: 64 bits, length of payload (unsigned)  
+S: 64 bits, padding (MUST be zero)  
+S: *length* bytes of payload data (if *length* is nonzero)  
+
 #### Terminating the transmission phase

 There are two methods of terminating the transmission phase:
@@ -870,15 +922,19 @@ The procedure works as follows:
   server supports.
 - During transmission, a client can then indicate interest in metadata
   for a given region by way of the `NBD_CMD_BLOCK_STATUS` command,
-  where *offset* and *length* indicate the area of interest. The
-  server MUST then respond with the requested information, for all
+  where *offset* and *length* indicate the area of interest.
+- The server MUST then respond with the requested information, for all
   contexts which were selected during negotiation. For every metadata
-  context, the server sends one set of extent chunks, where the sizes
-  of the extents MUST be less than or equal to the length as specified
-  in the request. Each extent comes with a *flags* field, the
-  semantics of which are defined by the metadata context.
-- A server MUST reply to `NBD_CMD_BLOCK_STATUS` with a structured
-  reply of type `NBD_REPLY_TYPE_BLOCK_STATUS`.
+  context, the server sends one set of extent chunks, using
+  `NBD_REPLY_TYPE_BLOCK_STATUS` or `NBD_REPLY_TYPE_BLOCK_STATUS_EXT`
+  (the latter is only possible if the client also negotiated
+  `NBD_OPT_EXTENDED_HEADERS`).  Each extent comes with a *flags*
+  field, the semantics of which are defined by the metadata context.
+
+The client's requested *size* is only a hint to the server, so the
+summed size of extents in the server's reply may be shorter, or in
+some cases longer, than the original request, and may even differ
+between contexts when multiple metadata contexts were negotiated.

 A client MUST NOT use `NBD_CMD_BLOCK_STATUS` unless it selected a
 nonzero number of metadata contexts during negotiation, and used the
@@ -1179,10 +1235,10 @@ of the newstyle negotiation.

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

@@ -1460,6 +1516,26 @@ of the newstyle negotiation.
     option does not select any metadata context, provided the client
     then does not attempt to issue `NBD_CMD_BLOCK_STATUS` commands.

+* `NBD_OPT_EXTENDED_HEADERS` (11)
+
+    The client wishes to use extended headers during the transmission
+    phase.  The client MUST NOT send any additional data with the
+    option, and the server SHOULD reject a request that includes data
+    with `NBD_REP_ERR_INVALID`.
+
+    The server replies with the following, or with an error permitted
+    elsewhere in this document:
+
+    - `NBD_REP_ACK`: Extended headers have been negotiated; the client
+      MUST use the 32-byte extended request header, and the server
+      MUST use the 32-byte extended reply header.
+    - For backwards compatibility, clients SHOULD be prepared to also
+      handle `NBD_REP_ERR_UNSUP`; in this case, only the compact
+      transmission headers will be used.
+
+    If the client requests `NBD_OPT_STARTTLS` after this option, it
+    MUST renegotiate extended headers.
+
 #### Option reply types

 These values are used in the "reply type" field, sent by the server
@@ -1713,12 +1789,12 @@ unrecognized flags.

 #### Structured reply types

-These values are used in the "type" field of a structured reply.
-Some chunk types can additionally be categorized by role, such as
-*error chunks* or *content chunks*.  Each type determines how to
-interpret the "length" bytes of payload.  If the client receives
-an unknown or unexpected type, other than an *error chunk*, it
-MUST initiate a hard disconnect.
+These values are used in the "type" field of a structured reply.  Some
+chunk types can additionally be categorized by role, such as *error
+chunks*, *content chunks*, or *status chunks*.  Each type determines
+how to interpret the "length" bytes of payload.  If the client
+receives an unknown or unexpected type, other than an *error chunk*,
+it MUST initiate a hard disconnect.

 * `NBD_REPLY_TYPE_NONE` (0)

@@ -1761,13 +1837,34 @@ MUST initiate a hard disconnect.
   64 bits: offset (unsigned)  
   32 bits: hole size (unsigned, MUST be nonzero)  

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
+  Note that even when extended headers are in use, a server may
+  enforce a maximum block size that is smaller than 32 bits, in which
+  case no valid `NBD_CMD_READ` will have a *length* large enough to
+  require the use of this chunk type.  However, a client using
+  extended headers MUST be prepared for the server to use either the
+  compact or extended chunk type.
+
 * `NBD_REPLY_TYPE_BLOCK_STATUS` (5)

-  *length* MUST be 4 + (a positive integer multiple of 8).  This reply
-  represents a series of consecutive block descriptors where the sum
-  of the length fields within the descriptors is subject to further
-  constraints documented below. This chunk type MUST appear
-  exactly once per metadata ID in a structured reply.
+  This chunk type is in the status chunk category.  *length* MUST be
+  4 + (a positive integer multiple of 8).  This reply represents a
+  series of consecutive block descriptors where the sum of the length
+  fields within the descriptors is subject to further constraints
+  documented below.  Each negotiated metadata ID must have exactly one
+  status chunk in the overall structured reply.

   The payload starts with:

@@ -1796,9 +1893,36 @@ MUST initiate a hard disconnect.
   information to the client, if looking up the information would be
   too resource-intensive for the server, so long as at least one
   extent is returned. Servers should however be aware that most
-  clients implementations will then simply ask for the next extent
+  client implementations will then simply ask for the next extent
   instead.

+* `NBD_REPLY_TYPE_BLOCK_STATUS_EXT` (6)
+
+  This chunk type is in the status chunk category.  *length* MUST be
+  4 + (a positive multiple of 16).  The semantics of this chunk mirror
+  those of `NBD_REPLY_TYPE_BLOCK_STATUS`, other than the use of a
+  larger *extent length* field, as well as added padding to ease
+  alignment.  This chunk type MUST NOT be used unless extended headers
+  were negotiated with `NBD_OPT_EXTENDED_HEADERS`.
+
+  The payload starts with:
+
+  32 bits, metadata context ID  
+
+  and is followed by a list of one or more descriptors, each with this
+  layout:
+
+  64 bits, length of the extent to which the status below
+     applies (unsigned, MUST be nonzero)  
+  32 bits, status flags  
+  32 bits, padding (MUST be zero)  
+
+  Note that even when extended headers are in use, the client MUST be
+  prepared for the server to use either the compact or extended chunk
+  type, regardless of whether the client's hinted length was more or
+  less than 32 bits, but the server MUST use exactly one of the two
+  chunk types per negotiated metacontext ID.
+
 All error chunk types have bit 15 set, and begin with the same
 *error*, *message length*, and optional *message* fields as
 `NBD_REPLY_TYPE_ERROR`.  If nonzero, *message length* indicates
@@ -1812,7 +1936,10 @@ remaining structured fields at the end.
   be at least 6.  This chunk represents that an error occurred,
   and the client MAY NOT make any assumptions about partial
   success. This type SHOULD NOT be used more than once in a
-  structured reply.  Valid as a reply to any request.
+  structured reply.  Valid as a reply to any request.  Note that
+  *message length* MUST NOT exceed the 4096 bytes string length limit,
+  and therefore there is no need for a counterpart extended-length
+  error chunk type.

   The payload is structured as:

@@ -1867,7 +1994,8 @@ The following request types exist:

     If structured replies were not negotiated, then a read request
     MUST always be answered by a simple reply, as documented above
-    (using magic 0x67446698 `NBD_SIMPLE_REPLY_MAGIC`, and containing
+    (using `NBD_SIMPLE_REPLY_MAGIC` or `NBD_SIMPLE_REPLY_EXT_MAGIC`
+    according to whether extended headers are in use, and containing
     length bytes of data according to the client's request).

     If an error occurs, the server SHOULD set the appropriate error code
@@ -1883,7 +2011,8 @@ The following request types exist:

     If structured replies are negotiated, then a read request MUST
     result in a structured reply with one or more chunks (each using
-    magic 0x668e33ef `NBD_STRUCTURED_REPLY_MAGIC`), where the final
+    `NBD_STRUCTURED_REPLY_MAGIC` or `NBD_STRUCTURED_REPLY_EXT_MAGIC`
+    according to whether extended headers are in use), where the final
     chunk has the flag `NBD_REPLY_FLAG_DONE`, and with the following
     additional constraints.

@@ -1897,13 +2026,14 @@ The following request types exist:
     chunks that describe data outside the offset and length of the
     request, but MAY send the content chunks in any order (the client
     MUST reassemble content chunks into the correct order), and MAY
-    send additional content chunks even after reporting an error chunk.
-    Note that a request for more than 2^32 - 8 bytes MUST be split
-    into at least two chunks, so as not to overflow the length field
-    of a reply while still allowing space for the offset of each
-    chunk.  When no error is detected, the server MUST send enough
-    data chunks to cover the entire region described by the offset and
-    length of the client's request.
+    send additional content chunks even after reporting an error
+    chunk.  Note that if extended headers are not in use, a request
+    for more than 2^32 - 8 bytes MUST be split into at least two
+    chunks, so as not to overflow the length field of a reply while
+    still allowing space for the offset of each chunk.  When no error
+    is detected, the server MUST send enough data chunks to cover the
+    entire region described by the offset and length of the client's
+    request.

     To minimize traffic, the server MAY use a content or error chunk
     as the final chunk by setting the `NBD_REPLY_FLAG_DONE` flag, but
@@ -2136,13 +2266,19 @@ The following request types exist:
     server returned at least one metadata context without an error.
     This in turn requires the client to first negotiate structured
     replies. For a successful return, the server MUST use a structured
-    reply, containing exactly one chunk of type
+    reply, containing exactly one status chunk of type
     `NBD_REPLY_TYPE_BLOCK_STATUS` per selected context id, where the
     status field of each descriptor is determined by the flags field
     as defined by the metadata context.  The server MAY send chunks in
     a different order than the context ids were assigned in reply to
     `NBD_OPT_SET_META_CONTEXT`.

+    If extended headers were negotiated via
+    `NBD_OPT_EXTENDED_HEADERS`, the server may use
+    `NBD_REPLY_TYPE_BLOCK_STATUS_EXT` instead of
+    `NBD_REPLY_TYPE_BLOCK_STATUS` as the reply chunk for a metacontext
+    id.
+
     The list of block status descriptors within the
     `NBD_REPLY_TYPE_BLOCK_STATUS` chunk represent consecutive portions
     of the file starting from specified *offset*.  If the client used
-- 
2.33.1


