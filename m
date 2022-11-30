Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F16FF63CF6D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 07:59:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0H3b-0003Zf-42; Wed, 30 Nov 2022 01:58:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0H3T-0003Z3-9Y
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 01:58:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0H3R-0001Si-JM
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 01:58:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669791528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Qy+Q9uC/ziyO0KfIF9Bw4e1uCvDOYZQH5WVNRHKEFI=;
 b=GZShLmr1z0OJb9KeVbupqapatLbiSI51vC1h8z9VYCQ6sWakAN9T72z2cx8DO/jgHGhaFu
 7KPyUXDOXCYAmK56HyFhBYET9bMbxS/J4wLzL5eMD9kXNNmYNexLsOa/Y8mvCYO70ZDxQ/
 3N+OnKBpvN/SR/Ky9iSrODV0nydpw38=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-215-WXhT_i_QO4y5FBC19fA-dw-1; Wed, 30 Nov 2022 01:58:47 -0500
X-MC-Unique: WXhT_i_QO4y5FBC19fA-dw-1
Received: by mail-ot1-f72.google.com with SMTP id
 q22-20020a05683022d600b0066d919dd4c4so6755847otc.23
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 22:58:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Qy+Q9uC/ziyO0KfIF9Bw4e1uCvDOYZQH5WVNRHKEFI=;
 b=bpcj8LSpkuD9AxgeaNzYbXl/NeRO/rR5jEPMyV/GHlmgjuK3cq/qP0ZPsBXxmhJgpx
 RXhnMiXNUudc06uESO2X5gO6WXTUn1EaQ+Af80GCqM1r4K4LGOQaHgZDhOyybq78cgbX
 yj0GXoB7ooYQcL6ZPyQYFxC3mVTPUthIzG9au+iHj5C981aFT9aGUbfC6G5WOk22CT5v
 eew+6nDz9M6N286w02Y+uY+kIuKdQC4DwKH4hT2ocGXcXP/xR/3FUhHUA08aSi0oqi85
 kJO7su6e7B8ItywMrFafyF64itOFMmYUUciZ1faG5PiH//h8Rm/Jg9aKGvxnM6CI/TdC
 G54A==
X-Gm-Message-State: ANoB5pmhIvfag7cFFdA7yQWkQ7/DIwerMemhsCzrGLN4vYH/HMTllpoG
 JS8PR+GlSS/GZ68ouSFXIqbGroh86BBJ5d/dALIfSrHDeh9BDXeOR8W+IO6OLf8nmzFAfEXcoSq
 oK1Hqsfjl1/D0idh27RTciflP1ZXFFpg=
X-Received: by 2002:a05:6870:75c3:b0:142:f59e:e509 with SMTP id
 de3-20020a05687075c300b00142f59ee509mr23871804oab.280.1669791526162; 
 Tue, 29 Nov 2022 22:58:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5k7qrnOVpq+twRxSrPOh+TxBILjO3i5u9ea/VBSFHyVuWGJCANy1YUhQKQJgKhCDIOeiDu6WgLtJUXJixPnrM=
X-Received: by 2002:a05:6870:75c3:b0:142:f59e:e509 with SMTP id
 de3-20020a05687075c300b00142f59ee509mr23871787oab.280.1669791525992; Tue, 29
 Nov 2022 22:58:45 -0800 (PST)
MIME-Version: 1.0
References: <20221124173314.2123015-1-eperezma@redhat.com>
 <20221124173314.2123015-3-eperezma@redhat.com>
In-Reply-To: <20221124173314.2123015-3-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 30 Nov 2022 14:58:35 +0800
Message-ID: <CACGkMEsbib_drMeDecQeHw2ND+s7T2zMOtcQMEtFBzW-0yV=hA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] virtio_net: copy VIRTIO_NET_S_ANNOUNCE if device
 model has it
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

On Fri, Nov 25, 2022 at 1:33 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Status part of the emulated feature. It will follow device model, so we
> must copy it as long as NIC device model has it set.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/net/virtio-net.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index eed629766f..bf71ef33e8 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -183,6 +183,7 @@ static void virtio_net_get_config(VirtIODevice *vdev,=
 uint8_t *config)
>              memcpy(netcfg.mac, n->mac, ETH_ALEN);
>          }
>
> +        netcfg.status |=3D (n->status & VIRTIO_NET_S_ANNOUNCE);

Do we need to care about the endian here? We use:

    virtio_stw_p(vdev, &netcfg.status, n->status);

At the beginning of this function.

Thanks

>          memcpy(config, &netcfg, n->config_size);
>      }
>  }
> --
> 2.31.1
>


