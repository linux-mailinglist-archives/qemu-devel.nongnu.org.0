Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B3110D1D0
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Nov 2019 08:31:01 +0100 (CET)
Received: from localhost ([::1]:55514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iaajz-0004UR-NP
	for lists+qemu-devel@lfdr.de; Fri, 29 Nov 2019 02:30:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41614)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1iaafN-0002fk-J0
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 02:26:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1iaafI-0003FU-Bv
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 02:26:11 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:53406 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1iaafB-0002Sh-PV; Fri, 29 Nov 2019 02:26:02 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id CF14DE5F7989B9981DAF;
 Fri, 29 Nov 2019 15:25:51 +0800 (CST)
Received: from HGHY2P002143101.china.huawei.com (10.184.39.213) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Fri, 29 Nov 2019 15:25:41 +0800
From: <pannengyuan@huawei.com>
To: <eblake@redhat.com>, <kwolf@redhat.com>, <mreitz@redhat.com>,
 <sgarzare@redhat.com>
Subject: [PATCH V3 2/2] block/nbd: fix memory leak in nbd_open()
Date: Fri, 29 Nov 2019 15:25:26 +0800
Message-ID: <1575012326-51324-2-git-send-email-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.7.2.windows.1
In-Reply-To: <1575012326-51324-1-git-send-email-pannengyuan@huawei.com>
References: <1575012326-51324-1-git-send-email-pannengyuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: liyiting@huawei.com, zhang.zhanghailiang@huawei.com, qemu-block@nongnu.org,
 PanNengyuan <pannengyuan@huawei.com>, qemu-devel@nongnu.org,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: PanNengyuan <pannengyuan@huawei.com>

In currently implementation there will be a memory leak when
nbd_client_connect() returns error status. Here is an easy way to
reproduce:

1. run qemu-iotests as follow and check the result with asan:
    ./check -raw 143

Following is the asan output backtrack:
Direct leak of 40 byte(s) in 1 object(s) allocated from:
    #0 0x7f629688a560 in calloc (/usr/lib64/libasan.so.3+0xc7560)
    #1 0x7f6295e7e015 in g_malloc0  (/usr/lib64/libglib-2.0.so.0+0x50015)
    #2 0x56281dab4642 in qobject_input_start_struct  /mnt/sdb/qemu-4.2.0-rc0/qapi/qobject-input-visitor.c:295
    #3 0x56281dab1a04 in visit_start_struct  /mnt/sdb/qemu-4.2.0-rc0/qapi/qapi-visit-core.c:49
    #4 0x56281dad1827 in visit_type_SocketAddress  qapi/qapi-visit-sockets.c:386
    #5 0x56281da8062f in nbd_config   /mnt/sdb/qemu-4.2.0-rc0/block/nbd.c:1716
    #6 0x56281da8062f in nbd_process_options /mnt/sdb/qemu-4.2.0-rc0/block/nbd.c:1829
    #7 0x56281da8062f in nbd_open /mnt/sdb/qemu-4.2.0-rc0/block/nbd.c:1873

Direct leak of 15 byte(s) in 1 object(s) allocated from:
    #0 0x7f629688a3a0 in malloc (/usr/lib64/libasan.so.3+0xc73a0)
    #1 0x7f6295e7dfbd in g_malloc (/usr/lib64/libglib-2.0.so.0+0x4ffbd)
    #2 0x7f6295e96ace in g_strdup (/usr/lib64/libglib-2.0.so.0+0x68ace)
    #3 0x56281da804ac in nbd_process_options /mnt/sdb/qemu-4.2.0-rc0/block/nbd.c:1834
    #4 0x56281da804ac in nbd_open /mnt/sdb/qemu-4.2.0-rc0/block/nbd.c:1873

Indirect leak of 24 byte(s) in 1 object(s) allocated from:
    #0 0x7f629688a3a0 in malloc (/usr/lib64/libasan.so.3+0xc73a0)
    #1 0x7f6295e7dfbd in g_malloc (/usr/lib64/libglib-2.0.so.0+0x4ffbd)
    #2 0x7f6295e96ace in g_strdup (/usr/lib64/libglib-2.0.so.0+0x68ace)
    #3 0x56281dab41a3 in qobject_input_type_str_keyval /mnt/sdb/qemu-4.2.0-rc0/qapi/qobject-input-visitor.c:536
    #4 0x56281dab2ee9 in visit_type_str /mnt/sdb/qemu-4.2.0-rc0/qapi/qapi-visit-core.c:297
    #5 0x56281dad0fa1 in visit_type_UnixSocketAddress_members qapi/qapi-visit-sockets.c:141
    #6 0x56281dad17b6 in visit_type_SocketAddress_members qapi/qapi-visit-sockets.c:366
    #7 0x56281dad186a in visit_type_SocketAddress qapi/qapi-visit-sockets.c:393
    #8 0x56281da8062f in nbd_config /mnt/sdb/qemu-4.2.0-rc0/block/nbd.c:1716
    #9 0x56281da8062f in nbd_process_options /mnt/sdb/qemu-4.2.0-rc0/block/nbd.c:1829
    #10 0x56281da8062f in nbd_open /mnt/sdb/qemu-4.2.0-rc0/block/nbd.c:1873

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: PanNengyuan <pannengyuan@huawei.com>
---
Changes v2 to v1:
- add a new function to do the common cleanups (suggested by Stefano
  Garzarella).
---
Changes v3 to v2:
- split in two patches(suggested by Stefano Garzarella)
---
 block/nbd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/nbd.c b/block/nbd.c
index 5805979..09d6925 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1889,6 +1889,7 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
 
     ret = nbd_client_connect(bs, errp);
     if (ret < 0) {
+        nbd_free_bdrvstate_prop(s);
         return ret;
     }
     /* successfully connected */
-- 
2.7.2.windows.1



