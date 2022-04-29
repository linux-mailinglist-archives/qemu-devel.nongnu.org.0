Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35115514094
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 04:31:16 +0200 (CEST)
Received: from localhost ([::1]:53676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkGPb-0001as-BG
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 22:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nkGOh-0000sj-G5
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 22:30:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nkGOf-00023L-KN
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 22:30:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651199417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EMEpyYG0SarnEGN0a3b3wKcg9+zMtt3YQwTAKgXALZM=;
 b=BNhKTwHLUNenw/+lgA7Xk3vyhHeMwN97qqdpCV/BVtdCB+6XvETAjGpWtDCI09z1f6oQbS
 qoOHXWhsVqqreOvjQLo71Jz/xdSeg/UJhQ/a6rca+SkXUQme95FNP+6ZPs4idzuxe968aK
 eYgLcx2yEXoATbYzrBQ2pXe9ahktVek=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-ydsnC0ikO0GK_sU1ht6pQQ-1; Thu, 28 Apr 2022 22:30:15 -0400
X-MC-Unique: ydsnC0ikO0GK_sU1ht6pQQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 y7-20020a2e95c7000000b0024f29bcd594so2273488ljh.9
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 19:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EMEpyYG0SarnEGN0a3b3wKcg9+zMtt3YQwTAKgXALZM=;
 b=DYhSBIzsM0H7OFR92FIn7/cDMR4jlcjMvu1AQjwfZrARU7fZnUB7OmOHLxXgZiaQ5G
 4U16jVoBVbvTdu1h3p4Lyydduwxbs11DGLizg1jTSXwME7IjUaMnVTb8H37A27DxQGlH
 +6N/hrYfWQfUGRFLQAWfkN42zUwntMNLw8prZa/vADtyKtwgvlpuVl/KraIn17SmMaHI
 Y8ZJq6a7Bmp9oJj5gOXJoqxn70X0O7pbDL9MCwXUfmfE7XXdK9pLru31xx7hBIpiMuWY
 lmPubsT/5XkXRb6EDFXcqaUHGnNH5aBCLmdjLj8m+rS1PTFUrP6tg6QFN69jjZH9bT9y
 CLkQ==
X-Gm-Message-State: AOAM5312dTMmkfsVmiSSbgym/X1y9uK/N3UQFWcw74Kpbrj6bfMSUXio
 SG0Lk0JjXbfSccmMnrM2DwEUMF55dlTV31SvBhoH5H4HUCmvnWcwjrnKEY8tM27stBxOnea8TLZ
 sVI4qsTMWPWFSImkwAGNzBt1R3aFV8BE=
X-Received: by 2002:a05:6512:1526:b0:471:44fa:c367 with SMTP id
 bq38-20020a056512152600b0047144fac367mr25987150lfb.376.1651199414143; 
 Thu, 28 Apr 2022 19:30:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2Pya5ijKEVKyiTXkd82wKtDX7HL2C8cERcLdNP3wq1bqkti3vxcLjVNFpN0tLiBDUrs1LDqYPEJwHn1gInrw=
X-Received: by 2002:a05:6512:1526:b0:471:44fa:c367 with SMTP id
 bq38-20020a056512152600b0047144fac367mr25987136lfb.376.1651199413854; Thu, 28
 Apr 2022 19:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <6d7d0a27-beca-6693-ebea-780bca80fd9f@redhat.com>
 <ee09f73a-3a60-ae02-ebd3-12f954a19793@oracle.com>
 <CACGkMEv-sbYsA42rp-58ea0HnE1p12SgS=p2bE0xFni5qXyRPA@mail.gmail.com>
 <7dce3f0f-a71b-9800-b462-f5406a9c95a2@oracle.com>
In-Reply-To: <7dce3f0f-a71b-9800-b462-f5406a9c95a2@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 29 Apr 2022 10:30:02 +0800
Message-ID: <CACGkMEtkf=B03NFEJfbPs2ZkurCJMi99TXYOHfucH9Ticqv+XA@mail.gmail.com>
Subject: Re: [PATCH 0/7] vhost-vdpa multiqueue fixes
To: Si-Wei Liu <si-wei.liu@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eperezma <eperezma@redhat.com>, Eli Cohen <eli@mellanox.com>,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 27, 2022 at 5:09 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 4/27/2022 1:38 AM, Jason Wang wrote:
> > On Wed, Apr 27, 2022 at 4:30 PM Si-Wei Liu <si-wei.liu@oracle.com> wrot=
e:
> >>
> >>
> >> On 4/26/2022 9:28 PM, Jason Wang wrote:
> >>> =E5=9C=A8 2022/3/30 14:33, Si-Wei Liu =E5=86=99=E9=81=93:
> >>>> Hi,
> >>>>
> >>>> This patch series attempt to fix a few issues in vhost-vdpa
> >>>> multiqueue functionality.
> >>>>
> >>>> Patch #1 is the formal submission for RFC patch in:
> >>>> https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/c3e93=
1ee-1a1b-9c2f-2f59-cb4395c230f9@oracle.com/__;!!ACWV5N9M2RV99hQ!OoUKcyWauHG=
QOM4MTAUn88TINQo5ZP4aaYyvyUCK9ggrI_L6diSZo5Nmq55moGH769SD87drxQyqg3ysNsk$
> >>>>
> >>>> Patch #2 and #3 were taken from a previous patchset posted on
> >>>> qemu-devel:
> >>>> https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/20211=
117192851.65529-1-eperezma@redhat.com/__;!!ACWV5N9M2RV99hQ!OoUKcyWauHGQOM4M=
TAUn88TINQo5ZP4aaYyvyUCK9ggrI_L6diSZo5Nmq55moGH769SD87drxQyqc3mXqDs$
> >>>>
> >>>> albeit abandoned, two patches in that set turn out to be useful for
> >>>> patch #4, which is to fix a QEMU crash due to race condition.
> >>>>
> >>>> Patch #5 through #7 are obviously small bug fixes. Please find the
> >>>> description of each in the commit log.
> >>>>
> >>>> Thanks,
> >>>> -Siwei
> >>>
> >>> Hi Si Wei:
> >>>
> >>> I think we need another version of this series?
> >> Hi Jason,
> >>
> >> Apologies for the long delay. I was in the middle of reworking the pat=
ch
> >> "virtio: don't read pending event on host notifier if disabled", but
> >> found out that it would need quite some code change for the userspace
> >> fallback handler to work properly (for the queue no. change case
> >> specifically).
> > We probably need this fix for -stable, so I wonder if we can have a
> > workaround first and do refactoring on top?
> Hmmm, a nasty fix but may well address the segfault is something like thi=
s:
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 8ca0b80..3ac93a4 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -368,6 +368,10 @@ static void virtio_net_set_status(struct
> VirtIODevice *vdev, uint8_t status)
>       int i;
>       uint8_t queue_status;
>
> +    if (n->status_pending)
> +        return;
> +
> +    n->status_pending =3D true;
>       virtio_net_vnet_endian_status(n, status);
>       virtio_net_vhost_status(n, status);
>
> @@ -416,6 +420,7 @@ static void virtio_net_set_status(struct
> VirtIODevice *vdev, uint8_t status)
>               }
>           }
>       }
> +    n->status_pending =3D false;
>   }
>
>   static void virtio_net_set_link_status(NetClientState *nc)
> diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-ne=
t.h
> index eb87032..95efea8 100644
> --- a/include/hw/virtio/virtio-net.h
> +++ b/include/hw/virtio/virtio-net.h
> @@ -216,6 +216,7 @@ struct VirtIONet {
>       VirtioNetRssData rss_data;
>       struct NetRxPkt *rx_pkt;
>       struct EBPFRSSContext ebpf_rss;
> +    bool status_pending;
>   };
>
>   void virtio_net_set_netclient_name(VirtIONet *n, const char *name,
>
> To be honest, I am not sure if this is worth a full blown fix to make it
> completely work. Without applying vq suspend patch (the one I posted in
> https://lore.kernel.org/qemu-devel/df7c9a87-b2bd-7758-a6b6-bd834a7336fe@o=
racle.com/),
> it's very hard for me to effectively verify my code change - it's very
> easy for the guest vq index to be out of sync if not stopping the vq
> once the vhost is up and running (I tested it with repeatedly set_link
> off and on).

Can we test via vmstop?

> I am not sure if there's real chance we can run into issue
> in practice due to the incomplete fix, if we don't fix the vq
> stop/suspend issue first. Anyway I will try, as other use case e.g, live
> migration is likely to get stumbled on it, too.

Ok, so I think we probably don't need the "nasty" fix above. Let's fix
it with the issue of stop/resume.

Thanks

>
> -Siwei
>
>
> >
> >> I have to drop it from the series and posted it later on
> >> when ready. Will post a v2 with relevant patches removed.
> > Thanks
> >
> >> Regards,
> >> -Siwei
> >>
> >>> Thanks
> >>>
> >>>
> >>>> ---
> >>>>
> >>>> Eugenio P=C3=A9rez (2):
> >>>>     virtio-net: Fix indentation
> >>>>     virtio-net: Only enable userland vq if using tap backend
> >>>>
> >>>> Si-Wei Liu (5):
> >>>>     virtio-net: align ctrl_vq index for non-mq guest for vhost_vdpa
> >>>>     virtio: don't read pending event on host notifier if disabled
> >>>>     vhost-vdpa: fix improper cleanup in net_init_vhost_vdpa
> >>>>     vhost-net: fix improper cleanup in vhost_net_start
> >>>>     vhost-vdpa: backend feature should set only once
> >>>>
> >>>>    hw/net/vhost_net.c         |  4 +++-
> >>>>    hw/net/virtio-net.c        | 25 +++++++++++++++++++++----
> >>>>    hw/virtio/vhost-vdpa.c     |  2 +-
> >>>>    hw/virtio/virtio-bus.c     |  3 ++-
> >>>>    hw/virtio/virtio.c         | 21 +++++++++++++--------
> >>>>    include/hw/virtio/virtio.h |  2 ++
> >>>>    net/vhost-vdpa.c           |  4 +++-
> >>>>    7 files changed, 45 insertions(+), 16 deletions(-)
> >>>>
>


