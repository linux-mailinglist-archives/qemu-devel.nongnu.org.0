Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 595326F8602
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 17:41:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puxXk-0008RZ-DL; Fri, 05 May 2023 11:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1puxXj-0008RQ-Bf
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:40:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1puxXh-00051S-Ee
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:40:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683301220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C/9EcHX4qnB9oMTlmvSJDOWM0TiS28NXODPj109Vof4=;
 b=VyRTnVmKhfRz6cXfvHupcE4CPT8Fl6pvvOQFE6VxgkepMf7qJ37qXGUeYuXl5ys+e7JLto
 8LbSDWCUcgE9iV/KzUOC2v1qIcENHASQVuJqyyyTu+oFzX/U7l3NRq1dE3IHxxuTNQjbmd
 amsSY/jgqHfUlIOUOiLILud73vuice0=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-nBYKX7ihMyS9LxlMSelIKw-1; Fri, 05 May 2023 11:40:18 -0400
X-MC-Unique: nBYKX7ihMyS9LxlMSelIKw-1
Received: by mail-yb1-f200.google.com with SMTP id
 3f1490d57ef6-b9a7550dca3so3467829276.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 08:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683301218; x=1685893218;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C/9EcHX4qnB9oMTlmvSJDOWM0TiS28NXODPj109Vof4=;
 b=FWKMaDOlsdnK4lrv995tru582aBmtqWv/PVvcjU5WzsANJvTbcOZsw24OEMCHr0d1a
 5Yn63OM76NAv+meQxGKHHsJJ2prLg7ogAPn5+OtKmXPu4nf01IY6OPKwu1ZoZjCiHpWP
 y5Jz5daPix+JQEHzED2QwJY/y8IiynL0acwTVsNNWeLmV6VV9xyFi92l9XnUM8+vThxn
 TH+f0OVWoFRO+AJwWM3dZHxPtz8/BXCE2aLwX85s5Ty0IUNuWidol8NxhMPpuS4pfWSw
 MhUoH0qsHy7H26wNgaSDn47FExaN66TsQtBb0kT29PVCBNHlY3pl0ZHjlq/qTQH6iQGz
 2wOQ==
X-Gm-Message-State: AC+VfDyfbWUgQoBB2PeH4Y2ahwR9FEhOzUjxg7T6aP9iSY0CzlNRIrnu
 vo/2ZGhlT7v7YxBGr9VoM5jJVmYNcafHDg26JEhhNsEzAp42VehkkQfHy57qamju0TyYMiS/YwW
 BIhfI9Czyi18eHcxqZf6qW9eRmYEOWiM=
X-Received: by 2002:a25:7355:0:b0:b9a:7cfe:9bed with SMTP id
 o82-20020a257355000000b00b9a7cfe9bedmr2189880ybc.14.1683301218397; 
 Fri, 05 May 2023 08:40:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7TyuGIz124zW1XOQ9+tR3X/RWUykO0mZBatLAhzYK55mffFR6vboCYQ5K9bFQES91urDNvn034bOx4kYiTHCI=
X-Received: by 2002:a25:7355:0:b0:b9a:7cfe:9bed with SMTP id
 o82-20020a257355000000b00b9a7cfe9bedmr2189868ybc.14.1683301218170; Fri, 05
 May 2023 08:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230501230409.274178-1-stefanha@redhat.com>
In-Reply-To: <20230501230409.274178-1-stefanha@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 5 May 2023 17:39:41 +0200
Message-ID: <CAJaqyWdenC-q8VEYafgPML_rzDPzc-gsBp7uca5r-hOpY-kxaw@mail.gmail.com>
Subject: Re: [PATCH v2] vhost-user: send SET_STATUS 0 after GET_VRING_BASE
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Yajun Wu <yajunw@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, May 2, 2023 at 1:42=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat.com=
> wrote:
>
> Setting the VIRTIO Device Status Field to 0 resets the device. The
> device's state is lost, including the vring configuration.
>
> vhost-user.c currently sends SET_STATUS 0 before GET_VRING_BASE. This
> risks confusion about the lifetime of the vhost-user state (e.g. vring
> last_avail_idx) across VIRTIO device reset.
>
> Eugenio P=C3=A9rez <eperezma@redhat.com> adjusted the order for vhost-vdp=
a.c
> in commit c3716f260bff ("vdpa: move vhost reset after get vring base")
> and in that commit description suggested doing the same for vhost-user
> in the future.
>
> Go ahead and adjust vhost-user.c now. I ran various online code searches
> to identify vhost-user backends implementing SET_STATUS. It seems only
> DPDK implements SET_STATUS and Yajun Wu <yajunw@nvidia.com> has
> confirmed that it is safe to make this change.
>
> Fixes: commit 923b8921d210763359e96246a58658ac0db6c645 ("vhost-user: Supp=
ort vhost_dev_start")
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Cindy Lu <lulu@redhat.com>
> Cc: Yajun Wu <yajunw@nvidia.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

> ---
> v2:
> - Added VHOST_USER_PROTOCOL_F_STATUS check [Yajun Wu]
> - Added "Fixes:" tag [Michael]
> ---
>  hw/virtio/vhost-user.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index e5285df4ba..40974afd06 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -2677,7 +2677,20 @@ static int vhost_user_dev_start(struct vhost_dev *=
dev, bool started)
>                                            VIRTIO_CONFIG_S_DRIVER |
>                                            VIRTIO_CONFIG_S_DRIVER_OK);
>      } else {
> -        return vhost_user_set_status(dev, 0);
> +        return 0;
> +    }
> +}
> +
> +static void vhost_user_reset_status(struct vhost_dev *dev)
> +{
> +    /* Set device status only for last queue pair */
> +    if (dev->vq_index + dev->nvqs !=3D dev->vq_index_end) {
> +        return;
> +    }
> +
> +    if (virtio_has_feature(dev->protocol_features,
> +                           VHOST_USER_PROTOCOL_F_STATUS)) {
> +        vhost_user_set_status(dev, 0);
>      }
>  }
>
> @@ -2716,4 +2729,5 @@ const VhostOps user_ops =3D {
>          .vhost_get_inflight_fd =3D vhost_user_get_inflight_fd,
>          .vhost_set_inflight_fd =3D vhost_user_set_inflight_fd,
>          .vhost_dev_start =3D vhost_user_dev_start,
> +        .vhost_reset_status =3D vhost_user_reset_status,
>  };
> --
> 2.40.1
>
>


