Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E682468053
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:24:02 +0100 (CET)
Received: from localhost ([::1]:35910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtHuL-0003WV-G2
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:24:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHmi-0007J2-Bk
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:16:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHme-00034h-BD
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:16:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638573363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ReflyIVyVVxgUfE8lnp73Rx1x6HoY9UGsRIRe/TvEe4=;
 b=iLS5hZipxBiwYtwKSwaImNwXuP8Mv6+DlK+3kpkYiZSyNbM9wYzldsgiIeY0uQOMJkI9gA
 hhEUKPj77dFt16OeZorP5XGdLcjgT8R5aHclAfTcqZes7Gor2QnBdmc4x5nBwlEkDQ+U92
 XaYedIxBQlZkUM900ndtEXRNYVkdwKw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-kMdgzBqtP7SN3waLOsfHhA-1; Fri, 03 Dec 2021 18:16:00 -0500
X-MC-Unique: kMdgzBqtP7SN3waLOsfHhA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AABB100CCC6;
 Fri,  3 Dec 2021 23:15:59 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60D205D9D5;
 Fri,  3 Dec 2021 23:15:58 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/14] qemu-io: Allow larger write zeroes under no fallback
Date: Fri,  3 Dec 2021 17:15:28 -0600
Message-Id: <20211203231539.3900865-4-eblake@redhat.com>
In-Reply-To: <20211203231539.3900865-1-eblake@redhat.com>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231539.3900865-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, nbd@other.debian.org, nsoffer@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When writing zeroes can fall back to a slow write, permitting an
overly large request can become an amplification denial of service
attack in triggering a large amount of work from a small request.  But
the whole point of the no fallback flag is to quickly determine if
writing an entire device to zero can be done quickly (such as when it
is already known that the device started with zero contents); in those
cases, artificially capping things at 2G in qemu-io itself doesn't
help us.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 qemu-io-cmds.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 954955c12fb9..45a957093369 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -603,10 +603,6 @@ static int do_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
         .done   = false,
     };

-    if (bytes > INT_MAX) {
-        return -ERANGE;
-    }
-
     co = qemu_coroutine_create(co_pwrite_zeroes_entry, &data);
     bdrv_coroutine_enter(blk_bs(blk), co);
     while (!data.done) {
@@ -1160,8 +1156,9 @@ static int write_f(BlockBackend *blk, int argc, char **argv)
     if (count < 0) {
         print_cvtnum_err(count, argv[optind]);
         return count;
-    } else if (count > BDRV_REQUEST_MAX_BYTES) {
-        printf("length cannot exceed %" PRIu64 ", given %s\n",
+    } else if (count > BDRV_REQUEST_MAX_BYTES &&
+               !(flags & BDRV_REQ_NO_FALLBACK)) {
+        printf("length cannot exceed %" PRIu64 " without -n, given %s\n",
                (uint64_t)BDRV_REQUEST_MAX_BYTES, argv[optind]);
         return -EINVAL;
     }
-- 
2.33.1


