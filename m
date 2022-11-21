Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D92D3632B07
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 18:31:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxAbu-0000Rn-D9; Mon, 21 Nov 2022 12:29:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oxAbr-0000RW-Md
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 12:29:31 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oxAbn-0004mn-Vq
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 12:29:31 -0500
Received: from frapeml500002.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4NGDpJ3TQJz67Zjl;
 Tue, 22 Nov 2022 01:26:48 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 frapeml500002.china.huawei.com (7.182.85.205) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 21 Nov 2022 18:29:20 +0100
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 21 Nov
 2022 17:29:20 +0000
Date: Mon, 21 Nov 2022 17:29:19 +0000
To: Stefan Hajnoczi <stefanha@gmail.com>
CC: <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>, <linuxarm@huawei.com>,
 David Hildenbrand <david@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Subject: Re: Null dereference in bdrv_unregister_buf() probably
 memory-backend-file related?
Message-ID: <20221121172919.000039f0@huawei.com>
In-Reply-To: <CAJSP0QVVt9911ZxCq9K5QeOBX2fhKSs372Qzqvg694-QkDnqGQ@mail.gmail.com>
References: <20221121162132.00007540@huawei.com>
 <CAJSP0QVVt9911ZxCq9K5QeOBX2fhKSs372Qzqvg694-QkDnqGQ@mail.gmail.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
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

On Mon, 21 Nov 2022 11:47:48 -0500
Stefan Hajnoczi <stefanha@gmail.com> wrote:

> On Mon, 21 Nov 2022 at 11:22, Jonathan Cameron via
> <qemu-devel@nongnu.org> wrote:
> >
> > First CC list is a guess as I haven't managed to root cause where things are
> > going wrong yet.
> >
> > Originally hit this whilst rebasing some CXL patches on v7.2.0-rc1.
> > CXL makes extensive use of memory-backends and most my tests happen
> > to use memory-backend-file
> >
> > Issue seen on arm64 and x86 though helpfully on x86 the crash appears in an entirely
> > unrelated location (though the 'fix' works).
> >
> > Fairly minimal test command line.
> >
> > qemu-system-aarch64 \
> >     -M virt  \
> >     -drive if=none,file=full.qcow2,format=qcow2,id=hd \
> >     -device virtio-blk,drive=hd \
> >     -object memory-backend-file,id=cxl-mem1,mem-path=/tmp/cxltest.raw,size=256M,align=256M \
> >
> > Powerdown the machine or ctrl-c during boot gives a segfault.
> > On arm64 it was in a stable location that made at least some sense in that
> > bs in the below snippet is NULL.
> >
> > I added the follow work around and the segfault goes away...
> >
> >  [PATCH] temp
> >
> > ---
> >  block/io.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/block/io.c b/block/io.c
> > index b9424024f9..750e1366aa 100644
> > --- a/block/io.c
> > +++ b/block/io.c
> > @@ -3324,6 +3324,9 @@ void bdrv_unregister_buf(BlockDriverState *bs, void *host, size_t size)
> >  {
> >      BdrvChild *child;
> >
> > +    if (!bs) {
> > +        return;
> > +    }
> >      GLOBAL_STATE_CODE();
> >      if (bs->drv && bs->drv->bdrv_unregister_buf) {
> >          bs->drv->bdrv_unregister_buf(bs, host, size);  
> 
> bdrv_*() APIs generally don't accept NULL bs arguments.
> 
> I think blk_unregister_buf() needs to handle the blk_bs() NULL return
> value. Can you confirm that the parent function is
> blk_unregister_buf()?
> 
> This bug may have been introduced by commit baf422684d73 ("virtio-blk:
> use BDRV_REQ_REGISTERED_BUF optimization hint").
Got it in one. I just bisected to exactly that patch

+ using the below change indeed works just as well as the above.
Now I'd send this as a patch, but I don't yet sufficiently understand what that change you
referenced did to break things Seems it registered a notifier that is getting
called for all ram blocks, not just the one virtio-blk ones?

Perhaps better if you send a fix with an explanation :)

Thanks for the quick response and correct identification of the problem.

Jonathan


diff --git a/block/block-backend.c b/block/block-backend.c
index b48c91f4e1..e281569137 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2582,8 +2582,13 @@ bool blk_register_buf(BlockBackend *blk, void *host, size_t size, Error **errp)

 void blk_unregister_buf(BlockBackend *blk, void *host, size_t size)
 {
+    BlockDriverState *bs;
     GLOBAL_STATE_CODE();
-    bdrv_unregister_buf(blk_bs(blk), host, size);
+
+    bs = blk_bs(blk);
+    if (bs) {
+        bdrv_unregister_buf(blk_bs(blk), host, size);
+    }
 }

 int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,

> 
> Stefan


