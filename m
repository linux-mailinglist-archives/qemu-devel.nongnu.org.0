Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603F26DF25B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 12:57:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmYA8-0006zI-I5; Wed, 12 Apr 2023 06:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gmaglion@redhat.com>)
 id 1pmYA5-0006tU-4B
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 06:57:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gmaglion@redhat.com>)
 id 1pmYA2-0000rT-QC
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 06:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681297029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UCRNNQLkEoxkamIpgA7aXKJU4UEWlOTvdpB5918psN0=;
 b=ftp91qtrpQKXxt/ngGrUqKd6hft6lStWlgB2qo+E7FlkMOxgR8mr1NQp0iL45Ba7bxCQZP
 0XR5zE500V9+DwNyDOlnTN9MCve7dHliI+aDYmxAbG6QWdKjxxm6GKFOaythr/YUHK7lmE
 VOtdUp1lKCgSNT4wVd+berlNN8oHSXQ=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-uByKO8f8N2i4KNBmj0UedQ-1; Wed, 12 Apr 2023 06:55:55 -0400
X-MC-Unique: uByKO8f8N2i4KNBmj0UedQ-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-54f97aac3d0so12321897b3.15
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 03:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681296954; x=1683888954;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UCRNNQLkEoxkamIpgA7aXKJU4UEWlOTvdpB5918psN0=;
 b=Q/NAfwtvyktWlB2CJbwDXSJF0MOc4STDVORBHEXG9eETRK0YzT3xrdWf6iyhjL39Vs
 BE1WMPuGjchzrENXg+hEzamhyRrdUv/AV2asi8hFj78xB1fZRuGSsHrNvdh6OaOgFlcW
 YCFMuOGPJqO7rNUv7di79OESMdhb59uOWLvfsXk5upzM1IKb8EirjZArPdH1AJW0Ft0J
 pmP9eMc0P25WATUqmqpiAP9ajWnqpvoriefh92VaSCxnUFGWkAp7zYpPod+I4ysZ/Ssb
 VixuFMgB75IzWqqWTFWoU3Ok4aGuje7lPozcWTLdErn2EVPtYjzJDz52wfYFGzRQQ+Kj
 tsPA==
X-Gm-Message-State: AAQBX9euvFjayiZUF5/uH3fWy5rt5hDNJ3OsLxsx/7dr4aRNRx74h2fS
 5qOhBxmua8GrXNLTZvZZqZALpEmx7W3tz6LHtnP7DK9UxKvqBZ/iwEsVvKhjFVtvrcAGUO/laoz
 5TAhiBRXgN0OnsxZ5ny1Q9ohk+GlrRlY=
X-Received: by 2002:a81:b657:0:b0:544:8bc1:a179 with SMTP id
 h23-20020a81b657000000b005448bc1a179mr1140037ywk.4.1681296954558; 
 Wed, 12 Apr 2023 03:55:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y/T+HrxvZGcjNmH9O1Zm/+L6JsvIOvVFjpnPMs6RdnYEx5ohGbg8c4M6WPSA7WoMO8emQAJn+DXeOOe/zx+j8=
X-Received: by 2002:a81:b657:0:b0:544:8bc1:a179 with SMTP id
 h23-20020a81b657000000b005448bc1a179mr1140023ywk.4.1681296954320; Wed, 12 Apr
 2023 03:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-2-hreitz@redhat.com>
In-Reply-To: <20230411150515.14020-2-hreitz@redhat.com>
From: German Maglione <gmaglione@redhat.com>
Date: Wed, 12 Apr 2023 12:55:18 +0200
Message-ID: <CAJh=p+4ki4XGEKZBQADUT5iO2NfPEyhYG4aTmaXyMPNzALpiwg@mail.gmail.com>
Subject: Re: [PATCH 1/4] vhost: Re-enable vrings after setting features
To: Hanna Czenczek <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>, 
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gmaglion@redhat.com;
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

On Tue, Apr 11, 2023 at 5:05=E2=80=AFPM Hanna Czenczek <hreitz@redhat.com> =
wrote:
>
> If the back-end supports the VHOST_USER_F_PROTOCOL_FEATURES feature,
> setting the vhost features will set this feature, too.  Doing so
> disables all vrings, which may not be intended.
>
> For example, enabling or disabling logging during migration requires
> setting those features (to set or unset VHOST_F_LOG_ALL), which will
> automatically disable all vrings.  In either case, the VM is running
> (disabling logging is done after a failed or cancelled migration, and
> only once the VM is running again, see comment in
> memory_global_dirty_log_stop()), so the vrings should really be enabled.
> As a result, the back-end seems to hang.
>
> To fix this, we must remember whether the vrings are supposed to be
> enabled, and, if so, re-enable them after a SET_FEATURES call that set
> VHOST_USER_F_PROTOCOL_FEATURES.
>
> It seems less than ideal that there is a short period in which the VM is
> running but the vrings will be stopped (between SET_FEATURES and
> SET_VRING_ENABLE).  To fix this, we would need to change the protocol,
> e.g. by introducing a new flag or vhost-user protocol feature to disable
> disabling vrings whenever VHOST_USER_F_PROTOCOL_FEATURES is set, or add
> new functions for setting/clearing singular feature bits (so that
> F_LOG_ALL can be set/cleared without touching F_PROTOCOL_FEATURES).
>

Could be the other way around?, I mean before commit
02b61f38d3574900fb4cc4c450b17c75956a6a04

so until v7.2rc0 we didn't have this problem with
VHOST_USER_F_PROTOCOL_FEATURES,
so "it seems" it's fine to start with the vrings enabled, could be
possible to go back to that
behavior (reflecting that in the spec) and add a new flag to start
with vrings disabled?

> Even with such a potential addition to the protocol, we still need this
> fix here, because we cannot expect that back-ends will implement this
> addition.
>
> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> ---
>  include/hw/virtio/vhost.h | 10 ++++++++++
>  hw/virtio/vhost.c         | 13 +++++++++++++
>  2 files changed, 23 insertions(+)
>
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index a52f273347..2fe02ed5d4 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -90,6 +90,16 @@ struct vhost_dev {
>      int vq_index_end;
>      /* if non-zero, minimum required value for max_queues */
>      int num_queues;
> +
> +    /*
> +     * Whether the virtqueues are supposed to be enabled (via
> +     * SET_VRING_ENABLE).  Setting the features (e.g. for
> +     * enabling/disabling logging) will disable all virtqueues if
> +     * VHOST_USER_F_PROTOCOL_FEATURES is set, so then we need to
> +     * re-enable them if this field is set.
> +     */
> +    bool enable_vqs;
> +
>      /**
>       * vhost feature handling requires matching the feature set
>       * offered by a backend which may be a subset of the total
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index a266396576..cbff589efa 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -50,6 +50,8 @@ static unsigned int used_memslots;
>  static QLIST_HEAD(, vhost_dev) vhost_devices =3D
>      QLIST_HEAD_INITIALIZER(vhost_devices);
>
> +static int vhost_dev_set_vring_enable(struct vhost_dev *hdev, int enable=
);
> +
>  bool vhost_has_free_slot(void)
>  {
>      unsigned int slots_limit =3D ~0U;
> @@ -899,6 +901,15 @@ static int vhost_dev_set_features(struct vhost_dev *=
dev,
>          }
>      }
>
> +    if (dev->enable_vqs) {
> +        /*
> +         * Setting VHOST_USER_F_PROTOCOL_FEATURES would have disabled al=
l
> +         * virtqueues, even if that was not intended; re-enable them if
> +         * necessary.
> +         */
> +        vhost_dev_set_vring_enable(dev, true);
> +    }
> +
>  out:
>      return r;
>  }
> @@ -1896,6 +1907,8 @@ int vhost_dev_get_inflight(struct vhost_dev *dev, u=
int16_t queue_size,
>
>  static int vhost_dev_set_vring_enable(struct vhost_dev *hdev, int enable=
)
>  {
> +    hdev->enable_vqs =3D enable;
> +
>      if (!hdev->vhost_ops->vhost_set_vring_enable) {
>          return 0;
>      }
> --
> 2.39.1
>


--=20
German


