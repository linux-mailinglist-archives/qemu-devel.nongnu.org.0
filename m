Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA25398AFF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:48:22 +0200 (CEST)
Received: from localhost ([::1]:43192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loREL-00037W-OT
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRBz-0008Mo-Pd
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:45:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRBw-00071L-4q
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:45:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622641551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MgFnAmrETwJamIS0R7FX5BEeNaWuQse4e92a2iXdJRE=;
 b=DhVavhEYqyyZ3v3ssloK/QbBpjWLD6mShHCikwKq/N/48Dt+wr1kUwFm2c6HJk0cRXluQJ
 TX+MH20C+GcOxju8qfV2ft88dm797ZLE/OiPTXnNopAhaJvhzN+I1NY6ZQ0MUrqJo295uX
 4eptqO63LQ+fF8WWox88YJchCPqDZbo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-XNoPrqZaNeO5pYAVCC3Xnw-1; Wed, 02 Jun 2021 09:45:49 -0400
X-MC-Unique: XNoPrqZaNeO5pYAVCC3Xnw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E51011085929;
 Wed,  2 Jun 2021 13:45:39 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE54419814;
 Wed,  2 Jun 2021 13:45:38 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/20] block/vvfat: fix vvfat_child_perm crash
Date: Wed,  2 Jun 2021 15:45:13 +0200
Message-Id: <20210602134529.231756-5-kwolf@redhat.com>
In-Reply-To: <20210602134529.231756-1-kwolf@redhat.com>
References: <20210602134529.231756-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

It's wrong to rely on s->qcow in vvfat_child_perm, as on permission
update during bdrv_open_child() call this field is not set yet.

Still prior to aa5a04c7db27eea6b36de32f241b155f0d9ce34d, it didn't
crash, as bdrv_open_child passed NULL as child to bdrv_child_perm(),
and NULL was equal to NULL in assertion (still, it was bad guarantee
for child being s->qcow, not backing :).

Since aa5a04c7db27eea6b36de32f241b155f0d9ce34d
"add bdrv_attach_child_noperm" bdrv_refresh_perms called on parent node
when attaching child, and new correct child pointer is passed to
.bdrv_child_perm. Still, s->qcow is NULL at the moment. Let's rely only
on role instead.

Without that fix,
./build/qemu-system-x86_64 -usb -device usb-storage,drive=fat16 \
    -drive \
    file=fat:rw:fat-type=16:"<path of a host folder>",id=fat16,format=raw,if=none

crashes:
(gdb) bt
0  raise () at /lib64/libc.so.6
1  abort () at /lib64/libc.so.6
2  _nl_load_domain.cold () at /lib64/libc.so.6
3  annobin_assert.c_end () at /lib64/libc.so.6
4  vvfat_child_perm (bs=0x559186f3d690, c=0x559186f1ed20, role=3,
                     reopen_queue=0x0, perm=0, shared=31,
                     nperm=0x7ffe56f28298, nshared=0x7ffe56f282a0) at
    ../block/vvfat.c:3214
5  bdrv_child_perm (bs=0x559186f3d690, child_bs=0x559186f60190,
                    c=0x559186f1ed20, role=3, reopen_queue=0x0,
                    parent_perm=0, parent_shared=31,
                    nperm=0x7ffe56f28298, nshared=0x7ffe56f282a0)
    at ../block.c:2094
6  bdrv_node_refresh_perm (bs=0x559186f3d690, q=0x0,
                           tran=0x559186f65850, errp=0x7ffe56f28530) at
    ../block.c:2336
7  bdrv_list_refresh_perms (list=0x559186db5b90 = {...}, q=0x0,
                            tran=0x559186f65850, errp=0x7ffe56f28530)
    at ../block.c:2358
8  bdrv_refresh_perms (bs=0x559186f3d690, errp=0x7ffe56f28530) at
    ../block.c:2419
9  bdrv_attach_child
    (parent_bs=0x559186f3d690, child_bs=0x559186f60190,
     child_name=0x559184d83e3d "write-target",
     child_class=0x5591852f3b00 <child_vvfat_qcow>, child_role=3,
     errp=0x7ffe56f28530) at ../block.c:2959
10 bdrv_open_child
    (filename=0x559186f5cb80 "/var/tmp/vl.7WYmFU",
     options=0x559186f66c20, bdref_key=0x559184d83e3d "write-target",
     parent=0x559186f3d690, child_class=0x5591852f3b00
     <child_vvfat_qcow>, child_role=3, allow_none=false,
     errp=0x7ffe56f28530) at ../block.c:3351
11 enable_write_target (bs=0x559186f3d690, errp=0x7ffe56f28530) at
    ../block/vvfat.c:3177
12 vvfat_open (bs=0x559186f3d690, options=0x559186f42db0, flags=155650,
               errp=0x7ffe56f28530) at ../block/vvfat.c:1236
13 bdrv_open_driver (bs=0x559186f3d690, drv=0x5591853d97e0
                     <bdrv_vvfat>, node_name=0x0,
                     options=0x559186f42db0, open_flags=155650,
                     errp=0x7ffe56f28640) at ../block.c:1557
14 bdrv_open_common (bs=0x559186f3d690, file=0x0,
                     options=0x559186f42db0, errp=0x7ffe56f28640) at
    ../block.c:1833
...

(gdb) fr 4
 #4  vvfat_child_perm (bs=0x559186f3d690, c=0x559186f1ed20, role=3,
                      reopen_queue=0x0, perm=0, shared=31,
                      nperm=0x7ffe56f28298, nshared=0x7ffe56f282a0) at
    ../block/vvfat.c:3214
3214        assert(c == s->qcow || (role & BDRV_CHILD_COW));
(gdb) p role
 $1 = 3   # BDRV_CHILD_DATA | BDRV_CHILD_METADATA
(gdb) p *c
 $2 = {bs = 0x559186f60190, name = 0x559186f669d0 "write-target", klass
     = 0x5591852f3b00 <child_vvfat_qcow>, role = 3, opaque =
         0x559186f3d690, perm = 3, shared_perm = 4, frozen = false,
         parent_quiesce_counter = 0, next = {le_next = 0x0, le_prev =
             0x559186f41818}, next_parent = {le_next = 0x0, le_prev =
                 0x559186f64320}}
(gdb) p s->qcow
 $3 = (BdrvChild *) 0x0

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210524101257.119377-3-vsementsov@virtuozzo.com>
Tested-by: John Arbuckle <programmingkidx@gmail.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vvfat.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index 07232a7cfc..86d99c899c 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3209,15 +3209,12 @@ static void vvfat_child_perm(BlockDriverState *bs, BdrvChild *c,
                              uint64_t perm, uint64_t shared,
                              uint64_t *nperm, uint64_t *nshared)
 {
-    BDRVVVFATState *s = bs->opaque;
-
-    assert(c == s->qcow || (role & BDRV_CHILD_COW));
-
-    if (c == s->qcow) {
+    if (role & BDRV_CHILD_DATA) {
         /* This is a private node, nobody should try to attach to it */
         *nperm = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE;
         *nshared = BLK_PERM_WRITE_UNCHANGED;
     } else {
+        assert(role & BDRV_CHILD_COW);
         /* The backing file is there so 'commit' can use it. vvfat doesn't
          * access it in any way. */
         *nperm = 0;
-- 
2.30.2


