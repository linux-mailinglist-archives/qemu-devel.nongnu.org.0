Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F426A9BD5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:36:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY8NY-0000hL-TE; Fri, 03 Mar 2023 11:35:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pY8NU-0000g3-G9
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:35:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pY8NR-00070n-LJ
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:35:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677861324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jh9Nzfj9sBC79eOOdrOykBI+FQi2AOIJvVfXCNXNiUU=;
 b=dEDtlGNzN1L8R11qxyQrR68sOobamJv+DtiLyaWcLNDAeF8Tl5y5vYV4SSIHbPYQaqsTTp
 +hmmYe7kiy0RKP9jSVNrRTw1R60O55STX+YuwRIqy+SBFA+71gsELVS4qoBEnY3PFx4AJT
 I55U+6bQkssaCxi/E4lzO6bA9wdCzik=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-pyUgcUUUMPi7UW7m7mx8Xg-1; Fri, 03 Mar 2023 11:35:23 -0500
X-MC-Unique: pyUgcUUUMPi7UW7m7mx8Xg-1
Received: by mail-yb1-f198.google.com with SMTP id
 d7-20020a25adc7000000b00953ffdfbe1aso2902639ybe.23
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 08:35:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677861322;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jh9Nzfj9sBC79eOOdrOykBI+FQi2AOIJvVfXCNXNiUU=;
 b=GVV6AjI8BSpOn0HbxSOWUg+6D4PvYdqR8xU7rVpe6XzX9/2xWpJ4n5M21sEOyCZISb
 smM2aMTaGQl5wixfT1pcgdAoVVKZLmApXpGkjorZaM+lrEFIA6xLqoPv5RCJyo+GCQDA
 BxLEiy0vWtygSVIrLbOCOlLtDhWxwn2dB2AKFJrFNXwyOzCf0HtqJJUOVjHIIs+n6+9S
 8DFc5B3UhVGzVlS8MYt71wpvFh+yVWMOoxFLsRzc2VTATA4DwR8RAJ/6XVeKEoDi0hUj
 69DoIuqiXR+4otlD/YzXrBAj9VsaVpuj1muarKMM13BHSdtSfz4lQJlBliz1Hq/ipIWG
 BLxg==
X-Gm-Message-State: AO0yUKXcN0kN8cuqJXPfILcR9VBUGsyTg5awKilOcQBz39YEZT34jlov
 ZckZsZQPD/dkZA6WwuzlFdZJssw4ATGPfY/gWbiWXsDiNTi7DnjkVFV2Fhs7nErtOpyHr3d/J5W
 11XNCVahbrkW8zOF4F2f8jP785/9FDjI=
X-Received: by 2002:a25:9c05:0:b0:a6f:b653:9f18 with SMTP id
 c5-20020a259c05000000b00a6fb6539f18mr1165540ybo.2.1677861322724; 
 Fri, 03 Mar 2023 08:35:22 -0800 (PST)
X-Google-Smtp-Source: AK7set+0EMrf3hjJ0voW9+dP8TxkXfgelywU9B/SAxT+mTsZDGyGaCAztwktRrY6/pDaDjTewdv6WA0aGhLLgBgU3oc=
X-Received: by 2002:a25:9c05:0:b0:a6f:b653:9f18 with SMTP id
 c5-20020a259c05000000b00a6fb6539f18mr1165522ybo.2.1677861322445; Fri, 03 Mar
 2023 08:35:22 -0800 (PST)
MIME-Version: 1.0
References: <20230224155438.112797-1-eperezma@redhat.com>
 <20230224155438.112797-8-eperezma@redhat.com>
 <32496de6-e1f7-a37b-3c82-5d294a9dd339@oracle.com>
In-Reply-To: <32496de6-e1f7-a37b-3c82-5d294a9dd339@oracle.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 3 Mar 2023 17:34:46 +0100
Message-ID: <CAJaqyWdm4mYUv_Jw-=2g8_D8sPmfKSGDkuKDESCm4aTzjfx_KQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/15] vdpa: add vhost_vdpa_suspend
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: qemu-devel@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>, 
 Shannon Nelson <snelson@pensando.io>, Jason Wang <jasowang@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Laurent Vivier <lvivier@redhat.com>,
 alvaro.karsz@solid-run.com, 
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org, 
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Parav Pandit <parav@mellanox.com>, Eli Cohen <eli@mellanox.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>
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

On Wed, Mar 1, 2023 at 2:30=E2=80=AFAM Si-Wei Liu <si-wei.liu@oracle.com> w=
rote:
>
>
>
> On 2/24/2023 7:54 AM, Eugenio P=C3=A9rez wrote:
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
> > v4:
> > * Look for _F_SUSPEND at vhost_dev->backend_cap, not backend_features
> > * Fall back on reset & fetch used idx from guest's memory
> > ---
> >   hw/virtio/vhost-vdpa.c | 25 +++++++++++++++++++++++++
> >   hw/virtio/trace-events |  1 +
> >   2 files changed, 26 insertions(+)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 228677895a..f542960a64 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -712,6 +712,7 @@ static int vhost_vdpa_reset_device(struct vhost_dev=
 *dev)
> >
> >       ret =3D vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
> >       trace_vhost_vdpa_reset_device(dev, status);
> > +    v->suspended =3D false;
> >       return ret;
> >   }
> >
> > @@ -1109,6 +1110,29 @@ static void vhost_vdpa_svqs_stop(struct vhost_de=
v *dev)
> >       }
> >   }
> >
> > +static void vhost_vdpa_suspend(struct vhost_dev *dev)
> > +{
> > +    struct vhost_vdpa *v =3D dev->opaque;
> > +    int r;
> > +
> > +    if (!vhost_vdpa_first_dev(dev)) {
> > +        return;
> > +    }
> > +
> > +    if (!(dev->backend_cap & BIT_ULL(VHOST_BACKEND_F_SUSPEND))) {
> Polarity reversed. This ends up device getting reset always even if the
> backend offers _F_SUSPEND.
>

Good catch, I'll fix it in v5.

Thanks!

> -Siwei
>
> > +        trace_vhost_vdpa_suspend(dev);
> > +        r =3D ioctl(v->device_fd, VHOST_VDPA_SUSPEND);
> > +        if (unlikely(r)) {
> > +            error_report("Cannot suspend: %s(%d)", g_strerror(errno), =
errno);
> > +        } else {
> > +            v->suspended =3D true;
> > +            return;
> > +        }
> > +    }
> > +
> > +    vhost_vdpa_reset_device(dev);
> > +}
> > +
> >   static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
> >   {
> >       struct vhost_vdpa *v =3D dev->opaque;
> > @@ -1123,6 +1147,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev =
*dev, bool started)
> >           }
> >           vhost_vdpa_set_vring_ready(dev);
> >       } else {
> > +        vhost_vdpa_suspend(dev);
> >           vhost_vdpa_svqs_stop(dev);
> >           vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
> >       }
> > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > index a87c5f39a2..8f8d05cf9b 100644
> > --- a/hw/virtio/trace-events
> > +++ b/hw/virtio/trace-events
> > @@ -50,6 +50,7 @@ vhost_vdpa_set_vring_ready(void *dev) "dev: %p"
> >   vhost_vdpa_dump_config(void *dev, const char *line) "dev: %p %s"
> >   vhost_vdpa_set_config(void *dev, uint32_t offset, uint32_t size, uint=
32_t flags) "dev: %p offset: %"PRIu32" size: %"PRIu32" flags: 0x%"PRIx32
> >   vhost_vdpa_get_config(void *dev, void *config, uint32_t config_len) "=
dev: %p config: %p config_len: %"PRIu32
> > +vhost_vdpa_suspend(void *dev) "dev: %p"
> >   vhost_vdpa_dev_start(void *dev, bool started) "dev: %p started: %d"
> >   vhost_vdpa_set_log_base(void *dev, uint64_t base, unsigned long long =
size, int refcnt, int fd, void *log) "dev: %p base: 0x%"PRIx64" size: %llu =
refcnt: %d fd: %d log: %p"
> >   vhost_vdpa_set_vring_addr(void *dev, unsigned int index, unsigned int=
 flags, uint64_t desc_user_addr, uint64_t used_user_addr, uint64_t avail_us=
er_addr, uint64_t log_guest_addr) "dev: %p index: %u flags: 0x%x desc_user_=
addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" =
log_guest_addr: 0x%"PRIx64
>


