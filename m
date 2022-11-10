Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBBE623B93
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 07:02:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot0cj-0003bq-6a; Thu, 10 Nov 2022 01:01:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ot0ch-0003bY-Ig
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 01:01:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ot0cf-000388-W7
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 01:01:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668060068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PQnPm1YLduHu1it/yH/StRprHEQQCZZMP7zcvCp6u3E=;
 b=X1Ui/a5vdS0sqII5GVEKAYR7I25ETBob63m0nhntMYDc4lYznMcJT2CX51jp7Ii1A06xsP
 sySfKzuX4OZT3PrbPdm5yPazUvEYVJYLSPlPBJwOOuxW5GJooHYttxdnHsoBPBrixeh7N1
 jq4WPrUP4MqKu+nMizhSSnl4mbRo1XU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-307-bsS8N1ABP3KU70SaOOQ6XQ-1; Thu, 10 Nov 2022 01:01:07 -0500
X-MC-Unique: bsS8N1ABP3KU70SaOOQ6XQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 z11-20020a056402274b00b00461dba91468so734543edd.6
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 22:01:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PQnPm1YLduHu1it/yH/StRprHEQQCZZMP7zcvCp6u3E=;
 b=dXXC1pOJSmKND8ueFja0tZeJUO3WGDjOTeJzBQJgOKPTbKDTkWZSQlx6lNPi33OC1L
 LechCk2raUnvibVzvIRd1HC+bFVk5tk0MfvrGD35JXc8FktubjrlLGLH65KJevdkS/JY
 9lwLX+CdQazEmiuOpstseydf4ndzyWFkBCC97NEBaoEmJZGplC3gKSnrdu3U50k6x+iu
 KBoyUz6qrxEFgYvjxPSikKC5JFVqQZaHe+gH4mTHFOB6JsC/PXoHcYP8SbVYwfqiyz3A
 dNywR1HfldbRzaFKXCaFEswshes3sUI1pUAxDFmBkVAbLn50l5NYkuY9kzFXQY0Qgyby
 eyAA==
X-Gm-Message-State: ACrzQf1+WC9qbe/oWJUGYzmC4Sh2Zx3HXVb7jYeEeZGOlVlwaLgQ3Tv6
 wrDnUB+OzakMLRBmuItQ1ev/Hlk2YKJ0Y6wZx5XRtwwI9qC17ACDBe2+9IN7RZQ1dGaCJlzBBN6
 lBHZp4c7vK/Iw2FLnhocNad3lMm1qXU4=
X-Received: by 2002:a17:907:1b1f:b0:72f:56db:cce9 with SMTP id
 mp31-20020a1709071b1f00b0072f56dbcce9mr57164929ejc.605.1668060065995; 
 Wed, 09 Nov 2022 22:01:05 -0800 (PST)
X-Google-Smtp-Source: AMsMyM50QMsSJcTUvrOlRwWiIjykGta2yvRyJdFwvVL9lpLzTelIP9oNRfitCVX+nxlZTF3bE3A1UT/8Ui4SoFG7REM=
X-Received: by 2002:a17:907:1b1f:b0:72f:56db:cce9 with SMTP id
 mp31-20020a1709071b1f00b0072f56dbcce9mr57164912ejc.605.1668060065782; Wed, 09
 Nov 2022 22:01:05 -0800 (PST)
MIME-Version: 1.0
References: <20221108170755.92768-1-eperezma@redhat.com>
 <20221108170755.92768-10-eperezma@redhat.com>
In-Reply-To: <20221108170755.92768-10-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 10 Nov 2022 14:00:52 +0800
Message-ID: <CACGkMEsr=fpbbOpUBHawt5DR+nTWcK1uMzXgorEcbijso1wsMQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] vdpa: Add listener_shadow_vq to vhost_vdpa
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

On Wed, Nov 9, 2022 at 1:08 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> The memory listener that thells the device how to convert GPA to qemu's
> va is registered against CVQ vhost_vdpa. This series try to map the
> memory listener translations to ASID 0, while it maps the CVQ ones to
> ASID 1.
>
> Let's tell the listener if it needs to register them on iova tree or
> not.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
> v5: Solve conflict about vhost_iova_tree_remove accepting mem_region by
>     value.
> ---
>  include/hw/virtio/vhost-vdpa.h | 2 ++
>  hw/virtio/vhost-vdpa.c         | 6 +++---
>  net/vhost-vdpa.c               | 1 +
>  3 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdp=
a.h
> index 6560bb9d78..0c3ed2d69b 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -34,6 +34,8 @@ typedef struct vhost_vdpa {
>      struct vhost_vdpa_iova_range iova_range;
>      uint64_t acked_features;
>      bool shadow_vqs_enabled;
> +    /* The listener must send iova tree addresses, not GPA */
> +    bool listener_shadow_vq;
>      /* IOVA mapping used by the Shadow Virtqueue */
>      VhostIOVATree *iova_tree;
>      GPtrArray *shadow_vqs;
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 8fd32ba32b..e3914fa40e 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -220,7 +220,7 @@ static void vhost_vdpa_listener_region_add(MemoryList=
ener *listener,
>                                           vaddr, section->readonly);
>
>      llsize =3D int128_sub(llend, int128_make64(iova));
> -    if (v->shadow_vqs_enabled) {
> +    if (v->listener_shadow_vq) {
>          int r;
>
>          mem_region.translated_addr =3D (hwaddr)(uintptr_t)vaddr,
> @@ -247,7 +247,7 @@ static void vhost_vdpa_listener_region_add(MemoryList=
ener *listener,
>      return;
>
>  fail_map:
> -    if (v->shadow_vqs_enabled) {
> +    if (v->listener_shadow_vq) {
>          vhost_iova_tree_remove(v->iova_tree, mem_region);
>      }
>
> @@ -292,7 +292,7 @@ static void vhost_vdpa_listener_region_del(MemoryList=
ener *listener,
>
>      llsize =3D int128_sub(llend, int128_make64(iova));
>
> -    if (v->shadow_vqs_enabled) {
> +    if (v->listener_shadow_vq) {
>          const DMAMap *result;
>          const void *vaddr =3D memory_region_get_ram_ptr(section->mr) +
>              section->offset_within_region +
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 85a318faca..02780ee37b 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -570,6 +570,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientS=
tate *peer,
>      s->vhost_vdpa.index =3D queue_pair_index;
>      s->always_svq =3D svq;
>      s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> +    s->vhost_vdpa.listener_shadow_vq =3D svq;

Any chance those above two can differ?

Thanks

>      s->vhost_vdpa.iova_tree =3D iova_tree;
>      if (!is_datapath) {
>          s->cvq_cmd_out_buffer =3D qemu_memalign(qemu_real_host_page_size=
(),
> --
> 2.31.1
>


