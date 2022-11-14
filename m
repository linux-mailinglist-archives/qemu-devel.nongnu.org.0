Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C69AB628EF6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:13:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouidp-0001lr-2Z; Mon, 14 Nov 2022 18:13:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidl-0001X6-Oh
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiJP-00036i-E0
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:52:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5xwarWq7IS97eQgNFs7g0Lw+/taGHjpDs4Ete5qDg2U=;
 b=QEMnzOSrNnDXTyylgMiWUilA9Tzy1CMsFzogC9U9n2GhlXor0K/yX5/jnn63dv/Zau2HmR
 h1zTYvFmNHRqMxQ/on9ZTAHrAMvlQqua4DAaR885f/9PytYOxEfElRRVFvc/Bkyfd88o+K
 rli9FC3mVWglRgY1FfNVOmQ2Wx2p1L0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-RlTzK5bCNRemScTiMHoUDw-1; Mon, 14 Nov 2022 17:52:11 -0500
X-MC-Unique: RlTzK5bCNRemScTiMHoUDw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1216F857D0E;
 Mon, 14 Nov 2022 22:52:11 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A259940E9786;
 Mon, 14 Nov 2022 22:52:10 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 16/23] examples: Update copy-libev to use 64-bit
 block status
Date: Mon, 14 Nov 2022 16:51:51 -0600
Message-Id: <20221114225158.2186742-17-eblake@redhat.com>
In-Reply-To: <20221114225158.2186742-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114225158.2186742-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Although our use of "base:allocation" doesn't require the use of the
64-bit API for flags, we might perform slightly faster for a server
that does give us 64-bit extent lengths and honors larger nbd_zero
lengths.
---
 examples/copy-libev.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/examples/copy-libev.c b/examples/copy-libev.c
index 418d99f1..d8b45d87 100644
--- a/examples/copy-libev.c
+++ b/examples/copy-libev.c
@@ -94,7 +94,7 @@ struct request {
 };

 struct extent {
-    uint32_t length;
+    uint64_t length;
     bool zero;
 };

@@ -182,7 +182,7 @@ get_events(struct connection *c)

 static int
 extent_callback (void *user_data, const char *metacontext, uint64_t offset,
-                 uint32_t *entries, size_t nr_entries, int *error)
+                 nbd_extent *entries, size_t nr_entries, int *error)
 {
     struct request *r = user_data;

@@ -197,22 +197,21 @@ extent_callback (void *user_data, const char *metacontext, uint64_t offset,
         return 1;
     }

-    /* Libnbd returns uint32_t pair (length, flags) for each extent. */
-    extents_len = nr_entries / 2;
+    extents_len = nr_entries;

     extents = malloc (extents_len * sizeof *extents);
     if (extents == NULL)
         FAIL ("Cannot allocated extents: %s", strerror (errno));

     /* Copy libnbd entries to extents array. */
-    for (int i = 0, j = 0; i < extents_len; i++, j=i*2) {
-        extents[i].length = entries[j];
+    for (int i = 0; i < extents_len; i++) {
+        extents[i].length = entries[i].length;

         /* Libnbd exposes both ZERO and HOLE flags. We care only about
          * ZERO status, meaning we can copy this extent using efficinet
          * zero method.
          */
-        extents[i].zero = (entries[j + 1] & LIBNBD_STATE_ZERO) != 0;
+        extents[i].zero = (entries[i].flags & LIBNBD_STATE_ZERO) != 0;
     }

     DEBUG ("r%zu: received %zu extents for %s",
@@ -284,10 +283,10 @@ start_extents (struct request *r)
     DEBUG ("r%zu: start extents offset=%" PRIi64 " count=%zu",
            r->index, offset, count);

-    cookie = nbd_aio_block_status (
+    cookie = nbd_aio_block_status_64 (
         src.nbd, count, offset,
-        (nbd_extent_callback) { .callback=extent_callback,
-                                .user_data=r },
+        (nbd_extent64_callback) { .callback=extent_callback,
+                                  .user_data=r },
         (nbd_completion_callback) { .callback=extents_completed,
                                     .user_data=r },
         0);
@@ -322,7 +321,7 @@ next_extent (struct request *r)
         limit = MIN (REQUEST_SIZE, size - offset);

     while (length < limit) {
-        DEBUG ("e%zu: offset=%" PRIi64 " len=%" PRIu32 " zero=%d",
+        DEBUG ("e%zu: offset=%" PRIi64 " len=%" PRIu64 " zero=%d",
                extents_pos, offset, extents[extents_pos].length, is_zero);

         /* If this extent is too large, steal some data from it to
-- 
2.38.1


