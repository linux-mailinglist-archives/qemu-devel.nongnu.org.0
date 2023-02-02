Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C95C6884E4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 17:56:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNcsp-0006Pc-BW; Thu, 02 Feb 2023 11:56:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pNcsn-0006PT-Gf
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 11:56:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pNcsl-00009j-Uk
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 11:56:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675356979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gtFOX+jVrcDWYp+4xqLrJcKRrPSUOiBa/PAuy1MzBbQ=;
 b=VueNFus9LYKF1cUeaWQtT0R06LCQZNU4r+EZdkKa/DZGgKC3x8G1B8Pksw0At9VJTMpl37
 17DwODWefuZVgTdTkH9fbDQ35rtg//YtVoNzeZCQqi9REEsJFMlP3CT0w+P3s7GN3qoPx6
 3ZGDl5d8wsbjYKRO8mp7xKbnkk++WGc=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-395-2fJo33_sN6-mWhH-PfkneA-1; Thu, 02 Feb 2023 11:56:16 -0500
X-MC-Unique: 2fJo33_sN6-mWhH-PfkneA-1
Received: by mail-yb1-f197.google.com with SMTP id
 u186-20020a2560c3000000b007c8e2cf3668so2227673ybb.14
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 08:56:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gtFOX+jVrcDWYp+4xqLrJcKRrPSUOiBa/PAuy1MzBbQ=;
 b=mrL5nnByYdKP1fN/qXsCobkVuIxZHKz/ByFPn5FbOMc/mhplZGxhKsb+S55XD07YAH
 7ExQK48gKTyYhdob/+FMjlawZ0iU8Oe9ZWBgyHT+Zk4VshGA5zPAlvIn3uBHGAeQq3da
 xqHqhFt8knxWM4bvSLes+gPeO3MCEl3GMTS9fuX+bKnkekvCw70bgtGgypD8EHLAHQxC
 OxERWuQkzyfgXEFaT/7NBo/8AJUqcHEPgiTMHLN5v1wqpb2He4xyRoBHhDT4YdmtQ7Qt
 QyUneoOWaZX8h9hPx9ouqMUD4vI50n82g7fqFpSnk0vfSc55qN4JcwhoEy3EdxMS++FV
 5rvA==
X-Gm-Message-State: AO0yUKWOmQV/Gi8UXv3iWAslgK3OXm/moU4S0nqwRkkcXekQXBNygEfb
 MLfP59qTWagY8Ep8WS0YfGq2vp3LwdJv2g1Zst7GUvXDkHXYjyCaaVIRZqkwpvmUvpouHH8uwSP
 PA59OqE0CQ97XWXLn/CGBi6SxP6i/lV0=
X-Received: by 2002:a25:2d1c:0:b0:801:525c:6726 with SMTP id
 t28-20020a252d1c000000b00801525c6726mr880127ybt.152.1675356975371; 
 Thu, 02 Feb 2023 08:56:15 -0800 (PST)
X-Google-Smtp-Source: AK7set/tjM+TPnsenD6TDcrPyh/KFHgZHPSh/j1A7xDAPG8nrVInw2sSG4u2QAx9E/qa6Xwq31VihbqV4nRUMSO5XlA=
X-Received: by 2002:a25:2d1c:0:b0:801:525c:6726 with SMTP id
 t28-20020a252d1c000000b00801525c6726mr880119ybt.152.1675356975155; Thu, 02
 Feb 2023 08:56:15 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-13-eperezma@redhat.com>
 <CACGkMEt8cMM1UxVzxb0eHeaWSpR0ApvGzaF901vrM4m-uGMiPA@mail.gmail.com>
 <7438853f-8d5e-33fb-1e53-b4a0036f0b7d@intel.com>
 <CACGkMEtwcjExouCbnMrQ3TcAkXJH4mv63ud-ROEUu6mH+53C6Q@mail.gmail.com>
 <CAJaqyWfijv2doQ8OAiiWdYvrWtmLPwJcnFtO+aUuoTa0jSL73A@mail.gmail.com>
 <bd62f070-4c0c-0cc6-dabf-ceb251ffc444@redhat.com>
In-Reply-To: <bd62f070-4c0c-0cc6-dabf-ceb251ffc444@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 2 Feb 2023 17:55:38 +0100
Message-ID: <CAJaqyWewuakFWr59hGrEsQhC=xX5qqVbAnvsNmrjdOG50ChB9w@mail.gmail.com>
Subject: Re: [RFC v2 12/13] vdpa: preemptive kick at enable
To: Jason Wang <jasowang@redhat.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>, qemu-devel@nongnu.org,
 si-wei.liu@oracle.com, Liuxiangdong <liuxiangdong5@huawei.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 alvaro.karsz@solid-run.com, Shannon Nelson <snelson@pensando.io>, 
 Laurent Vivier <lvivier@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Gautam Dawar <gdawar@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Jan 16, 2023 at 8:02 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2023/1/13 17:06, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > On Fri, Jan 13, 2023 at 4:39 AM Jason Wang <jasowang@redhat.com> wrote:
> >> On Fri, Jan 13, 2023 at 11:25 AM Zhu, Lingshan <lingshan.zhu@intel.com=
> wrote:
> >>>
> >>>
> >>> On 1/13/2023 10:31 AM, Jason Wang wrote:
> >>>> On Fri, Jan 13, 2023 at 1:27 AM Eugenio P=C3=A9rez <eperezma@redhat.=
com> wrote:
> >>>>> Spuriously kick the destination device's queue so it knows in case =
there
> >>>>> are new descriptors.
> >>>>>
> >>>>> RFC: This is somehow a gray area. The guest may have placed descrip=
tors
> >>>>> in a virtqueue but not kicked it, so it might be surprised if the d=
evice
> >>>>> starts processing it.
> >>>> So I think this is kind of the work of the vDPA parent. For the pare=
nt
> >>>> that needs this trick, we should do it in the parent driver.
> >>> Agree, it looks easier implementing this in parent driver,
> >>> I can implement it in ifcvf set_vq_ready right now
> >> Great, but please check whether or not it is really needed.
> >>
> >> Some device implementation could check the available descriptions
> >> after DRIVER_OK without waiting for a kick.
> >>
> > So IIUC we can entirely drop this from the series (and I hope we can).
> > But then, what with the devices that does *not* check for them?
>
>
> It needs mediation in the vDPA parent driver.
>
>
> >
> > If we drop it it seems to me we must mandate devices to check for
> > descriptors at queue_enable. The queue could stall if not, isn't it?
>
>
> I'm not sure, did you see real issue with this? (Note that we don't do
> this for vhost-user-(vDPA))
>

Still unchecked, sorry. But not needing it for vhost-user-vDPA is a
very good signal indeed, thanks for pointing that.

> Btw, the code can result of kick before DRIVER_OK, which seems racy.
>

Good catch :). I'll fix it in the next revision if we see we need it.
I really hope to be able to drop it though.

Thanks!

> Thanks
>
>
> >
> > Thanks!
> >
> >> Thanks
> >>
> >>> Thanks
> >>> Zhu Lingshan
> >>>> Thanks
> >>>>
> >>>>> However, that information is not in the migration stream and it sho=
uld
> >>>>> be an edge case anyhow, being resilient to parallel notifications f=
rom
> >>>>> the guest.
> >>>>>
> >>>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>>>> ---
> >>>>>    hw/virtio/vhost-vdpa.c | 5 +++++
> >>>>>    1 file changed, 5 insertions(+)
> >>>>>
> >>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >>>>> index 40b7e8706a..dff94355dd 100644
> >>>>> --- a/hw/virtio/vhost-vdpa.c
> >>>>> +++ b/hw/virtio/vhost-vdpa.c
> >>>>> @@ -732,11 +732,16 @@ static int vhost_vdpa_set_vring_ready(struct =
vhost_dev *dev, int ready)
> >>>>>        }
> >>>>>        trace_vhost_vdpa_set_vring_ready(dev);
> >>>>>        for (i =3D 0; i < dev->nvqs; ++i) {
> >>>>> +        VirtQueue *vq;
> >>>>>            struct vhost_vring_state state =3D {
> >>>>>                .index =3D dev->vq_index + i,
> >>>>>                .num =3D 1,
> >>>>>            };
> >>>>>            vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state=
);
> >>>>> +
> >>>>> +        /* Preemptive kick */
> >>>>> +        vq =3D virtio_get_queue(dev->vdev, dev->vq_index + i);
> >>>>> +        event_notifier_set(virtio_queue_get_host_notifier(vq));
> >>>>>        }
> >>>>>        return 0;
> >>>>>    }
> >>>>> --
> >>>>> 2.31.1
> >>>>>
>


