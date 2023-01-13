Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3FE66899D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 03:33:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG9rZ-0003F3-U0; Thu, 12 Jan 2023 21:32:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pG9rY-0003Ea-5n
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 21:32:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pG9rW-0000y7-Nb
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 21:32:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673577129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WRTveB47dnP5lQkFO4HXYNqIU+jlobkH8cziY1hDp14=;
 b=cc2oKhofo9aCzS5pEOBLGwh52ROJhNAXTgS0HkIpespUruIYjmZ9Ta6MBCVh+lbPlozUsp
 dyInr/CzB2VwGJK3++/+7qlDT/f4OvfCW+auA9S7QOgSolUK2zTpqMe1/MWeV9/yClq/ix
 OS9XYwnFVAir/5n0ftQxGiinwHbEywI=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-651-SnqD2W3UPIidayG-abA_QQ-1; Thu, 12 Jan 2023 21:32:08 -0500
X-MC-Unique: SnqD2W3UPIidayG-abA_QQ-1
Received: by mail-oo1-f72.google.com with SMTP id
 q28-20020a056820029c00b004d2bbed17b6so7622492ood.23
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 18:32:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WRTveB47dnP5lQkFO4HXYNqIU+jlobkH8cziY1hDp14=;
 b=goaygw4k93xDiGsqEfs9/Xd7+85GUKb7dqIYoOF4r6uQpbgcV1yn/It5bHt8v0FQR7
 fFbfB/1R0LmZrg483uIBmbmzZHaWU2u3bkxhD9ugxn0pdsjtNuL5Jel7d268F7Em5PZw
 pzZddWKKil29NOuRGKY64HymKEAs7NwGIcbtgjSKomBlgYz92l7O9eSnDE37z5AfJH0F
 ZU6ooMcci3vwRmMIHyAs3LK6bf5NNFhGPVc0UoOvP8pfKaQREwjmO8ZOOMP0GPKyYGV2
 EnHtpq01D2HAOggkoXym9T2ZmPFtaecytgf9NmzbYgMCdDfuCgl/zaqGt6MFuDsVC27I
 iyxg==
X-Gm-Message-State: AFqh2koVCwFDlAUwauN4FN9F57BQeo+XXuofD0vRCdBSKJNycsoB7nZc
 BNv/+2XMPqnLc4cfxcbufhOMHLrk5qlkbAfsB3mtqrhByc20Y9my1n2NcVjDpM/H0lS3ACHbKJl
 XozTdiGUivzZwJTWsCwHlHKEYcfOJXBw=
X-Received: by 2002:a05:6870:9e9a:b0:15b:96b5:9916 with SMTP id
 pu26-20020a0568709e9a00b0015b96b59916mr1305866oab.280.1673577127477; 
 Thu, 12 Jan 2023 18:32:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvFOjpc+nDZgVA/nm8OnAMpH4YbAcHkB/n5ZvjhWJJpvECmUUd621vPYW+HeEDDkLYky6zDz6cmpmJ9cZZYVLM=
X-Received: by 2002:a05:6870:9e9a:b0:15b:96b5:9916 with SMTP id
 pu26-20020a0568709e9a00b0015b96b59916mr1305844oab.280.1673577127204; Thu, 12
 Jan 2023 18:32:07 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-13-eperezma@redhat.com>
In-Reply-To: <20230112172434.760850-13-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 13 Jan 2023 10:31:56 +0800
Message-ID: <CACGkMEt8cMM1UxVzxb0eHeaWSpR0ApvGzaF901vrM4m-uGMiPA@mail.gmail.com>
Subject: Re: [RFC v2 12/13] vdpa: preemptive kick at enable
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, si-wei.liu@oracle.com, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com, 
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>, 
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

On Fri, Jan 13, 2023 at 1:27 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Spuriously kick the destination device's queue so it knows in case there
> are new descriptors.
>
> RFC: This is somehow a gray area. The guest may have placed descriptors
> in a virtqueue but not kicked it, so it might be surprised if the device
> starts processing it.

So I think this is kind of the work of the vDPA parent. For the parent
that needs this trick, we should do it in the parent driver.

Thanks

>
> However, that information is not in the migration stream and it should
> be an edge case anyhow, being resilient to parallel notifications from
> the guest.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-vdpa.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 40b7e8706a..dff94355dd 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -732,11 +732,16 @@ static int vhost_vdpa_set_vring_ready(struct vhost_=
dev *dev, int ready)
>      }
>      trace_vhost_vdpa_set_vring_ready(dev);
>      for (i =3D 0; i < dev->nvqs; ++i) {
> +        VirtQueue *vq;
>          struct vhost_vring_state state =3D {
>              .index =3D dev->vq_index + i,
>              .num =3D 1,
>          };
>          vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
> +
> +        /* Preemptive kick */
> +        vq =3D virtio_get_queue(dev->vdev, dev->vq_index + i);
> +        event_notifier_set(virtio_queue_get_host_notifier(vq));
>      }
>      return 0;
>  }
> --
> 2.31.1
>


