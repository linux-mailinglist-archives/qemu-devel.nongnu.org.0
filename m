Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BE758A4C4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 04:37:44 +0200 (CEST)
Received: from localhost ([::1]:52126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJnDb-0000RL-3r
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 22:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJnCG-0007OS-LC
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 22:36:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJnCE-0001hk-As
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 22:36:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659666977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VExRb9kWMCuwy5Be/6mRFdT/m5G+tqsSpY8Zc72nZZI=;
 b=W9sZlDRHztyQoyK+mdvEXUoEKXsaNXi7NMY81bWcBqJBOdU3i/PgJMiz9Nc6zeqq/prPFv
 fdOIoiNZVngefri0MKjn3TrY9LOsG7RD7W7zlG6XwCHd3JKE51R6yF1ofIDnjcS3thuytC
 zFeyyYNaVV2KFf1DF9YlLRlxPbrqKFU=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-DuijoAuMOi2hcCL_R7WHxA-1; Thu, 04 Aug 2022 22:36:16 -0400
X-MC-Unique: DuijoAuMOi2hcCL_R7WHxA-1
Received: by mail-lf1-f72.google.com with SMTP id
 o4-20020ac25e24000000b0048af174d5bdso236787lfg.9
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 19:36:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VExRb9kWMCuwy5Be/6mRFdT/m5G+tqsSpY8Zc72nZZI=;
 b=XzJG7hJAIVQsXlYVqYFkl2ZgPA12G8DmDDML6BVCqGmIeETh45djBJ8ujpmYZF719z
 RsmZfyUkvUX3moaRwkj1yHnkmRzfZxKETnw5kE79ojijaPjtcYlu07I24v5yZ7YpyBcw
 +Wcg9qoWFB5tmhJde36C6/QXracSdCoDDu75OG4PgONT5cHDvAMrYN+1s9GKckv+uoFp
 Cz9U08MEnu6QoZfJacN7iJWUxzt7rHXHc1QpNg5wKdwZFoTbcgHS4s4n3x2dMq+Rjwnp
 5YtS0g+z6hondoLKDLm5c8er5ZfjRAunkyc6sR1qbDFeqW3ImPZRFyI+til1gLhBWQqN
 c/tQ==
X-Gm-Message-State: ACgBeo1biLfMtsoaePWryJcmNo47lb9vMPNyf09WOPVqJkbEVLdcQjDb
 5w2raAVsT6DY/GzwWxH8WYS6K/O2qmZq2c76q1J7ZPDfu9WrUrTF4mARbazQ27+PJX8TTYk/T4d
 PyrplStFYtUn7Xw40+YVueT54JbWCLVs=
X-Received: by 2002:ac2:4205:0:b0:48a:95e6:395c with SMTP id
 y5-20020ac24205000000b0048a95e6395cmr1835943lfh.238.1659666974521; 
 Thu, 04 Aug 2022 19:36:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5HWezEseLTthVAb+LTbGQ2AJO/sgKtSUZVjYYyWf4erYigO90mMeRzdJVecIoGUrOJuFpE7zJ+uyfLKYUM2k0=
X-Received: by 2002:ac2:4205:0:b0:48a:95e6:395c with SMTP id
 y5-20020ac24205000000b0048a95e6395cmr1835932lfh.238.1659666974283; Thu, 04
 Aug 2022 19:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220804155443.671136-1-eperezma@redhat.com>
 <20220804155443.671136-3-eperezma@redhat.com>
In-Reply-To: <20220804155443.671136-3-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 5 Aug 2022 10:36:02 +0800
Message-ID: <CACGkMEu8cD+gepOMU35zgFh6O=zkSXrTz5MPgZd8LUStQ_B07A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] vdpa: do not save failed dma maps in SVQ iova tree
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Lei Yang <leiyang@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Aug 4, 2022 at 11:54 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> If a map fails for whatever reason, it must not be saved in the tree.
> Otherwise, qemu will try to unmap it in cleanup, leaving to more errors.
>
> Fixes: 34e3c94eda ("vdpa: Add custom IOTLB translations to SVQ")
> Reported-by: Lei Yang <leiyang@redhat.com>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  hw/virtio/vhost-vdpa.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 983d3697b0..7e28d2f674 100644
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


