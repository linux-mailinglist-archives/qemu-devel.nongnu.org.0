Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7065F6C287E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 04:15:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peSS9-00089D-7J; Mon, 20 Mar 2023 23:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1peSS6-000871-J7
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 23:14:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1peSS4-0005Ka-Va
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 23:14:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679368460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AJ5xi/aN9ykh0TqPqTfpwvr6Y2DveRVL5GE911NHMSU=;
 b=epLzYl9BJMFC36OBdBTAy4bHMiObF3/7iACbs7O+vmfKVyJIy5u6DhE85xgospfOordd2o
 EXWGQ6iWOHs0mvvy9PnMmG4a5gNu7u3Z3iSYLecmGC+EbcXQX64xmtNt8ffLkcVYRG6mec
 NdLoNScaF2M9zhpH2t5jCN0fGXoXOSo=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-8fyH8lQCMFCkYegMsnWhww-1; Mon, 20 Mar 2023 23:14:18 -0400
X-MC-Unique: 8fyH8lQCMFCkYegMsnWhww-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-17abfe9fd10so7981362fac.0
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 20:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679368458;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AJ5xi/aN9ykh0TqPqTfpwvr6Y2DveRVL5GE911NHMSU=;
 b=jQHgkXDUXTAJ5BlTqqaF6k0W26Y3A8lXJlAbQljV5Pp8nNGVVYeLjpdokWPP3Nr8dQ
 glwROvdWH5jKGyirFyOMu3IbtRDG+4sbJ9MG5aRRPp5arKzSiFSaMDikYKAryQGz9MOo
 /jF+o1iU9xzh8U+yJVsIKg8LDsdU2fhMHqawu6yixDPZV3b+YnA3Vm1V+YHhkCy4/GPX
 OjWovvpC2ow2aKnsMcTFloIq5GSQotQBT+SDwppPGUc3BKOQ4ymBnl5SutelV9XxLJB5
 cKP+pThuIJ6l8DxKsXUibGUoHVP1GkZauWah2W9esG2VCSrr73YZ7LBJqwWzrDsSzZQ6
 foCQ==
X-Gm-Message-State: AO0yUKU58ydo6qJ76YPOziOrl8s3fPybSQR4mBNpVOsdFYjhIrWUERGR
 ACZ+ym6ySBbd0nYKxMvVa4jCcR0CdPkAtXbx1ECS0w7YNkfUIsAxPfH8eokkBjZMi44T+mhmD57
 Q/XdcTwobofKGOBe9srh+xp08o3UVU2c=
X-Received: by 2002:a05:6808:3a1:b0:384:c4a:1b49 with SMTP id
 n1-20020a05680803a100b003840c4a1b49mr138416oie.9.1679368457930; 
 Mon, 20 Mar 2023 20:14:17 -0700 (PDT)
X-Google-Smtp-Source: AK7set/2a7XLxyeLS1ZFQBtHs8j/2hB61SGvI2bd30L1Sr/3JUS+sEkP5tPinpSRX0uHk/iskKuu+kYRzrfiPmANkU0=
X-Received: by 2002:a05:6808:3a1:b0:384:c4a:1b49 with SMTP id
 n1-20020a05680803a100b003840c4a1b49mr138409oie.9.1679368457710; Mon, 20 Mar
 2023 20:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230320161959.650841-1-lulu@redhat.com>
 <20230320161959.650841-4-lulu@redhat.com>
In-Reply-To: <20230320161959.650841-4-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 21 Mar 2023 11:14:06 +0800
Message-ID: <CACGkMEtx7JpUAmN17uJHUwa6qV7X=HX2MdQ8L0Gb4s9mqasbXQ@mail.gmail.com>
Subject: Re: [PATCH v14 3/4] vhost-vdpa: Add check for full 64-bit in region
 delete
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

On Tue, Mar 21, 2023 at 12:20=E2=80=AFAM Cindy Lu <lulu@redhat.com> wrote:
>
> The unmap ioctl doesn't accept a full 64-bit span. So need to
> add check for the section's size in vhost_vdpa_listener_region_del().
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  hw/virtio/vhost-vdpa.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 92c2413c76..0c8c37e786 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -316,10 +316,28 @@ static void vhost_vdpa_listener_region_del(MemoryLi=
stener *listener,
>          vhost_iova_tree_remove(v->iova_tree, *result);
>      }
>      vhost_vdpa_iotlb_batch_begin_once(v);
> +    /*
> +     * The unmap ioctl doesn't accept a full 64-bit. need to check it
> +     */
> +    if (int128_eq(llsize, int128_2_64())) {
> +        llsize =3D int128_rshift(llsize, 1);
> +        ret =3D vhost_vdpa_dma_unmap(v, VHOST_VDPA_GUEST_PA_ASID, iova,
> +                                   int128_get64(llsize));
> +
> +        if (ret) {
> +            error_report("vhost_vdpa_dma_unmap(%p, 0x%" HWADDR_PRIx ", "
> +                         "0x%" HWADDR_PRIx ") =3D %d (%m)",
> +                         v, iova, int128_get64(llsize), ret);
> +        }
> +        iova +=3D int128_get64(llsize);
> +    }
>      ret =3D vhost_vdpa_dma_unmap(v, VHOST_VDPA_GUEST_PA_ASID, iova,
>                                 int128_get64(llsize));
> +
>      if (ret) {
> -        error_report("vhost_vdpa dma unmap error!");
> +        error_report("vhost_vdpa_dma_unmap(%p, 0x%" HWADDR_PRIx ", "
> +                     "0x%" HWADDR_PRIx ") =3D %d (%m)",
> +                     v, iova, int128_get64(llsize), ret);
>      }
>
>      memory_region_unref(section->mr);
> --
> 2.34.3
>


