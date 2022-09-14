Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CF05B8181
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 08:25:14 +0200 (CEST)
Received: from localhost ([::1]:34754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYLph-0007pc-9j
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 02:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1oYLmE-0004cj-5k
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 02:21:38 -0400
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:54549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1oYLm3-0003Fp-51
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 02:21:29 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R291e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VPltn9V_1663136476; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VPltn9V_1663136476) by smtp.aliyun-inc.com;
 Wed, 14 Sep 2022 14:21:17 +0800
Message-ID: <1663136320.6336615-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v2 3/6] vhost-net: vhost-user: update
 vhost_net_virtqueue_reset()
Date: Wed, 14 Sep 2022 14:18:40 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, arei.gonglei@huawei.com, hengqi@linux.alibaba.com,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
References: <cover.1662949366.git.kangjie.xu@linux.alibaba.com>
 <a14f5ebdefb82d7679841c1d5ddab54ec9406ea1.1662949366.git.kangjie.xu@linux.alibaba.com>
 <ac7dacaf-ea85-b608-4047-27254aefd97a@redhat.com>
In-Reply-To: <ac7dacaf-ea85-b608-4047-27254aefd97a@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=115.124.30.56;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-56.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Sep 2022 11:13:29 +0800, Jason Wang <jasowang@redhat.com> wrote:
>
> =E5=9C=A8 2022/9/12 11:10, Kangjie Xu =E5=86=99=E9=81=93:
> > Update vhost_net_virtqueue_reset() for vhost-user scenario.
> >
> > In order to reuse some functions, we process the idx for
> > vhost-user scenario because vhost_get_vq_index behave
> > differently for vhost-user.
> >
> > Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > ---
> >   hw/net/vhost_net.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > index ea896ea75b..25e5665489 100644
> > --- a/hw/net/vhost_net.c
> > +++ b/hw/net/vhost_net.c
> > @@ -545,6 +545,9 @@ void vhost_net_virtqueue_reset(VirtIODevice *vdev, =
NetClientState *nc,
> >       assert(vhost_ops);
> >
> >       idx =3D vhost_ops->vhost_get_vq_index(&net->dev, vq_index);
> > +    if (net->nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_USER) {
> > +        idx -=3D net->dev.vq_index;
> > +    }
>
>
> This looks tricky. Any reason we can't simply use vq_index for both
> vhost-user and vhost-net?


static int vhost_user_get_vq_index(struct vhost_dev *dev, int idx)
{
    assert(idx >=3D dev->vq_index && idx < dev->vq_index + dev->nvqs);

    return idx;
}


static int vhost_kernel_get_vq_index(struct vhost_dev *dev, int idx)
{
    assert(idx >=3D dev->vq_index && idx < dev->vq_index + dev->nvqs);

    return idx - dev->vq_index;
}

The implementation of these two callbacks is different. The structure of th=
e two
scenarios is different. We may need to do some optimizations in the future.

Thanks.


>
> Thanks
>
>
> >
> >       if (net->nc->info->type =3D=3D NET_CLIENT_DRIVER_TAP) {
> >           file.index =3D idx;
>

