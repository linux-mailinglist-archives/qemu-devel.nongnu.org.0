Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC3F4D0DBD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 02:55:14 +0100 (CET)
Received: from localhost ([::1]:37942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRP48-0006VH-GY
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 20:55:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nROu6-0000Cy-RB
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:44:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nROu4-0006PS-9J
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:44:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646703883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WraX/OGMNVmbZY1nV3i3/BhswvgcPXKieI3gWq4dCcQ=;
 b=HJOxFhwDIKhwL89TyVpjhyVey4+CrHBhyvGmgxwQIa+giuOBpSxtYIqNC1BEvHStHUFfeK
 fuA2S5gu2ix2NxAQASVI2PFi1lhuN4mLYtdjZMIpEM08WUG6QNDdqe/TzMvLdHmBBs1jzq
 M7VV2X4H34SgDkzMlvHYhG4wDAcEkYw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-Ah7QmAR3N7CxrbjS1rj-WA-1; Mon, 07 Mar 2022 20:44:40 -0500
X-MC-Unique: Ah7QmAR3N7CxrbjS1rj-WA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 475F9801AFC;
 Tue,  8 Mar 2022 01:44:39 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B519D5E480;
 Tue,  8 Mar 2022 01:44:38 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/15] nbd/server: Minor cleanups
Date: Mon,  7 Mar 2022 19:44:17 -0600
Message-Id: <20220308014419.3056549-14-eblake@redhat.com>
In-Reply-To: <20220308014419.3056549-1-eblake@redhat.com>
References: <20220308014419.3056549-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Spelling fixes, grammar improvements and consistent spacing, noticed
while preparing other patches in this file.

Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20211203231539.3900865-2-eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 nbd/server.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 9fb2f264023e..ba6f71e15d49 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2084,11 +2084,10 @@ static void nbd_extent_array_convert_to_be(NBDExtentArray *ea)
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
@@ -2287,7 +2286,7 @@ static int nbd_co_receive_request(NBDRequestData *req, NBDRequest *request,
     assert(client->recv_coroutine == qemu_coroutine_self());
     ret = nbd_receive_request(client, request, errp);
     if (ret < 0) {
-        return  ret;
+        return ret;
     }

     trace_nbd_co_receive_request_decode_type(request->handle, request->type,
@@ -2647,7 +2646,7 @@ static coroutine_fn void nbd_trip(void *opaque)
     }

     if (ret < 0) {
-        /* It wans't -EIO, so, according to nbd_co_receive_request()
+        /* It wasn't -EIO, so, according to nbd_co_receive_request()
          * semantics, we should return the error to the client. */
         Error *export_err = local_err;

-- 
2.35.1


