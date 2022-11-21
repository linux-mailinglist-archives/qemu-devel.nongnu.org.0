Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D0C63294E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 17:22:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox9YS-0006PE-FK; Mon, 21 Nov 2022 11:21:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ox9YO-0006OT-Uj
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:21:52 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ox9YJ-0008K6-H5
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:21:52 -0500
Received: from fraeml738-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4NGCHz4CC5z682wj;
 Tue, 22 Nov 2022 00:18:55 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml738-chm.china.huawei.com (10.206.15.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 21 Nov 2022 17:21:34 +0100
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 21 Nov
 2022 16:21:33 +0000
Date: Mon, 21 Nov 2022 16:21:32 +0000
To: <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>, <linuxarm@huawei.com>,
 David Hildenbrand <david@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Subject: Null dereference in bdrv_unregister_buf() probably
 memory-backend-file related?
Message-ID: <20221121162132.00007540@huawei.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

First CC list is a guess as I haven't managed to root cause where things are
going wrong yet.

Originally hit this whilst rebasing some CXL patches on v7.2.0-rc1.
CXL makes extensive use of memory-backends and most my tests happen
to use memory-backend-file

Issue seen on arm64 and x86 though helpfully on x86 the crash appears in an entirely
unrelated location (though the 'fix' works).

Fairly minimal test command line.

qemu-system-aarch64 \
    -M virt  \
    -drive if=none,file=full.qcow2,format=qcow2,id=hd \
    -device virtio-blk,drive=hd \
    -object memory-backend-file,id=cxl-mem1,mem-path=/tmp/cxltest.raw,size=256M,align=256M \

Powerdown the machine or ctrl-c during boot gives a segfault.
On arm64 it was in a stable location that made at least some sense in that
bs in the below snippet is NULL.

I added the follow work around and the segfault goes away...

 [PATCH] temp

---
 block/io.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/block/io.c b/block/io.c
index b9424024f9..750e1366aa 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3324,6 +3324,9 @@ void bdrv_unregister_buf(BlockDriverState *bs, void *host, size_t size)
 {
     BdrvChild *child;

+    if (!bs) {
+        return;
+    }
     GLOBAL_STATE_CODE();
     if (bs->drv && bs->drv->bdrv_unregister_buf) {
         bs->drv->bdrv_unregister_buf(bs, host, size);
--
2.37.2

Not present on v7.1.0 . I'll start a bisection shortly but may take a while.

