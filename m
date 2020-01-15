Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DC113BEAA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 12:41:36 +0100 (CET)
Received: from localhost ([::1]:52580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irh3H-0000mF-3s
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 06:41:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41792)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qemu_oss@crudebyte.com>) id 1irh2L-0000Ht-JD
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 06:40:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <qemu_oss@crudebyte.com>) id 1irh2H-0005s8-Jh
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 06:40:37 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:56241)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <qemu_oss@crudebyte.com>)
 id 1irh2H-0005qu-6G
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 06:40:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=/hrOVHgjRyq7BISCMqQVhrA20R/v2uB0GCG0yArXY8E=; b=uqnwQHxfre1KQpKknF261uZqGz
 onPBSTDkvK2VRwvQ7YfDBD+86AawVg9fp3i40byYN4E9qJjl0Oms9cA0nAchM2qVjKrL0SQddkj7q
 4pZonWkCmnt1iLdJ1tFZvq1hVgQolyBhn+yx6WTmhaj3nuZOzR511Zr2YtRgLjhedAitNOcVgDncY
 vj3c+2o4kuYvh28Xhb2IFwoXPMHPzRH6rSLyNnRrfhnWWS/+RsHurJAfd0BahPCX8toNw+7w3HZ7k
 07YDtf9Q8QaU2o5jq5+RlcwGTpYCSrJSvV9NFoaFRKKqOkoqTQBRRbzlTkyHRXU4xA5f9Ldiapw6N
 vgAFR0/EB8i9R+7EiYgvLdt2xSC5dtdPNj7T0HqD93QuYFO78L+d+gaRqsqOPhVqURPUGEKiyGHwM
 jL1jpYBfthyMGQLnPphsl92BgB7CLDF6pvgbt9DcTZlZnKkQU5eTamG2gCLMomGFXcwdm26Vwl1Mx
 8A0uCnMuqCAl6cqT/Fgr8mhLWxrdqBeWNQeH+IcIUlKMg+U5ocpUp8aWTFuzrg92/1KhfWp2v3AE+
 X0yZ1dKpSuMY7MNCko0mCUcNi66iGllmElaA7w+QyoBGOHbaBnM+cRnZdxhdKkLjG+ihqRZ0nFSBo
 1nLU8Df4FwpUO1YFdeqgQwT1wC1HO1KYL2B3LmLbg=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Pan Nengyuan <pannengyuan@huawei.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, zhang.zhanghailiang@huawei.com,
 Euler Robot <euler.robot@huawei.com>, groug@kaod.org, mst@redhat.com
Subject: Re: [PATCH] virtio-9p-device: fix memleak in
 virtio_9p_device_unrealize
Date: Wed, 15 Jan 2020 12:40:24 +0100
Message-ID: <2341152.kUYHrPydlN@silver>
In-Reply-To: <c1d8c97e-6d08-1bac-ccb2-fe651e329bee@huawei.com>
References: <20200114074020.54696-1-pannengyuan@huawei.com>
 <1721395.PxUUFA46pP@silver> <c1d8c97e-6d08-1bac-ccb2-fe651e329bee@huawei.com>
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

On Mittwoch, 15. Januar 2020 02:28:03 CET Pan Nengyuan wrote:
> >>> diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
> >>> index b5a7c03f26..b146387ae2 100644
> >>> --- a/hw/9pfs/virtio-9p-device.c
> >>> +++ b/hw/9pfs/virtio-9p-device.c
> >>> @@ -215,6 +215,7 @@ static void virtio_9p_device_unrealize(DeviceState
> >>> *dev, Error **errp) V9fsVirtioState *v = VIRTIO_9P(dev);
> >>> 
> >>>      V9fsState *s = &v->state;
> >>> 
> >>> +    virtio_delete_queue(v->vq);
> >>> 
> >>>      virtio_cleanup(vdev);
> >>>      v9fs_device_unrealize_common(s, errp);
> >>>  
> >>>  }
> >> 
> >> Looks like you are using an old interface. The new one is
> >> 
> >> 	void virtio_del_queue(VirtIODevice *vdev, int n);
> > 
> > Ah, my bad, it is actually the other way around, that is I was not up to
> > date; virtio_delete_queue() was apparently introduced a week ago:
> > https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg00723.html
> > 
> > The old virtio_del_queue() still exists though:
> > https://github.com/qemu/qemu/blob/master/hw/virtio/virtio.c#L2339
> > 
> > Having said that, it would probably still make sense to use
> > virtio_del_queue() instead for now to make it easier for stable branches
> > to merge this fix?
> virtio_delete_queue makes the cleanup more clear and it tends to replace the
> old one gradually. So I think it would probably still use
> virtio_delete_queue.
> 
> Given that, maybe we can split this patch?
> For example:
> 1. use virtio_del_queue to fix memleak, it's easier for stable to merge.
> 2. rename virtio_del_queue to virtio_delete_queue

Exactly what I had in mind. :) Thanks!

Best regards,
Christian Schoenebeck



