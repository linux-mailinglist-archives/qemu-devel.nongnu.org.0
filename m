Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C94163CF7B
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 08:02:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0H6n-00060s-90; Wed, 30 Nov 2022 02:02:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0H6Z-0005ya-8u
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 02:02:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0H6X-0002CX-MQ
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 02:02:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669791719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3vfgfoht9ikjBgryxg5ee16+Y++GPO7FTT79vcTlvhs=;
 b=gT9D7Bx8XYcRkgBeQ5MkcP/YvKnmDNXmRsJGAY5SHqApgmSaS68m9nQ9f3qd1Kc/5IJaVD
 wSJmk3KYeRLjmU2RW4ry6SoBAsgllbsSvqcZ3BYw1IP5kU1pmvb2OelxYFRM697Xuo1kJJ
 jPNWBX/KIuMUTjl2TIeJCfDXzrsDmKc=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-412-44uzT_T5MtuN7oFzIPrpmA-1; Wed, 30 Nov 2022 02:01:57 -0500
X-MC-Unique: 44uzT_T5MtuN7oFzIPrpmA-1
Received: by mail-oo1-f72.google.com with SMTP id
 u5-20020a4a6145000000b0049f4b251d54so4157220ooe.13
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 23:01:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3vfgfoht9ikjBgryxg5ee16+Y++GPO7FTT79vcTlvhs=;
 b=dwyMsWSERD6lSz8MPxvmVeLhnqhIQwYXVr5TrRZpZp65wuK1f7H3WHyJ0GqcJ5IJrK
 707kr+o6i3wxmLbi/J5TbVGNrjqa1IGGOhvYMViQiEgfwuWACn72dHyGfsiWQbbW4uEX
 O+eJM8bZyNJ+OPbOZ6xRGhtmT9Rjn/9gJpyp4vpg7AMBaTRPT67MMDMoyAE62fre7R1D
 cjEH7P0cYEWBV1sDWGtwDBfR2yDrY71GaYFLP/Ft9tkLdJjb3+Py0Y0nBl/UDcE+BkBe
 XSb4VI7NpsIRQ7BOTtsGkD0bSr6JpXxksaRZyq9PH48rFpoHp8LW9Bxbj9p8DqK/rTTm
 5ItA==
X-Gm-Message-State: ANoB5pnDPd03TeY50wgWT+ahwPH6cvb/ZLur3CUpDnZD1rjukdxf4X0n
 XNRmXyTncie1OQRg32FHiza3QWsDmN615soJZ446VW8iEQv2d3W5W1L2g6Nmr5wVuC7UGMc45Y/
 UXPIJvsa8fnVbyajkMfMpvMQ8X6et0+o=
X-Received: by 2002:a4a:94a9:0:b0:480:8f4a:7062 with SMTP id
 k38-20020a4a94a9000000b004808f4a7062mr16629444ooi.57.1669791716303; 
 Tue, 29 Nov 2022 23:01:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5/4ysvIAAnzNpPbOapKarJsLZGRQSb/TqBoZQRBw7SY/+GVM311i+w5AMkNjntlbnB0e9ro7JuMwNm4+6d6uw=
X-Received: by 2002:a4a:94a9:0:b0:480:8f4a:7062 with SMTP id
 k38-20020a4a94a9000000b004808f4a7062mr16629434ooi.57.1669791716107; Tue, 29
 Nov 2022 23:01:56 -0800 (PST)
MIME-Version: 1.0
References: <20221124173314.2123015-1-eperezma@redhat.com>
 <20221124173314.2123015-4-eperezma@redhat.com>
In-Reply-To: <20221124173314.2123015-4-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 30 Nov 2022 15:01:45 +0800
Message-ID: <CACGkMEsOJuOM8JW83Ly+b3ZvfAhnOj61CvVz2SeLeLEkpT446Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] vdpa: handle VIRTIO_NET_CTRL_ANNOUNCE in
 vhost_vdpa_net_handle_ctrl_avail
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Eli Cohen <eli@mellanox.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>, 
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 Lei Yang <leiyang@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, Cindy Lu <lulu@redhat.com>
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

On Fri, Nov 25, 2022 at 1:33 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Since this capability is emulated by qemu shadowed CVQ cannot forward it
> to the device. Process all that command within qemu.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  net/vhost-vdpa.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 2b4b85d8f8..8172aa8449 100644
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
> +         * Guest announce capability is emulated by qemu, so dont forwar=
d to

s/dont/don't/

> +         * the device.
> +         */
> +        dev_written =3D sizeof(status);
> +        *s->status =3D VIRTIO_NET_OK;

I wonder if we should avoid negotiating ANNOUNCE with vDPA parents if
we do this?

Thanks

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


