Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF0C4225A9
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 13:48:53 +0200 (CEST)
Received: from localhost ([::1]:58878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXiwG-0000ZA-DU
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 07:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mXir3-0006Rg-V1; Tue, 05 Oct 2021 07:43:31 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:35293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mXiqu-00043k-V9; Tue, 05 Oct 2021 07:43:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=raFlPqOXr5gfQYPl4l0uonFA7Ywzt3rKj6cQmkfyCPw=; b=C6vOI2e9AOmtRvBfdiXKhKevgG
 urC1mBIvP2ydKKQjySWrE2n+usxXILQv/PHe9XvhAYUVV7B9fATRZ0Rl8RLVs3PZAya89zRZOvwUA
 L7XdCOWWolKPS3xrgJcSy1HPi5wY8CgMxUh7lq0moMQq0AnpMxbd/GFBT5hE8Frs21g2hd3TnSgCE
 VJ6ins0RiBZNzTkfUVxM1DPq7YD6v21q417A/lwwl5g0EVLjL7A31driKMRnvxDXv1SeCaLtBTHxF
 ixrt2cFMsmDARBEbFIEL8UUHXnLdxO/Eedrmn7fpgz0yvZYQmsQCPlVXui4VA3qh02osPirWqTXZC
 AVewYvn/SKuftbaVrJwRUsUfXLjJuMDbDf+8j609fvb0xZIBXEUGdBXqleoGyqGTlopAAoX58Y/Kr
 tXcR1ObcHoPwGuLau9TjwHQ2ZK9B0Xc3BX59/5R5H2k8Uy/j7sty2kQqq9+SYLPwRAGFcZTLpaBm4
 NSi/i1pFjynrjUJOk+7A6Lnk7uh2Dr3FILSq2y5C9vBPQYxb7EyAxGjtI5tL1NDTc6lErHfNX/nRb
 0GDIQacEEwdmjMFHU1nbrkx1iDNOX+9y5I1oRzSzsQPiJ1SEGYFN7Xxv/PIXNb2l9YiILn+ixBSPk
 HQn3SvBT3eAf9vwllyflO5DSWzAR26TuDY84n3LHM=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Amit Shah <amit@kernel.org>, Greg Kurz <groug@kaod.org>, virtio-fs@redhat.com,
 Eric Auger <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 0/3] virtio: increase VIRTQUEUE_MAX_SIZE to 32k
Date: Tue, 05 Oct 2021 13:43:14 +0200
Message-ID: <1754360.17xrOKl2ua@silver>
In-Reply-To: <20211005071300-mutt-send-email-mst@kernel.org>
References: <cover.1633376313.git.qemu_oss@crudebyte.com>
 <3198289.vhBqKWSW6W@silver> <20211005071300-mutt-send-email-mst@kernel.org>
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

On Dienstag, 5. Oktober 2021 13:19:43 CEST Michael S. Tsirkin wrote:
> On Tue, Oct 05, 2021 at 01:10:56PM +0200, Christian Schoenebeck wrote:
> > On Dienstag, 5. Oktober 2021 09:38:53 CEST David Hildenbrand wrote:
> > > On 04.10.21 21:38, Christian Schoenebeck wrote:
> > > > At the moment the maximum transfer size with virtio is limited to 4M
> > > > (1024 * PAGE_SIZE). This series raises this limit to its maximum
> > > > theoretical possible transfer size of 128M (32k pages) according to
> > > > the
> > > > virtio specs:
> > > > 
> > > > https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.h
> > > > tml#
> > > > x1-240006
> > > 
> > > I'm missing the "why do we care". Can you comment on that?
> > 
> > Primary motivation is the possibility of improved performance, e.g. in
> > case of 9pfs, people can raise the maximum transfer size with the Linux
> > 9p client's 'msize' option on guest side (and only on guest side
> > actually). If guest performs large chunk I/O, e.g. consider something
> > "useful" like this one on> 
> > guest side:
> >   time cat large_file_on_9pfs.dat > /dev/null
> > 
> > Then there is a noticable performance increase with higher transfer size
> > values. That performance gain is continuous with rising transfer size
> > values, but the performance increase obviously shrinks with rising
> > transfer sizes as well, as with similar concepts in general like cache
> > sizes, etc.
> > 
> > Then a secondary motivation is described in reason (2) of patch 2: if the
> > transfer size is configurable on guest side (like it is the case with the
> > 9pfs 'msize' option), then there is the unpleasant side effect that the
> > current virtio limit of 4M is invisible to guest; as this value of 4M is
> > simply an arbitrarily limit set on QEMU side in the past (probably just
> > implementation motivated on QEMU side at that point), i.e. it is not a
> > limit specified by the virtio protocol,
> 
> According to the spec it's specified, sure enough: vq size limits the
> size of indirect descriptors too.

In the virtio specs the only hard limit that I see is the aforementioned 32k:

"Queue Size corresponds to the maximum number of buffers in the virtqueue. 
Queue Size value is always a power of 2. The maximum Queue Size value is 
32768. This value is specified in a bus-specific way."

> However, ever since commit 44ed8089e991a60d614abe0ee4b9057a28b364e4 we
> do not enforce it in the driver ...

Then there is the current queue size (that you probably mean) which is 
transmitted to guest with whatever virtio was initialized with.

In case of 9p client however the virtio queue size is first initialized with 
some initial hard coded value when the 9p driver is loaded on Linux kernel 
guest side, then when some 9pfs is mounted later on by guest, it may include 
the 'msize' mount option to raise the transfer size, and that's the problem. I 
don't see any way for guest to see that it cannot go above that 4M transfer 
size now.

> > nor is this limit be made aware to guest via virtio protocol
> > at all. The consequence with 9pfs would be if user tries to go higher than
> > 4M,> 
> > then the system would simply hang with this QEMU error:
> >   virtio: too many write descriptors in indirect table
> > 
> > Now whether this is an issue or not for individual virtio users, depends
> > on
> > whether the individual virtio user already had its own limitation <= 4M
> > enforced on its side.
> > 
> > Best regards,
> > Christian Schoenebeck



