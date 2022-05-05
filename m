Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B0E51BC71
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:48:07 +0200 (CEST)
Received: from localhost ([::1]:57008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmY5d-0005ab-SV
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nmX2f-0008Sr-Lb
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:40:57 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:24774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nmX2c-0004vo-Od
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:40:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651740053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ATviU9gsBDjJDj4n3PPJL/qrwPk+uH2ArIBem/4y04Q=;
 b=bM8hzH48YrVz05JUq8kPu4NX/lxGegehYYVMcPgkQ8rBaJvQvTddYsqogvIbws25XYu3cy
 t6uO4WKrY/JiQvkcUWKmUZYZ4xe1WHcRdj41YykcmCMzuLqnfkjnbGPkRgywcV9mtWU1ED
 lT1qeumBnRmEji1UU1B1cc9mwBr4rcw=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-nhp9k_DzN3GHYV9oLiv9NA-1; Thu, 05 May 2022 04:40:52 -0400
X-MC-Unique: nhp9k_DzN3GHYV9oLiv9NA-1
Received: by mail-lf1-f71.google.com with SMTP id
 bp17-20020a056512159100b00472631eb445so1470818lfb.13
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 01:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ATviU9gsBDjJDj4n3PPJL/qrwPk+uH2ArIBem/4y04Q=;
 b=hT2GZECTR0cYoqogAjPdobNOVZvNaT3tglQVaG+lcMhCll0u7uXUvLmkOFyDYbZCbn
 Rrs+q/p34vPcgsnfL5mkuN3BDxJDAoZdQYdAA5jZ3n9Nt8ClnJey0dI0hbiYbLKwec7G
 IaddMDQNz8FMDSnuZ62c+EzVHU7BVc+Phz93Vxjnu7Dl88P2kWPhgE2UcfhQDL6qqNqA
 tp17KsklAseUO0Uhocf2nh2Z56bOGS1UlCp6BymimMs460UdrxxGKQBai9b3GwZD709X
 Ht0lpG+tGacNdbSeLzJUp3n81essuxGksCbIpq+hg+C3Jm5T1IDotdxLxtMnr74tA7Dz
 J/kg==
X-Gm-Message-State: AOAM532dy4useocX2Xa6WMo32mCORbtNyHdFW9GMz9LUgRqJJn8AdGe5
 8qZ2IJzHv6KE+tvwgj6BDhs4fICQsmXskvhODOQ2xjTpxhnqgZQdcSk2jd1q9HVLijJP4KJzoSO
 1UU8Ojo05ZExdF/fXcBA9HoBICCVTRyo=
X-Received: by 2002:a05:6512:a91:b0:473:bb9e:fc80 with SMTP id
 m17-20020a0565120a9100b00473bb9efc80mr4974963lfu.471.1651740050385; 
 Thu, 05 May 2022 01:40:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzcRLvX7xgH/IHhOt6HByZ7/ffGbtkUVWSoknQpykzh8En+gRa2rxkkuwQDqzjpSYvCSr6IaiW3mN43mFi8r0=
X-Received: by 2002:a05:6512:a91:b0:473:bb9e:fc80 with SMTP id
 m17-20020a0565120a9100b00473bb9efc80mr4974953lfu.471.1651740050079; Thu, 05
 May 2022 01:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <6d7d0a27-beca-6693-ebea-780bca80fd9f@redhat.com>
 <ee09f73a-3a60-ae02-ebd3-12f954a19793@oracle.com>
 <CACGkMEv-sbYsA42rp-58ea0HnE1p12SgS=p2bE0xFni5qXyRPA@mail.gmail.com>
 <7dce3f0f-a71b-9800-b462-f5406a9c95a2@oracle.com>
 <CACGkMEtkf=B03NFEJfbPs2ZkurCJMi99TXYOHfucH9Ticqv+XA@mail.gmail.com>
 <4f655f0f-c1ad-b8ae-2edd-b6a3524583cd@oracle.com>
In-Reply-To: <4f655f0f-c1ad-b8ae-2edd-b6a3524583cd@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 5 May 2022 16:40:39 +0800
Message-ID: <CACGkMEtAkqcvMKty_BZE8Dy5is5DWzG8tzBnpuc6Cx7JboQ6bw@mail.gmail.com>
Subject: Re: [PATCH 0/7] vhost-vdpa multiqueue fixes
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>, 
 eperezma <eperezma@redhat.com>, Eli Cohen <eli@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.74; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Apr 30, 2022 at 10:07 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 4/28/2022 7:30 PM, Jason Wang wrote:
> > On Wed, Apr 27, 2022 at 5:09 PM Si-Wei Liu <si-wei.liu@oracle.com> wrot=
e:
> >>
> >>
> >> On 4/27/2022 1:38 AM, Jason Wang wrote:
> >>> On Wed, Apr 27, 2022 at 4:30 PM Si-Wei Liu <si-wei.liu@oracle.com> wr=
ote:
> >>>>
> >>>> On 4/26/2022 9:28 PM, Jason Wang wrote:
> >>>>> =E5=9C=A8 2022/3/30 14:33, Si-Wei Liu =E5=86=99=E9=81=93:
> >>>>>> Hi,
> >>>>>>
> >>>>>> This patch series attempt to fix a few issues in vhost-vdpa
> >>>>>> multiqueue functionality.
> >>>>>>
> >>>>>> Patch #1 is the formal submission for RFC patch in:
> >>>>>> https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/c3e=
931ee-1a1b-9c2f-2f59-cb4395c230f9@oracle.com/__;!!ACWV5N9M2RV99hQ!OoUKcyWau=
HGQOM4MTAUn88TINQo5ZP4aaYyvyUCK9ggrI_L6diSZo5Nmq55moGH769SD87drxQyqg3ysNsk$
> >>>>>>
> >>>>>> Patch #2 and #3 were taken from a previous patchset posted on
> >>>>>> qemu-devel:
> >>>>>> https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/202=
11117192851.65529-1-eperezma@redhat.com/__;!!ACWV5N9M2RV99hQ!OoUKcyWauHGQOM=
4MTAUn88TINQo5ZP4aaYyvyUCK9ggrI_L6diSZo5Nmq55moGH769SD87drxQyqc3mXqDs$
> >>>>>>
> >>>>>> albeit abandoned, two patches in that set turn out to be useful fo=
r
> >>>>>> patch #4, which is to fix a QEMU crash due to race condition.
> >>>>>>
> >>>>>> Patch #5 through #7 are obviously small bug fixes. Please find the
> >>>>>> description of each in the commit log.
> >>>>>>
> >>>>>> Thanks,
> >>>>>> -Siwei
> >>>>> Hi Si Wei:
> >>>>>
> >>>>> I think we need another version of this series?
> >>>> Hi Jason,
> >>>>
> >>>> Apologies for the long delay. I was in the middle of reworking the p=
atch
> >>>> "virtio: don't read pending event on host notifier if disabled", but
> >>>> found out that it would need quite some code change for the userspac=
e
> >>>> fallback handler to work properly (for the queue no. change case
> >>>> specifically).
> >>> We probably need this fix for -stable, so I wonder if we can have a
> >>> workaround first and do refactoring on top?
> >> Hmmm, a nasty fix but may well address the segfault is something like =
this:
> >>
> >> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> >> index 8ca0b80..3ac93a4 100644
> >> --- a/hw/net/virtio-net.c
> >> +++ b/hw/net/virtio-net.c
> >> @@ -368,6 +368,10 @@ static void virtio_net_set_status(struct
> >> VirtIODevice *vdev, uint8_t status)
> >>        int i;
> >>        uint8_t queue_status;
> >>
> >> +    if (n->status_pending)
> >> +        return;
> >> +
> >> +    n->status_pending =3D true;
> >>        virtio_net_vnet_endian_status(n, status);
> >>        virtio_net_vhost_status(n, status);
> >>
> >> @@ -416,6 +420,7 @@ static void virtio_net_set_status(struct
> >> VirtIODevice *vdev, uint8_t status)
> >>                }
> >>            }
> >>        }
> >> +    n->status_pending =3D false;
> >>    }
> >>
> >>    static void virtio_net_set_link_status(NetClientState *nc)
> >> diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio=
-net.h
> >> index eb87032..95efea8 100644
> >> --- a/include/hw/virtio/virtio-net.h
> >> +++ b/include/hw/virtio/virtio-net.h
> >> @@ -216,6 +216,7 @@ struct VirtIONet {
> >>        VirtioNetRssData rss_data;
> >>        struct NetRxPkt *rx_pkt;
> >>        struct EBPFRSSContext ebpf_rss;
> >> +    bool status_pending;
> >>    };
> >>
> >>    void virtio_net_set_netclient_name(VirtIONet *n, const char *name,
> >>
> >> To be honest, I am not sure if this is worth a full blown fix to make =
it
> >> completely work. Without applying vq suspend patch (the one I posted i=
n
> >> https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/df7c9a8=
7-b2bd-7758-a6b6-bd834a7336fe@oracle.com/__;!!ACWV5N9M2RV99hQ!L4qque3YpPr-C=
Gp12NrNdMMT1HROfEY_Juw2vnfZXHjOhtT0XJCR9GB8cvWEbJL9Aeh-WhDogBVArJn91P0$ ),
> >> it's very hard for me to effectively verify my code change - it's very
> >> easy for the guest vq index to be out of sync if not stopping the vq
> >> once the vhost is up and running (I tested it with repeatedly set_link
> >> off and on).
> > Can we test via vmstop?
> Yes, of coz, that's where the segfault happened. The tight loop of
> set_link on/off doesn't even work for the single queue case, hence
> that's why I doubted it ever worked for vhost-vdpa.

Right, this is something we need to check. Set_link should stop the
vhost device anyhow, otherwise it should be a bug.

>
> >
> >> I am not sure if there's real chance we can run into issue
> >> in practice due to the incomplete fix, if we don't fix the vq
> >> stop/suspend issue first. Anyway I will try, as other use case e.g, li=
ve
> >> migration is likely to get stumbled on it, too.
> > Ok, so I think we probably don't need the "nasty" fix above. Let's fix
> > it with the issue of stop/resume.
> Ok, then does below tentative code change suffice the need? i.e. it
> would fail the request of changing queue pairs when the vhost-vdpa
> backend falls back to the userspace handler, but it's probably the
> easiest way to fix the vmstop segfault.

Probably, let's see.

Thanks

>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index ed231f9..8ba9f09 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -1177,6 +1177,7 @@ static int virtio_net_handle_mq(VirtIONet *n,
> uint8_t cmd,
>       struct virtio_net_ctrl_mq mq;
>       size_t s;
>       uint16_t queue_pairs;
> +    NetClientState *nc =3D qemu_get_queue(n->nic);
>
>       s =3D iov_to_buf(iov, iov_cnt, 0, &mq, sizeof(mq));
>       if (s !=3D sizeof(mq)) {
> @@ -1196,6 +1197,13 @@ static int virtio_net_handle_mq(VirtIONet *n,
> uint8_t cmd,
>           return VIRTIO_NET_ERR;
>       }
>
> +    /* avoid changing the number of queue_pairs for vdpa device in
> +     * userspace handler.
> +     * TODO: get userspace fallback to work with future patch */
> +    if (nc->peer && nc->peer->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_=
VDPA) {
> +        return VIRTIO_NET_ERR;
> +    }
> +
>       n->curr_queue_pairs =3D queue_pairs;
>       /* stop the backend before changing the number of queue_pairs to
> avoid handling a
>        * disabled queue */
>
> Thanks,
> -Siwei
> >
> > Thanks
> >
> >> -Siwei
> >>
> >>
> >>>> I have to drop it from the series and posted it later on
> >>>> when ready. Will post a v2 with relevant patches removed.
> >>> Thanks
> >>>
> >>>> Regards,
> >>>> -Siwei
> >>>>
> >>>>> Thanks
> >>>>>
> >>>>>
> >>>>>> ---
> >>>>>>
> >>>>>> Eugenio P=C3=A9rez (2):
> >>>>>>      virtio-net: Fix indentation
> >>>>>>      virtio-net: Only enable userland vq if using tap backend
> >>>>>>
> >>>>>> Si-Wei Liu (5):
> >>>>>>      virtio-net: align ctrl_vq index for non-mq guest for vhost_vd=
pa
> >>>>>>      virtio: don't read pending event on host notifier if disabled
> >>>>>>      vhost-vdpa: fix improper cleanup in net_init_vhost_vdpa
> >>>>>>      vhost-net: fix improper cleanup in vhost_net_start
> >>>>>>      vhost-vdpa: backend feature should set only once
> >>>>>>
> >>>>>>     hw/net/vhost_net.c         |  4 +++-
> >>>>>>     hw/net/virtio-net.c        | 25 +++++++++++++++++++++----
> >>>>>>     hw/virtio/vhost-vdpa.c     |  2 +-
> >>>>>>     hw/virtio/virtio-bus.c     |  3 ++-
> >>>>>>     hw/virtio/virtio.c         | 21 +++++++++++++--------
> >>>>>>     include/hw/virtio/virtio.h |  2 ++
> >>>>>>     net/vhost-vdpa.c           |  4 +++-
> >>>>>>     7 files changed, 45 insertions(+), 16 deletions(-)
> >>>>>>
>


