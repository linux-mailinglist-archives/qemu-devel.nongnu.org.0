Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E4530CF67
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 23:54:01 +0100 (CET)
Received: from localhost ([::1]:37082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74Ya-0000TE-8z
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 17:54:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74R3-0007mt-T5
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:46:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74Qm-00062d-2t
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:46:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612305954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wCLzipQ2csPhjricVn4dyJBTpw3iZe7fRskG249I++I=;
 b=XO6XRJQpMo+LdyQjGgeAGvMh3dIunBW2pBT12o2B9SyQq4/NmfSbxTbMkmrxueMe0TvkBN
 URIQ7PbdKc46jP9y+zBd4eXNtpnXHLkkrzYiMCzmJlz6tQxqekvEoL+/spBkGb+u6JtHdK
 RXoVlEQro0az/0OfPe3FMw1S7UmmxP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-SIE7-E7VNTGJCkyxWb6GfA-1; Tue, 02 Feb 2021 17:45:50 -0500
X-MC-Unique: SIE7-E7VNTGJCkyxWb6GfA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 481C11846092;
 Tue,  2 Feb 2021 22:45:46 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C57B10016F9;
 Tue,  2 Feb 2021 22:45:45 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/20] block/io: support int64_t bytes in bdrv_aligned_preadv()
Date: Tue,  2 Feb 2021 16:45:23 -0600
Message-Id: <20210202224529.642055-15-eblake@redhat.com>
In-Reply-To: <20210202224529.642055-1-eblake@redhat.com>
References: <20210202224529.642055-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block I/O path" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are generally moving to int64_t for both offset and bytes parameters
on all io paths.

Main motivation is realization of 64-bit write_zeroes operation for
fast zeroing large disk chunks, up to the whole disk.

We chose signed type, to be consistent with off_t (which is signed) and
with possibility for signed return type (where negative value means
error).

So, prepare bdrv_aligned_preadv() now.

Make the bytes variable in bdrv_padding_rmw_read() int64_t, as it is
only used for pass-through to bdrv_aligned_preadv().

All bdrv_aligned_preadv() callers are safe as type is widening. Let's
look inside:

 - add a new-style assertion that request is good.
 - callees bdrv_is_allocated(), bdrv_co_do_copy_on_readv() supports
   int64_t bytes
 - conversion of bytes_remaining is OK, as we never have requests
   overflowing BDRV_MAX_LENGTH
 - looping through bytes_remaining is ok, num is updated to int64_t
   - for bdrv_driver_preadv we have same limit of max_transfer
   - qemu_iovec_memset is OK, as bytes+qiov_offset should not overflow
     qiov->size anyway (thanks to bdrv_check_qiov_request())

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201211183934.169161-14-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[eblake: grammar tweak]
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/io.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/block/io.c b/block/io.c
index 63b0fa0e9ed7..cef284e3a189 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1475,15 +1475,16 @@ err:
  * reads; any other features must be implemented by the caller.
  */
 static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
-    BdrvTrackedRequest *req, int64_t offset, unsigned int bytes,
+    BdrvTrackedRequest *req, int64_t offset, int64_t bytes,
     int64_t align, QEMUIOVector *qiov, size_t qiov_offset, int flags)
 {
     BlockDriverState *bs = child->bs;
     int64_t total_bytes, max_bytes;
     int ret = 0;
-    uint64_t bytes_remaining = bytes;
+    int64_t bytes_remaining = bytes;
     int max_transfer;

+    bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, &error_abort);
     assert(is_power_of_2(align));
     assert((offset & (align - 1)) == 0);
     assert((bytes & (align - 1)) == 0);
@@ -1545,7 +1546,7 @@ static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
     }

     while (bytes_remaining) {
-        int num;
+        int64_t num;

         if (max_bytes) {
             num = MIN(bytes_remaining, MIN(max_bytes, max_transfer));
@@ -1652,7 +1653,7 @@ static int bdrv_padding_rmw_read(BdrvChild *child,
     assert(req->serialising && pad->buf);

     if (pad->head || pad->merge_reads) {
-        uint64_t bytes = pad->merge_reads ? pad->buf_len : align;
+        int64_t bytes = pad->merge_reads ? pad->buf_len : align;

         qemu_iovec_init_buf(&local_qiov, pad->buf, bytes);

-- 
2.30.0


