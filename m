Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5175B5E7283
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 05:41:37 +0200 (CEST)
Received: from localhost ([::1]:34610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obZZI-0007vv-ER
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 23:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1obZUm-0003iM-E7
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 23:36:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1obZUi-0002fw-OD
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 23:36:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663904211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NeagRBJSFlPXWB9XZBjdCJzyzIrRGv1R9xKtfjtw350=;
 b=BBsaA4r8UtuWCDhGLnvLsGGQvpOO4GKKUFqi/pXRpA7zzAzauWlFkQN0/cEAaelYsunMMO
 tmnggkY+y4NcxPozZr9kVf11ac6h45hkQSsBWwoh1XQdg6SPg/5DKmKk9wD/fBUaGhhreF
 BgSIO4Z4/0JNnLXroX0/LnF36BasEcs=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-53-2WnaSt2dPlGwVMo3MFzSww-1; Thu, 22 Sep 2022 23:36:50 -0400
X-MC-Unique: 2WnaSt2dPlGwVMo3MFzSww-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-11eadf59e50so5833101fac.8
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 20:36:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=NeagRBJSFlPXWB9XZBjdCJzyzIrRGv1R9xKtfjtw350=;
 b=rOubBSxL0vbPpvuMdJwMzJB6bGAdt31VrsSr5SzqEvE4gKqO8efrZQn3pyytFIewWJ
 b99EQIqynh9+3ramaLEuH2V6crLpmFIURQzNaCUTVKNlcXhEJbteP/NmdzGXsZ8Qpa5Y
 NbzxfMWTPmBFmZYf4KkcWgb1qwWuteiMJ2jPXYagDUgEVPHgvyLLiAsVsoAwUejjDF7O
 4h3+fPxi2A+01kXKLMUavQyT+NhyHhQSF2xqLEizVkhcwybE8rgyoGlSY8UkEMLGscPu
 3iMYpMSin42HdvAKHv8Ryg1ZO8dX5nStl2Dh7/aRUeO+sbgAkdiPBB4YhuGs6XBNK/4+
 WJZg==
X-Gm-Message-State: ACrzQf33Df19iLOnmfFCD4V6qpOqDVV43amrIiUSLY3I3UTeEreEMiyp
 mZidfz5hbGmt1rnT6UtsViDcxFCtQYYsdWwv8ST2FNatq8o5DQuxYmEFg4mEhXEgRnOAAYHKnr0
 FLSoP+Adib4ECaKK62hTs63m5ULb9TN4=
X-Received: by 2002:a05:6870:73cd:b0:12a:dff3:790a with SMTP id
 a13-20020a05687073cd00b0012adff3790amr9969989oan.35.1663904209542; 
 Thu, 22 Sep 2022 20:36:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Z6k3yiw0FaM1ysGp4pYa0IIvBwd3TB3MGcrXSGlYbaFtE0SWw+Ca89Q6s7cdmOXJquOQLLDzwxc1EF0AUoSE=
X-Received: by 2002:a05:6870:73cd:b0:12a:dff3:790a with SMTP id
 a13-20020a05687073cd00b0012adff3790amr9969980oan.35.1663904209261; Thu, 22
 Sep 2022 20:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220921060026.392164-1-chenh@yusur.tech>
 <BL3PR02MB79380882D0B877C2D5A754FFEA4F9@BL3PR02MB7938.namprd02.prod.outlook.com>
 <CACGkMEttGsDrFo_U7AKHEof0HwVfHaRTeQSRE+QTiRPPtnU3hQ@mail.gmail.com>
 <20220922055531-mutt-send-email-mst@kernel.org>
 <fbf87d19-f7ab-dfdb-9f93-4087262cad57@yusur.tech>
In-Reply-To: <fbf87d19-f7ab-dfdb-9f93-4087262cad57@yusur.tech>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 23 Sep 2022 11:36:38 +0800
Message-ID: <CACGkMEuc22yQwNTe5NeQH1ooxk_HgM7tpuTFcNKWZVmYEJPAwA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/virtio/vhost-user: support obtain vdpa device's mac
 address automatically
To: =?UTF-8?B?6ZmI5rWp?= <chenh@yusur.tech>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, 
 "kwolf@redhat.com" <kwolf@redhat.com>, "hreitz@redhat.com" <hreitz@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "houyl@yusur.tech" <houyl@yusur.tech>, "zy@yusur.tech" <zy@yusur.tech>,
 "lulu@redhat.com" <lulu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 23, 2022 at 11:33 AM =E9=99=88=E6=B5=A9 <chenh@yusur.tech> wrot=
e:
>
>
> On 2022/9/22 17:56, Michael S. Tsirkin wrote:
> > On Thu, Sep 22, 2022 at 09:34:41AM +0800, Jason Wang wrote:
> >> On Thu, Sep 22, 2022 at 1:58 AM Raphael Norwitz
> >> <raphael.norwitz@nutanix.com> wrote:
> >>> If I read your response on the other thread correctly, this change is=
 intended
> >>>
> >>> to prioritize the MAC address exposed by DPDK over the one provided b=
y the
> >>>
> >>> QEMU command line? Sounds reasonable in principle, but I would get co=
nfirmation
> >>>
> >>> from vDPA/vhost-net maintainers.
> >> I think the best way is to (and it seems easier)
> >>
> >> 1) have the management layer to make sure the mac came from cli
> >> matches the underlayer vDPA
> >> 2) having a sanity check and fail the device initialization if they do=
n't match
> >>
> >> Thanks
> > I think I agree, we should not overwrite user supplied arguments.
> > I think the case where we might want to get the mac from VDPA
> > and use it is when it's been assigned randomly as opposed to coming fro=
m cli.
> Yes, when the cli passes in a random mac address that is inconsistent
> with the vdpa device, qemu still starts the virtual machine as usual,
> but in this case, the qemu and vdpa environments do not work correctly.
> So I want to get mac address directly from vdpa device instead of cli.

Let's teach the management to do that. It has a lot of advantages, more bel=
ow.

Not sure for the DPDK case, but kernel vDPA allows the mgmt to
provision the vDPA with a mac address which could be used in this
case.

>
> Having a sanity check and fail the device initialization if they don't
> match is a good idea, but it seems more convenient to directly overwrite
> the cli mac address.

This will confuse the management where it may do a lot of mac related setup=
s.

Thanks

> >
> >
> >>>
> >>>
> >>> That said the way you=E2=80=99re hacking the vhost-user code breaks a=
 valuable check for
> >>>
> >>> bad vhost-user-blk backends. I would suggest finding another implemen=
tation which
> >>>
> >>> does not regress functionality for other device types.
> >>>
> >>>
> >>>
> >>>
> >>>
> >>>> From: Hao Chen <chenh@yusur.tech>
> >>>> When use dpdk-vdpa tests vdpa device. You need to specify the mac ad=
dress to
> >>>> start the virtual machine through libvirt or qemu, but now, the libv=
irt or
> >>>> qemu can call dpdk vdpa vendor driver's ops .get_config through vhos=
t_net_get_config
> >>>> to get the mac address of the vdpa hardware without manual configura=
tion.
> >>>> v1->v2:
> >>>> Only copy ETH_ALEN data of netcfg for some vdpa device such as
> >>>> NVIDIA BLUEFIELD DPU(BF2)'s netcfg->status is not right.
> >>>> We only need the mac address and don't care about the status field.
> >>>> Signed-off-by: Hao Chen <chenh@yusur.tech>
> >>>> ---
> >>>> hw/block/vhost-user-blk.c |  1 -
> >>>> hw/net/virtio-net.c       |  7 +++++++
> >>>> hw/virtio/vhost-user.c    | 19 -------------------
> >>>> 3 files changed, 7 insertions(+), 20 deletions(-)
> >>>> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> >>>> index 9117222456..5dca4eab09 100644
> >>>> --- a/hw/block/vhost-user-blk.c
> >>>> +++ b/hw/block/vhost-user-blk.c
> >>>> @@ -337,7 +337,6 @@ static int vhost_user_blk_connect(DeviceState *d=
ev, Error **errp)
> >>>>      vhost_dev_set_config_notifier(&s->dev, &blk_ops);
> >>>> -    s->vhost_user.supports_config =3D true;
> >>>>      ret =3D vhost_dev_init(&s->dev, &s->vhost_user, VHOST_BACKEND_T=
YPE_USER, 0,
> >>>>                           errp);
> >>>>      if (ret < 0) {
> >>>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> >>>> index dd0d056fde..90405083b1 100644
> >>>> --- a/hw/net/virtio-net.c
> >>>> +++ b/hw/net/virtio-net.c
> >>>> @@ -166,6 +166,13 @@ static void virtio_net_get_config(VirtIODevice =
*vdev, uint8_t *config)
> >>>>              }
> >>>>              memcpy(config, &netcfg, n->config_size);
> >>>>          }
> >>>> +    } else if (nc->peer && nc->peer->info->type =3D=3D NET_CLIENT_D=
RIVER_VHOST_USER) {
> >>>> +        ret =3D vhost_net_get_config(get_vhost_net(nc->peer), (uint=
8_t *)&netcfg,
> >>>> +                                   n->config_size);
> >>>> +        if (ret !=3D -1) {
> >>>> +               /* Automatically obtain the mac address of the vdpa =
device
> >>>> +                * when using the dpdk vdpa */
> >>>> +                memcpy(config, &netcfg, ETH_ALEN);
> >>>>      }
> >>>> }
> >>>> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> >>>> index bd24741be8..8b01078249 100644
> >>>> --- a/hw/virtio/vhost-user.c
> >>>> +++ b/hw/virtio/vhost-user.c
> >>>> @@ -2013,8 +2013,6 @@ static int vhost_user_backend_init(struct vhos=
t_dev *dev, void *opaque,
> >>>>      }
> >>>>      if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES=
)) {
> >>>> -        bool supports_f_config =3D vus->supports_config ||
> >>>> -            (dev->config_ops && dev->config_ops->vhost_dev_config_n=
otifier);
> >>>>          uint64_t protocol_features;
> >>>>          dev->backend_features |=3D 1ULL << VHOST_USER_F_PROTOCOL_FE=
ATURES;
> >>>> @@ -2033,23 +2031,6 @@ static int vhost_user_backend_init(struct vho=
st_dev *dev, void *opaque,
> >>>>           */
> >>>>          protocol_features &=3D VHOST_USER_PROTOCOL_FEATURE_MASK;
> >>>> -        if (supports_f_config) {
> >>>> -            if (!virtio_has_feature(protocol_features,
> >>>> -                                    VHOST_USER_PROTOCOL_F_CONFIG)) =
{
> >>>> -                error_setg(errp, "vhost-user device expecting "
> >>>> -                           "VHOST_USER_PROTOCOL_F_CONFIG but the vh=
ost-user backend does "
> >>>> -                           "not support it.");
> >>>> -                return -EPROTO;
> >>>> -            }
> >>>> -        } else {
> >>>> -            if (virtio_has_feature(protocol_features,
> >>>> -                                   VHOST_USER_PROTOCOL_F_CONFIG)) {
> >>>> -                warn_reportf_err(*errp, "vhost-user backend support=
s "
> >>>> -                                 "VHOST_USER_PROTOCOL_F_CONFIG but =
QEMU does not.");
> >>>> -                protocol_features &=3D ~(1ULL << VHOST_USER_PROTOCO=
L_F_CONFIG);
> >>>> -            }
> >>>> -        }
> >>>> -
> >>>>          /* final set of protocol features */
> >>>>          dev->protocol_features =3D protocol_features;
> >>>>          err =3D vhost_user_set_protocol_features(dev, dev->protocol=
_features);
> >>>> --
> >>>> 2.27.0
> >>>
> >
>


