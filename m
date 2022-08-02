Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2716E587E65
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 16:51:24 +0200 (CEST)
Received: from localhost ([::1]:42570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oItEw-0008Ci-Ik
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 10:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oItCs-0006XY-S7
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 10:49:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oItCp-00026k-VW
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 10:49:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659451750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l0TsEOKCDj8uUeJDEbxvh33x9P68/sG4jREd3Xw/MEI=;
 b=dgLi8D/y9Q8XXtrln8LDE3cNh+E66qRxiNSqBSAmbBqbn+AuQh+CFk1FL3SKJs4fznmLUI
 /lUAJsWCNFgTLPND2NL/KitSIQqlTXj+KYasuovrsHiBybfqUy2fJHo8ZGCu4vPgB5b7j7
 I7czmeUH1zpgnjZlHRp8AJotGLO0IR0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-MoscJq2bNiiz2joAHP5NHg-1; Tue, 02 Aug 2022 10:49:09 -0400
X-MC-Unique: MoscJq2bNiiz2joAHP5NHg-1
Received: by mail-qk1-f197.google.com with SMTP id
 bm34-20020a05620a19a200b006b5f1d95ceeso11610379qkb.5
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 07:49:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l0TsEOKCDj8uUeJDEbxvh33x9P68/sG4jREd3Xw/MEI=;
 b=yz/vb3GRK41A/mvccKBmSzRPTDBm6it26WEJS5Gw8JzN1BsLnNyZWEisJxZLb8O2gf
 7JHf7cgldV441q3tmOIL4fZANTDvVaMkVWUfAhr68gomiAiEvbc2xEauL74ueo+KRoxE
 5UN0A6I0VzMReRz5I8GFX8ZizKa6G26aRzpirzs7d38mEuI9DtcRc2yYZVJAc/qUrlLn
 DN45ZzzzhLne3R+laf4Pe7oy1LK+L6CJwqHiy7bqbpbXS0Dy1gCSkR6qfI+2qv9+SjOe
 HB/XXBzcDrggX0pBXml+1rb2s44XZnU0TNdn6MQmNd7fJdqBGecjsoXS3zwwn2iRizNV
 ZLcw==
X-Gm-Message-State: ACgBeo17cEcFhbs0xj7k/YfBYz60RXlw/4sQ+P6NmZPPcsR1MlMgdAW2
 GGFAlyREJHPSz5MxAsf4JHKK0LIWMT2Gk+U8S0qSettz19MHEJaDJgM8A22kkgcXCIYJ6ckw5iP
 r0+iXJyywVVnvgLlrK4D3M4EW30IH+Lc=
X-Received: by 2002:a05:620a:46a2:b0:6b8:bef3:8f82 with SMTP id
 bq34-20020a05620a46a200b006b8bef38f82mr4714880qkb.234.1659451748912; 
 Tue, 02 Aug 2022 07:49:08 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7ngDmMZuL11WPh+SvMWkEhXt5dp+1xN0ZquC53uT9esmsIGGUeaOCZ8uWlKM80D8O3ixv1MohnlZmHyV+WR0c=
X-Received: by 2002:a05:620a:46a2:b0:6b8:bef3:8f82 with SMTP id
 bq34-20020a05620a46a200b006b8bef38f82mr4714865qkb.234.1659451748687; Tue, 02
 Aug 2022 07:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220802143908.274364-1-eperezma@redhat.com>
In-Reply-To: <20220802143908.274364-1-eperezma@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 2 Aug 2022 16:48:32 +0200
Message-ID: <CAJaqyWd47xR-mxERSuGpDUThZozJnBgp9kMoTet=PNNX4tuQMg@mail.gmail.com>
Subject: Re: [PATCH] vdpa: do not save failed dma maps in SVQ iova tree
To: qemu-level <qemu-devel@nongnu.org>
Cc: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 2, 2022 at 4:41 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> If a map fails for whatever reason, it must not be saved in the tree.
> Otherwise, qemu will try to unmap it in cleanup, leaving to more errors.
>

I forgot to add:

Reported-by: Lei Yang <leiyang@redhat.com>

> Fixes: 34e3c94eda ("vdpa: Add custom IOTLB translations to SVQ")
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-vdpa.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 3ff9ce3501..e44c23dce5 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -176,6 +176,7 @@ static void vhost_vdpa_listener_commit(MemoryListener=
 *listener)
>  static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>                                             MemoryRegionSection *section)
>  {
> +    DMAMap mem_region =3D {};
>      struct vhost_vdpa *v =3D container_of(listener, struct vhost_vdpa, l=
istener);
>      hwaddr iova;
>      Int128 llend, llsize;
> @@ -212,13 +213,13 @@ static void vhost_vdpa_listener_region_add(MemoryLi=
stener *listener,
>
>      llsize =3D int128_sub(llend, int128_make64(iova));
>      if (v->shadow_vqs_enabled) {
> -        DMAMap mem_region =3D {
> -            .translated_addr =3D (hwaddr)(uintptr_t)vaddr,
> -            .size =3D int128_get64(llsize) - 1,
> -            .perm =3D IOMMU_ACCESS_FLAG(true, section->readonly),
> -        };
> +        int r;
>
> -        int r =3D vhost_iova_tree_map_alloc(v->iova_tree, &mem_region);
> +        mem_region.translated_addr =3D (hwaddr)(uintptr_t)vaddr,
> +        mem_region.size =3D int128_get64(llsize) - 1,
> +        mem_region.perm =3D IOMMU_ACCESS_FLAG(true, section->readonly),
> +
> +        r =3D vhost_iova_tree_map_alloc(v->iova_tree, &mem_region);
>          if (unlikely(r !=3D IOVA_OK)) {
>              error_report("Can't allocate a mapping (%d)", r);
>              goto fail;
> @@ -232,11 +233,16 @@ static void vhost_vdpa_listener_region_add(MemoryLi=
stener *listener,
>                               vaddr, section->readonly);
>      if (ret) {
>          error_report("vhost vdpa map fail!");
> -        goto fail;
> +        goto fail_map;
>      }
>
>      return;
>
> +fail_map:
> +    if (v->shadow_vqs_enabled) {
> +        vhost_iova_tree_remove(v->iova_tree, &mem_region);
> +    }
> +
>  fail:
>      /*
>       * On the initfn path, store the first error in the container so we
> --
> 2.31.1
>
>


