Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E2458E6A5
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 07:12:37 +0200 (CEST)
Received: from localhost ([::1]:39332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLe1E-0000Q2-EK
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 01:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLdwO-0002Ik-5i
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 01:07:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLdw8-0006nN-Og
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 01:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660108039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SvJcfByTuSO30mpUYGNpDWmV/Idc63a454E0bFsxMdo=;
 b=PZJvJ8wFWr70PMmW3F8ZdLUEY2Jk+wkGW+ueMDQX+rzsZcqUCM/NiM2oQ5qFslmjETRIu1
 tux2aEeNSUpWVMa0Lb8sFNRgmHRi/hHlCKxbxEkwQ13LmG639rSj9Vwcp9GMEYuvEZ0y8T
 gzBk0v8avCU+8tHDtn/7cCtI76lPknM=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-LiUSE0r6P7qXUvvqJGZf9A-1; Wed, 10 Aug 2022 01:07:18 -0400
X-MC-Unique: LiUSE0r6P7qXUvvqJGZf9A-1
Received: by mail-lf1-f72.google.com with SMTP id
 z1-20020a0565120c0100b0048ab2910b13so3145299lfu.23
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 22:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=SvJcfByTuSO30mpUYGNpDWmV/Idc63a454E0bFsxMdo=;
 b=ufuhrpgm9mgkLLVYWLtA8vM3PMOxmuNKS/Q/MSKmUccT0Ifss2y+dQ8+T3dtprC/wi
 A7esz8/hlEjbyrKqM/8Y4yID9fGCAJhtJDHtkvzSi0AbkLkAxRLEJZZnIGFjDEMPSYuT
 jMcugcf+XitoonouR0fsru05xOfKj/dp5YanHwFb/3HeCN5t4X/z7ZeF7xPn/+Dcs9k8
 WZldoitNO7ipjnUYpkzmoW44BlDHMC8VfKDyQPiUy8D2uP/ExT9ydjI6I8idTWBVoO0o
 kO+QHibSUFQR4IuAbJ7FUQUo/TkuyJC9Q0fbojqbjd3fjjySct6+2PI4H05z9PdgQKOa
 rD1w==
X-Gm-Message-State: ACgBeo0c8fkcyG0wkLO1CPbWJeCwVW1jTLTRJHMvUB993NphxKzfRyax
 +ewxlbH2sTOd1E2RWDM6IxcTUCPh8DjYMevC1nml9SccErEJN6BUpK1uyagefRAC/NLztXlVYCW
 yaHgs4oim4Bx7n2jnm/ziA1/yLqqIdL8=
X-Received: by 2002:a05:6512:308a:b0:48b:4dd:5362 with SMTP id
 z10-20020a056512308a00b0048b04dd5362mr9195030lfd.575.1660108037217; 
 Tue, 09 Aug 2022 22:07:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7CVZ4lyyFWPgxVsQ3cbAMg+nJXdmbunVocwCx8iGJJBlg6LCnvmM7Ee8C84MLRZloohJkM8KYgy+n503f8Ykc=
X-Received: by 2002:a05:6512:308a:b0:48b:4dd:5362 with SMTP id
 z10-20020a056512308a00b0048b04dd5362mr9195010lfd.575.1660108037029; Tue, 09
 Aug 2022 22:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220809173926.1695280-1-eperezma@redhat.com>
 <20220809173926.1695280-8-eperezma@redhat.com>
In-Reply-To: <20220809173926.1695280-8-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 10 Aug 2022 13:07:05 +0800
Message-ID: <CACGkMEtR77rWJKTNcAcZT43b6vaHatybdNPrcP8RqZzgea2SqA@mail.gmail.com>
Subject: Re: [PATCH v8 07/12] vdpa: add net_vhost_vdpa_cvq_info NetClientInfo
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Laurent Vivier <lvivier@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 Eric Blake <eblake@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eli Cohen <eli@mellanox.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 10, 2022 at 1:39 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Next patches will add a new info callback to restore NIC status through
> CVQ. Since only the CVQ vhost device is needed, create it with a new
> NetClientInfo.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
> v5: Create a new NetClientInfo instead of reusing the dataplane one.
> ---
>  net/vhost-vdpa.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index ac1810723c..55e8a39a56 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -334,6 +334,16 @@ static bool vhost_vdpa_net_cvq_map_elem(VhostVDPASta=
te *s,
>      return true;
>  }
>
> +static NetClientInfo net_vhost_vdpa_cvq_info =3D {
> +    .type =3D NET_CLIENT_DRIVER_VHOST_VDPA,
> +    .size =3D sizeof(VhostVDPAState),
> +    .receive =3D vhost_vdpa_receive,
> +    .cleanup =3D vhost_vdpa_cleanup,
> +    .has_vnet_hdr =3D vhost_vdpa_has_vnet_hdr,
> +    .has_ufo =3D vhost_vdpa_has_ufo,
> +    .check_peer_type =3D vhost_vdpa_check_peer_type,
> +};
> +
>  /**
>   * Do not forward commands not supported by SVQ. Otherwise, the device c=
ould
>   * accept it and qemu would not know how to update the device model.
> @@ -475,7 +485,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientS=
tate *peer,
>          nc =3D qemu_new_net_client(&net_vhost_vdpa_info, peer, device,
>                                   name);
>      } else {
> -        nc =3D qemu_new_net_control_client(&net_vhost_vdpa_info, peer,
> +        nc =3D qemu_new_net_control_client(&net_vhost_vdpa_cvq_info, pee=
r,
>                                           device, name);
>      }
>      snprintf(nc->info_str, sizeof(nc->info_str), TYPE_VHOST_VDPA);
> --
> 2.31.1
>


