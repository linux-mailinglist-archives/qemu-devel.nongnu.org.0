Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D015623B30
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 06:22:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot00z-0007H8-Aj; Thu, 10 Nov 2022 00:22:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ot00x-0007GX-8n
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:22:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ot00v-0002qn-Jk
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:22:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668057728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=39bJkdb1ZhD+vECu9SAvHeqKZ+aFs/dYe/MiEsKgSjY=;
 b=IOJ8InrUqltqd4pDwS2mmNAWyYZbp4ScO6i0CGx+sLoMqYm8RwTe2GbZkmrKBkwtGAkCTB
 7J/dVlktKVT0BOLHGjku2qqes16V/NSxa128nO+WY8gSRPuJ/i1vQ4uDfpVLBALX/yX2vO
 9s0UONY+D/5ycYJhllPKJjgnu4OSjaQ=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-260-NJ31-IFeNtSSK6aStCYP3A-1; Thu, 10 Nov 2022 00:22:05 -0500
X-MC-Unique: NJ31-IFeNtSSK6aStCYP3A-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-13bdcfbd787so557225fac.18
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 21:22:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=39bJkdb1ZhD+vECu9SAvHeqKZ+aFs/dYe/MiEsKgSjY=;
 b=rtYFcLv/T6YDkTRk2qLw/6YcWwsoh2cDwm+wdoPo/hACcT3NxHOt/+jDxVJaJehnpJ
 PFjwY0zDoPKoVnRY8zwlT5o1Gjikm2Q2t2Z2q2Yn/NP3YxJLUA881d++XMfWfrIUnwHr
 ff0G+/xRk+iicZc2ZRJ78YRuY9OCeYQ/+TQ2j3ioFazfJPWOOgl0L4iRPnfXOSlWBjgY
 rBVlvjbBf9iHkwV5itdH8xYIb/ycqyqJpr7yEnYry5AiuR9XWb9hsnHQq0UzgZ/qGSBT
 sWchngVEslRobJAsxDWbx4xh2TUKs8S2zIOVRq895SWkQR25EbTcUiFJjcGr9a3f12KI
 xFqw==
X-Gm-Message-State: ACrzQf2au+10CziPjCQCavpOM3XzxPNRckuBR4NJJNY/bNdNQ/kCA5lT
 LrPAU43CRD6WMZU1ews9ubaGp8UCIuCwUZN4prrjXioNhoYeqbgQ0VAse+uzckq7mXFs1kiju+I
 M/Rr0ouhuCDysOzzjXHYGg1kUhjiL07w=
X-Received: by 2002:aca:908:0:b0:354:68aa:9c59 with SMTP id
 8-20020aca0908000000b0035468aa9c59mr1094243oij.35.1668057725215; 
 Wed, 09 Nov 2022 21:22:05 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5Ntrqyanq4iCvD/7JhkyrTaPhUkC3GXZMAZSkKLcKRV9waH6kFq/1vvPwY9tNcDd4EGPMzUp1ibemhm+vI5Lg=
X-Received: by 2002:aca:908:0:b0:354:68aa:9c59 with SMTP id
 8-20020aca0908000000b0035468aa9c59mr1094225oij.35.1668057725029; Wed, 09 Nov
 2022 21:22:05 -0800 (PST)
MIME-Version: 1.0
References: <20221108170755.92768-1-eperezma@redhat.com>
 <20221108170755.92768-2-eperezma@redhat.com>
In-Reply-To: <20221108170755.92768-2-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 10 Nov 2022 13:21:53 +0800
Message-ID: <CACGkMEtvbSbsNZQV5RB1yyNzpam4QezdJ-f75nh4ToMJU=KYQQ@mail.gmail.com>
Subject: Re: [PATCH v6 01/10] vdpa: Use v->shadow_vqs_enabled in
 vhost_vdpa_svqs_start & stop
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Parav Pandit <parav@mellanox.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>, 
 Laurent Vivier <lvivier@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, kvm@vger.kernel.org, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
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

On Wed, Nov 9, 2022 at 1:08 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> This function used to trust in v->shadow_vqs !=3D NULL to know if it must
> start svq or not.
>
> This is not going to be valid anymore, as qemu is going to allocate svq
> unconditionally (but it will only start them conditionally).

It might be a waste of memory if we did this. Any reason for this?

Thanks

>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-vdpa.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 7468e44b87..7f0ff4df5b 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -1029,7 +1029,7 @@ static bool vhost_vdpa_svqs_start(struct vhost_dev =
*dev)
>      Error *err =3D NULL;
>      unsigned i;
>
> -    if (!v->shadow_vqs) {
> +    if (!v->shadow_vqs_enabled) {
>          return true;
>      }
>
> @@ -1082,7 +1082,7 @@ static void vhost_vdpa_svqs_stop(struct vhost_dev *=
dev)
>  {
>      struct vhost_vdpa *v =3D dev->opaque;
>
> -    if (!v->shadow_vqs) {
> +    if (!v->shadow_vqs_enabled) {
>          return;
>      }
>
> --
> 2.31.1
>


