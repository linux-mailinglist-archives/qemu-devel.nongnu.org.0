Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAEB668A4D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 04:40:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGAuX-0005I7-SW; Thu, 12 Jan 2023 22:39:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pGAuV-0005Hx-I3
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 22:39:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pGAuT-00047h-H3
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 22:39:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673581156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mEmeq+vWvJVaqv8a06Gwaq89+2SOnyeHaGpf4ZXbRJM=;
 b=Vg1Js+ZcSSO/NxdHqAE5KLXFPmMq+rFNTdnnP1shb0PIXveHEjhoANH8yXQt0KQO9ME20Y
 ZCLx0q72W8or9GFaIpJ9M9/BFAHnNvntljQ8zjdFSk5xlxZpCFlJ0c95LzJUWg8ThZ1UMy
 /icusEW3vAn2fU7NQiCDrUt/9gQTyTE=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655-7nohsforPxaW1_4PPNiqkQ-1; Thu, 12 Jan 2023 22:39:14 -0500
X-MC-Unique: 7nohsforPxaW1_4PPNiqkQ-1
Received: by mail-ot1-f72.google.com with SMTP id
 r38-20020a05683044a600b00684a00af1e1so4991356otv.14
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 19:39:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mEmeq+vWvJVaqv8a06Gwaq89+2SOnyeHaGpf4ZXbRJM=;
 b=YVTVs2h9SFLmXOkYUW0LDVwL2bP/tLCsajoCYQSR8qkTZzbepSFiQrbA1vB9mhI7V9
 sPdLI27cB7Cy4Znwj2vboVsRia0QoZe7MNrFO/8rBEe1fCihqv0EeZy3BECaQeagAzcz
 FBZ12Atm5AVfnNdTsfudiD47RIqeOgj9nwUJN7ieLMndneznBj/9loyqqlwvPcL2eO7s
 xvT/VpK78nSQCDtONafSsrlhvxzLdYGjhIw4A4VXRz/MRKpCTLebBHmgmzTJkNfVxwut
 K+nHbZ5wCTqIH4G5bq3uVZNLXKSfuEN0CMg+Bng24WssGChpsWkfhZGCVF6cfk4Ior03
 1QPg==
X-Gm-Message-State: AFqh2kpZn7EFJbglh2LFW85LxkUNt72DSIHrKZXI6gCjzQHyLmwscKrf
 GDapHI1xK5sW8jCH91IcOj6YsKLkGAFJXibzH7+62a9F5VEHOElnYO2Hti1mKMMv0Lg5pgS3Jfz
 M4cLNEVYz6C99MT1FW+h3P8+3hcEpeo0=
X-Received: by 2002:a54:4e89:0:b0:35c:303d:fe37 with SMTP id
 c9-20020a544e89000000b0035c303dfe37mr3456269oiy.35.1673581153684; 
 Thu, 12 Jan 2023 19:39:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvj7EthUs0CjBr8WUJof2MQbx74EPa8kTEjq/zH2UOyrh3RazCN7AvNrmQ2m3Zz3+1DGpujN/ax+QZYDO2TQzs=
X-Received: by 2002:a54:4e89:0:b0:35c:303d:fe37 with SMTP id
 c9-20020a544e89000000b0035c303dfe37mr3456262oiy.35.1673581153450; Thu, 12 Jan
 2023 19:39:13 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-13-eperezma@redhat.com>
 <CACGkMEt8cMM1UxVzxb0eHeaWSpR0ApvGzaF901vrM4m-uGMiPA@mail.gmail.com>
 <7438853f-8d5e-33fb-1e53-b4a0036f0b7d@intel.com>
In-Reply-To: <7438853f-8d5e-33fb-1e53-b4a0036f0b7d@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 13 Jan 2023 11:39:02 +0800
Message-ID: <CACGkMEtwcjExouCbnMrQ3TcAkXJH4mv63ud-ROEUu6mH+53C6Q@mail.gmail.com>
Subject: Re: [RFC v2 12/13] vdpa: preemptive kick at enable
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 qemu-devel@nongnu.org, si-wei.liu@oracle.com, 
 Liuxiangdong <liuxiangdong5@huawei.com>,
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Fri, Jan 13, 2023 at 11:25 AM Zhu, Lingshan <lingshan.zhu@intel.com> wro=
te:
>
>
>
> On 1/13/2023 10:31 AM, Jason Wang wrote:
> > On Fri, Jan 13, 2023 at 1:27 AM Eugenio P=C3=A9rez <eperezma@redhat.com=
> wrote:
> >> Spuriously kick the destination device's queue so it knows in case the=
re
> >> are new descriptors.
> >>
> >> RFC: This is somehow a gray area. The guest may have placed descriptor=
s
> >> in a virtqueue but not kicked it, so it might be surprised if the devi=
ce
> >> starts processing it.
> > So I think this is kind of the work of the vDPA parent. For the parent
> > that needs this trick, we should do it in the parent driver.
> Agree, it looks easier implementing this in parent driver,
> I can implement it in ifcvf set_vq_ready right now

Great, but please check whether or not it is really needed.

Some device implementation could check the available descriptions
after DRIVER_OK without waiting for a kick.

Thanks

>
> Thanks
> Zhu Lingshan
> >
> > Thanks
> >
> >> However, that information is not in the migration stream and it should
> >> be an edge case anyhow, being resilient to parallel notifications from
> >> the guest.
> >>
> >> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >> ---
> >>   hw/virtio/vhost-vdpa.c | 5 +++++
> >>   1 file changed, 5 insertions(+)
> >>
> >> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >> index 40b7e8706a..dff94355dd 100644
> >> --- a/hw/virtio/vhost-vdpa.c
> >> +++ b/hw/virtio/vhost-vdpa.c
> >> @@ -732,11 +732,16 @@ static int vhost_vdpa_set_vring_ready(struct vho=
st_dev *dev, int ready)
> >>       }
> >>       trace_vhost_vdpa_set_vring_ready(dev);
> >>       for (i =3D 0; i < dev->nvqs; ++i) {
> >> +        VirtQueue *vq;
> >>           struct vhost_vring_state state =3D {
> >>               .index =3D dev->vq_index + i,
> >>               .num =3D 1,
> >>           };
> >>           vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
> >> +
> >> +        /* Preemptive kick */
> >> +        vq =3D virtio_get_queue(dev->vdev, dev->vq_index + i);
> >> +        event_notifier_set(virtio_queue_get_host_notifier(vq));
> >>       }
> >>       return 0;
> >>   }
> >> --
> >> 2.31.1
> >>
>


