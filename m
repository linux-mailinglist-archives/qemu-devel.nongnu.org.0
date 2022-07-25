Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2326E57F9E9
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 09:10:24 +0200 (CEST)
Received: from localhost ([::1]:33302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFsEQ-00032i-V6
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 03:10:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oFsBz-0000Oc-D7
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 03:07:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oFsBx-00071g-Cf
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 03:07:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658732868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d9eaj1DoG8Ac3WS9RAR0NNxNI6/ZX16bjZ631mEaxy8=;
 b=H2jDTzLhQ7ikzmpsDaIVnuMoEdIDaXEnMrnV0ENWhhkJpiVdythd5S9JNi4VHHvo+zc2DV
 8+xes43cyH9KbfeAYaPCd+aP+2C5cPCsSAka0OycJJonCfdoTq/ZQLcsVcTZOebzEq5vbZ
 mgwFqSrEOjipNaqI9s//WnexmPXBrKU=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-WhuE0kadNqq44Nz_DbBULg-1; Mon, 25 Jul 2022 03:07:44 -0400
X-MC-Unique: WhuE0kadNqq44Nz_DbBULg-1
Received: by mail-lf1-f70.google.com with SMTP id
 y7-20020ac24467000000b0048a7aa5a96dso1694780lfl.11
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 00:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=d9eaj1DoG8Ac3WS9RAR0NNxNI6/ZX16bjZ631mEaxy8=;
 b=agXXP5VLGMeVX37YiKDl820BRKGj1aLrDRfZSh40QzJAZpidxErTDS/5CD1HUz6k/k
 8mCQ8JahaEhyMHzCh/hlatqHMILnGPsY+W2hlhzgdZmHMVvlbGuRwJI0C+c1RzNYglIn
 rmqWb5+CfUhKsgq9p8GnhUJSXISrNxHe+cmY6rpfF6jZ8aSo5mmvv+eqVWISoOKWkly5
 e0DPqkfJEnUgrnu+uMs3XNmwq6m4mo/OuCL9Tu/peT40cFIJc3/jpG3xyt8PgmGHgOOp
 Y1qNcDGlwr45SOha9Y35pJP6a23RvXVbUtezRcmbFf7NSx6i8yZRu+SgibwoUkrHT0Yy
 yS9Q==
X-Gm-Message-State: AJIora976fB/4xaUErDHVOoZBKOsCF1DwRluHkpiCaHZatNfalUz43Ec
 5z3oO2dGyZIGXb9QdPU3AMTQb7ohS57FanqTvKbxDOd55opSk07AjEbQm+D5S+qZR/VUUbnBKrH
 9RPLeKj8P8ki5+Lfo0G+Z/0uJZz1jKtE=
X-Received: by 2002:a2e:9e1a:0:b0:25d:f9db:92f7 with SMTP id
 e26-20020a2e9e1a000000b0025df9db92f7mr3095086ljk.243.1658732862573; 
 Mon, 25 Jul 2022 00:07:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s0ZR30briwjNT0l4ErAZEfL5JspPxehGV3xY9wI5aoR4s9ajS9DiERUQlZxSR3J5G878eHQ/GgRjZzeg0Yc8Y=
X-Received: by 2002:a2e:9e1a:0:b0:25d:f9db:92f7 with SMTP id
 e26-20020a2e9e1a000000b0025df9db92f7mr3095081ljk.243.1658732862402; Mon, 25
 Jul 2022 00:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220718120545.2879871-1-eperezma@redhat.com>
In-Reply-To: <20220718120545.2879871-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 25 Jul 2022 15:07:31 +0800
Message-ID: <CACGkMEtQN7EaPvwUzN8fU_LdOqKS90nk0n_CuAduVgsSf+oU2Q@mail.gmail.com>
Subject: Re: [PATCH v2] vhost: Get vring base from vq, not svq
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Mon, Jul 18, 2022 at 8:05 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> The SVQ vring used idx usually match with the guest visible one, as long
> as all the guest buffers (GPA) maps to exactly one buffer within qemu's
> VA. However, as we can see in virtqueue_map_desc, a single guest buffer
> could map to many buffers in SVQ vring.
>
> Also, its also a mistake to rewind them at the source of migration.
> Since VirtQueue is able to migrate the inflight descriptors, its
> responsability of the destination to perform the rewind just in case it
> cannot report the inflight descriptors to the device.
>
> This makes easier to migrate between backends or to recover them in
> vhost devices that support set in flight descriptors.
>
> Fixes: 6d0b22266633 ("vdpa: Adapt vhost_vdpa_get_vring_base to SVQ")
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

>
> --
> v2: Squash both fixes in one.
> ---
>  hw/virtio/vhost-vdpa.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 795ed5a049..4458c8d23e 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -1178,7 +1178,18 @@ static int vhost_vdpa_set_vring_base(struct vhost_=
dev *dev,
>                                         struct vhost_vring_state *ring)
>  {
>      struct vhost_vdpa *v =3D dev->opaque;
> +    VirtQueue *vq =3D virtio_get_queue(dev->vdev, ring->index);
>
> +    /*
> +     * vhost-vdpa devices does not support in-flight requests. Set all o=
f them
> +     * as available.
> +     *
> +     * TODO: This is ok for networking, but other kinds of devices might
> +     * have problems with these retransmissions.
> +     */
> +    while (virtqueue_rewind(vq, 1)) {
> +        continue;
> +    }
>      if (v->shadow_vqs_enabled) {
>          /*
>           * Device vring base was set at device start. SVQ base is handle=
d by
> @@ -1194,21 +1205,10 @@ static int vhost_vdpa_get_vring_base(struct vhost=
_dev *dev,
>                                         struct vhost_vring_state *ring)
>  {
>      struct vhost_vdpa *v =3D dev->opaque;
> -    int vdpa_idx =3D ring->index - dev->vq_index;
>      int ret;
>
>      if (v->shadow_vqs_enabled) {
> -        VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs, v=
dpa_idx);
> -
> -        /*
> -         * Setting base as last used idx, so destination will see as ava=
ilable
> -         * all the entries that the device did not use, including the in=
-flight
> -         * processing ones.
> -         *
> -         * TODO: This is ok for networking, but other kinds of devices m=
ight
> -         * have problems with these retransmissions.
> -         */
> -        ring->num =3D svq->last_used_idx;
> +        ring->num =3D virtio_queue_get_last_avail_idx(dev->vdev, ring->i=
ndex);
>          return 0;
>      }
>
> --
> 2.31.1
>


