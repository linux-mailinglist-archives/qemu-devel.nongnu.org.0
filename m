Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B082B57D8A3
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 04:31:44 +0200 (CEST)
Received: from localhost ([::1]:38826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEiS7-0008VZ-9a
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 22:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oEiQE-00071J-NH
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 22:29:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oEiQC-0005Ui-25
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 22:29:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658456982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YQCMWi9tg9OObyUAPSrhsLFNzqfQwkPJIpTw50Pb930=;
 b=iOqvLONGEFO9ZZzS7F9w6IfXgoq3rT5yie6kqrboNRhrZe1LGLjEZeLNcW2ZG57jG/PxHW
 nuX/yHQOdNpe+J82aZCa7OGVf4vy6YW7eA4uyZ9ezKkshwLjpfId2Av21GrNs6q/ksGxKa
 wqiEgQ5Acw63P5bW92GQxaGCn7qQwqg=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-KpDCbbx8Pvq2hCVFqp2giQ-1; Thu, 21 Jul 2022 22:29:33 -0400
X-MC-Unique: KpDCbbx8Pvq2hCVFqp2giQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 w20-20020a194914000000b00489e66662d1so1308910lfa.1
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 19:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YQCMWi9tg9OObyUAPSrhsLFNzqfQwkPJIpTw50Pb930=;
 b=w9sADnomRAi8yvxLErwdB8zMAUKnbkGxfjeVYYvyKwl4Mfe2M07Q9yYm9M0GWrU+h2
 UVKJOTPbHpdcT8F/kNwA84nKTTlzjLOAnJk/5NjNFP2fQpskYhM+fPoZcs98dPApBG86
 Q/NDN+n/1OXRA5WjCP70xrTmGi4OQtyEwmSd5URFprydPQbKtzQ6rqrKb1HxAtUZ233O
 QxCfmVS+WH/kRBM9ASo9MRmfEtbE0AJxtN/ucOj890WI6P/h6TPmVbOBsZoUsfW8QOy1
 XnrUrLmI1FoIP6iZIn9uYd5c07kT1SdemJOgcX00wQw2+38ZUgCEh0wQwYvbEJKyuWEa
 wcsA==
X-Gm-Message-State: AJIora8Xxh2BaQy7T5sHjKlY24EdD+YursrDtINIuemsgcDgcjyWQx3o
 w8ERN5D0jHb4Zf274PwGGACLuuM9TtvT2hVTmDSL9qfh6fykWsbI1ZTazzIBb8UqTfHVd7HMhZ7
 jio8cV8FiRTT1CI8rDy5Oq1CxTojRkzo=
X-Received: by 2002:a05:6512:3145:b0:48a:73bc:9059 with SMTP id
 s5-20020a056512314500b0048a73bc9059mr481931lfi.397.1658456972126; 
 Thu, 21 Jul 2022 19:29:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t5IP2uLjrAibQstj9CmyAYjfy/50TwNPl8NwXV7Wy59Mi0QD+VBSweDyupAKliZROZYWHWLdC1fJke0a60wXw=
X-Received: by 2002:a05:6512:3145:b0:48a:73bc:9059 with SMTP id
 s5-20020a056512314500b0048a73bc9059mr481912lfi.397.1658456971788; Thu, 21 Jul
 2022 19:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220718162938.2938783-1-eperezma@redhat.com>
 <20220718162938.2938783-5-eperezma@redhat.com>
In-Reply-To: <20220718162938.2938783-5-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 22 Jul 2022 10:29:20 +0800
Message-ID: <CACGkMEsjR6HbVLzLNypMu+7yLkAosrkLCSkrySG5miQfd+ZLdg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] vdpa: Add virtio-net mac address via CVQ at start
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Eric Blake <eblake@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 Parav Pandit <parav@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Eli Cohen <eli@mellanox.com>
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

On Tue, Jul 19, 2022 at 12:30 AM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
>
> This is needed so the destination vdpa device see the same state a the
> guest set in the source.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  include/net/vhost-vdpa.h |  1 +
>  hw/net/vhost_net.c       |  8 +++++
>  net/vhost-vdpa.c         | 64 ++++++++++++++++++++++++++++++++++++++--
>  3 files changed, 71 insertions(+), 2 deletions(-)
>
> diff --git a/include/net/vhost-vdpa.h b/include/net/vhost-vdpa.h
> index b81f9a6f2a..38d65e845d 100644
> --- a/include/net/vhost-vdpa.h
> +++ b/include/net/vhost-vdpa.h
> @@ -15,6 +15,7 @@
>  #define TYPE_VHOST_VDPA "vhost-vdpa"
>
>  struct vhost_net *vhost_vdpa_get_vhost_net(NetClientState *nc);
> +int vhost_vdpa_start(NetClientState *nc);
>
>  extern const int vdpa_feature_bits[];
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index ccac5b7a64..f9cebd9716 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -274,6 +274,13 @@ static int vhost_net_start_one(struct vhost_net *net=
,
>              }
>          }
>      }
> +
> +    if (net->nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA) {
> +        r =3D vhost_vdpa_start(net->nc);
> +        if (r < 0) {
> +            goto fail;
> +        }
> +    }

This seems tricky, I wonder if we can do this via NetClientInfo
instead of directly via the vhost layer?

Note that the virtio-net has several places that check VDPA backend
explicitly. This is suboptimal, I will post patch to hide them via
NetClientInfo.

>      return 0;
>  fail:
>      file.fd =3D -1;
> @@ -373,6 +380,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState=
 *ncs,
>          r =3D vhost_net_start_one(get_vhost_net(peer), dev);
>
>          if (r < 0) {
> +            vhost_net_stop_one(get_vhost_net(peer), dev);

This should not be correct. vhost_net_start_one() fail means the
device is not started, stop once again seems not again.

>              goto err_start;
>          }
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 533bd9f680..84e90f067a 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -342,9 +342,12 @@ static virtio_net_ctrl_ack vhost_vdpa_net_cvq_add(Vh=
ostShadowVirtqueue *svq,
>      virtio_net_ctrl_ack status;
>      size_t dev_written;
>      int r;
> -    void *unused =3D (void *)1;
>
> -    r =3D vhost_svq_add(svq, &dev_buffers[0], 1, &dev_buffers[1], 1, unu=
sed);
> +    /*
> +     * Add a fake non-NULL VirtQueueElement since we'll remove before SV=
Q
> +     * event loop can get it.
> +     */
> +    r =3D vhost_svq_add(svq, &dev_buffers[0], 1, &dev_buffers[1], 1, (vo=
id *)1);

Any reason we can 't simply pass NULL as the last parameter for vhost_svq_a=
dd()?

Thanks

>      if (unlikely(r !=3D 0)) {
>          if (unlikely(r =3D=3D -ENOSPC)) {
>              qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device queue=
\n",
> @@ -372,6 +375,63 @@ static virtio_net_ctrl_ack vhost_vdpa_net_cvq_add(Vh=
ostShadowVirtqueue *svq,
>      return VIRTIO_NET_OK;
>  }
>
> +int vhost_vdpa_start(NetClientState *nc)
> +{
> +    VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> +    VirtIONet *n =3D VIRTIO_NET(v->dev->vdev);
> +    uint64_t features =3D v->dev->vdev->host_features;
> +    VhostShadowVirtqueue *svq;
> +
> +    if (!v->shadow_vqs_enabled) {
> +        return 0;
> +    }
> +
> +    if (v->dev->vq_index + v->dev->nvqs !=3D v->dev->vq_index_end) {
> +        /* Only interested in CVQ */
> +        return 0;
> +    }
> +
> +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> +
> +    svq =3D g_ptr_array_index(v->shadow_vqs, 0);
> +    if (features & BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR)) {
> +        const struct virtio_net_ctrl_hdr ctrl =3D {
> +            .class =3D VIRTIO_NET_CTRL_MAC,
> +            .cmd =3D VIRTIO_NET_CTRL_MAC_ADDR_SET,
> +        };
> +        uint8_t mac[6];
> +        const struct iovec out[] =3D {
> +            {
> +                .iov_base =3D (void *)&ctrl,
> +                .iov_len =3D sizeof(ctrl),
> +            },{
> +                .iov_base =3D mac,
> +                .iov_len =3D sizeof(mac),
> +            },
> +        };
> +        struct iovec dev_buffers[2] =3D {
> +            { .iov_base =3D s->cvq_cmd_out_buffer },
> +            { .iov_base =3D s->cvq_cmd_in_buffer },
> +        };
> +        bool ok;
> +        virtio_net_ctrl_ack state;
> +
> +        ok =3D vhost_vdpa_net_cvq_map_sg(s, out, ARRAY_SIZE(out), dev_bu=
ffers);
> +        if (unlikely(!ok)) {
> +            return -1;
> +        }
> +
> +        memcpy(mac, n->mac, sizeof(mac));
> +        state =3D vhost_vdpa_net_cvq_add(svq, dev_buffers);
> +        vhost_vdpa_cvq_unmap_buf(v, dev_buffers[0].iov_base);
> +        vhost_vdpa_cvq_unmap_buf(v, dev_buffers[1].iov_base);
> +        return state =3D=3D VIRTIO_NET_OK ? 0 : 1;
> +    }
> +
> +    return 0;
> +}
> +
>  /**
>   * Do not forward commands not supported by SVQ. Otherwise, the device c=
ould
>   * accept it and qemu would not know how to update the device model.
> --
> 2.31.1
>


