Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB196689EF
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 04:13:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGAUU-0001l0-66; Thu, 12 Jan 2023 22:12:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pGAUS-0001kr-PB
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 22:12:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pGAUR-0007Yk-7j
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 22:12:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673579542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lc74ZggLEAte+GxgWuNjvOgrCooS03caPip9LbVNbho=;
 b=KYqIxKrHAbK5YEPNYoM1QYKSJ798N8rAEVkAquiZby3QoIn30HN7Wh7qYMkvKXSeA8bxMm
 bNoG9uSdj21exZemCDUD63NcQ/iERYQ0SM6ge70OYVkmmgvfkT2bTPyJETMcj2CbHqoEJO
 8RN5qE7ZPcaNFBS3Oq7cBebo+gnijJo=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-403-EEVFuyl_O-GtzbH_9hBMaw-1; Thu, 12 Jan 2023 22:12:20 -0500
X-MC-Unique: EEVFuyl_O-GtzbH_9hBMaw-1
Received: by mail-ot1-f69.google.com with SMTP id
 d18-20020a9d51d2000000b006745346e57bso9998840oth.18
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 19:12:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lc74ZggLEAte+GxgWuNjvOgrCooS03caPip9LbVNbho=;
 b=IApMzrQgd1EMVS+/DFMpYVrFBv2Rm/rrTvjP4arf9JT22V1HcYn/4+ctSDSfIiqpCD
 ozsGDz1v8LOQGmY6rm7avVfKjsrGPik4E9AudpV1bDc8pLHgmSNL7apIYs1bFqSLWV9Z
 IxsTI+xOnbj7xDxZ8uorc7cFl+9+gKTULS0HY0krMYlhI+pMv/cDqjr25BECf72bP7tZ
 Bh1OtlHF1W7jR8GGhHQvMMcM0zeBDDa0W/DiroickwjP5Lv0LqlHMuMLjwzqRpzTDxG3
 ohiEJEVYxuo9ShQBEM83yb/obsqFD8JuyBgk3uj6pQ1hrCmWk4Ym8k8gfNCfjvmfQz4v
 6Ovw==
X-Gm-Message-State: AFqh2koaoZdpUDBeEqW5kAHxA1/bOoUEMiPUMQd7POUShath60Y28yJM
 V6GD9Geet2p9NjFXTLBAn3uVap/RaF7yaL/GtvIDzRTPTuadHTHubzINCBEZ/o2Q179PNm5+9YD
 cp8Zk4IDgownmS+oT11SvLuyWwUR2yJU=
X-Received: by 2002:a05:6830:1c9:b0:684:c737:8322 with SMTP id
 r9-20020a05683001c900b00684c7378322mr202276ota.237.1673579539507; 
 Thu, 12 Jan 2023 19:12:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs8KG2M1Up2Ix/9bnzkVzKHXH0WdjeiYWwxe7W0TBaJ7VcND8kDbVY0OWHLf1Y2UejnodQD7ChM4ughovk3srE=
X-Received: by 2002:a05:6830:1c9:b0:684:c737:8322 with SMTP id
 r9-20020a05683001c900b00684c7378322mr202256ota.237.1673579539282; Thu, 12 Jan
 2023 19:12:19 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-2-eperezma@redhat.com>
In-Reply-To: <20230112172434.760850-2-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 13 Jan 2023 11:12:08 +0800
Message-ID: <CACGkMEs2UaDFSn=_bvZ+6xXJCUAd71wVhBbp9r5mJLN=e_mG2A@mail.gmail.com>
Subject: Re: [RFC v2 01/13] vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check
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

On Fri, Jan 13, 2023 at 1:24 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> VHOST_BACKEND_F_IOTLB_ASID is the feature bit, not the bitmask. Since
> the device under test also provided VHOST_BACKEND_F_IOTLB_MSG_V2 and
> VHOST_BACKEND_F_IOTLB_BATCH, this went unnoticed.
>
> Fixes: c1a1008685 ("vdpa: always start CVQ in SVQ mode if possible")
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Do we need this for -stable?

Thanks

> ---
>  net/vhost-vdpa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 1a13a34d35..de5ed8ff22 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -384,7 +384,7 @@ static int vhost_vdpa_net_cvq_start(NetClientState *n=
c)
>              g_strerror(errno), errno);
>          return -1;
>      }
> -    if (!(backend_features & VHOST_BACKEND_F_IOTLB_ASID) ||
> +    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)) ||
>          !vhost_vdpa_net_valid_svq_features(v->dev->features, NULL)) {
>          return 0;
>      }
> --
> 2.31.1
>


