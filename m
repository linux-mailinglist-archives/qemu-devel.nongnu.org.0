Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B372628EE7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:08:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouieY-0003tg-HA; Mon, 14 Nov 2022 18:14:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidu-0001m0-1t
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiEL-0002CM-Ea
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:47:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uuaSAbLULdKS6n+Mze1ExTD67+B/CL/4oJ/FeniV1kM=;
 b=TzpYaCRBnu7b9EHLY5wjcyRqXPDOq4glz4MTf23dEXCv4a9YXyN8bpzzJtqZL3+pnLuzqO
 YpiH2s2FNbZHtr+hCKdsM2XaK7hAk3F6drGFdvu8ipVjB136q61G2k9/LfhPeNYzQrgWBc
 7y//cytOcMqR0TeOLNmkRaV8kgaNJ7s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-dgxc94uaPS2864B-M07Ixw-1; Mon, 14 Nov 2022 17:47:01 -0500
X-MC-Unique: dgxc94uaPS2864B-M07Ixw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23FBD811E84;
 Mon, 14 Nov 2022 22:47:01 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1DA12024CC0;
 Mon, 14 Nov 2022 22:47:00 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	libguestfs@redhat.com
Subject: [PATCH v2 4/6] spec: Allow 64-bit block status results
Date: Mon, 14 Nov 2022 16:46:53 -0600
Message-Id: <20221114224655.2186173-5-eblake@redhat.com>
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

There are some potential extension metadata contexts that would
benefit from a 64-bit status value.  For example, Zoned Block Devices
(see https://zonedstorage.io/docs/linux/zbd-api) may want to return
the relative offset of where the next write will occur within the
zone, where a zone may be larger than 4G; creating a metacontext
"zbd:offset" that returns a 64-bit offset seems nicer than creating
two metacontexts "zbd:offset_lo" and "zbd:offset_hi" that each return
only 32 bits of the answer.

While the addition of extended headers superficially justified leaving
room in NBD_REPLY_TYPE_BLOCK_STATUS_EXT for the purpose of alignment,
it also has the nice benefit of being useful to allow extension
metadata contexts that can actually take advantage of the padding (and
remembering that since network byte order is big-endian, the padding
is in the correct location).  To ensure maximum backwards
compatibility, require that all contexts in the "base:" namespace (so
far, just "base:allocation") will only utilize 32-bit status.
---
 doc/proto.md | 62 +++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 49 insertions(+), 13 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index fde1e70..14af48d 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -987,7 +987,10 @@ The procedure works as follows:
   during transmission, the client MUST select one or more metadata
   contexts with the `NBD_OPT_SET_META_CONTEXT` command. If needed, the
   client can use `NBD_OPT_LIST_META_CONTEXT` to list contexts that the
-  server supports.
+  server supports.  Most metadata contexts expose no more than 32 bits
+  of information, but some metadata contexts have associated data that
+  is 64 bits in length; using such contexts requires the client to
+  first negotiate extended headers with `NBD_OPT_EXTENDED_HEADERS`.
 - During transmission, a client can then indicate interest in metadata
   for a given region by way of the `NBD_CMD_BLOCK_STATUS` command,
   where *offset* and *length* indicate the area of interest. On
@@ -1045,7 +1048,7 @@ third-party namespaces are currently registered:
 Save in respect of the `base:` namespace described below, this specification
 requires no specific semantics of metadata contexts, except that all the
 information they provide MUST be representable within the flags field as
-defined for `NBD_REPLY_TYPE_BLOCK_STATUS`. Likewise, save in respect of
+defined for `NBD_REPLY_TYPE_BLOCK_STATUS_EXT`. Likewise, save in respect of
 the `base:` namespace, the syntax of query strings is not specified by this
 document, other than the recommendation that the empty leaf-name makes
 sense as a wildcard for a client query during `NBD_OPT_LIST_META_CONTEXT`,
@@ -1112,7 +1115,9 @@ should make no assumption as to its contents or stability.

 For the `base:allocation` context, the remainder of the flags field is
 reserved. Servers SHOULD set it to all-zero; clients MUST ignore
-unknown flags.
+unknown flags.  Because fewer than 32 flags are defined, this metadata
+context does not require the use of `NBD_OPT_EXTENDED_HEADERS`, and a
+server can use `NBD_REPLY_TYPE_BLOCK_STATUS` to return results.

 ## Values

@@ -1480,6 +1485,18 @@ of the newstyle negotiation.
     to do so, a server MAY send `NBD_REP_ERR_INVALID` or
     `NBD_REP_ERR_EXT_HEADER_REQD`.

+    A server MAY support extension contexts that produce status values
+    that require more than 32 bits.  The server MAY advertise such
+    contexts even if the client has not yet negotiated extended
+    headers, although it SHOULD then conclude the overall response
+    with the `NBD_REP_ERR_EXT_HEADER_REQD` error to inform the client
+    that extended headers are required to make full use of all
+    contexts advertised.  However, since none of the contexts defined
+    in the "base:" namespace provide more than 32 bits of status, a
+    server MUST NOT use this failure mode when the response is limited
+    to the "base:" namespace; nor may the server use this failure mode
+    when the client has already negotiated extended headers.
+
     Data:
     - 32 bits, length of export name.  
     - String, name of export for which we wish to list metadata
@@ -1565,6 +1582,13 @@ of the newstyle negotiation.
     to do so, a server SHOULD send `NBD_REP_ERR_INVALID` or
     `NBD_REP_ERR_EXT_HEADER_REQD`.

+    If a client requests a metadata context that utilizes 64-bit
+    status, but has not yet negotiated extended headers, the server
+    MUST either omit that context from its successful reply, or else
+    fail the request with `NBD_REP_ERR_EXT_HEADER_REQD`.  The server
+    MUST NOT use this failure for a client request that is limited to
+    contexts in the "base:" namespace.
+
     A client MUST NOT send `NBD_CMD_BLOCK_STATUS` unless within the
     negotiation phase it sent `NBD_OPT_SET_META_CONTEXT` at least
     once, and where the final time it was sent, it referred to the
@@ -2028,16 +2052,23 @@ size.
   extent information at the first offset not covered by a
   reduced-length reply.

+  For an extension metadata context that documents that the status
+  value may potentially occupy 64 bits, a server MUST NOT use this
+  reply type unless the most-significant 32 bits of all *status*
+  values included in this reply are all zeroes.  Note that if the
+  client did not negotiate extended headers, then the server already
+  guaranteed during the handshake phase that no metadata contexts
+  utilizing a 64-bit status value were negotiated.
+
 * `NBD_REPLY_TYPE_BLOCK_STATUS_EXT` (6)

   This chunk type is in the status chunk category.  *length* MUST be
   8 + (a positive multiple of 16).  The semantics of this chunk mirror
   those of `NBD_REPLY_TYPE_BLOCK_STATUS`, other than the use of a
-  larger *extent length* field, added padding in each descriptor to
-  ease alignment, and the addition of a *descriptor count* field that
-  can be used for easier client processing.  This chunk type MUST NOT
-  be used unless extended headers were negotiated with
-  `NBD_OPT_EXTENDED_HEADERS`.
+  larger *extent length* field and a 64-bit *status* field, and the
+  addition of a *descriptor count* field that can be used for easier
+  client processing.  This chunk type MUST NOT be used unless extended
+  headers were negotiated with `NBD_OPT_EXTENDED_HEADERS`.

   If the *descriptor count* field contains 0, the number of subsequent
   descriptors is determined solely by the *length* field of the reply
@@ -2056,14 +2087,19 @@ size.

   64 bits, length of the extent to which the status below
      applies (unsigned, MUST be nonzero)  
-  32 bits, padding (MUST be zero)  
-  32 bits, status flags  
+  64 bits, status flags  

   Note that even when extended headers are in use, the client MUST be
   prepared for the server to use either the compact or extended chunk
-  type, regardless of whether the client's hinted effect length was
-  more or less than 32 bits; but the server MUST use exactly one of
-  the two chunk types per negotiated metacontext ID.
+  type for metadata contexts, regardless of whether the client's
+  hinted effect length was more or less than 32 bits; but the server
+  MUST use exactly one of the two chunk types per negotiated
+  metacontext ID.  However, the server MUST use the extended chunk
+  type when responding to an extension metadata context that utilizes
+  a 64-bit status code where the resulting *status* value is not
+  representable in 32 bits.  For metadata contexts that only return a
+  32-bit status (including all contexts in the "base:" namespace), the
+  most-significant 32 bits of *status* MUST be all zeroes.

 All error chunk types have bit 15 set, and begin with the same
 *error*, *message length*, and optional *message* fields as
-- 
2.38.1


