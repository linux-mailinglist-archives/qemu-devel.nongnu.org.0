Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 042BC3ECCCD
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 04:53:12 +0200 (CEST)
Received: from localhost ([::1]:49302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFSkR-0002KJ-1j
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 22:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mFSjX-0001az-Tx
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 22:52:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mFSjU-00026Y-8K
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 22:52:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629082331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g0VNWqGmW/rfgq3RurMa87+qNXN0niAUv/SA6c2+asg=;
 b=Nx4jKzo2y4pAgWGmwOvfF5zLA0x6D4zga40QQI/iYVGT0OZ1AoXlWBpg+PBXqTteeqR+fW
 WtQ+ltEbZfPybdmlN4S8gja6P3JZsqhdx+EqXh9sBtnJeIZsQB9A0Jt84p281KejPl9k6m
 ucHaCWw8pUNQAILXO9yFxY3breT7FV4=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-xsjvCNMYODGJ5Iw5O1K3Vw-1; Sun, 15 Aug 2021 22:52:10 -0400
X-MC-Unique: xsjvCNMYODGJ5Iw5O1K3Vw-1
Received: by mail-lf1-f69.google.com with SMTP id
 bu41-20020a05651216a9b02903c171c5bf72so3953493lfb.8
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 19:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g0VNWqGmW/rfgq3RurMa87+qNXN0niAUv/SA6c2+asg=;
 b=fp99QzKAbjaACvwpidFRfjv3iPkMijHWIiknUjuScZQDwUYQeHsbMRlu5k5blVpIHk
 lyb+7nQCn9Sm4IFKO+cqhI/9KSbMQCFNjqGybQnjrhS9Yrluq5BfBFNX2pEYdSFLle/1
 c4EHTnPKEqIM9vg+nGpb10LBvfi+s+b6Z5dxXOz02plFuMSMQa1K2znJK1cti47AeGpd
 FyvhFDwyXwDKJ7kdFJuy+78vBBRz4KVoYp8fcOHzd1irfa4uA8SbTjlTU6dYOAjsQ8aW
 WtUBEMyQdfA7WUcoa1sBnQecpiUTdEsHaDcO8q/XQY9UkJa/vYl4fLtYuCYYrdzTE4M7
 4YXA==
X-Gm-Message-State: AOAM531ypymZ2K6spZnlHSbhNEOFluaZBt31W0YuJuVC39uyi505szMp
 cp1RLjEd8eFL4cois7QwY4zgdGgrTfz2oIYWmMAx8Tfb5XnL3/ijDogqC+86M/1p4t88cFqXhkd
 Lb8DBsaS0zInLGZjW5IVytO17HSCKZN0=
X-Received: by 2002:a05:651c:12ca:: with SMTP id
 10mr10964850lje.494.1629082328500; 
 Sun, 15 Aug 2021 19:52:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGJvmW7NsLr3hgoC9YG+56lbl0yLbokjLfkXHkVM+6AfjlmYzYaYcq155iRcTnD9nnA8lNUXW28WLscgy/u0M=
X-Received: by 2002:a05:651c:12ca:: with SMTP id
 10mr10964831lje.494.1629082328173; 
 Sun, 15 Aug 2021 19:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210812140933.226288-1-eperezma@redhat.com>
In-Reply-To: <20210812140933.226288-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 16 Aug 2021 10:51:57 +0800
Message-ID: <CACGkMEsqs28TAFb6ZnXM5XQwFmjqzj2LkR1fQZXVhs=13AGKsQ@mail.gmail.com>
Subject: Re: [PATCH v3] vhost-vdpa: Do not send empty IOTLB update batches
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, Aug 12, 2021 at 10:09 PM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
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

Acked-by: Jason Wang <jasowang@redhat.com>

>
> v3:
>   * Use a bool instead of a counter avoiding potential number wrapping
>   * Fix bad check on _commit
>   * Move VHOST_BACKEND_F_IOTLB_BATCH check to
>     vhost_vdpa_iotlb_batch_begin_once
>
> v2 (from RFC):
>   * Rename misleading name
>   * Abstract start batching function for listener_add/del
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  include/hw/virtio/vhost-vdpa.h |  1 +
>  hw/virtio/vhost-vdpa.c         | 35 ++++++++++++++++++++++------------
>  2 files changed, 24 insertions(+), 12 deletions(-)
>
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdp=
a.h
> index e98e327f12..6b9288fef8 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -23,6 +23,7 @@ typedef struct vhost_vdpa {
>      int device_fd;
>      int index;
>      uint32_t msg_type;
> +    bool iotlb_batch_begin_sent;
>      MemoryListener listener;
>      struct vhost_dev *dev;
>      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 6ce94a1f4d..93b7db61d1 100644
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
> @@ -109,6 +103,16 @@ static void vhost_vdpa_listener_begin(MemoryListener=
 *listener)
>      }
>  }
>
> +static void vhost_vdpa_iotlb_batch_begin_once(struct vhost_vdpa *v)
> +{
> +    if (v->dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH) &&
> +        !v->iotlb_batch_begin_sent) {
> +        vhost_vdpa_listener_begin_batch(v);
> +    }
> +
> +    v->iotlb_batch_begin_sent =3D true;
> +}
> +
>  static void vhost_vdpa_listener_commit(MemoryListener *listener)
>  {
>      struct vhost_vdpa *v =3D container_of(listener, struct vhost_vdpa, l=
istener);
> @@ -120,6 +124,10 @@ static void vhost_vdpa_listener_commit(MemoryListene=
r *listener)
>          return;
>      }
>
> +    if (!v->iotlb_batch_begin_sent) {
> +        return;
> +    }
> +
>      msg.type =3D v->msg_type;
>      msg.iotlb.type =3D VHOST_IOTLB_BATCH_END;
>
> @@ -127,6 +135,8 @@ static void vhost_vdpa_listener_commit(MemoryListener=
 *listener)
>          error_report("failed to write, fd=3D%d, errno=3D%d (%s)",
>                       fd, errno, strerror(errno));
>      }
> +
> +    v->iotlb_batch_begin_sent =3D false;
>  }
>
>  static void vhost_vdpa_listener_region_add(MemoryListener *listener,
> @@ -170,6 +180,7 @@ static void vhost_vdpa_listener_region_add(MemoryList=
ener *listener,
>
>      llsize =3D int128_sub(llend, int128_make64(iova));
>
> +    vhost_vdpa_iotlb_batch_begin_once(v);
>      ret =3D vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
>                               vaddr, section->readonly);
>      if (ret) {
> @@ -221,6 +232,7 @@ static void vhost_vdpa_listener_region_del(MemoryList=
ener *listener,
>
>      llsize =3D int128_sub(llend, int128_make64(iova));
>
> +    vhost_vdpa_iotlb_batch_begin_once(v);
>      ret =3D vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
>      if (ret) {
>          error_report("vhost_vdpa dma unmap error!");
> @@ -234,7 +246,6 @@ static void vhost_vdpa_listener_region_del(MemoryList=
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


