Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9E36E801D
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 19:08:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppBGh-0004eB-PA; Wed, 19 Apr 2023 13:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ppBGf-0004dg-ID
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 13:06:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ppBGc-0001Jx-QZ
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 13:06:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681924009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4W3VY4hp6sIMZV/wws6xG5JAK0A28phgs4wvcRBtlEw=;
 b=XO0opHYD8cuyhbATwUB+xIpznFxFLfpjZRzEpOu0/OUaXsn0yVVVW+YgWmL+PNmRK+LfxT
 fcbMSVC1r+QslVgvkDxesLLsekjHc3IMwBcuepaLsYdtaYdCxElk4v7ThDBh76EOD0/e+S
 PHfeBY8Hb7HvolmMmQQHmFTq9r5FAhM=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-aloK7NGTMxawNJcN_k4h4Q-1; Wed, 19 Apr 2023 13:06:48 -0400
X-MC-Unique: aloK7NGTMxawNJcN_k4h4Q-1
Received: by mail-yb1-f198.google.com with SMTP id
 v200-20020a252fd1000000b00b8f548a72bbso174215ybv.9
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 10:06:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681924007; x=1684516007;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4W3VY4hp6sIMZV/wws6xG5JAK0A28phgs4wvcRBtlEw=;
 b=lFYnsOdsgJBgSzEaQsG9A9aeQEHAaSDDIkGH1nq4o6VIhGdqBjIeajfm7A6C6FpFfp
 jNOA9ix6sUb15aGvi15/BKzah0yQuVm38d5F7VO3ndwv35n0zTnZ2mV65PqD6YTB/KPT
 KB8BMtg/Fd912ptJOr7/3F9uM7ruYyCKcv3jMYdSjnf0IMk6eOP6n5qQfMRNu/cEibfm
 bjJx7RV1RVjh+xUkaQvRFtKqariW7FmhLYJrhmyBcSN3TgZeLO3TTZT7qRGHOfq0gGQC
 BnJmiCNbpD+iJAkuCsLGma9UfzO5uCKwkyAG39W49ztB7tCeSGoMBicgylIktD72utT0
 IAkg==
X-Gm-Message-State: AAQBX9dhnqinnhpJf4StyxGsqCdLyLNc277LzlO64RsN3JIWgwqWFo+A
 fBpGlnmaCy4/YT+jT4im0SgoPHE4AtoKJuJDBCCBsaA5U5DfaBAvIz4fwPHdGdc0xX3jTwZ2qxF
 S02JsDl1cXS0fwOx1jOaOgnqeZ5NkaDncYozN+7ahTg==
X-Received: by 2002:a05:6902:114b:b0:b96:c255:acf3 with SMTP id
 p11-20020a056902114b00b00b96c255acf3mr525165ybu.11.1681924007245; 
 Wed, 19 Apr 2023 10:06:47 -0700 (PDT)
X-Google-Smtp-Source: AKy350b6zSUpkCr09enbcr6KSLF7q/D5+TfpCYD+EWEPLGyER9OsyWFkbwtGD4tbZcW81xgruuqaOiZeG5eA7R72sSk=
X-Received: by 2002:a05:6902:114b:b0:b96:c255:acf3 with SMTP id
 p11-20020a056902114b00b00b96c255acf3mr525135ybu.11.1681924006976; Wed, 19 Apr
 2023 10:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1681819697.git.ray90514@gmail.com>
 <5c10e79c26b8dda38ebeba6bcafb8bc650f6a588.1681819697.git.ray90514@gmail.com>
In-Reply-To: <5c10e79c26b8dda38ebeba6bcafb8bc650f6a588.1681819697.git.ray90514@gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 19 Apr 2023 19:06:10 +0200
Message-ID: <CAJaqyWdJBbrBwj1NyeU6z_j8mo+UV9tiM6yM7QtJ92w9bBh1aA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 2/2] vhost-vdpa: cache device config
To: Shao-Chien Chiang <ray90514@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Tue, Apr 18, 2023 at 3:22=E2=80=AFPM Shao-Chien Chiang <ray90514@gmail.c=
om> wrote:
>
> The config caching is disabled when starting config interruption.
> If we could know whether there is a config interruption, I think we can
> invalidate the cache at that time instead of disabling the caching
> mechanism.
> After caching the device config, the latency is reduced by 0.066 sec.
>
> Signed-off-by: Shao-Chien Chiang <ray90514@gmail.com>
> ---
>  hw/virtio/vhost-vdpa.c         | 44 +++++++++++++++++++++++++++-------
>  include/hw/virtio/vhost-vdpa.h |  2 ++
>  2 files changed, 38 insertions(+), 8 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index ccde4c7040..92bb09ef4d 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -436,6 +436,8 @@ static int vhost_vdpa_init(struct vhost_dev *dev, voi=
d *opaque, Error **errp)
>      v->msg_type =3D VHOST_IOTLB_MSG_V2;
>      v->status =3D 0;
>      v->features =3D dev->features;
> +    v->config =3D NULL;
> +    v->config_cache_enabled =3D true;
>      vhost_vdpa_init_svq(dev, v);
>
>      error_propagate(&dev->migration_blocker, v->migration_blocker);
> @@ -748,8 +750,16 @@ static int vhost_vdpa_set_vring_ready(struct vhost_d=
ev *dev)
>  static int vhost_vdpa_set_config_call(struct vhost_dev *dev,
>                                         int fd)
>  {
> +    struct vhost_vdpa *v =3D dev->opaque;
> +    int ret;
> +
>      trace_vhost_vdpa_set_config_call(dev, fd);
> -    return vhost_vdpa_call(dev, VHOST_VDPA_SET_CONFIG_CALL, &fd);
> +    ret =3D vhost_vdpa_call(dev, VHOST_VDPA_SET_CONFIG_CALL, &fd);
> +    if (ret =3D=3D 0) {
> +        v->config_cache_enabled =3D false;

The lifecycle of the vhost_vdpa device is:
init -> start -> stop -> start -> .... -> cleanup.

In other words, it is initialized only once at qemu startup but it can
be started & stopped many times. You can check if the device is
stopping if the fd is -1. Other values indicate the device is starting
or that the notifier is being masked, we must disable the cache in
both cases.

You can force this cycle if you rmmod the virtio_net module in the
guest and then modprobe it again. However, maybe it only accesses the
config once in this situation. If that is the case, I think it is
worth keeping this code and putting a comment explaining it.

Thanks!

> +    }
> +
> +    return ret;
>  }
>
>  static void vhost_vdpa_dump_config(struct vhost_dev *dev, const uint8_t =
*config,
> @@ -769,6 +779,7 @@ static int vhost_vdpa_set_config(struct vhost_dev *de=
v, const uint8_t *data,
>                                     uint32_t offset, uint32_t size,
>                                     uint32_t flags)
>  {
> +    struct vhost_vdpa *v =3D dev->opaque;
>      struct vhost_vdpa_config *config;
>      int ret;
>      unsigned long config_size =3D offsetof(struct vhost_vdpa_config, buf=
);
> @@ -783,6 +794,11 @@ static int vhost_vdpa_set_config(struct vhost_dev *d=
ev, const uint8_t *data,
>          vhost_vdpa_dump_config(dev, data, size);
>      }
>      ret =3D vhost_vdpa_call(dev, VHOST_VDPA_SET_CONFIG, config);
> +    if (v->config_cache_enabled && v->config !=3D NULL) {
> +        if (ret =3D=3D 0) {
> +            memcpy(v->config->buf + offset, data, size);
> +        }
> +    }
>      g_free(config);
>      return ret;
>  }
> @@ -790,17 +806,29 @@ static int vhost_vdpa_set_config(struct vhost_dev *=
dev, const uint8_t *data,
>  static int vhost_vdpa_get_config(struct vhost_dev *dev, uint8_t *config,
>                                     uint32_t config_len, Error **errp)
>  {
> -    struct vhost_vdpa_config *v_config;
> +    struct vhost_vdpa *v =3D dev->opaque;
>      unsigned long config_size =3D offsetof(struct vhost_vdpa_config, buf=
);
>      int ret;
>
>      trace_vhost_vdpa_get_config(dev, config, config_len);
> -    v_config =3D g_malloc(config_len + config_size);
> -    v_config->len =3D config_len;
> -    v_config->off =3D 0;
> -    ret =3D vhost_vdpa_call(dev, VHOST_VDPA_GET_CONFIG, v_config);
> -    memcpy(config, v_config->buf, config_len);
> -    g_free(v_config);
> +    if (v->config_cache_enabled && v->config !=3D NULL) {
> +        if (config_len <=3D v->config->len) {
> +            memcpy(config, v->config->buf, config_len);
> +            ret =3D 0;
> +        } else {
> +            ret =3D -EINVAL;
> +        }
> +    } else {
> +        v->config =3D g_malloc(config_len + config_size);

This may not be the whole size of the config. The size is
sizeof(struct virtio_net_config), and it should be set to 0 with
g_malloc0.

> +        v->config->len =3D config_len;
> +        v->config->off =3D 0;
> +        ret =3D vhost_vdpa_call(dev, VHOST_VDPA_GET_CONFIG, v->config);
> +        memcpy(config, v->config->buf, config_len);
> +        if (!v->config_cache_enabled) {
> +            g_free(v->config);
> +            v->config =3D NULL;

Maybe it is worth freeing it at vhost_vdpa_set_config_call?

Thanks!

> +        }
> +    }
>      if (trace_event_get_state_backends(TRACE_VHOST_VDPA_GET_CONFIG) &&
>          trace_event_get_state_backends(TRACE_VHOST_VDPA_DUMP_CONFIG)) {
>          vhost_vdpa_dump_config(dev, config, config_len);
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdp=
a.h
> index d563630cc9..60374785fd 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -41,6 +41,8 @@ typedef struct vhost_vdpa {
>      uint64_t acked_features;
>      uint64_t features;
>      uint8_t status;
> +    struct vhost_vdpa_config *config;
> +    bool config_cache_enabled;
>      bool shadow_vqs_enabled;
>      /* Vdpa must send shadow addresses as IOTLB key for data queues, not=
 GPA */
>      bool shadow_data;
> --
> 2.25.1
>
>


