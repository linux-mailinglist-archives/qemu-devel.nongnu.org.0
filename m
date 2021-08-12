Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 684773E9E57
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 08:17:31 +0200 (CEST)
Received: from localhost ([::1]:51016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE41y-0003rD-Fc
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 02:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mE40z-00038E-8x
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 02:16:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mE40v-0004p2-TW
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 02:16:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628748984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L2FNZnMtILEx0p0XvOCA5uA2/uqRoNFozyuXoyjrG5c=;
 b=UVTzcb9tTEh2QHJojhURyFsMIQFHL3ek8iFRfmZtEv424bX7lvFjQE5O1SDUfEJMN41zeW
 YZBQMoNAzXJFMeZlNN1nZ+kARYxzvEDYZe/Iz6ynmtPbYfaRJCb7QLwsrPZQrbkllDxVF6
 O8JIZneIjVGGqAwzOo0sKarQznuxK2Q=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-dBa1NEX5MAWeRJmj0mdIyg-1; Thu, 12 Aug 2021 02:16:22 -0400
X-MC-Unique: dBa1NEX5MAWeRJmj0mdIyg-1
Received: by mail-lj1-f198.google.com with SMTP id
 y18-20020a2e95d20000b02901b29cf2565fso1607659ljh.18
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 23:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L2FNZnMtILEx0p0XvOCA5uA2/uqRoNFozyuXoyjrG5c=;
 b=sPg7Z3CMx8pzxWlRyary3+96X6/nESk47X3IuPwmBJMOyTJvz+03utMRphsGEigJ0E
 8sBdjkc5E0iz0Jn+cbpVbKaHXGI/K/JtK90QOncmQaFOuiZSikIPHFSo8PxIfhwxvDD6
 1wojrsqD5ky9MJLKh24rGnzV6jgAqpBECpjwu6WUgnBLiHCltaX0B2Yx0VhidyAm77iA
 JUTpH63i2vM6WcRw5SUHw+vgKcKMWlboU290C31pZ0zrMePdw+AX+OFuirqkBPzoykIa
 cSUd3wEIgtWYH7412bXXZq2mj8XJ6SU/iacGTcNU4tT8nGi9bhcIeo4NE2hdCS6+EyXz
 9+ng==
X-Gm-Message-State: AOAM5303CjaKYERpb6V1x04HYU1PRdpcOQJwPA2dkZEFX03xatJB12jd
 6bQn8pTeeCS20aDf1TLgWS8QHA3Yk4v991o/fKpJBYjO83+y9q3wUG+eMx9VDemQgC9PNOJhZAp
 bI0gOeqWHcTBvCm9LGwUy7b+VdPhAvGk=
X-Received: by 2002:ac2:4105:: with SMTP id b5mr1396283lfi.153.1628748981349; 
 Wed, 11 Aug 2021 23:16:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkVW7TdCziWyw9TlX+r4bZoGOXvJLWAHxO/UBvJRuSDsNT1nEcotKJf9yTHCxKWGwMfVxPqGqen+YRflprZuE=
X-Received: by 2002:ac2:4105:: with SMTP id b5mr1396267lfi.153.1628748980999; 
 Wed, 11 Aug 2021 23:16:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210811163211.185870-1-eperezma@redhat.com>
In-Reply-To: <20210811163211.185870-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 12 Aug 2021 14:16:10 +0800
Message-ID: <CACGkMEsP1QFh16qLDyXmPp4-NgLA-7HNZ7Far2sQqjr9rXoorw@mail.gmail.com>
Subject: Re: [PATCH v2] vhost-vdpa: Do not send empty IOTLB update batches
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.7, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eli Cohen <elic@nvidia.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 12, 2021 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
>
> With the introduction of the batch hinting, meaningless batches can be
> created with no IOTLB updates if the memory region was skipped by
> vhost_vdpa_listener_skipped_section. This is the case of host notifiers
> memory regions, device un/realize, and others. This causes the vdpa
> device to receive dma mapping settings with no changes, a possibly
> expensive operation for nothing.
>
> To avoid that, VHOST_IOTLB_BATCH_BEGIN hint is delayed until we have a
> meaningful (not skipped section) mapping or unmapping operation, and
> VHOST_IOTLB_BATCH_END is not written unless at least one of _UPDATE /
> _INVALIDATE has been issued.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  include/hw/virtio/vhost-vdpa.h |  1 +
>  hw/virtio/vhost-vdpa.c         | 50 ++++++++++++++++++++++++++--------
>  2 files changed, 39 insertions(+), 12 deletions(-)
>
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdp=
a.h
> index e98e327f12..6538572a6f 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -23,6 +23,7 @@ typedef struct vhost_vdpa {
>      int device_fd;
>      int index;
>      uint32_t msg_type;
> +    size_t n_mr_updated;
>      MemoryListener listener;
>      struct vhost_dev *dev;
>      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 6ce94a1f4d..512fa18d68 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -89,19 +89,13 @@ static int vhost_vdpa_dma_unmap(struct vhost_vdpa *v,=
 hwaddr iova,
>      return ret;
>  }
>
> -static void vhost_vdpa_listener_begin(MemoryListener *listener)
> +static void vhost_vdpa_listener_begin_batch(struct vhost_vdpa *v)
>  {
> -    struct vhost_vdpa *v =3D container_of(listener, struct vhost_vdpa, l=
istener);
> -    struct vhost_dev *dev =3D v->dev;
> -    struct vhost_msg_v2 msg =3D {};
>      int fd =3D v->device_fd;
> -
> -    if (!(dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH))) {
> -        return;
> -    }
> -
> -    msg.type =3D v->msg_type;
> -    msg.iotlb.type =3D VHOST_IOTLB_BATCH_BEGIN;
> +    struct vhost_msg_v2 msg =3D {
> +        .type =3D v->msg_type,
> +        .iotlb.type =3D VHOST_IOTLB_BATCH_BEGIN,
> +    };
>
>      if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
>          error_report("failed to write, fd=3D%d, errno=3D%d (%s)",
> @@ -109,6 +103,25 @@ static void vhost_vdpa_listener_begin(MemoryListener=
 *listener)
>      }
>  }
>
> +static bool vhost_vdpa_iotlb_batch_is_started(const struct vhost_vdpa *v=
)
> +{
> +    return v->n_mr_updated !=3D 0;
> +}
> +
> +static void vhost_vdpa_iotlb_batch_begin_once(struct vhost_vdpa *v)
> +{
> +    if (!vhost_vdpa_iotlb_batch_is_started(v)) {
> +        vhost_vdpa_listener_begin_batch(v);
> +    }
> +
> +    v->n_mr_updated++;
> +}
> +
> +static void vhost_vdpa_iotlb_batch_reset(struct vhost_vdpa *v)
> +{
> +    v->n_mr_updated =3D 0;
> +}
> +
>  static void vhost_vdpa_listener_commit(MemoryListener *listener)
>  {
>      struct vhost_vdpa *v =3D container_of(listener, struct vhost_vdpa, l=
istener);
> @@ -120,6 +133,10 @@ static void vhost_vdpa_listener_commit(MemoryListene=
r *listener)
>          return;
>      }
>
> +    if (vhost_vdpa_iotlb_batch_is_started(v)) {
> +        return;
> +    }
> +
>      msg.type =3D v->msg_type;
>      msg.iotlb.type =3D VHOST_IOTLB_BATCH_END;
>
> @@ -127,6 +144,8 @@ static void vhost_vdpa_listener_commit(MemoryListener=
 *listener)
>          error_report("failed to write, fd=3D%d, errno=3D%d (%s)",
>                       fd, errno, strerror(errno));
>      }
> +
> +    vhost_vdpa_iotlb_batch_reset(v);
>  }
>
>  static void vhost_vdpa_listener_region_add(MemoryListener *listener,
> @@ -170,6 +189,10 @@ static void vhost_vdpa_listener_region_add(MemoryLis=
tener *listener,
>
>      llsize =3D int128_sub(llend, int128_make64(iova));
>
> +    if (v->dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH)) {

Let's move this in to vhost_vdpa_iotlb_batch_begin_once()?

> +        vhost_vdpa_iotlb_batch_begin_once(v);
> +    }
> +
>      ret =3D vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
>                               vaddr, section->readonly);
>      if (ret) {
> @@ -221,6 +244,10 @@ static void vhost_vdpa_listener_region_del(MemoryLis=
tener *listener,
>
>      llsize =3D int128_sub(llend, int128_make64(iova));
>
> +    if (v->dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH)) {
> +        vhost_vdpa_iotlb_batch_begin_once(v);
> +    }
> +

Do we need to check vhost_vdpa_iotlb_batch_is_started() in the .commit?

Others look good.

Thanks

>      ret =3D vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
>      if (ret) {
>          error_report("vhost_vdpa dma unmap error!");
> @@ -234,7 +261,6 @@ static void vhost_vdpa_listener_region_del(MemoryList=
ener *listener,
>   * depends on the addnop().
>   */
>  static const MemoryListener vhost_vdpa_memory_listener =3D {
> -    .begin =3D vhost_vdpa_listener_begin,
>      .commit =3D vhost_vdpa_listener_commit,
>      .region_add =3D vhost_vdpa_listener_region_add,
>      .region_del =3D vhost_vdpa_listener_region_del,
> --
> 2.27.0
>


