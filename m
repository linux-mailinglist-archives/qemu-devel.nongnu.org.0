Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB814468046
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:21:28 +0100 (CET)
Received: from localhost ([::1]:56736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtHrr-0006qg-Q2
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:21:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHmY-0007Ec-3q
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:16:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHmW-00033G-NX
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:15:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638573356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XPqO+0QHBfaom4pEhnAk5AqXR/f6poXPR218L1xFEEU=;
 b=AqIs8NfQbe1m5KTCZVU409K5cwv5ckMjWCUJtq3x2d0fIaf6xJiVAsg25HlqpBpdZW1K7b
 7E7hvXeMf270/5yMbfkSpo14456wZxrVl9L/2V9SOY5gTrMMEAF/fx1YrzOWwTAKA9Vhd2
 yptkqTyDqQpgbu7Fiz94UD/DCWPcMdk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-Wu5-ZOztPPmUtYSDDt4rjg-1; Fri, 03 Dec 2021 18:15:53 -0500
X-MC-Unique: Wu5-ZOztPPmUtYSDDt4rjg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0924585EE61;
 Fri,  3 Dec 2021 23:15:52 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 209255D9D5;
 Fri,  3 Dec 2021 23:15:51 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/14] nbd/server: Minor cleanups
Date: Fri,  3 Dec 2021 17:15:26 -0600
Message-Id: <20211203231539.3900865-2-eblake@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: nsoffer@redhat.com, vsementsov@virtuozzo.com, libguestfs@redhat.com,
 qemu-block@nongnu.org, nbd@other.debian.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Spelling fixes, grammar improvements and consistent spacing, noticed
while preparing other patches in this file.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/server.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 4630dd732250..f302e1cbb03e 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2085,11 +2085,10 @@ static void nbd_extent_array_convert_to_be(NBDExtentArray *ea)
  * Add extent to NBDExtentArray. If extent can't be added (no available space),
  * return -1.
  * For safety, when returning -1 for the first time, .can_add is set to false,
- * further call to nbd_extent_array_add() will crash.
- * (to avoid the situation, when after failing to add an extent (returned -1),
- * user miss this failure and add another extent, which is successfully added
- * (array is full, but new extent may be squashed into the last one), then we
- * have invalid array with skipped extent)
+ * and further calls to nbd_extent_array_add() will crash.
+ * (this avoids the situation where a caller ignores failure to add one extent,
+ * where adding another extent that would squash into the last array entry
+ * would result in an incorrect range reported to the client)
  */
 static int nbd_extent_array_add(NBDExtentArray *ea,
                                 uint32_t length, uint32_t flags)
@@ -2288,7 +2287,7 @@ static int nbd_co_receive_request(NBDRequestData *req, NBDRequest *request,
     assert(client->recv_coroutine == qemu_coroutine_self());
     ret = nbd_receive_request(client, request, errp);
     if (ret < 0) {
-        return  ret;
+        return ret;
     }

     trace_nbd_co_receive_request_decode_type(request->handle, request->type,
@@ -2648,7 +2647,7 @@ static coroutine_fn void nbd_trip(void *opaque)
     }

     if (ret < 0) {
-        /* It wans't -EIO, so, according to nbd_co_receive_request()
+        /* It wasn't -EIO, so, according to nbd_co_receive_request()
          * semantics, we should return the error to the client. */
         Error *export_err = local_err;

-- 
2.33.1


