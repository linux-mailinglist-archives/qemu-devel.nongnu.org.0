Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A7D69978D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:37:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfMn-0002f1-HN; Thu, 16 Feb 2023 09:36:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pSfMk-0002ek-Av
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:36:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pSfMg-0003ja-2F
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:36:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676558160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3N61449qEQhmonLxw+C14O7dIGoQ0pQhDOvdh1r11ic=;
 b=I2p0bBEkZgOI41cEGbZuUAcAQJbZ4A7Yr7fEsQ3brjwMKnKX6n6N6LnK7W8JUnkBfEHZDU
 Z4Uy7kYuUdZ0gDj9bcKLuZI9wQLIMt5pX7Yz9zTkCZLe6mT2AwlhD6jnIheKj0tOohdBB3
 b3Kz/vsBkjLVKJPI7S1bMd0VpNx0IdM=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-608-HzpB32SHN4-nfo9z7JhSNQ-1; Thu, 16 Feb 2023 09:35:56 -0500
X-MC-Unique: HzpB32SHN4-nfo9z7JhSNQ-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-52f2ab6a942so21913357b3.14
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 06:35:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3N61449qEQhmonLxw+C14O7dIGoQ0pQhDOvdh1r11ic=;
 b=GStsDdDDtD9CVJK8ULsU6FsuzWt4DzIY7L1+nTV/GMRzJV6WPPTO74qq7g3GwzBe8y
 6QAUueeMZScz+E4TcvLsv7rBRMRl2sWhlwdKKcbWQoxd3mgZ7UPD4oL+0fAup4LTCXrN
 WGFq5cxxcw1toFY0825gkFVQERoDsYCH75yw8EoF1M11aihPjMTZF/dFMawDi1HHsRb3
 /9kvZcBx5oksng3nlmASkEsMZCRrJAkLBtvz28WlgOAriyfbHCN75p1DpV7xZxuYew5s
 hMn60xXJcc6RAoQbyKJ1eqSgOfmYSxnsVsclAupZdRDu54250bbnYFIoApZmsuAVI//x
 0GkA==
X-Gm-Message-State: AO0yUKXAJGdRJh28vDMkk9c/9lScxGSZI0/GCogmxKpLr2Xs+//ovdHc
 Sg7QBYvYbxxw3ji5hxuFF3fbmKm7krbNm8ug/iKkVTH7yooO5FF3SP50QD8pyEYeKJ0nDk9b6PR
 zhFR2ZuivQP+ByEXy0UGJ8Zmpl8kNbwM=
X-Received: by 2002:a5b:e86:0:b0:874:89a9:c09a with SMTP id
 z6-20020a5b0e86000000b0087489a9c09amr509584ybr.148.1676558155585; 
 Thu, 16 Feb 2023 06:35:55 -0800 (PST)
X-Google-Smtp-Source: AK7set8tit6+MRyYJAQmVWNC5JuEls6SKzW6BYQ5eckUHvkl44GRLq1uuIzYEeq565nvqq+UeBD1vXYysZSGJJiucxA=
X-Received: by 2002:a5b:e86:0:b0:874:89a9:c09a with SMTP id
 z6-20020a5b0e86000000b0087489a9c09amr509575ybr.148.1676558155358; Thu, 16 Feb
 2023 06:35:55 -0800 (PST)
MIME-Version: 1.0
References: <20230215173850.298832-1-eperezma@redhat.com>
 <20230215173850.298832-5-eperezma@redhat.com>
 <CAJs=3_Ci0m2wGYmw6cbdmJmeM+Gv05z2sJ_mdnAbpTRm9pbP5w@mail.gmail.com>
In-Reply-To: <CAJs=3_Ci0m2wGYmw6cbdmJmeM+Gv05z2sJ_mdnAbpTRm9pbP5w@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 16 Feb 2023 15:35:19 +0100
Message-ID: <CAJaqyWcOYcsyUy7q4tsdMRXSXRwdR=tvLFdPbKY0ajg+zN8W7A@mail.gmail.com>
Subject: Re: [PATCH v3 04/14] vdpa: add vhost_vdpa_suspend
To: Alvaro Karsz <alvaro.karsz@solid-run.com>
Cc: qemu-devel@nongnu.org, Cindy Lu <lulu@redhat.com>, 
 Shannon Nelson <snelson@pensando.io>, longpeng2@huawei.com, 
 virtualization@lists.linux-foundation.org, 
 Harpreet Singh Anand <hanand@xilinx.com>, si-wei.liu@oracle.com, 
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Laurent Vivier <lvivier@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>
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

On Thu, Feb 16, 2023 at 2:48 PM Alvaro Karsz <alvaro.karsz@solid-run.com> w=
rote:
>
> Hi,
>
> > The function vhost.c:vhost_dev_stop fetches the vring base so the vq
> > state can be migrated to other devices.  However, this is unreliable in
> > vdpa, since we didn't signal the device to suspend the queues, making
> > the value fetched useless.
> >
> > Suspend the device if possible before fetching first and subsequent
> > vring bases.
> >
> > Moreover, vdpa totally reset and wipes the device at the last device
> > before fetch its vrings base, making that operation useless in the last
> > device. This will be fixed in later patches of this series.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/virtio/vhost-vdpa.c | 19 +++++++++++++++++++
> >  hw/virtio/trace-events |  1 +
> >  2 files changed, 20 insertions(+)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 1d0209d6ad..796f38d64e 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -1109,6 +1109,24 @@ static void vhost_vdpa_svqs_stop(struct vhost_de=
v *dev)
> >      }
> >  }
> >
> > +static void vhost_vdpa_suspend(struct vhost_dev *dev)
> > +{
> > +    struct vhost_vdpa *v =3D dev->opaque;
> > +    int r;
> > +
> > +    if (!vhost_vdpa_first_dev(dev) ||
> > +        !(dev->backend_features & BIT_ULL(VHOST_BACKEND_F_SUSPEND))) {
>
> Shouldn't it be backend_cap?
>

Good catch, I reversed it by mistake.

I'll send a v4 once I fix this and other problems found. Thanks!


