Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD95628E0D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:13:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouie0-00026u-SC; Mon, 14 Nov 2022 18:13:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidn-0001hU-Ud
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiJF-00034i-OW
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:52:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KDtXC+vARe66jRIcdES2jWaXwJ20uxlRPIx8ZWr1N8M=;
 b=F2SnMrJSkJMpqMWEzfDZmEhNnF6GLxOtdsLr3Q+EW3AIm1boZivATCpGavuupj6+vXydee
 BXRB/IUZPhlCaArebofEqYeMbhvtE9+lOIMo9HtyhKyuza5hycIqWoxIzlm4oy8tpoEv9d
 vweROzqS8IglJN4aR9407Tx9mrtAozw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-q_XoddxBOPalLCO1acSQvw-1; Mon, 14 Nov 2022 17:52:05 -0500
X-MC-Unique: q_XoddxBOPalLCO1acSQvw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63D4C101CC6B;
 Mon, 14 Nov 2022 22:52:05 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0050940E9786;
 Mon, 14 Nov 2022 22:52:04 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 06/23] states: Break deadlock if server goofs on
 extended replies
Date: Mon, 14 Nov 2022 16:51:41 -0600
Message-Id: <20221114225158.2186742-7-eblake@redhat.com>
In-Reply-To: <20221114225158.2186742-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114225158.2186742-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

One of the benefits of extended replies is that we can do a
fixed-length read for the entire header of every server reply, which
is fewer syscalls than the split-read approach required by structured
replies.  But one of the drawbacks of doing a large read is that if
the server is non-compliant (not a problem for normal servers, but
something I hit rather more than I'd like to admit while developing
extended header support in servers), nbd_pwrite() and friends will
deadlock if the server replies with the wrong header.  Add in some
code to catch that failure mode and move the state machine to DEAD
sooner, to make it easier to diagnose the fault in the server.

Unlike in the case of an unexpected simply reply from a structured
server (where we never over-read, and can therefore commit b31e7bac
can merely fail the command with EPROTO and successfully move on to
the next server reply), in this case we really do have to move to
DEAD: in addition to having already read the 16 or 20 bytes that the
server sent in its (short) reply for this command, we may have already
read the initial bytes of the server's next reply, but we have no way
to push those extra bytes back onto our read stream for parsing on our
next pass through the state machine.
---
 generator/states-reply.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/generator/states-reply.c b/generator/states-reply.c
index dde23b39..e89e9019 100644
--- a/generator/states-reply.c
+++ b/generator/states-reply.c
@@ -109,7 +109,23 @@  REPLY.START:
  REPLY.RECV_REPLY:
   switch (recv_into_rbuf (h)) {
   case -1: SET_NEXT_STATE (%.DEAD); return 0;
-  case 1: SET_NEXT_STATE (%.READY); return 0;
+  case 1: SET_NEXT_STATE (%.READY);
+    /* Special case: if we have a short read, but got at least far
+     * enough to decode the magic number, we can check if the server
+     * is matching our expectations. This lets us avoid deadlocking if
+     * a buggy server sends only 16 bytes of a simple reply, and is
+     * waiting for our next command, while we are blocked waiting for
+     * the server to send 32 bytes of an extended reply.
+     */
+    if (h->extended_headers &&
+        (char *) h->rbuf >= (char *) &h->sbuf.reply.hdr.extended.flags) {
+      uint32_t magic = be32toh (h->sbuf.reply.hdr.extended.magic);
+      if (magic != NBD_EXTENDED_REPLY_MAGIC) {
+        SET_NEXT_STATE (%.DEAD); /* We've probably lost synchronization. */
+        set_error (0, "invalid or unexpected reply magic 0x%" PRIx32, magic);
+      }
+    }
+    return 0;
   case 0: SET_NEXT_STATE (%CHECK_SIMPLE_OR_STRUCTURED_REPLY);
   }
   return 0;
-- 
2.38.1


