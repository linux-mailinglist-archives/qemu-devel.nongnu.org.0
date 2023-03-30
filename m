Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 181716CFB5E
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 08:16:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phlZn-0008P0-Uz; Thu, 30 Mar 2023 02:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1phlZb-0008Lv-HR
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 02:15:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1phlZZ-0000gf-Pe
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 02:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680156944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dfpJZ5Q4PDE3gtLd2xOQdUbuOUGSWYys34+KAHsU+0o=;
 b=DG0nahEETQOhtn6Mc5+B5n8Ss1rpOEX8JIfGQU88S5EWvN+NUVPCeTMdfHxV9GHcQE12ew
 /jmzKvAgnCDnkYGz7SbnBplbvhhqEZmborTDD0T1xEFxQIx+1Afi/GH0k3pN2HctmySDR4
 53k7wgPpAYL/SpXuTw8mAmLr5GvUxBg=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-ApHTjd0tP-u--RQdEwGQAw-1; Thu, 30 Mar 2023 02:15:42 -0400
X-MC-Unique: ApHTjd0tP-u--RQdEwGQAw-1
Received: by mail-oi1-f198.google.com with SMTP id
 f18-20020a05680814d200b003877ce3bfb4so4191251oiw.3
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 23:15:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680156942; x=1682748942;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dfpJZ5Q4PDE3gtLd2xOQdUbuOUGSWYys34+KAHsU+0o=;
 b=s71UWtolF0tzTJFFBDqPQ8p/RWMGuB9EhT5UPdXOxyuvh6XImmT7mDV2v+QgDf5tfb
 nd3bMmUTvOV2dIxmCikZwY6vO4/lPd7pPlIErtyygCeT65nYWCXbG3aFjBOKbMT1xETZ
 WqEYh4xuZRAQqeY69elm2TxcrF7Szi2SiytJv+wayU4HpvxJf7ssKVVCHQMY3sh9Q2Vd
 eD23fst2kWCMOo8g+H4mSK65xHFsKvsfE1ng3Z0UhC16k9W2tuChXgFqNgirjZiwuU+u
 58YqwIrgAeegcqZffJUZ6Hg10idA6C8hQkPOW6KJt6IMKHSjlS/Rp4KLl+WeZxUEa8Ok
 1s2A==
X-Gm-Message-State: AO0yUKVLeUjkudmWC0ogF7m2IjRSBonRBvWXSvvAuXZqDdZqMufP5Ng0
 Z7sG3f+mQqNoD53e0fCwDfy6picdAeu5PDyW5B/MbxuNsbUALIhvrsP5bvKu5Vg5iCODdNAvPQM
 bHfrlZ8yCs4SnGIOPOO6MLAk63u36gfs=
X-Received: by 2002:aca:2306:0:b0:384:c4a:1b49 with SMTP id
 e6-20020aca2306000000b003840c4a1b49mr6201684oie.9.1680156942254; 
 Wed, 29 Mar 2023 23:15:42 -0700 (PDT)
X-Google-Smtp-Source: AK7set9rxLMR2CsDgIz1p1ERQg8vqtkQ+yeKVtPdrZYyJtkf8F/7P6z7RvMGWZ61RcXL8anVbPPutXPNqtEYnXN6yk0=
X-Received: by 2002:aca:2306:0:b0:384:c4a:1b49 with SMTP id
 e6-20020aca2306000000b003840c4a1b49mr6201669oie.9.1680156942037; Wed, 29 Mar
 2023 23:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230323195404.1247326-1-eperezma@redhat.com>
 <20230323195404.1247326-4-eperezma@redhat.com>
In-Reply-To: <20230323195404.1247326-4-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 30 Mar 2023 14:15:31 +0800
Message-ID: <CACGkMEtP9fUNT3toDLQkybEaU-JvMg_KLa3s9Gu5vRq0s2t6aA@mail.gmail.com>
Subject: Re: [PATCH for 8.1 v2 3/6] vdpa: add vhost_vdpa_set_dev_features_fd
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Gautam Dawar <gdawar@xilinx.com>, alvaro.karsz@solid-run.com, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>,
 si-wei.liu@oracle.com, 
 Eli Cohen <eli@mellanox.com>, Shannon Nelson <snelson@pensando.io>, 
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 longpeng2@huawei.com, Harpreet Singh Anand <hanand@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Fri, Mar 24, 2023 at 3:54=E2=80=AFAM Eugenio P=C3=A9rez <eperezma@redhat=
.com> wrote:
>
> This allows to set the features of a vhost-vdpa device from external
> subsystems like vhost-net.  It is used in subsequent patches to
> negotiate features and probe for CVQ ASID isolation.
>
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  include/hw/virtio/vhost-vdpa.h |  1 +
>  hw/virtio/vhost-vdpa.c         | 20 +++++++++++++-------
>  2 files changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdp=
a.h
> index 28de7da91e..a9cb6f3a32 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -55,6 +55,7 @@ typedef struct vhost_vdpa {
>  } VhostVDPA;
>
>  void vhost_vdpa_reset_status_fd(int fd);
> +int vhost_vdpa_set_dev_features_fd(int fd, uint64_t features);
>  int vhost_vdpa_get_iova_range(int fd, struct vhost_vdpa_iova_range *iova=
_range);
>
>  int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 7a2053b8d9..acd5be46a9 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -651,11 +651,22 @@ static int vhost_vdpa_set_mem_table(struct vhost_de=
v *dev,
>      return 0;
>  }
>
> +int vhost_vdpa_set_dev_features_fd(int fd, uint64_t features)
> +{
> +    int ret;
> +
> +    ret =3D vhost_vdpa_call_fd(fd, VHOST_SET_FEATURES, &features);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    return vhost_vdpa_add_status_fd(fd, VIRTIO_CONFIG_S_FEATURES_OK);
> +}
> +
>  static int vhost_vdpa_set_features(struct vhost_dev *dev,
>                                     uint64_t features)
>  {
>      struct vhost_vdpa *v =3D dev->opaque;
> -    int ret;
>
>      if (!vhost_vdpa_first_dev(dev)) {
>          return 0;
> @@ -678,12 +689,7 @@ static int vhost_vdpa_set_features(struct vhost_dev =
*dev,
>      }
>
>      trace_vhost_vdpa_set_features(dev, features);
> -    ret =3D vhost_vdpa_call(dev, VHOST_SET_FEATURES, &features);
> -    if (ret) {
> -        return ret;
> -    }
> -
> -    return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_FEATURES_OK);
> +    return vhost_vdpa_set_dev_features_fd(vhost_vdpa_dev_fd(dev), featur=
es);
>  }
>
>  static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
> --
> 2.31.1
>


