Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D33D66AB4F2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 04:08:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ1CW-0007oJ-Jv; Sun, 05 Mar 2023 22:07:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZ1CU-0007jD-QJ
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 22:07:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZ1CT-0005U9-0b
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 22:07:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678072064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZtmiJiyrx/VmV/mTbB9GE2rTLOh4kRFcoCGSWV5wM/c=;
 b=flOiAaO1zLJ7tA4GYMFysZjbT9PlFiQzVauSGL9k2pJBDKs4R9dnq5WkYZDH1950YiDMVj
 oXPfk1QQHVFT7hgN5Xv3zEJWpWKwGbFSgJui3ve2hK9epeFEojVXPiEUrsLoF1+Gcpez1k
 vsX0rfKq64sI8+m289bRELpy9zmTL0Y=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-dNfI02BmNz-fn5123NFGhw-1; Sun, 05 Mar 2023 22:07:42 -0500
X-MC-Unique: dNfI02BmNz-fn5123NFGhw-1
Received: by mail-oi1-f197.google.com with SMTP id
 i2-20020a056808054200b0037fa81b753bso3330315oig.12
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 19:07:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678072061;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZtmiJiyrx/VmV/mTbB9GE2rTLOh4kRFcoCGSWV5wM/c=;
 b=219MCqDYwBiLVHNlZgGI+D4k+JvN99pM5lDAusDxAYea/uetbesFcojCQHeV/XHJdD
 E3jPgELHaHZBj18m3PuGJBQA3PB9bmSYob+rS4Bp1uK/9YhJ9TeTafngVrRxcdDTs/YT
 lBpm7lCvB9WzDmJvPt1w/ZxTJmrv/REC2QDbqSop9lsDkF60FaARkzazLcmUiMyFUpfW
 KEyRccShP2d+zMwWCGVHBxeu+Q3WgwZ6x5hCV2K2P14B0/08yEwcNlIRzu1KqNYJRPTY
 4AQ5V/x/MVZLOBGMkljLa6PjrRG4NQJQqdl/amce1YOms6+SexUPF7gxG/W6zH5AiLDW
 XuYA==
X-Gm-Message-State: AO0yUKXexS0wDcnISgQtKo+jNxXa+DcOEn3kVCuzv16Q/4y7n5iOehrC
 /P8svABKJidomRBsJMMJppv81JOzw2wyu96ZzH/GiOWIP0G7Cgx4m/iGEArcTYHvpBO+jEPmW5B
 mnhAvi/i2YGZFTt0IKedOnS0TG3CCwWg=
X-Received: by 2002:a4a:ae84:0:b0:525:499e:ce2f with SMTP id
 u4-20020a4aae84000000b00525499ece2fmr3212528oon.1.1678072061746; 
 Sun, 05 Mar 2023 19:07:41 -0800 (PST)
X-Google-Smtp-Source: AK7set9L63Tn6Bh28KI/71ihcjGZBcY4VMEJtHgy1zxwP5pARU7hesrplhaDxdWMyladQMQ1RpQ+nzYbKdcFJ/zV9TE=
X-Received: by 2002:a4a:ae84:0:b0:525:499e:ce2f with SMTP id
 u4-20020a4aae84000000b00525499ece2fmr3212523oon.1.1678072061548; Sun, 05 Mar
 2023 19:07:41 -0800 (PST)
MIME-Version: 1.0
References: <20230208025722.2683024-1-lulu@redhat.com>
 <20230208025722.2683024-2-lulu@redhat.com>
In-Reply-To: <20230208025722.2683024-2-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 6 Mar 2023 11:07:30 +0800
Message-ID: <CACGkMEurZ=ZHLBCypaVcDbUT7xKfi+-e_GhPWku241qbqBzmYA@mail.gmail.com>
Subject: Re: [PATCH v13 1/2] vhost: expose function vhost_dev_has_iommu()
To: Cindy Lu <lulu@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org
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

On Wed, Feb 8, 2023 at 10:57=E2=80=AFAM Cindy Lu <lulu@redhat.com> wrote:
>
> To support vIOMMU in vdpa, need to exposed the function
> vhost_dev_has_iommu, vdpa will use this function to check
> if vIOMMU enable.
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  hw/virtio/vhost.c         | 2 +-
>  include/hw/virtio/vhost.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index eb8c4c378c..9ff5516655 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -107,7 +107,7 @@ static void vhost_dev_sync_region(struct vhost_dev *d=
ev,
>      }
>  }
>
> -static bool vhost_dev_has_iommu(struct vhost_dev *dev)
> +bool vhost_dev_has_iommu(struct vhost_dev *dev)
>  {
>      VirtIODevice *vdev =3D dev->vdev;
>
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index a52f273347..f7f10c8fb7 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -336,4 +336,5 @@ int vhost_dev_set_inflight(struct vhost_dev *dev,
>                             struct vhost_inflight *inflight);
>  int vhost_dev_get_inflight(struct vhost_dev *dev, uint16_t queue_size,
>                             struct vhost_inflight *inflight);
> +bool vhost_dev_has_iommu(struct vhost_dev *dev);
>  #endif
> --
> 2.34.3
>


