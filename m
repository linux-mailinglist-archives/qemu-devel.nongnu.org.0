Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DFE6239A4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 03:14:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osx3p-00023K-0b; Wed, 09 Nov 2022 21:12:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1osx3j-00022j-72
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 21:12:51 -0500
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1osx3W-0002UV-JR
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 21:12:50 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R291e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VUQOnFs_1668046349; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VUQOnFs_1668046349) by smtp.aliyun-inc.com;
 Thu, 10 Nov 2022 10:12:30 +0800
Message-ID: <1668046343.214681-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH] virtio: remove the excess virtio features check
Date: Thu, 10 Nov 2022 10:12:23 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@gmail.com, lersek@redhat.com,
 jasowang@redhat.com, peter.maydell@linaro.org, kraxel@redhat.com
References: <20221109111021.24344-1-xuanzhuo@linux.alibaba.com>
 <20221109094421-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221109094421-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=115.124.30.57;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-57.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 9 Nov 2022 09:46:18 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Wed, Nov 09, 2022 at 07:10:21PM +0800, Xuan Zhuo wrote:
> > In virtio_queue_enable(), we checked virtio feature VIRTIO_F_VERSION_1.
> >
> > This check is not necessary, and conflict with SeaBIOS. The problem
> > appeared in SeaBIOS. But we also remove this check.
> >
> > Link: https://www.mail-archive.com/qemu-devel@nongnu.org/msg920538.html
> > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > ---
> >  hw/virtio/virtio.c | 5 -----
> >  1 file changed, 5 deletions(-)
> >
> > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > index 9683b2e158..701e23ea6a 100644
> > --- a/hw/virtio/virtio.c
> > +++ b/hw/virtio/virtio.c
> > @@ -2499,11 +2499,6 @@ void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
> >  {
> >      VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> >
> > -    if (!virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
> > -        error_report("queue_enable is only suppported in devices of virtio "
> > -                     "1.0 or later.");
> > -    }
> > -
> >      if (k->queue_enable) {
> >          k->queue_enable(vdev, queue_index);
> >      }
>
> Well this warning turned out to be actually useful.
> Let's see whether we can fix seabios in time for release.
> If yes I would just make it LOG_GUEST_ERR and limit to
> latest machine type but not drop completely.

OK.


>
> > --
> > 2.32.0.3.g01195cf9f
>

