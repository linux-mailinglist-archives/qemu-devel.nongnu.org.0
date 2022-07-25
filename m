Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE63657FC88
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 11:36:14 +0200 (CEST)
Received: from localhost ([::1]:55642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFuVX-0008FH-4e
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 05:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oFuSA-0005cQ-RE
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 05:32:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oFuS6-0003x1-R9
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 05:32:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658741557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yGPU90wcH5aF2ldDWHfAt8U9zVeHE+VrG3GM1F49rF0=;
 b=ViqAH+vWAiQGONtcwPdxAYSVAbYTZlsVrybDQ7chjhEisffKkAppwLTTGm+3if7cc2CdCu
 tiCOLHMLV6o3wBp1KQc4q2lodRiUmOIWWScZ3mwbyNVnp2QS65DwBX57hI+DMhuM9qQblE
 x736QKqqOGTkmPV5ddgjNZrhpSqTU9k=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-4Su4VAO1MaitNweBlhlidA-1; Mon, 25 Jul 2022 05:32:36 -0400
X-MC-Unique: 4Su4VAO1MaitNweBlhlidA-1
Received: by mail-pl1-f197.google.com with SMTP id
 f14-20020a170902ce8e00b0016d5e636249so2679777plg.7
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 02:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yGPU90wcH5aF2ldDWHfAt8U9zVeHE+VrG3GM1F49rF0=;
 b=wn9LLAurnvKduBlg2k0+Dq5kR0j9NUMYE5Vdqp4B1cHTcMmQmfKIYgRRt4+Fv3HNHo
 7oPCYBeMnXatrPvfHbkV94GUyzqIRri4T2XRBnXTotJupC6ShDEU0Zj1xMUXrVv2qlN/
 7wj+ILwWV1czeCzyNCevHssrdFnE2S2ifDHwC+6cIvfJOkrIY6yxlay67qg87kghNePY
 2GYyL5/HAHA5qtsbvaLtyrpiON+yl8xR+8A5DMPly1qWI6gBY/SYtF71Mqc8LSxGB/Gd
 7WQPsfk4tkgWbQMHtibLHNj2PaGe+GPB6g6HSEIi3wDWhNOZ7iMgQFykSOchVsff8ozw
 RjMA==
X-Gm-Message-State: AJIora+j91oCltv7Eb0iomYFGB046ZwH7hXCp0mP5CK9EDsHx1+CzYZC
 JHbxYiYawm86nTSA1VJPhJJhYoAL3al3JfUwQyhMEbOqZaDOyiRQ0ZuOa6XfncNOHTRohOf6Jht
 IyyeeajNFOl+dcSk=
X-Received: by 2002:a63:148:0:b0:41a:53d5:fb04 with SMTP id
 69-20020a630148000000b0041a53d5fb04mr10476356pgb.39.1658741554919; 
 Mon, 25 Jul 2022 02:32:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sG0KtI4+zy/TvXK6ir9awAZzpIYBdwW+XltOMdsxNWXJLDeefiVqxT4jpJygSCvHh4jn2XZw==
X-Received: by 2002:a63:148:0:b0:41a:53d5:fb04 with SMTP id
 69-20020a630148000000b0041a53d5fb04mr10476346pgb.39.1658741554668; 
 Mon, 25 Jul 2022 02:32:34 -0700 (PDT)
Received: from [10.72.13.203] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 a17-20020aa795b1000000b0050dc762816dsm9002718pfk.71.2022.07.25.02.32.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 02:32:33 -0700 (PDT)
Message-ID: <2530135d-42a6-462e-5835-5e8f948c3f09@redhat.com>
Date: Mon, 25 Jul 2022 17:32:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v4 6/7] vdpa: Add virtio-net mac address via CVQ at start
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Harpreet Singh Anand
 <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Cornelia Huck
 <cohuck@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>
References: <20220722111245.3403062-1-eperezma@redhat.com>
 <20220722111245.3403062-7-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220722111245.3403062-7-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


在 2022/7/22 19:12, Eugenio Pérez 写道:
> This is needed so the destination vdpa device see the same state a the
> guest set in the source.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   net/vhost-vdpa.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 61 insertions(+)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 61516b1432..3e15a42c35 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -365,10 +365,71 @@ static virtio_net_ctrl_ack vhost_vdpa_net_cvq_add(VhostShadowVirtqueue *svq,
>       return VIRTIO_NET_OK;
>   }
>   
> +static int vhost_vdpa_net_start(NetClientState *nc)
> +{
> +    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
> +    struct vhost_vdpa *v = &s->vhost_vdpa;
> +    VirtIONet *n;
> +    uint64_t features;
> +    VhostShadowVirtqueue *svq;
> +
> +    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
> +
> +    if (!v->shadow_vqs_enabled) {
> +        return 0;
> +    }
> +
> +    if (v->dev->nvqs != 1 &&
> +        v->dev->vq_index + v->dev->nvqs != v->dev->vq_index_end) {
> +        /* Only interested in CVQ */
> +        return 0;
> +    }


I'd have a dedicated NetClientInfo for cvq.


> +
> +    n = VIRTIO_NET(v->dev->vdev);
> +    features = v->dev->vdev->host_features;
> +    svq = g_ptr_array_index(v->shadow_vqs, 0);
> +    if (features & BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR)) {
> +        const struct virtio_net_ctrl_hdr ctrl = {
> +            .class = VIRTIO_NET_CTRL_MAC,
> +            .cmd = VIRTIO_NET_CTRL_MAC_ADDR_SET,
> +        };
> +        uint8_t mac[6];
> +        const struct iovec out[] = {
> +            {
> +                .iov_base = (void *)&ctrl,
> +                .iov_len = sizeof(ctrl),
> +            },{
> +                .iov_base = mac,
> +                .iov_len = sizeof(mac),
> +            },
> +        };
> +        struct iovec dev_buffers[2] = {
> +            { .iov_base = s->cvq_cmd_out_buffer },
> +            { .iov_base = s->cvq_cmd_in_buffer },
> +        };
> +        bool ok;
> +        virtio_net_ctrl_ack state;
> +
> +        ok = vhost_vdpa_net_cvq_map_sg(s, out, ARRAY_SIZE(out), dev_buffers);


To speed up the state recovery, can we map those buffers during svq start?

Thanks


> +        if (unlikely(!ok)) {
> +            return -1;
> +        }
> +
> +        memcpy(mac, n->mac, sizeof(mac));
> +        state = vhost_vdpa_net_cvq_add(svq, dev_buffers);
> +        vhost_vdpa_cvq_unmap_buf(v, dev_buffers[0].iov_base);
> +        vhost_vdpa_cvq_unmap_buf(v, dev_buffers[1].iov_base);
> +        return state == VIRTIO_NET_OK ? 0 : 1;
> +    }
> +
> +    return 0;
> +}
> +
>   static NetClientInfo net_vhost_vdpa_info = {
>           .type = NET_CLIENT_DRIVER_VHOST_VDPA,
>           .size = sizeof(VhostVDPAState),
>           .receive = vhost_vdpa_receive,
> +        .start = vhost_vdpa_net_start,
>           .cleanup = vhost_vdpa_cleanup,
>           .has_vnet_hdr = vhost_vdpa_has_vnet_hdr,
>           .has_ufo = vhost_vdpa_has_ufo,


