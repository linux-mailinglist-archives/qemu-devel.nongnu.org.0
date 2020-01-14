Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B304C13AC1B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 15:19:10 +0100 (CET)
Received: from localhost ([::1]:40636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irN2D-0006cf-A3
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 09:19:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56464)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qemu_oss@crudebyte.com>) id 1irN0K-00058z-Oz
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 09:17:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <qemu_oss@crudebyte.com>) id 1irN0F-0002sI-LZ
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 09:17:12 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:47587)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <qemu_oss@crudebyte.com>)
 id 1irN0F-0002rY-6E
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 09:17:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=C4MdNkE6Zbqsy+jF90heUr29aiC53aN04wAUL8Gimxo=; b=wOwFlxO4yGF7guTCacnRV4XhCU
 S1y9gdlxZWqRmNHzhMJ/QxqLSXlT+aWGhnWkj4dfpOOqUm1XQYTsYXUjxvUiu4G1tYGo7y666eGmU
 FjrnjV1ncpNOfTaope2/5A1Jdfhi3buhqOTyCWv8QLfHBn411FFV8OUDOzJho/sWDv5l5+aoBEQPz
 yfA6XdGweNXFJzTDN9hkdLm1FWchapo6hPDtWKdva4RgvDCMxjnZseo9C08u75D5k74n93m4/t/iu
 I93Mk1V38U58QrSGGMwf5ENRCDpDX/Qzhfxoz/aza2oSeKK5RM1JWc4rY8TA2Ci4jE17gZ0C/4Z1y
 F+je6p4MG7sPEamZk94IgqAUPNupFMiEYEtgtOcw1GAgv701I3GeUdS74cr0+PG1vXWJzZBUZrfCO
 CqtVDeWjJS0xSe5VnS77GZRRvtpBBlj15XC+RCXA6ei+C7qj/GSLIfSz6V05dE1iL60MAMuzM1xgc
 DRVXa66+VMQCseTM/WeT6IERh05rcoMhaYJW+6ZvDdQDPFBkmfB1kgy4EddHWjzPvY6ituXrGaMaZ
 b0GIzjFidK2OZZnaCYgWyhEZiUhfTIcFVpjcqVW9tPk8162EHaZKvqh8EdvB5ZeCehZ5iFWa0NG3/
 avcNGotObvEni7rUE7Og2WT+wIgcGHUJVNhX7c8+Y=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, pannengyuan@huawei.com,
 mst@redhat.com, groug@kaod.org, Euler Robot <euler.robot@huawei.com>,
 zhang.zhanghailiang@huawei.com
Subject: Re: [PATCH] virtio-9p-device: fix memleak in
 virtio_9p_device_unrealize
Date: Tue, 14 Jan 2020 15:17:01 +0100
Message-ID: <1721395.PxUUFA46pP@silver>
In-Reply-To: <56394079.B7N9aGhjP3@silver>
References: <20200114074020.54696-1-pannengyuan@huawei.com>
 <56394079.B7N9aGhjP3@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.189.157.229
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

On Dienstag, 14. Januar 2020 11:08:59 CET Christian Schoenebeck wrote:
> On Dienstag, 14. Januar 2020 08:40:20 CET pannengyuan@huawei.com wrote:
> > From: Pan Nengyuan <pannengyuan@huawei.com>
> > 
> > v->vq forgot to cleanup in virtio_9p_device_unrealize, the memory leak
> > stack is as follow:
> > 
> > Direct leak of 14336 byte(s) in 2 object(s) allocated from:
> >   #0 0x7f819ae43970 (/lib64/libasan.so.5+0xef970)  ??:?
> >   #1 0x7f819872f49d (/lib64/libglib-2.0.so.0+0x5249d)  ??:?
> >   #2 0x55a3a58da624 (./x86_64-softmmu/qemu-system-x86_64+0x2c14624)
> > 
> > /mnt/sdb/qemu/hw/virtio/virtio.c:2327 #3 0x55a3a571bac7
> > (./x86_64-softmmu/qemu-system-x86_64+0x2a55ac7)
> > /mnt/sdb/qemu/hw/9pfs/virtio-9p-device.c:209 #4 0x55a3a58e7bc6
> > (./x86_64-softmmu/qemu-system-x86_64+0x2c21bc6)
> > /mnt/sdb/qemu/hw/virtio/virtio.c:3504 #5 0x55a3a5ebfb37
> > (./x86_64-softmmu/qemu-system-x86_64+0x31f9b37)
> > /mnt/sdb/qemu/hw/core/qdev.c:876
> > 
> > Reported-by: Euler Robot <euler.robot@huawei.com>
> > Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> > ---
> > 
> >  hw/9pfs/virtio-9p-device.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
> > index b5a7c03f26..b146387ae2 100644
> > --- a/hw/9pfs/virtio-9p-device.c
> > +++ b/hw/9pfs/virtio-9p-device.c
> > @@ -215,6 +215,7 @@ static void virtio_9p_device_unrealize(DeviceState
> > *dev, Error **errp) V9fsVirtioState *v = VIRTIO_9P(dev);
> > 
> >      V9fsState *s = &v->state;
> > 
> > +    virtio_delete_queue(v->vq);
> > 
> >      virtio_cleanup(vdev);
> >      v9fs_device_unrealize_common(s, errp);
> >  
> >  }
> 
> Looks like you are using an old interface. The new one is
> 
> 	void virtio_del_queue(VirtIODevice *vdev, int n);

Ah, my bad, it is actually the other way around, that is I was not up to date; 
virtio_delete_queue() was apparently introduced a week ago:
https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg00723.html

The old virtio_del_queue() still exists though:
https://github.com/qemu/qemu/blob/master/hw/virtio/virtio.c#L2339

Having said that, it would probably still make sense to use virtio_del_queue() 
instead for now to make it easier for stable branches to merge this fix?

Best regards,
Christian Schoenebeck





