Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF5942537D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 14:53:22 +0200 (CEST)
Received: from localhost ([::1]:55464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYStl-0001oV-1B
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 08:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mYSsa-0000ND-S3; Thu, 07 Oct 2021 08:52:09 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:43005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mYSsY-0000BT-Iu; Thu, 07 Oct 2021 08:52:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=2c6CeQRCKMhgBVE9BGVHMVfDNDbbu3ZbfUEEaVFdDz8=; b=BP+MLJdZNqyFKNyN2x8NuREFjg
 L/qHlbvWM9g7SQPongjonazZxWe0+dJ2uA4hd32wfXP5PTOXYZFMSnlXIHwQkkL+c6h6ekFdSWfm4
 Arv1OCjvwHZ3LH33iTNyicYIgRjV9LxeqmnjrSw0ETvDsRQvBfbCUTpDywnbc2vV8Ag+zeDl7AhMr
 aUrM+LLLGebiockQIT/infQ5Ci13tOPielBq+Ah8+pVf5SY/8Xx35+h7YwEGydilRFOmKzT669Ujd
 pV5TwZbiH4fGgOm4gFD5oQ7Z5bPNvjlKOzjq3LWlp6utyenqARlBqYaTUPTovDa3f01XcvuXjSLNu
 fuSMWfP0f5LEAI0270kNz3zshbTHarlZJ4CLMgzZPruknMKRQSgR8lvI89tmwTYKOADf53VUbKOiR
 31IZmjr1oNpJ6veGA2NQPDKhQ24+Ib2H9WaXTEOtHYiinzxkeNKnSTLNX/s+8pp4zMkuZnDF/VPNt
 5757jYP2lKuHyaUrPH3eSg0lDzlbw+VmocI/t6y4YVYDP8h7i9Dg1ecj6W4T3H1hZxteZCEB19G2H
 khqAlkSdDHmROYY/W3lZbU+aH4nxXXK1wgBvkYrzhgYX/nknYJjz+7+ujjCuiEjnxDU/6f+mnRKP0
 lfWUXsOXXBgVx6zHx2GwfahRXMwP5fovNXkiXGyz4=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Amit Shah <amit@kernel.org>, David Hildenbrand <david@redhat.com>,
 Greg Kurz <groug@kaod.org>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 virtio-fs@redhat.com, Eric Auger <eric.auger@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 0/3] virtio: increase VIRTQUEUE_MAX_SIZE to 32k
Date: Thu, 07 Oct 2021 14:51:55 +0200
Message-ID: <2233456.PtHKNz60go@silver>
In-Reply-To: <YV6EbwMFmcIEC+za@stefanha-x1.localdomain>
References: <cover.1633376313.git.qemu_oss@crudebyte.com>
 <YV6EbwMFmcIEC+za@stefanha-x1.localdomain>
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

On Donnerstag, 7. Oktober 2021 07:23:59 CEST Stefan Hajnoczi wrote:
> On Mon, Oct 04, 2021 at 09:38:00PM +0200, Christian Schoenebeck wrote:
> > At the moment the maximum transfer size with virtio is limited to 4M
> > (1024 * PAGE_SIZE). This series raises this limit to its maximum
> > theoretical possible transfer size of 128M (32k pages) according to the
> > virtio specs:
> > 
> > https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#
> > x1-240006
> Hi Christian,
> I took a quick look at the code:
> 
> - The Linux 9p driver restricts descriptor chains to 128 elements
>   (net/9p/trans_virtio.c:VIRTQUEUE_NUM)

Yes, that's the limitation that I am about to remove (WIP); current kernel 
patches:
https://lore.kernel.org/netdev/cover.1632327421.git.linux_oss@crudebyte.com/

> - The QEMU 9pfs code passes iovecs directly to preadv(2) and will fail
>   with EINVAL when called with more than IOV_MAX iovecs
>   (hw/9pfs/9p.c:v9fs_read())

Hmm, which makes me wonder why I never encountered this error during testing.

Most people will use the 9p qemu 'local' fs driver backend in practice, so 
that v9fs_read() call would translate for most people to this implementation 
on QEMU side (hw/9p/9p-local.c):

static ssize_t local_preadv(FsContext *ctx, V9fsFidOpenState *fs,
                            const struct iovec *iov,
                            int iovcnt, off_t offset)
{
#ifdef CONFIG_PREADV
    return preadv(fs->fd, iov, iovcnt, offset);
#else
    int err = lseek(fs->fd, offset, SEEK_SET);
    if (err == -1) {
        return err;
    } else {
        return readv(fs->fd, iov, iovcnt);
    }
#endif
}

> Unless I misunderstood the code, neither side can take advantage of the
> new 32k descriptor chain limit?
> 
> Thanks,
> Stefan

I need to check that when I have some more time. One possible explanation 
might be that preadv() already has this wrapped into a loop in its 
implementation to circumvent a limit like IOV_MAX. It might be another "it 
works, but not portable" issue, but not sure.

There are still a bunch of other issues I have to resolve. If you look at
net/9p/client.c on kernel side, you'll notice that it basically does this ATM

    kmalloc(msize);

for every 9p request. So not only does it allocate much more memory for every 
request than actually required (i.e. say 9pfs was mounted with msize=8M, then 
a 9p request that actually would just need 1k would nevertheless allocate 8M), 
but also it allocates > PAGE_SIZE, which obviously may fail at any time.

With those kernel patches above and QEMU being patched with these series as 
well, I can go above 4M msize now, and the test system runs stable if 9pfs was 
mounted with an msize not being "too high". If I try to mount 9pfs with msize 
being very high, the upper described kmalloc() issue would kick in and cause 
an immediate kernel oops when mounting. So that's a high priority issue that I 
still need to resolve.

Best regards,
Christian Schoenebeck



