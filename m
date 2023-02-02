Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 454B96884DD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 17:55:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNcqS-0002Tx-Jc; Thu, 02 Feb 2023 11:53:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pNcqN-0002Tn-Qo
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 11:53:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pNcqL-0006Dk-UH
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 11:53:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675356828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+kv0EXzAfsxcs0UOZRpJHGK9MVAbCLBpJSVzVpldUxk=;
 b=c7UcKD40YleegHsFr5zMuiNKswAfbk+KeXBePc6GIPUlx4BVWzXc2qsTa2Rot7UwD/hyIh
 gr1myjwIuCObwclIRxCu0BGfgyU6+007EXmbOF71V3vnLapAZw2NEJK6VAIhb/cB0X0Fm8
 Lp76RqfxcXyTqFz7C6bA7ZlbS+yzoNU=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-50-nWvL6XBLOSSM-D5Mw0jUHg-1; Thu, 02 Feb 2023 11:53:47 -0500
X-MC-Unique: nWvL6XBLOSSM-D5Mw0jUHg-1
Received: by mail-yb1-f197.google.com with SMTP id
 b18-20020a253412000000b0085747dc8317so2202263yba.15
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 08:53:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+kv0EXzAfsxcs0UOZRpJHGK9MVAbCLBpJSVzVpldUxk=;
 b=VrNOCcezw/2NmVnDNxuckldidLHbIcDkJJCFcv4ftKVrJK1ppmtYV7z33YPO+Vn84e
 bKhKSFX7MGdotI2d+RviCg2oRsqs7o6j/e/lVKE2I3PqquSbh6OxIsImCm9n/af+EoNT
 VMSw6ya1OWV4KRG1JC0A2JVnEWzwlowLr1izBPmdfDILf6u670q3NJnUJRubrkvjQL+W
 oivVPi7ByJoqgffYiPuKlJNgCllbtFITxgjSb9XINdwST1WEj2qx5nCoURNVKniG1j01
 0VFifvnv2qrFdVKYeZ/DfMYvGcUpejsMFb1/vBJigrboed9w9tOssMKumPBHexxhxp21
 RmcA==
X-Gm-Message-State: AO0yUKU8gXpmS01Rm6QtTNisR9xcoPE9lJXGp8yyJTpWvHxh+u547wtN
 tSTHWZv2DtIo4GTcjL6Ml8LBQoNWqgrOe09++umndDigExIogm5rSDmV+zFdaRrCQSpGno+72NU
 yhnpudgkqQYvpnTeMJsI/WJvInRfmKh8=
X-Received: by 2002:a25:a0c2:0:b0:80b:bb5c:778b with SMTP id
 i2-20020a25a0c2000000b0080bbb5c778bmr826916ybm.382.1675356826459; 
 Thu, 02 Feb 2023 08:53:46 -0800 (PST)
X-Google-Smtp-Source: AK7set+tdrEM7Spq1eIm2c/CsrY1roE9Bfa+hy/0Tlr4bp74UF6+KWNsARb/St2aUyBmvNSTJFvUom+nDqtnixUKlBk=
X-Received: by 2002:a25:a0c2:0:b0:80b:bb5c:778b with SMTP id
 i2-20020a25a0c2000000b0080bbb5c778bmr826895ybm.382.1675356826138; Thu, 02 Feb
 2023 08:53:46 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-13-eperezma@redhat.com>
 <CACGkMEt8cMM1UxVzxb0eHeaWSpR0ApvGzaF901vrM4m-uGMiPA@mail.gmail.com>
 <7438853f-8d5e-33fb-1e53-b4a0036f0b7d@intel.com>
 <CACGkMEtwcjExouCbnMrQ3TcAkXJH4mv63ud-ROEUu6mH+53C6Q@mail.gmail.com>
 <CAJaqyWfijv2doQ8OAiiWdYvrWtmLPwJcnFtO+aUuoTa0jSL73A@mail.gmail.com>
 <a7367dec-2f96-c748-8f62-7bd03c3de263@oracle.com>
In-Reply-To: <a7367dec-2f96-c748-8f62-7bd03c3de263@oracle.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 2 Feb 2023 17:53:10 +0100
Message-ID: <CAJaqyWe3d0i85DS2+yS9nZ6dZkcXyOEmYng-vKVk=6G3Ty-mfg@mail.gmail.com>
Subject: Re: [RFC v2 12/13] vdpa: preemptive kick at enable
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: Jason Wang <jasowang@redhat.com>, "Zhu, Lingshan" <lingshan.zhu@intel.com>,
 qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>,
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Thu, Feb 2, 2023 at 1:57 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 1/13/2023 1:06 AM, Eugenio Perez Martin wrote:
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
> I wonder how the kick can be missed from the first place. Supposedly the
> moment when vhost_dev_stop() calls .suspend() into vdpa driver, the
> vcpus already stopped running (vm_running =3D false) and all pending kick=
s
> are delivered through vhost-vdpa's host notifiers or mapped doorbell
> already then device won't get new ones.

I'm thinking now in cases like the net rx queue.

When the guest starts it fills it and kicks the device. Let's say
avail_idx is 255.

Following the qemu emulated virtio net,
hw/virtio/virtio.c:virtqueue_split_pop will stash shadow_avail_idx =3D
255, and it will not check it again until it is out of rx descriptors.

Now the NIC fills N < 255 receive buffers, and VMM migrates. Will the
destination device check rx avail idx even if it has not received any
kick? (here could be at startup or when it needs to receive a packet).
- If the answer is yes, and it will be a bug not to check it, then we
can drop this patch. We're covered even if there is a possibility of
losing a kick in the source.
- If the answer is that it is not mandatory, we need to solve it
somehow. To me, the best way is to spuriously kick as we don't need
changes in the device, all we need is here. A new feature flag
_F_CHECK_AVAIL_ON_STARTUP or equivalent would work the same, but I
think it complicates everything more.

For tx the device should suspend "immediately", so it may receive a
kick, fetch avail_idx with M pending descriptors, transmit P < M and
then receive the suspend. If we don't want to wait indefinitely, the
device should stop processing so there are still pending requests in
the queue for the destination to send. So the case now is the same as
rx, even if the source device actually receives the kick.

Having said that, I didn't check if any code drains the vhost host
notifier. Or, as mentioned in the meeting, check that HW cannot
reorder kick and suspend call.

> If the device intends to
> purposely ignore (note: this could be a device bug) pending kicks during
> .suspend(), then consequently it should check available descriptors
> after reaching driver_ok to process outstanding descriptors, making up
> for the missing kick. If the vdpa driver doesn't support .suspend(),
> then it should flush the work before .reset() - vhost-scsi does it this
> way.  Or otherwise I think it's the norm (right thing to do) device
> should process pending kicks before guest memory is to be unmapped at
> the late game of vhost_dev_stop(). Is there any case kicks may be missing=
?
>

So process pending kicks means to drain all tx and rx descriptors?
That would be a solution, but then we don't need virtqueue_state at
all as we might simply recover it from guest's vring avail_idx.

Thanks!

> -Siwei
>
>
> >
> > If we drop it it seems to me we must mandate devices to check for
> > descriptors at queue_enable. The queue could stall if not, isn't it?
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


