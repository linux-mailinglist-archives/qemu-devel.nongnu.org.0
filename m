Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A89AD668AD5
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 05:26:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGBd6-00053b-6Z; Thu, 12 Jan 2023 23:25:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pGBd2-000537-Gu
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 23:25:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pGBd0-0003Uq-RR
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 23:25:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673583917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HKEsNniL67dORvTUDXnwwWGNg5WrrMu1CSH+4pYaJa4=;
 b=iiGcv1n06yaHqUvGGIBUAGdo3CUFFeE3o1yVt8+gK9Lvz/5uDaRgaDrkobjkAL/AHrrPJe
 7TlMwJ4vvbBCXcqyCzUBRVe/+fTeQ7pbheLJLcyU+tAGYLZYMsNWqnQ4SYMtCWdnPw4qi7
 lDQuTB7328NHROSsDX4rVNikDzzDbug=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-310-8ESxg7adPuiMiy1EmWyn9w-1; Thu, 12 Jan 2023 23:25:16 -0500
X-MC-Unique: 8ESxg7adPuiMiy1EmWyn9w-1
Received: by mail-pl1-f200.google.com with SMTP id
 p15-20020a170902a40f00b00192b2bbb7f8so14086728plq.14
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 20:25:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HKEsNniL67dORvTUDXnwwWGNg5WrrMu1CSH+4pYaJa4=;
 b=6zxawjVO5tAAOQJyRJ/08BoZ6mvdVb3ncidLTNcgKaxVbO9+AZl7reAZS5cCI2bUFY
 H/XdJQmceCaTmWmgcCrIvEx3nKCr0i1NqOQVpCj0BZFz7i1rQbLj6S2xMD8HUoPXSXJt
 Qm5H+ocBfuXCgq6NULSrClQZBErhZ311Qk8azr5Q2Vvzhs7tob2qWg0a2WDdBstQg7F9
 7UudjTCp9Gkbvf9N/+AXPEJ2scrkZJFR6aNBg2J6IFnCeN16YMSuhDkSIc/gTKn1SSr7
 zMZhSMC9h844u/9gQ67O5vB42KjpBDGZAG/x9QTPK8VcJVx7kDXLB2e2oGW+1XWQfxDE
 ZTOA==
X-Gm-Message-State: AFqh2kqJljuk3IUY8F6R51+zh1le0W3V3sMy55XB2rGqnPR+/p3N/MPB
 qo7VNFHphFlQiaMRzvUQgxRVuZcRx4qvo5zeFC4UscaKbfjiuAwpq/RCrurvXgvuOc8vIC1wnIO
 JHJoFTRxRdAMDBAM=
X-Received: by 2002:a17:90a:30c:b0:226:42ea:28cd with SMTP id
 12-20020a17090a030c00b0022642ea28cdmr49220461pje.16.1673583915100; 
 Thu, 12 Jan 2023 20:25:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuMgnNZkI/w9o7J9Wvptr2qKSXrCwXSTbtqhs81s79TYU4QM5vd8eEOXzB9eAbOW7YiG9+Wgg==
X-Received: by 2002:a17:90a:30c:b0:226:42ea:28cd with SMTP id
 12-20020a17090a030c00b0022642ea28cdmr49220430pje.16.1673583914793; 
 Thu, 12 Jan 2023 20:25:14 -0800 (PST)
Received: from [10.72.12.164] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 mg6-20020a17090b370600b002265ddfc13esm146441pjb.29.2023.01.12.20.25.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 20:25:14 -0800 (PST)
Message-ID: <451c3617-61a1-a4bb-791a-6c55e363e961@redhat.com>
Date: Fri, 13 Jan 2023 12:24:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC v2 05/13] vdpa net: add migration blocker if cannot migrate
 cvq
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: si-wei.liu@oracle.com, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com,
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-6-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20230112172434.760850-6-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


在 2023/1/13 01:24, Eugenio Pérez 写道:
> A vdpa net device must initialize with SVQ in order to be migratable,
> and initialization code verifies conditions.  If the device is not
> initialized with the x-svq parameter, it will not expose _F_LOG so vhost
> sybsystem will block VM migration from its initialization.
>
> Next patches change this. Net data VQs will be shadowed only at
> migration time and vdpa net devices need to expose _F_LOG as long as it
> can go to SVQ.
>
> Since we don't know that at initialization time but at start, add an
> independent blocker at CVQ.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   net/vhost-vdpa.c | 35 +++++++++++++++++++++++++++++------
>   1 file changed, 29 insertions(+), 6 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 631424d9c4..2ca93e850a 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -26,12 +26,14 @@
>   #include <err.h>
>   #include "standard-headers/linux/virtio_net.h"
>   #include "monitor/monitor.h"
> +#include "migration/blocker.h"
>   #include "hw/virtio/vhost.h"
>   
>   /* Todo:need to add the multiqueue support here */
>   typedef struct VhostVDPAState {
>       NetClientState nc;
>       struct vhost_vdpa vhost_vdpa;
> +    Error *migration_blocker;


Any reason we can't use the mivration_blocker in vhost_dev structure?

I believe we don't need to wait until start to know we can't migrate.

Thanks


>       VHostNetState *vhost_net;
>   
>       /* Control commands shadow buffers */
> @@ -433,9 +435,15 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
>               g_strerror(errno), errno);
>           return -1;
>       }
> -    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)) ||
> -        !vhost_vdpa_net_valid_svq_features(v->dev->features, NULL)) {
> -        return 0;
> +    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID))) {
> +        error_setg(&s->migration_blocker,
> +                   "vdpa device %s does not support ASID",
> +                   nc->name);
> +        goto out;
> +    }
> +    if (!vhost_vdpa_net_valid_svq_features(v->dev->features,
> +                                           &s->migration_blocker)) {
> +        goto out;
>       }
>   
>       /*
> @@ -455,7 +463,10 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
>           }
>   
>           if (group == cvq_group) {
> -            return 0;
> +            error_setg(&s->migration_blocker,
> +                "vdpa %s vq %d group %"PRId64" is the same as cvq group "
> +                "%"PRId64, nc->name, i, group, cvq_group);
> +            goto out;
>           }
>       }
>   
> @@ -468,8 +479,15 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
>       s->vhost_vdpa.address_space_id = VHOST_VDPA_NET_CVQ_ASID;
>   
>   out:
> -    if (!s->vhost_vdpa.shadow_vqs_enabled) {
> -        return 0;
> +    if (s->migration_blocker) {
> +        Error *errp = NULL;
> +        r = migrate_add_blocker(s->migration_blocker, &errp);
> +        if (unlikely(r != 0)) {
> +            g_clear_pointer(&s->migration_blocker, error_free);
> +            error_report_err(errp);
> +        }
> +
> +        return r;
>       }
>   
>       s0 = vhost_vdpa_net_first_nc_vdpa(s);
> @@ -513,6 +531,11 @@ static void vhost_vdpa_net_cvq_stop(NetClientState *nc)
>           vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->status);
>       }
>   
> +    if (s->migration_blocker) {
> +        migrate_del_blocker(s->migration_blocker);
> +        g_clear_pointer(&s->migration_blocker, error_free);
> +    }
> +
>       vhost_vdpa_net_client_stop(nc);
>   }
>   


