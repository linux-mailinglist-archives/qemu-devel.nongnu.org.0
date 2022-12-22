Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0421A653BB1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 06:16:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8DvN-0006yV-EO; Thu, 22 Dec 2022 00:15:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p8DvL-0006xz-4y
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 00:15:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p8DvJ-0000rI-1l
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 00:15:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671686115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/L50MwsF2OomJtv+22gnHpiQ6cRMDJAeC5Sl2GNXgEA=;
 b=TuctxR544LXVxjBa9LEadbiyHjSNPnEeUD6MRSwusbEFdIxs5fVZhG/u8e8Y0fPnn+nTPG
 CaWKXvVFhXWrGs+eLC+01011BGymO5mal2WSLvJcYEf1ETiG65kaVjBl4rJ6911MScBox1
 hS6qeNnQDXLSRGFoRHuTJt4Rs+WNItw=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-296-pvtg0jSoMwyF0_kc96Mb7g-1; Thu, 22 Dec 2022 00:15:11 -0500
X-MC-Unique: pvtg0jSoMwyF0_kc96Mb7g-1
Received: by mail-ot1-f70.google.com with SMTP id
 e8-20020a9d63c8000000b006704cedcfe2so459210otl.19
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 21:15:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/L50MwsF2OomJtv+22gnHpiQ6cRMDJAeC5Sl2GNXgEA=;
 b=imvTOebYZHaCyU9jYutTQuQWjOrcObrY3GUmLhw3NIqICvC3RZrbGOGSXH0E7xuV+h
 klticqhAZpWd8Z2Gw0n3vtULTePlBJBtZsluVHPd/SSGQeId1VIANjJBW2rVih2BqZZ4
 goh1L8niiD7eA5vCugHYhztoWorsJ302DSIVK8METWYChIHPBF5JWSiyqaYvz1myKwgs
 maLEBCT6eb7DxpEslLHiMaT8B3dGIjNT3rNBRiS5u4DSzotUzU/oodJ8jpIl0+Z+XWaY
 p5TewnpiZ2we2iX6CT5tgpysjNoaeGObg8ihfpKrePjAp4T69ZiC9FJciMJ7IGiEXDrX
 Q6zw==
X-Gm-Message-State: AFqh2kqqnuJpWErm4tMi2ibphG97nK0tocqjqIbhy7cyv24BkHJ39kYj
 XexP1+GrjwhkutLoGUdWRrwmWZU8cnCHA1+QZm/AHya2ZTLJkKx/ERzKWOMHdWQyQjLKWh5KIh2
 JZejYVwctvfLWExNmMr1NzEzoU4QCAAY=
X-Received: by 2002:a05:6830:4a3:b0:670:8334:ccf2 with SMTP id
 l3-20020a05683004a300b006708334ccf2mr260306otd.201.1671686110890; 
 Wed, 21 Dec 2022 21:15:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvhc9sU0XWFbhcUBe1mC+gY3ARGU2x5lRDOEvW4/Zzxx6YpHbHvJxrS0skEauvqHX8c48oF01DH6F3YpVbYCTA=
X-Received: by 2002:a05:6830:4a3:b0:670:8334:ccf2 with SMTP id
 l3-20020a05683004a300b006708334ccf2mr260296otd.201.1671686110681; Wed, 21 Dec
 2022 21:15:10 -0800 (PST)
MIME-Version: 1.0
References: <20221221115015.1400889-1-eperezma@redhat.com>
 <20221221115015.1400889-3-eperezma@redhat.com>
In-Reply-To: <20221221115015.1400889-3-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 22 Dec 2022 13:14:59 +0800
Message-ID: <CACGkMEuCwmD=JaRPOQnVD45WN1Tc4vquzQrvdNDxazt+c-Ew5A@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] virtio_net: copy VIRTIO_NET_S_ANNOUNCE if device
 model has it
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

On Wed, Dec 21, 2022 at 7:50 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Status part of the emulated feature. It will follow device model, so we
> must copy it as long as NIC device model has it set.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
> v3: Add virtio byte swapping writing net config status.
> ---
>  hw/net/virtio-net.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index b30038d130..122eac25ee 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -183,6 +183,8 @@ static void virtio_net_get_config(VirtIODevice *vdev,=
 uint8_t *config)
>              memcpy(netcfg.mac, n->mac, ETH_ALEN);
>          }
>
> +        netcfg.status |=3D virtio_tswap16(vdev,
> +                                        n->status & VIRTIO_NET_S_ANNOUNC=
E);
>          memcpy(config, &netcfg, n->config_size);
>      }
>  }
> --
> 2.31.1
>


