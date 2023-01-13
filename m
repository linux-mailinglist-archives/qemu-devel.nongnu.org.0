Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EE666924F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 10:08:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGG2C-0002QG-7L; Fri, 13 Jan 2023 04:07:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pGG20-0002Py-8V
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 04:07:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pGG1y-0001WI-Cc
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 04:07:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673600839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L/+b33jqpE9jNjg/LpxlGSruDDM0RyxXTpfe1PiX5gg=;
 b=QDLNstl3pTZVQBpKCyQr2tPqIY7CPGqG8Lsd+bC7aDoePoGpOUITuTSo/XrUK0BNRIrRc6
 yf46XZRIPoKGz3qlp51zr2gzA1RLi68JwLiCmE8uU8Ab1byJ39+owEAAtFO6A+Zd2NmsMj
 bOQkMZ7fGyFOgNQZdsNYr5lmUMx6IZU=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-81-qqVMtxrwOUu6BXD9vuJ-YA-1; Fri, 13 Jan 2023 04:07:18 -0500
X-MC-Unique: qqVMtxrwOUu6BXD9vuJ-YA-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-4dd4d4591f7so20817447b3.15
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 01:07:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L/+b33jqpE9jNjg/LpxlGSruDDM0RyxXTpfe1PiX5gg=;
 b=6qZaxrdAZgmG/1ElC02O2MPQykhDIGG5DyeUPj2xAHDMpoa0nZChIuBfYMkRt6ScYr
 97e5CuGF9sAnT/0Zu1wDxgzowRInNqIlsONOfNH60ftfo/oaEVvo06x283KJ/kLJ/1RM
 e842Il9HwLltNyO89sUxkvRY0S8+KWGedBX5KMcCKmRw+s4GQ6pDbVWVmSOBUHcL5tjO
 y1oznJLHazPa3/e7a1vqBsF3RwCutGvgz7GRXBh2qckrmtlugmcaxK/40uAiSWUbOK18
 rwyFdJmasgLjO3EGpZ/Z4XKT/T6QjD9W9cEXTJX6e4lpWEcDiGW9xMdUJA43hqAkvDZ1
 gBfQ==
X-Gm-Message-State: AFqh2kqBPftgJ6ZNpsrDIrGeFfCrm3dZxnz+IESHJe4/8Dg7ruZD3DzE
 efeOj1R4yEk9HmjX0lo8+kNlLamYGpojuIj6SyayhDFSrWgip1rNy2Acv3HrwneSnA6nRF1MOJd
 bgwxMGMsa59s5OA0k4UUMMxh6KkoTXpA=
X-Received: by 2002:a05:690c:dc3:b0:4db:3ac0:78a3 with SMTP id
 db3-20020a05690c0dc300b004db3ac078a3mr608889ywb.266.1673600838105; 
 Fri, 13 Jan 2023 01:07:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv6uZnNtu9MuyOM9Ac6/Z2wAAFTSoHokuYbNfpdO6ixawjBlFPjrFxVFfGwPAE7ad1i41HHvl57fpCEub3fSvg=
X-Received: by 2002:a05:690c:dc3:b0:4db:3ac0:78a3 with SMTP id
 db3-20020a05690c0dc300b004db3ac078a3mr608879ywb.266.1673600837902; Fri, 13
 Jan 2023 01:07:17 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-13-eperezma@redhat.com>
 <CACGkMEt8cMM1UxVzxb0eHeaWSpR0ApvGzaF901vrM4m-uGMiPA@mail.gmail.com>
 <7438853f-8d5e-33fb-1e53-b4a0036f0b7d@intel.com>
 <CACGkMEtwcjExouCbnMrQ3TcAkXJH4mv63ud-ROEUu6mH+53C6Q@mail.gmail.com>
In-Reply-To: <CACGkMEtwcjExouCbnMrQ3TcAkXJH4mv63ud-ROEUu6mH+53C6Q@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 13 Jan 2023 10:06:41 +0100
Message-ID: <CAJaqyWfijv2doQ8OAiiWdYvrWtmLPwJcnFtO+aUuoTa0jSL73A@mail.gmail.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Fri, Jan 13, 2023 at 4:39 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Jan 13, 2023 at 11:25 AM Zhu, Lingshan <lingshan.zhu@intel.com> w=
rote:
> >
> >
> >
> > On 1/13/2023 10:31 AM, Jason Wang wrote:
> > > On Fri, Jan 13, 2023 at 1:27 AM Eugenio P=C3=A9rez <eperezma@redhat.c=
om> wrote:
> > >> Spuriously kick the destination device's queue so it knows in case t=
here
> > >> are new descriptors.
> > >>
> > >> RFC: This is somehow a gray area. The guest may have placed descript=
ors
> > >> in a virtqueue but not kicked it, so it might be surprised if the de=
vice
> > >> starts processing it.
> > > So I think this is kind of the work of the vDPA parent. For the paren=
t
> > > that needs this trick, we should do it in the parent driver.
> > Agree, it looks easier implementing this in parent driver,
> > I can implement it in ifcvf set_vq_ready right now
>
> Great, but please check whether or not it is really needed.
>
> Some device implementation could check the available descriptions
> after DRIVER_OK without waiting for a kick.
>

So IIUC we can entirely drop this from the series (and I hope we can).
But then, what with the devices that does *not* check for them?

If we drop it it seems to me we must mandate devices to check for
descriptors at queue_enable. The queue could stall if not, isn't it?

Thanks!

> Thanks
>
> >
> > Thanks
> > Zhu Lingshan
> > >
> > > Thanks
> > >
> > >> However, that information is not in the migration stream and it shou=
ld
> > >> be an edge case anyhow, being resilient to parallel notifications fr=
om
> > >> the guest.
> > >>
> > >> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > >> ---
> > >>   hw/virtio/vhost-vdpa.c | 5 +++++
> > >>   1 file changed, 5 insertions(+)
> > >>
> > >> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > >> index 40b7e8706a..dff94355dd 100644
> > >> --- a/hw/virtio/vhost-vdpa.c
> > >> +++ b/hw/virtio/vhost-vdpa.c
> > >> @@ -732,11 +732,16 @@ static int vhost_vdpa_set_vring_ready(struct v=
host_dev *dev, int ready)
> > >>       }
> > >>       trace_vhost_vdpa_set_vring_ready(dev);
> > >>       for (i =3D 0; i < dev->nvqs; ++i) {
> > >> +        VirtQueue *vq;
> > >>           struct vhost_vring_state state =3D {
> > >>               .index =3D dev->vq_index + i,
> > >>               .num =3D 1,
> > >>           };
> > >>           vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
> > >> +
> > >> +        /* Preemptive kick */
> > >> +        vq =3D virtio_get_queue(dev->vdev, dev->vq_index + i);
> > >> +        event_notifier_set(virtio_queue_get_host_notifier(vq));
> > >>       }
> > >>       return 0;
> > >>   }
> > >> --
> > >> 2.31.1
> > >>
> >
>


