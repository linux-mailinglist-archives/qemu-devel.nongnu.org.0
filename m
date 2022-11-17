Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4643A62D2D9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 06:44:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovXgQ-0001Pt-Fr; Thu, 17 Nov 2022 00:43:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ovXgO-0001Pj-Nn
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 00:43:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ovXgM-000863-Vt
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 00:43:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668663805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PBMBfEnnPEN2MZOvERqsCSnzi4edcJDo9R6V1rzv/vQ=;
 b=XqJnhH2Kp3yTmlsZEI8b0PcwDfjVlp5DiW0GS53lu0nHmoFlOAQRs+c9U0/ov+yzJxJYfr
 2nG/z4EV8VsX00PyhWxvDrji6YxldpAVHPXIdwDuYqZS83dHuLxW7DPPQs0/17YG7wJToX
 IPb5RV7W7S/8A/EAMMnT/BKonzwzJUg=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-442-W1gaa_eMMgGvPFbSYgj9uw-1; Thu, 17 Nov 2022 00:43:23 -0500
X-MC-Unique: W1gaa_eMMgGvPFbSYgj9uw-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-13cbfc38be2so387111fac.0
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 21:43:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PBMBfEnnPEN2MZOvERqsCSnzi4edcJDo9R6V1rzv/vQ=;
 b=zLeGvH4vgoKuUosddcnfU3whFYUzW6pp4JhQCgFWZQhrLV84jovbfGnr+ES02uBZ5t
 MEi+XzOZygr5qAxhCGFLOHyQZ7l6qAw2e578A3V7mlzyZLZsJxfmWp3sWCfRb1QN8L4w
 Y0sXUvpRksZ68p12onCVEp9npsDo28tyXof53QSNIbDwIlh1qu2fCKqIFJo0sZuCOg4q
 LoWGTQEAnpMym1bjfdr/jxwOQtkq1AldDsq7qs/Pm29QWi46qnsvh0C17LJNtG66bPqS
 fYcaRtC7XbDY19ydlNiXRq4ImZkSNGkXqbR0k5RHLd+zFEZxFoVwx0beNKWZnogRqJtv
 AIqw==
X-Gm-Message-State: ANoB5pmHYn1mqtAvO6b/WEf+eEULuZW6abEhwixfGweNSusG+nEZbOdB
 levZfwunfQrSEkuTDwQCKbPefh4T77MQcoSQfBrG++sjz+DH7NnWi0fHArxxzVLKuSqbMjLTMsB
 jwMauhjl1wUiz+ZSZcQSzUBcAYET2/wk=
X-Received: by 2002:a4a:b145:0:b0:49f:449a:5f6c with SMTP id
 e5-20020a4ab145000000b0049f449a5f6cmr651051ooo.93.1668663803179; 
 Wed, 16 Nov 2022 21:43:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4aIyM6TQSblqvB9prdwXIJgcHUZgakb0mFfB8niYk1S+XlF3oniGqAO2+JrimF9hW+GatROlPxinUOMcF7NN0=
X-Received: by 2002:a4a:b145:0:b0:49f:449a:5f6c with SMTP id
 e5-20020a4ab145000000b0049f449a5f6cmr651042ooo.93.1668663802991; Wed, 16 Nov
 2022 21:43:22 -0800 (PST)
MIME-Version: 1.0
References: <20221116150556.1294049-1-eperezma@redhat.com>
 <20221116150556.1294049-2-eperezma@redhat.com>
In-Reply-To: <20221116150556.1294049-2-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 17 Nov 2022 13:43:11 +0800
Message-ID: <CACGkMEtJ4aWS4J-5nrOzMLxDqZHUT0rb3qnjVJuN-TXZDebYSQ@mail.gmail.com>
Subject: Re: [PATCH for 8.0 v7 01/10] vdpa: Use v->shadow_vqs_enabled in
 vhost_vdpa_svqs_start & stop
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

On Wed, Nov 16, 2022 at 11:06 PM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
>
> This function used to trust in v->shadow_vqs !=3D NULL to know if it must
> start svq or not.
>
> This is not going to be valid anymore, as qemu is going to allocate svq
> unconditionally (but it will only start them conditionally).
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

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


