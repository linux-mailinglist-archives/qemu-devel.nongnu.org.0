Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FD062D2DC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 06:45:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovXhg-0002fP-Oo; Thu, 17 Nov 2022 00:44:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ovXhd-0002co-5l
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 00:44:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ovXhb-000077-J3
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 00:44:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668663882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FYOr5hpybhH+9zqQ2jktdqtrLOvIQkG/NJ+Z4lZqKJY=;
 b=KaE4PsI14bk/Gz1P5xv5ULmx52YP5Zi0//W+KTN95n6jLdyn51vUwa/IpfntSitYHbh8dF
 M0SC2gy3zstgDSsC2pOw5QQS5bDbxyNm9aNxKHSMKNXw3gx51cq2zPksbo9coMlEgxeBCk
 Wdb0pueUR/451hc6et9MpHMDqmAGYVk=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-279-WXCHqy5VN-GSaEbZrlTaNg-1; Thu, 17 Nov 2022 00:44:41 -0500
X-MC-Unique: WXCHqy5VN-GSaEbZrlTaNg-1
Received: by mail-oo1-f70.google.com with SMTP id
 n27-20020a4a611b000000b0048067b2a6f7so483608ooc.6
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 21:44:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FYOr5hpybhH+9zqQ2jktdqtrLOvIQkG/NJ+Z4lZqKJY=;
 b=uHGQ2t+k30JSAOg+1hvvAKxW465bX8qP7nZqvDQbxHJnVLa2OY3M+zV2uzLmuTebxq
 MRz0h6s8Jak06b8hHGrgTgRyg1EDykzd36Yk8DJMLYGCDNfUBZMjthIsp5ecvG60Ro6q
 fyVOZiZ0FXKqrgklFgILsJmKkpcNA1Dk0F6an1OifP02/IDRoI9d7dT0j3oOn7D0BU0O
 n3pCJKBAgnEr/5bANplzXqTEy9Denw2tJu1ssxloNDvfLPYJl8BzaRz+OQm3OFx/wSaZ
 G2hffKvDh8HPGtz4+C26QzL8tCDvMLcfztBLc/FVA9js1GC2r1vDucmeWJp9QHO/3Lm4
 gtjA==
X-Gm-Message-State: ANoB5pl2fOaoDQpHiReUjlUlrIqTIfCzsBlwLIwxEqW0SHkgeSrjrdIG
 gq6H127L0v2bKiuoijCfgOSCwGa9IJfUnMYmrEKrunMDBVx+A6qCdl9HpwP2nH7nsRpFX5yk8KO
 aXqmiAwA5nVhlvPQifNmtX4sfq5MhUME=
X-Received: by 2002:a4a:94a9:0:b0:480:8f4a:7062 with SMTP id
 k38-20020a4a94a9000000b004808f4a7062mr669928ooi.57.1668663880498; 
 Wed, 16 Nov 2022 21:44:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5j1BanuW0SdKc18jcM4HSY4QyInPXCP+MLBD8FDg44fXKMfa0SUxH18LeKItWdoRIKcUv3y49kTZubn44lkVc=
X-Received: by 2002:a4a:94a9:0:b0:480:8f4a:7062 with SMTP id
 k38-20020a4a94a9000000b004808f4a7062mr669911ooi.57.1668663880252; Wed, 16 Nov
 2022 21:44:40 -0800 (PST)
MIME-Version: 1.0
References: <20221116150556.1294049-1-eperezma@redhat.com>
 <20221116150556.1294049-6-eperezma@redhat.com>
In-Reply-To: <20221116150556.1294049-6-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 17 Nov 2022 13:44:29 +0800
Message-ID: <CACGkMEsOLOYuiA=HUBmbgsSCjHZiD0N6UELz3hNRX7ziW=8SZQ@mail.gmail.com>
Subject: Re: [PATCH for 8.0 v7 05/10] vdpa: move SVQ vring features check to
 net/
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Parav Pandit <parav@mellanox.com>, Si-Wei Liu <si-wei.liu@oracle.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, kvm@vger.kernel.org
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

On Wed, Nov 16, 2022 at 11:06 PM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
>
> The next patches will start control SVQ if possible. However, we don't
> know if that will be possible at qemu boot anymore.
>
> Since the moved checks will be already evaluated at net/ to know if it
> is ok to shadow CVQ, move them.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  hw/virtio/vhost-vdpa.c | 33 ++-------------------------------
>  net/vhost-vdpa.c       |  3 ++-
>  2 files changed, 4 insertions(+), 32 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 3df2775760..146f0dcb40 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -402,29 +402,9 @@ static int vhost_vdpa_get_dev_features(struct vhost_=
dev *dev,
>      return ret;
>  }
>
> -static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa=
 *v,
> -                               Error **errp)
> +static void vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdp=
a *v)
>  {
>      g_autoptr(GPtrArray) shadow_vqs =3D NULL;
> -    uint64_t dev_features, svq_features;
> -    int r;
> -    bool ok;
> -
> -    if (!v->shadow_vqs_enabled) {
> -        return 0;
> -    }
> -
> -    r =3D vhost_vdpa_get_dev_features(hdev, &dev_features);
> -    if (r !=3D 0) {
> -        error_setg_errno(errp, -r, "Can't get vdpa device features");
> -        return r;
> -    }
> -
> -    svq_features =3D dev_features;
> -    ok =3D vhost_svq_valid_features(svq_features, errp);
> -    if (unlikely(!ok)) {
> -        return -1;
> -    }
>
>      shadow_vqs =3D g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
>      for (unsigned n =3D 0; n < hdev->nvqs; ++n) {
> @@ -436,7 +416,6 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev=
, struct vhost_vdpa *v,
>      }
>
>      v->shadow_vqs =3D g_steal_pointer(&shadow_vqs);
> -    return 0;
>  }
>
>  static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **=
errp)
> @@ -461,11 +440,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, vo=
id *opaque, Error **errp)
>      dev->opaque =3D  opaque ;
>      v->listener =3D vhost_vdpa_memory_listener;
>      v->msg_type =3D VHOST_IOTLB_MSG_V2;
> -    ret =3D vhost_vdpa_init_svq(dev, v, errp);
> -    if (ret) {
> -        goto err;
> -    }
> -
> +    vhost_vdpa_init_svq(dev, v);
>      vhost_vdpa_get_iova_range(v);
>
>      if (!vhost_vdpa_first_dev(dev)) {
> @@ -476,10 +451,6 @@ static int vhost_vdpa_init(struct vhost_dev *dev, vo=
id *opaque, Error **errp)
>                                 VIRTIO_CONFIG_S_DRIVER);
>
>      return 0;
> -
> -err:
> -    ram_block_discard_disable(false);
> -    return ret;
>  }
>
>  static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index e98d5f5eac..dd9cea42d0 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -117,9 +117,10 @@ static bool vhost_vdpa_net_valid_svq_features(uint64=
_t features, Error **errp)
>      if (invalid_dev_features) {
>          error_setg(errp, "vdpa svq does not work with features 0x%" PRIx=
64,
>                     invalid_dev_features);
> +        return false;
>      }
>
> -    return !invalid_dev_features;
> +    return vhost_svq_valid_features(features, errp);
>  }
>
>  static int vhost_vdpa_net_check_device_id(struct vhost_net *net)
> --
> 2.31.1
>


