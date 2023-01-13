Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85823668AEF
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 05:38:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGBoQ-0006ZZ-JU; Thu, 12 Jan 2023 23:37:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pGBoN-0006ZD-TK
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 23:37:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pGBoM-0005Hs-4P
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 23:37:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673584621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tPrQZm/bAQo0Llu9JebeZfWOX2ixVCRQDd2XvXa5cJU=;
 b=a37/UiNjwcGKpL7+4sHP1f6LeZnqUJvHN6UxZ658k9L8GsLGA2NRNucJQOLXKD6pfNdA0+
 1kUl732tXALe42n0qqj8gBFCAeU4V/bRJRMvKhquAdtH35uqH9QKRF1gqzdZGiaZHRY5J2
 Ewb2a219+J2Zy0di478jVtaO8EaYjW4=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-594-cYdJNg0oMJuURbc6XM9IRQ-1; Thu, 12 Jan 2023 23:36:52 -0500
X-MC-Unique: cYdJNg0oMJuURbc6XM9IRQ-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-14bb44ca7d1so7548206fac.14
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 20:36:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tPrQZm/bAQo0Llu9JebeZfWOX2ixVCRQDd2XvXa5cJU=;
 b=NmVOHsKLOVZ4qd3XKEo2y599K5fboCkJi6JRjkjtcRUwNGEBDYchQtyb5eibAv3KOW
 ot2sNrNyYhACa0O7BJaRN/3x0Ri9wRVyACPC1cETWyY3qM+olvtSVtxyjZUjPk703L7I
 6A5Uq858Gog3/B7fwlRqPRBo2trX1hj4pP84ivIn/m9TOuTANgM/TLska1iYOUeJh3Os
 ucwaBlJiOxmj9npWeG896HCzJdP2BCGxGdj+FkYCRlRbW8Ocz1SsWS+vIBP5x0GNdT93
 aoquzj1KTS5AXLTw+kSNRAlwGXTRsJiM0ikfv17oXR9kKKP0f5JMzWFVvi9AVmVv2w4Q
 HbVQ==
X-Gm-Message-State: AFqh2kr3h7Rl2dVMq7kjgRmuoCLXvJgd3Q3ExQ6RCt8HXWgnK//I4Ji4
 xj52NByVa/D8t+WKw7j2A4htTJQE5edFsdJj+ljvs2n2sccfo+TBTPw1dmSYREsJSh4xvIKY/B2
 vO2y40qAWkH6uwi7FxRfUqWE/hoHP8QQ=
X-Received: by 2002:a05:6870:9e9a:b0:15b:96b5:9916 with SMTP id
 pu26-20020a0568709e9a00b0015b96b59916mr1331999oab.280.1673584611777; 
 Thu, 12 Jan 2023 20:36:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu3WntcyuGuXRZJhZK7nZidcRon5ai1uTVdVYiCADnvlf0yOtTdrZMCeZniFbqVarEGZai0dATjIUXXinKah90=
X-Received: by 2002:a05:6870:9e9a:b0:15b:96b5:9916 with SMTP id
 pu26-20020a0568709e9a00b0015b96b59916mr1331984oab.280.1673584611538; Thu, 12
 Jan 2023 20:36:51 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-7-eperezma@redhat.com>
In-Reply-To: <20230112172434.760850-7-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 13 Jan 2023 12:36:40 +0800
Message-ID: <CACGkMEvvjvhFrd5DJOMM0d7OWm0=9t6-YPzsZLZ8ZeZ4RU6PQw@mail.gmail.com>
Subject: Re: [RFC v2 06/13] vhost: delay set_vring_ready after DRIVER_OK
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, si-wei.liu@oracle.com, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com, 
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Fri, Jan 13, 2023 at 1:25 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> To restore the device at the destination of a live migration we send the
> commands through control virtqueue. For a device to read CVQ it must
> have received the DRIVER_OK status bit.

This probably requires the support from the parent driver and requires
some changes or fixes in the parent driver.

Some drivers did:

parent_set_status():
if (DRIVER_OK)
    if (queue_enable)
        write queue_enable to the device

Examples are IFCVF or even vp_vdpa at least. MLX5 seems to be fine.

>
> However this opens a window where the device could start receiving
> packets in rx queue 0 before it receives the RSS configuration. To avoid
> that, we will not send vring_enable until all configuration is used by
> the device.
>
> As a first step, run vhost_set_vring_ready for all vhost_net backend afte=
r
> all of them are started (with DRIVER_OK). This code should not affect
> vdpa.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/net/vhost_net.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index c4eecc6f36..3900599465 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -399,6 +399,18 @@ int vhost_net_start(VirtIODevice *dev, NetClientStat=
e *ncs,
>          } else {
>              peer =3D qemu_get_peer(ncs, n->max_queue_pairs);
>          }
> +        r =3D vhost_net_start_one(get_vhost_net(peer), dev);
> +        if (r < 0) {
> +            goto err_start;
> +        }
> +    }
> +
> +    for (int j =3D 0; j < nvhosts; j++) {
> +        if (j < data_queue_pairs) {
> +            peer =3D qemu_get_peer(ncs, j);
> +        } else {
> +            peer =3D qemu_get_peer(ncs, n->max_queue_pairs);
> +        }

I fail to understand why we need to change the vhost_net layer? This
is vhost-vDPA specific, so I wonder if we can limit the changes to e.g
vhost_vdpa_dev_start()?

Thanks

>
>          if (peer->vring_enable) {
>              /* restore vring enable state */
> @@ -408,11 +420,6 @@ int vhost_net_start(VirtIODevice *dev, NetClientStat=
e *ncs,
>                  goto err_start;
>              }
>          }
> -
> -        r =3D vhost_net_start_one(get_vhost_net(peer), dev);
> -        if (r < 0) {
> -            goto err_start;
> -        }
>      }
>
>      return 0;
> --
> 2.31.1
>


