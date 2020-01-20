Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B01142C0C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 14:26:41 +0100 (CET)
Received: from localhost ([::1]:36366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itX4h-0000H0-Pt
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 08:26:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32872)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1itX3D-0007cJ-1T
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 08:25:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1itX38-0007KC-3R
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 08:25:06 -0500
Received: from 5.mo177.mail-out.ovh.net ([46.105.39.154]:48218)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1itX37-0007IH-3t
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 08:25:01 -0500
Received: from player159.ha.ovh.net (unknown [10.109.146.211])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 0026D11CF67
 for <qemu-devel@nongnu.org>; Mon, 20 Jan 2020 14:24:55 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player159.ha.ovh.net (Postfix) with ESMTPSA id ECBBDE64CDB1;
 Mon, 20 Jan 2020 13:24:47 +0000 (UTC)
Date: Mon, 20 Jan 2020 14:24:45 +0100
From: Greg Kurz <groug@kaod.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 1/2] virtio-9p-device: fix memleak in
 virtio_9p_device_unrealize
Message-ID: <20200120142445.534bfe7a@bahia.lan>
In-Reply-To: <20200117084322-mutt-send-email-mst@kernel.org>
References: <20200117060927.51996-1-pannengyuan@huawei.com>
 <20200117060927.51996-2-pannengyuan@huawei.com>
 <7781044.dIsAdKOGtE@silver>
 <20200117084322-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 12260768511563897305
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudehgdeflecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrudehledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.39.154
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
Cc: pannengyuan@huawei.com, zhang.zhanghailiang@huawei.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 17 Jan 2020 08:43:42 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Fri, Jan 17, 2020 at 01:52:53PM +0100, Christian Schoenebeck wrote:
> > On Freitag, 17. Januar 2020 07:09:26 CET pannengyuan@huawei.com wrote:
> > > From: Pan Nengyuan <pannengyuan@huawei.com>
> > > 
> > > v->vq forgot to cleanup in virtio_9p_device_unrealize, the memory leak
> > > stack is as follow:
> > > 
> > > Direct leak of 14336 byte(s) in 2 object(s) allocated from:
> > >   #0 0x7f819ae43970 (/lib64/libasan.so.5+0xef970)  ??:?
> > >   #1 0x7f819872f49d (/lib64/libglib-2.0.so.0+0x5249d)  ??:?
> > >   #2 0x55a3a58da624 (./x86_64-softmmu/qemu-system-x86_64+0x2c14624) 
> > > /mnt/sdb/qemu/hw/virtio/virtio.c:2327 #3 0x55a3a571bac7
> > > (./x86_64-softmmu/qemu-system-x86_64+0x2a55ac7) 
> > > /mnt/sdb/qemu/hw/9pfs/virtio-9p-device.c:209 #4 0x55a3a58e7bc6
> > > (./x86_64-softmmu/qemu-system-x86_64+0x2c21bc6) 
> > > /mnt/sdb/qemu/hw/virtio/virtio.c:3504 #5 0x55a3a5ebfb37
> > > (./x86_64-softmmu/qemu-system-x86_64+0x31f9b37) 
> > > /mnt/sdb/qemu/hw/core/qdev.c:876
> > > 
> > > Reported-by: Euler Robot <euler.robot@huawei.com>
> > > Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> > 
> > Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > 
> > Maybe you could add this patch to your revised PR Greg?
> 
> I'm testing all the related virtio changes and they will be
> in my next PR.
> 

Thanks Michael.

You can add this tag for the whole series:

Acked-by: Greg Kurz <groug@kaod.org>

> > > ---
> > > Changes V2 to V1:
> > > - use old function virtio_del_queue to make it easier for stable branch
> > > to merge (suggested by Christian Schoenebeck)
> > > ---
> > >  hw/9pfs/virtio-9p-device.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
> > > index b5a7c03f26..910dc5045e 100644
> > > --- a/hw/9pfs/virtio-9p-device.c
> > > +++ b/hw/9pfs/virtio-9p-device.c
> > > @@ -215,6 +215,7 @@ static void virtio_9p_device_unrealize(DeviceState *dev,
> > > Error **errp) V9fsVirtioState *v = VIRTIO_9P(dev);
> > >      V9fsState *s = &v->state;
> > > 
> > > +    virtio_del_queue(vdev, 0);
> > >      virtio_cleanup(vdev);
> > >      v9fs_device_unrealize_common(s, errp);
> > >  }
> > 
> > 
> > 
> 


