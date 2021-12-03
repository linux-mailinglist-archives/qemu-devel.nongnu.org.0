Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66173468056
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:26:01 +0100 (CET)
Received: from localhost ([::1]:43408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtHwG-0000G1-GZ
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:26:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHnH-0007vG-89
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:16:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHnE-0003Bt-R7
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:16:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638573400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tY7h3+bq2nYHgwaUd6pL1PiQc9UJocScO6g1ctQu6O4=;
 b=HbBgA151DSYyVdGxJYXPu3kMjpMctIK61PcxmDDnZdRyRjeaQ1tpoOwExYqPcWgRCBO2+Z
 ZTcpTHnWBLGvuuYzM+s0bBxHpZ965CxKij8SI8gMTOS7+L34SG81sVwHyi6Au3KImUSr6X
 UmtZ9G3W3oshn+opMayPQN0/cEhmHT8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-105-DjEC12nGOGqBolIv-x8Tmg-1; Fri, 03 Dec 2021 18:16:37 -0500
X-MC-Unique: DjEC12nGOGqBolIv-x8Tmg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F1A5102C886;
 Fri,  3 Dec 2021 23:16:36 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BD5C5D9D5;
 Fri,  3 Dec 2021 23:16:35 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/14] do not apply: nbd/server: Send 64-bit hole chunk
Date: Fri,  3 Dec 2021 17:15:39 -0600
Message-Id: <20211203231539.3900865-15-eblake@redhat.com>
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
Cc: nsoffer@redhat.com, vsementsov@virtuozzo.com, libguestfs@redhat.com,
 qemu-block@nongnu.org, nbd@other.debian.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we cap NBD_CMD_READ requests to 32M, we never have a reason to
send a 64-bit chunk type for a hole; but it is worth producing these
for interoperability testing of clients that want extended headers.
---
 nbd/server.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 7e6140350797..4369a9a8ff08 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2071,19 +2071,29 @@ static int coroutine_fn nbd_co_send_sparse_read(NBDClient *client,
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

             trace_nbd_co_send_structured_read_hole(handle, offset + progress,
                                                    pnum);
             set_be_chunk(client, &iov[0],
                          final ? NBD_REPLY_FLAG_DONE : 0,
-                         NBD_REPLY_TYPE_OFFSET_HOLE,
+                         client->extended_headers ? NBD_REPLY_TYPE_OFFSET_HOLE_EXT
+                         : NBD_REPLY_TYPE_OFFSET_HOLE,
                          handle, iov[1].iov_len);
-            stq_be_p(&chunk.offset, offset + progress);
-            stl_be_p(&chunk.length, pnum);
+            if (client->extended_headers) {
+                stq_be_p(&chunk_ext.offset, offset + progress);
+                stq_be_p(&chunk_ext.length, pnum);
+            } else {
+                stq_be_p(&chunk.offset, offset + progress);
+                stl_be_p(&chunk.length, pnum);
+            }
             ret = nbd_co_send_iov(client, iov, 2, errp);
         } else {
             ret = blk_pread(exp->common.blk, offset + progress,
-- 
2.33.1


