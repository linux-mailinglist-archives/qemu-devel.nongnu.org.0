Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA9263CF53
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 07:44:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Gof-00005N-D7; Wed, 30 Nov 2022 01:43:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0Goc-0008Vf-Tj
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 01:43:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0Goa-0007oU-Sl
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 01:43:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669790607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xjd/oMdsjidgORS4x4dIOgj/JjLdO4P/IMxpTdg96xA=;
 b=HQeqM5vOAIateHtB9Wv0T+ooBVyoSoPH2vFdLFhtAfjHa0jKDbC7ATYvTHcsYUFgraKvXV
 O2K2nFZcsbBITVuumkas3/I9TmP43IzO+2JD+g07/Ja6oqek1WE3DvDlwFEaH+Uh2gMqkb
 oG4BiCqG1tEc/+3+hCsOT7V3jgvOQMs=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-527-C9N1t6jlMzC98uBTfTkQWw-1; Wed, 30 Nov 2022 01:43:26 -0500
X-MC-Unique: C9N1t6jlMzC98uBTfTkQWw-1
Received: by mail-oo1-f71.google.com with SMTP id
 x30-20020a4a621e000000b004a046991904so2905881ooc.20
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 22:43:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xjd/oMdsjidgORS4x4dIOgj/JjLdO4P/IMxpTdg96xA=;
 b=tKYnrkHilBG2avsvUa1gtezomcktAcaDEQ6ilVBvegsm7qsJktdS1Aurz3ImdA66pO
 8/IWYRfxMfAg5+5U9+wwniVmklTqUQWGvAwSHqxrBzzaNDzjS+9cAn36ShiRDJ+Vj6Zh
 E5+CzBuGPRnrjfBE5TjOyEUaUGqAMj1NNneyVaVoHkvxdU6wy198/IU3V33e2twO5mlp
 jRs4ANyTmx9gMxm5J5hg9HJxfD4vB6Lb7r+JZwLlg+ZpfDck5MwS39BAn8WEBbsiTAcu
 XFIKeKPoGPJadFVT3UPRv8CQ/b2or6ApsJZCCUkCXqZipFCm0tYotdEVs+nVzDNVG6c3
 WdyQ==
X-Gm-Message-State: ANoB5pnqcnld8SJDAS6KSd9OIxEB6Y5atmhP6Neq1hyuugns/WONWy34
 s0vuTiRidsDLfttqaTmT+l0H2vxTSp8b9P8rGK/5HTDwXdiy2ClWy98ejkUT8JcUMxST8P9P4pr
 Sw4bRrOptRGSc9PjgW1L1WZXrn298HVI=
X-Received: by 2002:a05:6830:6505:b0:66c:fb5b:4904 with SMTP id
 cm5-20020a056830650500b0066cfb5b4904mr29927895otb.237.1669790605425; 
 Tue, 29 Nov 2022 22:43:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6wxcs63mFAcy1jH7J5665PFD1BMgM89Ro6tgAYoev6mcYR4Dp5tkh800k5JC3UQ6Ue4Y1PO6VvmGKxC626baE=
X-Received: by 2002:a05:6830:6505:b0:66c:fb5b:4904 with SMTP id
 cm5-20020a056830650500b0066cfb5b4904mr29927873otb.237.1669790605193; Tue, 29
 Nov 2022 22:43:25 -0800 (PST)
MIME-Version: 1.0
References: <20221124155158.2109884-1-eperezma@redhat.com>
 <20221124155158.2109884-7-eperezma@redhat.com>
In-Reply-To: <20221124155158.2109884-7-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 30 Nov 2022 14:43:14 +0800
Message-ID: <CACGkMEubBA9NYR5ynT_2C=iMEk3fph2GEOBvcw73BOuqiFKzJg@mail.gmail.com>
Subject: Re: [PATCH for 8.0 v8 06/12] vdpa: extract
 vhost_vdpa_svq_allocate_iova_tree
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, 
 Cornelia Huck <cohuck@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, 
 Parav Pandit <parav@mellanox.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>
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

On Thu, Nov 24, 2022 at 11:52 PM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
>
> It can be allocated either if all virtqueues must be shadowed or if
> vdpa-net detects it can shadow only cvq.
>
> Extract in its own function so we can reuse it.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  net/vhost-vdpa.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 88e0eec5fa..9ee3bc4cd3 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -240,6 +240,22 @@ static NetClientInfo net_vhost_vdpa_info =3D {
>          .check_peer_type =3D vhost_vdpa_check_peer_type,
>  };
>
> +static int vhost_vdpa_get_iova_range(int fd,
> +                                     struct vhost_vdpa_iova_range *iova_=
range)
> +{
> +    int ret =3D ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
> +
> +    return ret < 0 ? -errno : 0;
> +}

I don't get why this needs to be moved to net specific code.

Thanks

> +
> +static VhostIOVATree *vhost_vdpa_svq_allocate_iova_tree(int vdpa_device_=
fd)
> +{
> +    struct vhost_vdpa_iova_range iova_range;
> +
> +    vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> +    return vhost_iova_tree_new(iova_range.first, iova_range.last);
> +}
> +
>  static void vhost_vdpa_cvq_unmap_buf(struct vhost_vdpa *v, void *addr)
>  {
>      VhostIOVATree *tree =3D v->iova_tree;
> @@ -587,14 +603,6 @@ static NetClientState *net_vhost_vdpa_init(NetClient=
State *peer,
>      return nc;
>  }
>
> -static int vhost_vdpa_get_iova_range(int fd,
> -                                     struct vhost_vdpa_iova_range *iova_=
range)
> -{
> -    int ret =3D ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
> -
> -    return ret < 0 ? -errno : 0;
> -}
> -
>  static int vhost_vdpa_get_features(int fd, uint64_t *features, Error **e=
rrp)
>  {
>      int ret =3D ioctl(fd, VHOST_GET_FEATURES, features);
> @@ -690,14 +698,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, const=
 char *name,
>      }
>
>      if (opts->x_svq) {
> -        struct vhost_vdpa_iova_range iova_range;
> -
>          if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
>              goto err_svq;
>          }
>
> -        vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> -        iova_tree =3D vhost_iova_tree_new(iova_range.first, iova_range.l=
ast);
> +        iova_tree =3D vhost_vdpa_svq_allocate_iova_tree(vdpa_device_fd);
>      }
>
>      ncs =3D g_malloc0(sizeof(*ncs) * queue_pairs);
> --
> 2.31.1
>


