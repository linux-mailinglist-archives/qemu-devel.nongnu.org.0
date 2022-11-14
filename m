Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BA4628E5A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:30:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouie3-0002CA-7M; Mon, 14 Nov 2022 18:13:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidr-0001df-6E
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiGM-0002QB-Kx
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:49:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CHsBQkgh32mZYDlsY0mZ2u45YAKMiJgOqFfn5u30FUM=;
 b=eflHQfT6fgXpf9vgPxWhOSlcUIKdvxYwaL75zSzK4Rg5rXXbh/b08rOoIMk2S/zMR1DiGp
 RvPQxRvTHqzFSIgz0kGCuQcIRPsBU8HniwIDWM3X8chyDGIggJpcbLsEf8MgJZS/PUHvMV
 Mmquj8sxsFxLNNok/Zobfo1wBrO1HcQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-Y1SxJHrLPdCwHXu-gqXVEA-1; Mon, 14 Nov 2022 17:49:06 -0500
X-MC-Unique: Y1SxJHrLPdCwHXu-gqXVEA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47AFC101E989;
 Mon, 14 Nov 2022 22:49:06 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3AAE40E42E3;
 Mon, 14 Nov 2022 22:49:05 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, libguestfs@redhat.com, nbd@other.debian.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v2 15/15] RFC: nbd/server: Send 64-bit hole chunk
Date: Mon, 14 Nov 2022 16:48:48 -0600
Message-Id: <20221114224848.2186298-16-eblake@redhat.com>
In-Reply-To: <20221114224848.2186298-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224848.2186298-1-eblake@redhat.com>
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

Since we cap NBD_CMD_READ requests to 32M, we never have a reason to
send a 64-bit chunk type for a hole; but it is worth producing these
for interoperability testing of clients that want extended headers.
---
 nbd/server.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index cd280f1721..04cb172f97 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2112,9 +2112,13 @@ static int coroutine_fn nbd_co_send_sparse_read(NBDClient *client,
         if (status & BDRV_BLOCK_ZERO) {
             NBDReply hdr;
             NBDStructuredReadHole chunk;
+            NBDStructuredReadHoleExt chunk_ext;
             struct iovec iov[] = {
                 {.iov_base = &hdr},
-                {.iov_base = &chunk, .iov_len = sizeof(chunk)},
+                {.iov_base = client->extended_headers ? &chunk_ext
+                 : (void *) &chunk,
+                 .iov_len = client->extended_headers ? sizeof(chunk_ext)
+                 : sizeof(chunk)},
             };

             trace_nbd_co_send_structured_read_hole(request->handle,
@@ -2122,9 +2126,17 @@ static int coroutine_fn nbd_co_send_sparse_read(NBDClient *client,
                                                    pnum);
             set_be_chunk(client, &iov[0],
                          final ? NBD_REPLY_FLAG_DONE : 0,
-                         NBD_REPLY_TYPE_OFFSET_HOLE, request, iov[1].iov_len);
-            stq_be_p(&chunk.offset, offset + progress);
-            stl_be_p(&chunk.length, pnum);
+                         client->extended_headers
+                         ? NBD_REPLY_TYPE_OFFSET_HOLE_EXT
+                         : NBD_REPLY_TYPE_OFFSET_HOLE,
+                         request, iov[1].iov_len);
+            if (client->extended_headers) {
+                stq_be_p(&chunk_ext.offset, offset + progress);
+                stq_be_p(&chunk_ext.length, pnum);
+            } else {
+                stq_be_p(&chunk.offset, offset + progress);
+                stl_be_p(&chunk.length, pnum);
+            }
             ret = nbd_co_send_iov(client, iov, 2, errp);
         } else {
             ret = blk_pread(exp->common.blk, offset + progress, pnum,
-- 
2.38.1


