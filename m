Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 712F26C5D74
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 04:49:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfBwT-0007o2-A1; Wed, 22 Mar 2023 23:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pfBwR-0007gw-1Z
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 23:48:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pfBwP-0005I3-HX
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 23:48:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679543320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WTzX2TLUjasuPXMjWBWkgG8Jfs/i7i4WphnFP0KmORY=;
 b=GXt5Itkj1VLEuOeVqVXogXNq/eRNjCe+GHSS40G21wp/AXfFc+B6lwDe5r8rSAf7HGjkf/
 1kpf09GhxaOdm5VwscS6AecG6CDKBu8V5rtyx4iY0pDhxZ8q7YJN7B+3VQ+BaIayOEeioX
 HR/XTS+FOXiTmBmjZEqAVAQx6LkarnU=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-CoE0MD5UNFSCv6TSdIWJSg-1; Wed, 22 Mar 2023 23:48:39 -0400
X-MC-Unique: CoE0MD5UNFSCv6TSdIWJSg-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-17ab1d11480so10847672fac.13
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 20:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679543318;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WTzX2TLUjasuPXMjWBWkgG8Jfs/i7i4WphnFP0KmORY=;
 b=ZuHVNXBbUb2ceAt4+irtckBp+idULUjd2ZqfjRwWjZqpjaL8Fu7u/Ix855dCOL6Lct
 AOZWmD7ImbKEyWqdPIMO1zyhrPl6ZnFD26FYtiSZLiw9HeRbErjYsXMq5hcYBl27hcVy
 LS0S/zDAisHg37yR2E1+51STVo2rle2Xi6ko5Vn79hYRlfLwf8Zid4Ep3A3Jae11CEGv
 AOZct+SvCtTfSZ7xu98m20gr3uet5j/+CQAtVVHLeofLIAErZroS+VK6cISVXfaA/i7b
 lksSoU/fAmkxiA5V3MKmOtktBP6Lc8eb6dAgu2YgUODS5nUhlDlOrB/gI3sqGMBGEv02
 3sfg==
X-Gm-Message-State: AO0yUKVdSfAQ9nuII1j8QxTdpo7BG5LJO3zdlB5JfsG7Wdm/2LMbyJpG
 j1RlsKs3/pP3Fji4BP9fhRlXt2TTTpLQozJrfWu5/6n5vuzBG6SLqx3a/xLwVsquvvJ2yh/rh7c
 JbFeNZjIZINEG2aw8jy4FZlIRj0XXHzQ=
X-Received: by 2002:a05:6830:1441:b0:690:daac:e823 with SMTP id
 w1-20020a056830144100b00690daace823mr1885216otp.2.1679543318759; 
 Wed, 22 Mar 2023 20:48:38 -0700 (PDT)
X-Google-Smtp-Source: AK7set8cqdi7231a+woLhNGtKr02ENzXS7zjWOtWHAg1GId0EzdxYgsM1ndQ0zTi+EEdGZ2qZdAZB1+go/rKK142HjU=
X-Received: by 2002:a05:6830:1441:b0:690:daac:e823 with SMTP id
 w1-20020a056830144100b00690daace823mr1885214otp.2.1679543318573; Wed, 22 Mar
 2023 20:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230321142327.749980-1-lulu@redhat.com>
 <20230321142327.749980-2-lulu@redhat.com>
In-Reply-To: <20230321142327.749980-2-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 23 Mar 2023 11:48:27 +0800
Message-ID: <CACGkMEsaCjmkvb6j_pWa7UM9_RPShEVzT27VOx-7H_MfSE45fQ@mail.gmail.com>
Subject: Re: [PATCH v15 1/4] vhost: expose function vhost_dev_has_iommu()
To: Cindy Lu <lulu@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org
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

On Tue, Mar 21, 2023 at 10:23=E2=80=AFPM Cindy Lu <lulu@redhat.com> wrote:
>
> To support vIOMMU in vdpa, need to exposed the function
> vhost_dev_has_iommu, vdpa will use this function to check
> if vIOMMU enable.
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>

It looks like you missed my acks for patches 1 - 3.

Thanks

> ---
>  hw/virtio/vhost.c         | 2 +-
>  include/hw/virtio/vhost.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index a266396576..fd746b085b 100644
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


