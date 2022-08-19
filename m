Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB8159955F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 08:39:29 +0200 (CEST)
Received: from localhost ([::1]:39238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOvfD-0000qn-ON
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 02:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oOvVB-0004eU-EW
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 02:29:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oOvV8-0002y9-Ei
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 02:29:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660890540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vsholbglUkh/XhHF1sxCobV7yHeKCyAYcI8G/oL7/X0=;
 b=IlTxS5L1YxX3zXMxmp5jE8USEkBrHOZwEXmUaPGEpe+p3n2FJpXyQ9vEM21jF6tsjehehO
 3AsqgU1jhyfVHCs1y6/CRbdr3pBu247vFqvJuuBJuC6WRJ37xGkuxP1hFzB88qi/hg0bRk
 NkOJL5V63RHE4uBmrSkSqTntb7suNQo=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-594-7hUD9_vmN7Goejexrd_w6w-1; Fri, 19 Aug 2022 02:28:59 -0400
X-MC-Unique: 7hUD9_vmN7Goejexrd_w6w-1
Received: by mail-lj1-f197.google.com with SMTP id
 s8-20020a2e9c08000000b0025e5c453a63so758203lji.21
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 23:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=vsholbglUkh/XhHF1sxCobV7yHeKCyAYcI8G/oL7/X0=;
 b=RFcgKbCe9RP2vZ3SQWdOnV6uh6bpDMMZHbk8vHkugrd+ORljROmUQkApS+WCfli3rF
 U8nxEtlm75l9FMnG5tRLbkaLP/xfeCewmrR7daePfNcpxukdwlkVzAxEm1+b18nhwdO4
 x19661AUbjfSNJKIh1D1AMOunIKtu7bdJ+0oqoHojvs0yeaClolH/KwQ+aL+u74n9xek
 qv/AxEBUYQOB94/0eGx0pNeofgDIZ0QXNY1y2H/pjROj4P4fd5lxONKPZCo+PA5OFcp6
 UL1drEcpLyUeBqdDLplzYcm9RcGh7DP/ERbHRdNPGv1n//ATk67wIq1VJ8GQHBHn/37H
 7L2w==
X-Gm-Message-State: ACgBeo1bp2T/9eLv9EOe9omYFOvXJCu2mzBIZuRTnMpWviB2kIjT+vhL
 9rOhRFgOV4AFf/jO5tKOXkUFaisa11W1KhCkI/QzPMFqNhl+O1WxbNepkfz593rL4UiN3lJgXT+
 zJ6ZWwpEJjmC9XT+J0T+NLiRB4NYhLo4=
X-Received: by 2002:a2e:a418:0:b0:261:9a96:a5c2 with SMTP id
 p24-20020a2ea418000000b002619a96a5c2mr1802403ljn.487.1660890537703; 
 Thu, 18 Aug 2022 23:28:57 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5pEdRD0oCYQRwD+tijOM8ZbzyidpRBAyV8/mMuhkdwfDb/wtIolWBADd2Dsmc/cSoMXnPOgi93OZ98cLN71a0=
X-Received: by 2002:a2e:a418:0:b0:261:9a96:a5c2 with SMTP id
 p24-20020a2ea418000000b002619a96a5c2mr1802384ljn.487.1660890537401; Thu, 18
 Aug 2022 23:28:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220810184220.2362292-1-eperezma@redhat.com>
 <20220810184220.2362292-6-eperezma@redhat.com>
In-Reply-To: <20220810184220.2362292-6-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 19 Aug 2022 14:28:46 +0800
Message-ID: <CACGkMEsEO1hqRMp6d5fR6eMCqCPD4A_8nFTd2ABswWiwX2xSFw@mail.gmail.com>
Subject: Re: [RFC 5/8] vdpa: Add vdpa memory listener
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Cindy Lu <lulu@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Cornelia Huck <cohuck@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>
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

On Thu, Aug 11, 2022 at 2:42 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> This enable net/vdpa to restart the full device when a migration is
> started or stopped.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

I have the following questions

1) any reason that we need to make this net specific? The dirty page
tracking via shadow virtqueue is pretty general. And the net specific
part was done via NetClientInfo anyhow.
2) any reason we can't re-use the vhost-vdpa listener?

(Anyway, it's better to explain the reason in detail in the changelog.)

Thanks

> ---
>  net/vhost-vdpa.c | 87 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index a035c89c34..4c6947feb8 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -21,6 +21,7 @@
>  #include "qemu/memalign.h"
>  #include "qemu/option.h"
>  #include "qapi/error.h"
> +#include "exec/address-spaces.h"
>  #include <linux/vhost.h>
>  #include <sys/ioctl.h>
>  #include <err.h>
> @@ -32,6 +33,8 @@
>  typedef struct VhostVDPAState {
>      NetClientState nc;
>      struct vhost_vdpa vhost_vdpa;
> +    MemoryListener memory_listener;
> +
>      VHostNetState *vhost_net;
>
>      /* Control commands shadow buffers */
> @@ -110,6 +113,16 @@ static const uint64_t vdpa_svq_device_features =3D
>  #define VHOST_VDPA_NET_CVQ_PASSTHROUGH 0
>  #define VHOST_VDPA_NET_CVQ_ASID 1
>
> +/*
> + * Vdpa memory listener must run before vhost one, so vhost_vdpa does no=
t get
> + * _F_LOG_ALL without SVQ.
> + */
> +#define VHOST_VDPA_NET_MEMORY_LISTENER_PRIORITY \
> +                                       (VHOST_DEV_MEMORY_LISTENER_PRIORI=
TY - 1)
> +/* Check for underflow */
> +QEMU_BUILD_BUG_ON(VHOST_DEV_MEMORY_LISTENER_PRIORITY <
> +                  VHOST_VDPA_NET_MEMORY_LISTENER_PRIORITY);
> +
>  VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
>  {
>      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> @@ -172,6 +185,9 @@ static void vhost_vdpa_cleanup(NetClientState *nc)
>
>      qemu_vfree(s->cvq_cmd_out_buffer);
>      qemu_vfree(s->cvq_cmd_in_buffer);
> +    if (dev->vq_index =3D=3D 0) {
> +        memory_listener_unregister(&s->memory_listener);
> +    }
>      if (dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
>          g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete=
);
>      }
> @@ -224,6 +240,69 @@ static ssize_t vhost_vdpa_receive(NetClientState *nc=
, const uint8_t *buf,
>      return 0;
>  }
>
> +static void vhost_vdpa_net_log_global_enable(MemoryListener *listener,
> +                                             bool enable)
> +{
> +    VhostVDPAState *s =3D container_of(listener, VhostVDPAState,
> +                                     memory_listener);
> +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> +    VirtIONet *n;
> +    VirtIODevice *vdev;
> +    int data_queue_pairs, cvq, r;
> +    NetClientState *peer;
> +
> +    if (s->always_svq || s->log_enabled =3D=3D enable) {
> +        return;
> +    }
> +
> +    s->log_enabled =3D enable;
> +    vdev =3D v->dev->vdev;
> +    n =3D VIRTIO_NET(vdev);
> +    if (!n->vhost_started) {
> +        return;
> +    }
> +
> +    if (enable) {
> +        ioctl(v->device_fd, VHOST_VDPA_SUSPEND);
> +    }
> +    data_queue_pairs =3D n->multiqueue ? n->max_queue_pairs : 1;
> +    cvq =3D virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
> +                                  n->max_ncs - n->max_queue_pairs : 0;
> +    vhost_net_stop(vdev, n->nic->ncs, data_queue_pairs, cvq);
> +
> +    peer =3D s->nc.peer;
> +    for (int i =3D 0; i < data_queue_pairs + cvq; i++) {
> +        VhostVDPAState *vdpa_state;
> +        NetClientState *nc;
> +
> +        if (i < data_queue_pairs) {
> +            nc =3D qemu_get_peer(peer, i);
> +        } else {
> +            nc =3D qemu_get_peer(peer, n->max_queue_pairs);
> +        }
> +
> +        vdpa_state =3D DO_UPCAST(VhostVDPAState, nc, nc);
> +        vdpa_state->vhost_vdpa.listener_shadow_vq =3D enable;
> +        vdpa_state->vhost_vdpa.shadow_vqs_enabled =3D enable;
> +        vdpa_state->log_enabled =3D enable;
> +    }
> +
> +    r =3D vhost_net_start(vdev, n->nic->ncs, data_queue_pairs, cvq);
> +    if (unlikely(r < 0)) {
> +        error_report("unable to start vhost net: %s(%d)", g_strerror(-r)=
, -r);
> +    }
> +}
> +
> +static void vhost_vdpa_net_log_global_start(MemoryListener *listener)
> +{
> +    vhost_vdpa_net_log_global_enable(listener, true);
> +}
> +
> +static void vhost_vdpa_net_log_global_stop(MemoryListener *listener)
> +{
> +    vhost_vdpa_net_log_global_enable(listener, false);
> +}
> +
>  static NetClientInfo net_vhost_vdpa_info =3D {
>          .type =3D NET_CLIENT_DRIVER_VHOST_VDPA,
>          .size =3D sizeof(VhostVDPAState),
> @@ -413,6 +492,7 @@ static void vhost_vdpa_net_cvq_stop(NetClientState *n=
c)
>
>      assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
>
> +    memory_listener_unregister(&s->memory_listener);
>      if (s->vhost_vdpa.shadow_vqs_enabled) {
>          vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer);
>          vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_in_buffer);
> @@ -671,6 +751,13 @@ static NetClientState *net_vhost_vdpa_init(NetClient=
State *peer,
>      s->vhost_vdpa.shadow_vqs_enabled =3D svq;
>      s->vhost_vdpa.listener_shadow_vq =3D svq;
>      s->vhost_vdpa.iova_tree =3D iova_tree;
> +    if (queue_pair_index =3D=3D 0) {
> +        s->memory_listener =3D (MemoryListener) {
> +            .log_global_start =3D vhost_vdpa_net_log_global_start,
> +            .log_global_stop =3D vhost_vdpa_net_log_global_stop,
> +        };
> +        memory_listener_register(&s->memory_listener, &address_space_mem=
ory);
> +    }
>      if (!is_datapath) {
>          s->cvq_cmd_out_buffer =3D qemu_memalign(qemu_real_host_page_size=
(),
>                                              vhost_vdpa_net_cvq_cmd_page_=
len());
> --
> 2.31.1
>


