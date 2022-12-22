Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA03F653BB3
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 06:17:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8DwP-0007N8-TI; Thu, 22 Dec 2022 00:16:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p8DwM-0007LL-Ra
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 00:16:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p8DwL-0001Bg-8T
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 00:16:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671686180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vVwgY22vaFGmK//bsY461j1GKbM+0mVCI5NhpNknuTg=;
 b=b9myQKUwNY3cJl1WW2i4oZBlZfyK+FmqSTQZ3u63qTGyTsGY29CQOSXY0uPe5FyRuxzeyr
 TqXjOujqc/q5G6tpVLrVLYcgadU+k2leIHrwDOzvFHSlTMtbZ8FJKpizAnnMiOei9jLS8q
 2tkCOZsg9V0G9ZKnN2CyiJAEV/4aEQI=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-625-1VJHmf3hNSePzZ3G27lG0g-1; Thu, 22 Dec 2022 00:16:18 -0500
X-MC-Unique: 1VJHmf3hNSePzZ3G27lG0g-1
Received: by mail-oi1-f198.google.com with SMTP id
 j8-20020a056808034800b0035eb41b5638so150170oie.14
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 21:16:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vVwgY22vaFGmK//bsY461j1GKbM+0mVCI5NhpNknuTg=;
 b=NQ+djhMFp6JGfCTFH/CLrRDpEPJCQ0XBoE5iurKQ17Il41eS8Tc7fVCfcTah8GEKpu
 Tf2gIgf1bynAXOKLkPb5+nVxUFO91sBSlLa813zhVBZYRdmjUbzf7HhUAXIxKONb+KE1
 lXsVM2VlAPUYtsY7qNn66nSRrKf4do3C9FOTJhIARWSTDucaZZdJLl3+K8XjDnkJN9jw
 vJoUsexSM1gRrCrIQvywsRzS7yT511xz9C8/6mwFl3PmUA3KFva6ZERHTRNWZEEhZ7YI
 HDp4aZmg7naYX1UC7khRkLaSbdh2ExogK8v9iVKr975FvFaKPIonHFFRLMMNBueuBxK0
 6hDw==
X-Gm-Message-State: AFqh2kqi2Ct56+DVsKqZ7nneVHQbCQNuBlEX4q8S7mww1OaNabRKWVHd
 P9wqHOOe2Lj3HA3lhv+DmKvYCajvX1N9PodxwJl/0pDfHUawAdw1uaziM7vUAoUUddorW9tR22N
 f4CrwhCUeJJ8yJUpHe/r17ZauFY5IyNk=
X-Received: by 2002:a54:4e89:0:b0:35c:303d:fe37 with SMTP id
 c9-20020a544e89000000b0035c303dfe37mr73138oiy.35.1671686178022; 
 Wed, 21 Dec 2022 21:16:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvcjwckEGDpsi/WfaJGLJUcxjJnFocYq/cRtrQEVye5YQUPXy4pRHPRcMDb+UTJmdJmtM4eFopKcOOFIWPYOMw=
X-Received: by 2002:a54:4e89:0:b0:35c:303d:fe37 with SMTP id
 c9-20020a544e89000000b0035c303dfe37mr73132oiy.35.1671686177848; Wed, 21 Dec
 2022 21:16:17 -0800 (PST)
MIME-Version: 1.0
References: <20221221115015.1400889-1-eperezma@redhat.com>
 <20221221115015.1400889-4-eperezma@redhat.com>
In-Reply-To: <20221221115015.1400889-4-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 22 Dec 2022 13:16:06 +0800
Message-ID: <CACGkMEux4Y9am20Y=_2orjcAiPvGuJOhZESLvubX1H3h5Zz6nA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] vdpa: handle VIRTIO_NET_CTRL_ANNOUNCE in
 vhost_vdpa_net_handle_ctrl_avail
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>, 
 Lei Yang <leiyang@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Eli Cohen <eli@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, 
 Parav Pandit <parav@mellanox.com>, Laurent Vivier <lvivier@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, Harpreet Singh Anand <hanand@xilinx.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>
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

On Wed, Dec 21, 2022 at 7:50 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Since this capability is emulated by qemu shadowed CVQ cannot forward it
> to the device. Process all that command within qemu.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  net/vhost-vdpa.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 260e474863..0b0712cd8a 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -489,9 +489,18 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostSha=
dowVirtqueue *svq,
>      out.iov_len =3D iov_to_buf(elem->out_sg, elem->out_num, 0,
>                               s->cvq_cmd_out_buffer,
>                               vhost_vdpa_net_cvq_cmd_len());
> -    dev_written =3D vhost_vdpa_net_cvq_add(s, out.iov_len, sizeof(status=
));
> -    if (unlikely(dev_written < 0)) {
> -        goto out;
> +    if (*(uint8_t *)s->cvq_cmd_out_buffer =3D=3D VIRTIO_NET_CTRL_ANNOUNC=
E) {
> +        /*
> +         * Guest announce capability is emulated by qemu, so don't forwa=
rd to
> +         * the device.
> +         */
> +        dev_written =3D sizeof(status);
> +        *s->status =3D VIRTIO_NET_OK;
> +    } else {
> +        dev_written =3D vhost_vdpa_net_cvq_add(s, out.iov_len, sizeof(st=
atus));
> +        if (unlikely(dev_written < 0)) {
> +            goto out;
> +        }
>      }
>
>      if (unlikely(dev_written < sizeof(status))) {
> --
> 2.31.1
>


