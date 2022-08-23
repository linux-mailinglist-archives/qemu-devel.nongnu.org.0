Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABDC59D177
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 08:48:42 +0200 (CEST)
Received: from localhost ([::1]:37308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQNiL-0002qG-8A
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 02:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQNcE-0006Mn-Jj
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 02:42:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQNcA-00059F-En
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 02:42:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661236937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JsG23CmIfkFrQmfwC3Rjmd2TVs/WTO65xCKPSgP+eOQ=;
 b=Ti66ccJ29PNNsRkhCuceOHEdnBtrBYZYpeUOKoYrC9gWeX0m37kkUzmmJz9EYnetEZO594
 RkHdy2ZMO6GHl3lU2EZmyVADu6qCG3GZvap+V08jhduFodxRWyc1HptmcJ41qFucEMWezz
 rYzTsicw8QmuFx/Sbj/ZuHBd547v3WM=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-158-3fv0OO98MjeBEBr1pxgrQQ-1; Tue, 23 Aug 2022 02:42:13 -0400
X-MC-Unique: 3fv0OO98MjeBEBr1pxgrQQ-1
Received: by mail-pg1-f199.google.com with SMTP id
 a186-20020a6390c3000000b00422cc29268eso5693855pge.16
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 23:42:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=JsG23CmIfkFrQmfwC3Rjmd2TVs/WTO65xCKPSgP+eOQ=;
 b=lRY3aeI6rW0zMnUA4xb1Z9HOBldouZHJaznRzPPy2bOemKCpDToG9mNkaf6xUvvFXo
 iz28NXUkzjMAPRPVDZNOIzDETZL6DjaKWt40EARaips2y27R6grli+TQ9gIYz7sRpaBp
 0QF2HSDgUFj5FskZJtx5XvRTNCB2Vs+EuIyb7rR/zNEdRb20vu5ceE2IugNnCjCwZ91y
 xoUZY2eVP0hXR5ott+4sdlsIT+Qb2JX+WRGrXHkTowfn8rVJ1Z0Oc1F8DeFXOQfjkqM3
 AaYkdcHhQGN4JteWij+brRP9XLg6FxdROT3A4EAZHuaA7bOZqGV/GY2EfvOAoWoeUeqA
 bVmg==
X-Gm-Message-State: ACgBeo0PSt6ycs3ikIzYRyet9ImlEDitFWo+9MSvnINmRUPOKVkwk8nh
 0PY6CUx0jJOh2Qqmrxku9OwEXdbpCQsDVUC5vs43pGWkQSguh6p9PPqy/onUZMtCdMF0c+gf7a5
 1I5oM73mN1kUluVs=
X-Received: by 2002:a63:d0d:0:b0:41d:109:4af3 with SMTP id
 c13-20020a630d0d000000b0041d01094af3mr19791822pgl.38.1661236932605; 
 Mon, 22 Aug 2022 23:42:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4649AhXJAwwIy1rNiXo5YAgF32uHTDST4BEi5Xe3Ym6bUB0BKVlXT0w/3AA88aWGRzvJKkFg==
X-Received: by 2002:a63:d0d:0:b0:41d:109:4af3 with SMTP id
 c13-20020a630d0d000000b0041d01094af3mr19791813pgl.38.1661236932388; 
 Mon, 22 Aug 2022 23:42:12 -0700 (PDT)
Received: from [10.72.13.141] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a626303000000b0052dd7d0ad02sm9763129pfb.162.2022.08.22.23.42.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 23:42:11 -0700 (PDT)
Message-ID: <8acabe61-6f74-8938-6044-d2f2c7729c17@redhat.com>
Date: Tue, 23 Aug 2022 14:41:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v9 11/12] vdpa: Add virtio-net mac address via CVQ at start
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 Laurent Vivier <lvivier@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220819170048.3593487-1-eperezma@redhat.com>
 <20220819170048.3593487-12-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220819170048.3593487-12-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/8/20 01:00, Eugenio Pérez 写道:
> This is needed so the destination vdpa device see the same state a the
> guest set in the source.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
> v9:
> * Use guest acked features instead of device's.
> * Constify vhost_vdpa and VirtIONet variables.
> * Delete unneeded increment of cursor.
>
> v8:
> * Delete unneeded copy from device's in buffer.
>
> v6:
> * Map and unmap command buffers at the start and end of device usage.
>
> v5:
> * Rename s/start/load/
> * Use independent NetClientInfo to only add load callback on cvq.
> ---
>   net/vhost-vdpa.c | 40 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 40 insertions(+)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index ebf76d1034..8fad31a5fd 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -363,11 +363,51 @@ static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s, size_t out_len,
>       return vhost_svq_poll(svq);
>   }
>   
> +static int vhost_vdpa_net_load(NetClientState *nc)
> +{
> +    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
> +    const struct vhost_vdpa *v = &s->vhost_vdpa;
> +    const VirtIONet *n;
> +    uint64_t features;
> +
> +    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
> +
> +    if (!v->shadow_vqs_enabled) {
> +        return 0;
> +    }
> +
> +    n = VIRTIO_NET(v->dev->vdev);
> +    features = n->parent_obj.guest_features;
> +    if (features & BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR)) {
> +        const struct virtio_net_ctrl_hdr ctrl = {
> +            .class = VIRTIO_NET_CTRL_MAC,
> +            .cmd = VIRTIO_NET_CTRL_MAC_ADDR_SET,
> +        };
> +        char *cursor = s->cvq_cmd_out_buffer;
> +        ssize_t dev_written;
> +
> +        memcpy(cursor, &ctrl, sizeof(ctrl));
> +        cursor += sizeof(ctrl);
> +        memcpy(cursor, n->mac, sizeof(n->mac));
> +
> +        dev_written = vhost_vdpa_net_cvq_add(s, sizeof(ctrl) + sizeof(n->mac),
> +                                             sizeof(virtio_net_ctrl_ack));
> +        if (unlikely(dev_written < 0)) {
> +            return dev_written;
> +        }
> +
> +        return *((virtio_net_ctrl_ack *)s->cvq_cmd_in_buffer) != VIRTIO_NET_OK;
> +    }
> +
> +    return 0;
> +}
> +
>   static NetClientInfo net_vhost_vdpa_cvq_info = {
>       .type = NET_CLIENT_DRIVER_VHOST_VDPA,
>       .size = sizeof(VhostVDPAState),
>       .receive = vhost_vdpa_receive,
>       .start = vhost_vdpa_net_cvq_start,
> +    .load = vhost_vdpa_net_load,
>       .stop = vhost_vdpa_net_cvq_stop,
>       .cleanup = vhost_vdpa_cleanup,
>       .has_vnet_hdr = vhost_vdpa_has_vnet_hdr,


