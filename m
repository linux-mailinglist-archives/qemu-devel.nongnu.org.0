Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCE6426E69
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 18:10:12 +0200 (CEST)
Received: from localhost ([::1]:46718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYsRn-0004XP-3R
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 12:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mYsQe-0003jB-4c; Fri, 08 Oct 2021 12:09:00 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:58425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mYsQa-00018h-KX; Fri, 08 Oct 2021 12:08:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=vBNlGsFfxAMJasg2xaw1tA/8bhJQ/QzW2d99MEym6Yw=; b=J6Dye207QzdnzHGb80gpquxM+g
 YNm21tu55kfqWAeZkja5VkX2vlxQiDNhBqg2bT9E/hKCRCYmAnIyDDRaKWn9+ZwHQHJN84dTjGJBz
 8edMpy8vjdglhX3/POvdpu3HqDNe9ThosrKg7crSI3ifodtp9n22oMbwz23+qdnonv69p2IIt10L2
 WGKXJc1xBODjHv/2OIOFT9hNJ779VdwpurPuO08uYgT19x6HXcy63ubEYIhdz5u+ewPHXg3N6m/D1
 d8/ssbt80fmWQWY0Wxv5QZ/6BRo4Sa3gn5GLGkulrIreo6sI3oU6DPrE1RsvLVY9ezvfyaNXxN9DJ
 oLzNU1PWZGFskg89FYDmyJ+gPdEYsDOH+NLuMVTET8F6O7yzQg4hWV0tIshB8ThTbKFeNNAe9mKZs
 zcWL+uFd4FhuxwG2RPaFhdL+HrV/HM+a2RJKgHEz8XwMigThytd5Kz/aBNlv5qxXzetX9IseTxT5l
 sRhFA5tVE7PQx67Hnzwi17PbBSJ8rTuq2Fi2ZWyki5tSKctDM2txfLPIiV1xWDzXKzMpyb3hLLK34
 tyrUTb7w63bb6vBmuYhTGAYVk9mCt/TCFGf5l1LAz8rsiSCLbG+0ruupR/IlRiemdZfqv/IIeUFgQ
 PWmQfbXlI4Wjz9EzYdXUft8vZLKt317tcLO49wGJw=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Amit Shah <amit@kernel.org>,
 David Hildenbrand <david@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, virtio-fs@redhat.com,
 Eric Auger <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 0/3] virtio: increase VIRTQUEUE_MAX_SIZE to 32k
Date: Fri, 08 Oct 2021 18:08:48 +0200
Message-ID: <2657765.azTuxnmmC0@silver>
In-Reply-To: <1853723.Wj769PA2Ue@silver>
References: <cover.1633376313.git.qemu_oss@crudebyte.com>
 <20211008092533.376b568b@bahia.huguette> <1853723.Wj769PA2Ue@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Freitag, 8. Oktober 2021 16:24:42 CEST Christian Schoenebeck wrote:
> On Freitag, 8. Oktober 2021 09:25:33 CEST Greg Kurz wrote:
> > On Thu, 7 Oct 2021 16:42:49 +0100
> > 
> > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > > On Thu, Oct 07, 2021 at 02:51:55PM +0200, Christian Schoenebeck wrote:
> > > > On Donnerstag, 7. Oktober 2021 07:23:59 CEST Stefan Hajnoczi wrote:
> > > > > On Mon, Oct 04, 2021 at 09:38:00PM +0200, Christian Schoenebeck 
wrote:
> > > > > > At the moment the maximum transfer size with virtio is limited to
> > > > > > 4M
> > > > > > (1024 * PAGE_SIZE). This series raises this limit to its maximum
> > > > > > theoretical possible transfer size of 128M (32k pages) according
> > > > > > to
> > > > > > the
> > > > > > virtio specs:
> > > > > > 
> > > > > > https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs
> > > > > > 01
> > > > > > .html#
> > > > > > x1-240006
> > > > > 
> > > > > Hi Christian,
> > 
> > > > > I took a quick look at the code:
> > Hi,
> > 
> > Thanks Stefan for sharing virtio expertise and helping Christian !
> > 
> > > > > - The Linux 9p driver restricts descriptor chains to 128 elements
> > > > > 
> > > > >   (net/9p/trans_virtio.c:VIRTQUEUE_NUM)
> > > > 
> > > > Yes, that's the limitation that I am about to remove (WIP); current
> > > > kernel
> > > > patches:
> > > > https://lore.kernel.org/netdev/cover.1632327421.git.linux_oss@crudebyt
> > > > e.
> > > > com/>
> > > 
> > > I haven't read the patches yet but I'm concerned that today the driver
> > > is pretty well-behaved and this new patch series introduces a spec
> > > violation. Not fixing existing spec violations is okay, but adding new
> > > ones is a red flag. I think we need to figure out a clean solution.
> 
> Nobody has reviewed the kernel patches yet. My main concern therefore
> actually is that the kernel patches are already too complex, because the
> current situation is that only Dominique is handling 9p patches on kernel
> side, and he barely has time for 9p anymore.
> 
> Another reason for me to catch up on reading current kernel code and
> stepping in as reviewer of 9p on kernel side ASAP, independent of this
> issue.
> 
> As for current kernel patches' complexity: I can certainly drop patch 7
> entirely as it is probably just overkill. Patch 4 is then the biggest chunk,
> I have to see if I can simplify it, and whether it would make sense to
> squash with patch 3.
> 
> > > > > - The QEMU 9pfs code passes iovecs directly to preadv(2) and will
> > > > > fail
> > > > > 
> > > > >   with EINVAL when called with more than IOV_MAX iovecs
> > > > >   (hw/9pfs/9p.c:v9fs_read())
> > > > 
> > > > Hmm, which makes me wonder why I never encountered this error during
> > > > testing.
> > > > 
> > > > Most people will use the 9p qemu 'local' fs driver backend in
> > > > practice,
> > > > so
> > > > that v9fs_read() call would translate for most people to this
> > > > implementation on QEMU side (hw/9p/9p-local.c):
> > > > 
> > > > static ssize_t local_preadv(FsContext *ctx, V9fsFidOpenState *fs,
> > > > 
> > > >                             const struct iovec *iov,
> > > >                             int iovcnt, off_t offset)
> > > > 
> > > > {
> > > > #ifdef CONFIG_PREADV
> > > > 
> > > >     return preadv(fs->fd, iov, iovcnt, offset);
> > > > 
> > > > #else
> > > > 
> > > >     int err = lseek(fs->fd, offset, SEEK_SET);
> > > >     if (err == -1) {
> > > >     
> > > >         return err;
> > > >     
> > > >     } else {
> > > >     
> > > >         return readv(fs->fd, iov, iovcnt);
> > > >     
> > > >     }
> > > > 
> > > > #endif
> > > > }
> > > > 
> > > > > Unless I misunderstood the code, neither side can take advantage of
> > > > > the
> > > > > new 32k descriptor chain limit?
> > > > > 
> > > > > Thanks,
> > > > > Stefan
> > > > 
> > > > I need to check that when I have some more time. One possible
> > > > explanation
> > > > might be that preadv() already has this wrapped into a loop in its
> > > > implementation to circumvent a limit like IOV_MAX. It might be another
> > > > "it
> > > > works, but not portable" issue, but not sure.
> > > > 
> > > > There are still a bunch of other issues I have to resolve. If you look
> > > > at
> > > > net/9p/client.c on kernel side, you'll notice that it basically does
> > > > this ATM> >
> > > > 
> > > >     kmalloc(msize);
> > 
> > Note that this is done twice : once for the T message (client request) and
> > once for the R message (server answer). The 9p driver could adjust the
> > size
> > of the T message to what's really needed instead of allocating the full
> > msize. R message size is not known though.
> 
> Would it make sense adding a second virtio ring, dedicated to server
> responses to solve this? IIRC 9p server already calculates appropriate
> exact sizes for each response type. So server could just push space that's
> really needed for its responses.
> 
> > > > for every 9p request. So not only does it allocate much more memory
> > > > for
> > > > every request than actually required (i.e. say 9pfs was mounted with
> > > > msize=8M, then a 9p request that actually would just need 1k would
> > > > nevertheless allocate 8M), but also it allocates > PAGE_SIZE, which
> > > > obviously may fail at any time.>
> > > 
> > > The PAGE_SIZE limitation sounds like a kmalloc() vs vmalloc() situation.
> 
> Hu, I didn't even consider vmalloc(). I just tried the kvmalloc() wrapper as
> a quick & dirty test, but it crashed in the same way as kmalloc() with
> large msize values immediately on mounting:
> 
> diff --git a/net/9p/client.c b/net/9p/client.c
> index a75034fa249b..cfe300a4b6ca 100644
> --- a/net/9p/client.c
> +++ b/net/9p/client.c
> @@ -227,15 +227,18 @@ static int parse_opts(char *opts, struct p9_client
> *clnt)
>  static int p9_fcall_init(struct p9_client *c, struct p9_fcall *fc,
>                          int alloc_msize)
>  {
> -       if (likely(c->fcall_cache) && alloc_msize == c->msize) {
> +       //if (likely(c->fcall_cache) && alloc_msize == c->msize) {
> +       if (false) {
>                 fc->sdata = kmem_cache_alloc(c->fcall_cache, GFP_NOFS);
>                 fc->cache = c->fcall_cache;
>         } else {
> -               fc->sdata = kmalloc(alloc_msize, GFP_NOFS);
> +               fc->sdata = kvmalloc(alloc_msize, GFP_NOFS);

Ok, GFP_NOFS -> GFP_KERNEL did the trick.

Now I get:

   virtio: bogus descriptor or out of resources

So, still some work ahead on both ends.

>                 fc->cache = NULL;
>         }
> -       if (!fc->sdata)
> +       if (!fc->sdata) {
> +               pr_info("%s !fc->sdata", __func__);
>                 return -ENOMEM;
> +       }
>         fc->capacity = alloc_msize;
>         return 0;
>  }
> 
> I try to look at this at the weekend, I would have expected this hack to
> bypass this issue.
> 
> > > I saw zerocopy code in the 9p guest driver but didn't investigate when
> > > it's used. Maybe that should be used for large requests (file
> > > reads/writes)?
> > 
> > This is the case already : zero-copy is only used for reads/writes/readdir
> > if the requested size is 1k or more.
> > 
> > Also you'll note that in this case, the 9p driver doesn't allocate msize
> > for the T/R messages but only 4k, which is largely enough to hold the
> > header.
> > 
> > 	/*
> > 	
> > 	 * We allocate a inline protocol data of only 4k bytes.
> > 	 * The actual content is passed in zero-copy fashion.
> > 	 */
> > 	
> > 	req = p9_client_prepare_req(c, type, P9_ZC_HDR_SZ, fmt, ap);
> > 
> > and
> > 
> > /* size of header for zero copy read/write */
> > #define P9_ZC_HDR_SZ 4096
> > 
> > A huge msize only makes sense for Twrite, Rread and Rreaddir because
> > of the amount of data they convey. All other messages certainly fit
> > in a couple of kilobytes only (sorry, don't remember the numbers).
> > 
> > A first change should be to allocate MIN(XXX, msize) for the
> > regular non-zc case, where XXX could be a reasonable fixed
> > value (8k?). In the case of T messages, it is even possible
> > to adjust the size to what's exactly needed, ala snprintf(NULL).
> 
> Good idea actually! That would limit this problem to reviewing the 9p specs
> and picking one reasonable max value. Because you are right, those message
> types are tiny. Probably not worth to pile up new code to calculate exact
> message sizes for each one of them.
> 
> Adding some safety net would make sense though, to force e.g. if a new
> message type is added in future, that this value would be reviewed as well,
> something like:
> 
> static int max_msg_size(int msg_type) {
>     switch (msg_type) {
>         /* large zero copy messages */
>         case Twrite:
>         case Tread:
>         case Treaddir:
>             BUG_ON(true);
> 
>         /* small messages */
>         case Tversion:
>         ....
>             return 8k; /* to be replaced with appropriate max value */
>     }
> }
> 
> That way the compiler would bark on future additions. But on doubt, a simple
> comment on msg type enum might do as well though.
> 
> > > virtio-blk/scsi don't memcpy data into a new buffer, they
> > > directly access page cache or O_DIRECT pinned pages.
> > > 
> > > Stefan
> > 
> > Cheers,
> > 
> > --
> > Greg



