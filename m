Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2688863CF67
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 07:56:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0H0z-000259-9c; Wed, 30 Nov 2022 01:56:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0H0v-000245-29
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 01:56:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0H0k-0001FC-KP
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 01:56:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669791356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jV2G5c3dayoFYmfmNilh8JWjqoFaMV7qpLNd+niHvqo=;
 b=Xes5lLEikcgMUpa7FWMCqUPUqAzcclX1yr+kRTJZJb/6eZYMZElBlV2D1CK8QsbOGQoVoI
 Fl0QCf1zKtGVH2eqj5VMCBGLM1rFRXb/P03JxkNxraJ2lv6H0m3M879nU/djNu7vzpvV/x
 MOhmbVOIe3cBo78APlv0S9UDDLjmrtM=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-NSW6N95hP-Cg86eBwY7Y0g-1; Wed, 30 Nov 2022 01:55:55 -0500
X-MC-Unique: NSW6N95hP-Cg86eBwY7Y0g-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-142f8ce995fso9458759fac.8
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 22:55:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jV2G5c3dayoFYmfmNilh8JWjqoFaMV7qpLNd+niHvqo=;
 b=t9Pc98N7QZF+4hpY361s7+mflYYAHeo24mrv9tyfxJ8Qss2o2I2vXCyqESEuK37LsA
 2cNxK5S/HfzrjEJvuFO6laL6B9Uuf+NQHjOTn0Bm+Hl8PFumK/igBLDcTmFBULDjtLkx
 q2rkd8Be7NM/ZzWQPAx4Wr6j6PSp6d45krkVJbN2TivUwtCAp5/ea/5Kv2BtDDP0TDDa
 1OOCIJ5Mi9qxg54JmxXkr3HLP11eCCyAHSE2ci4jOf0wiyamBiqVlKrA5Bx+ijKKod2F
 aMrDc6Ea4PspT4Ij/cG350RDqT0bBzI22DDqWyP8g0ML0UoU0LTzQLYIF4T/sO370SVL
 E9uw==
X-Gm-Message-State: ANoB5pk7ENgto1/PDd1/MFbt/0pVPNMDpSDSC2aboSPG9/yoR4W/H2j6
 4OlJG1eNAVrgob2BA2R4m31IcEV4v+dsrQZZXnuvyu6PpIx/Skrbszg9s4qccNv8IkP1VdZiSVu
 ZFCIh/MAQIYXBE4b68hpva4E9fYcCyKE=
X-Received: by 2002:aca:2103:0:b0:35b:9abf:5031 with SMTP id
 3-20020aca2103000000b0035b9abf5031mr10613582oiz.280.1669791354268; 
 Tue, 29 Nov 2022 22:55:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6c2aRP3IJXocU8KZWBx2v/G0p/6BeJIqX3MyDsfwvgQ8VhPrAjuomnhRCOqMypkqeYPO1PnK7yRmGh0Kypcak=
X-Received: by 2002:aca:2103:0:b0:35b:9abf:5031 with SMTP id
 3-20020aca2103000000b0035b9abf5031mr10613569oiz.280.1669791354067; Tue, 29
 Nov 2022 22:55:54 -0800 (PST)
MIME-Version: 1.0
References: <20221124173314.2123015-1-eperezma@redhat.com>
 <20221124173314.2123015-2-eperezma@redhat.com>
In-Reply-To: <20221124173314.2123015-2-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 30 Nov 2022 14:55:43 +0800
Message-ID: <CACGkMEsTG+h8=_DQdStcUANhuggw9vjs1AAVtr=64ZMh8kNy9g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] virtio_net: Modify virtio_net_get_config to early
 return
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
> Next patches introduce more code on vhost-vdpa branch, with already have
> too much indentation.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  hw/net/virtio-net.c | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index aba12759d5..eed629766f 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -168,20 +168,22 @@ static void virtio_net_get_config(VirtIODevice *vde=
v, uint8_t *config)
>      if (nc->peer && nc->peer->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_=
VDPA) {
>          ret =3D vhost_net_get_config(get_vhost_net(nc->peer), (uint8_t *=
)&netcfg,
>                                     n->config_size);
> -        if (ret !=3D -1) {
> -            /*
> -             * Some NIC/kernel combinations present 0 as the mac address=
.  As
> -             * that is not a legal address, try to proceed with the
> -             * address from the QEMU command line in the hope that the
> -             * address has been configured correctly elsewhere - just no=
t
> -             * reported by the device.
> -             */
> -            if (memcmp(&netcfg.mac, &zero, sizeof(zero)) =3D=3D 0) {
> -                info_report("Zero hardware mac address detected. Ignorin=
g.");
> -                memcpy(netcfg.mac, n->mac, ETH_ALEN);
> -            }
> -            memcpy(config, &netcfg, n->config_size);
> +        if (ret =3D=3D -1) {
> +            return;
>          }
> +
> +        /*
> +         * Some NIC/kernel combinations present 0 as the mac address.  A=
s that
> +         * is not a legal address, try to proceed with the address from =
the
> +         * QEMU command line in the hope that the address has been confi=
gured
> +         * correctly elsewhere - just not reported by the device.
> +         */
> +        if (memcmp(&netcfg.mac, &zero, sizeof(zero)) =3D=3D 0) {
> +            info_report("Zero hardware mac address detected. Ignoring.")=
;
> +            memcpy(netcfg.mac, n->mac, ETH_ALEN);
> +        }
> +
> +        memcpy(config, &netcfg, n->config_size);
>      }
>  }
>
> --
> 2.31.1
>


