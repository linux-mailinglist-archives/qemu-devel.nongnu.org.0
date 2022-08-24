Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CDB59F2A9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 06:29:23 +0200 (CEST)
Received: from localhost ([::1]:45532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQi14-00077Q-89
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 00:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQhvi-0007lW-W9
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 00:23:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQhvg-0003I2-1d
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 00:23:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661315026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4vacmRQWcYGHujj/k7yvM8Bbhh0IJr+yjFsm7a3bD2Q=;
 b=ZTNstrxOKMPtd5wCfjwOz/9D06o0kFhs37ORnofoOUpSnHZlE1GKp/NvDB/suzmUxkr+FG
 YbQ7X6fsN0+VeV2LjDJpEqWnDH3PWhrMdCu79ts5V2kPM+OoAa2MHv1ixvQrvMwBY69ShT
 GlPW39OkA6ngKo9uihpTQKXhysGaoss=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-633-UNmRAl0XO-aRqZSo3iW54g-1; Wed, 24 Aug 2022 00:23:45 -0400
X-MC-Unique: UNmRAl0XO-aRqZSo3iW54g-1
Received: by mail-pf1-f197.google.com with SMTP id
 d10-20020a056a00198a00b005367ac052bbso3494096pfl.16
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 21:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=4vacmRQWcYGHujj/k7yvM8Bbhh0IJr+yjFsm7a3bD2Q=;
 b=Arx5Ns32pJ2XvJxIllRyM9mJFA7XBx7MeHVLtKrKaW0IsDug/hxfUXpFLDYnbG+T2c
 S3cOLAHjEf1l4v938j1b08GmH+gk3/i8LxngXUj0DCw6/z1x34zWoaxNJfwnchjG5+iM
 pZPvcpCucMuRopW4mqFQt2eg5CuiVrsqL8OHJivBRdlqOlZeBczr6nJDPiz9wKY4JtRH
 e3xtP9EF9xQBqq52UOishyipIf+nLu8DwxNsq0SvXw2bLTI6FPaLrSVD/0gMHhIq2nzS
 n0C6KbZe8iwyEUgAQfnTwYNbeKnPJ6e8kJvwtNOJEnnFbFHCi529yeU0uuALSxa8q2FN
 hibw==
X-Gm-Message-State: ACgBeo2U5PwwqJD/spnC+KQYMwbDiySmTA2x9OB4kC01+gS9iuR1LcJ9
 zoBQoA6oDJiM75sVButpPQDW0ZCrDdKJJUE2MADq2d4WtZk1tgMhlq4CN54RCEXBkjvMmkExCi0
 hoUPqD6UGYh76lRY=
X-Received: by 2002:a63:460b:0:b0:429:1cb9:c74d with SMTP id
 t11-20020a63460b000000b004291cb9c74dmr23141704pga.514.1661315024121; 
 Tue, 23 Aug 2022 21:23:44 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4xgZjsmB50FOrZOsCalaHT7rA2xBwCa+c9jLolw0pGf5tniGUTjH7711Pdm4NOM16Dd4Lw9g==
X-Received: by 2002:a63:460b:0:b0:429:1cb9:c74d with SMTP id
 t11-20020a63460b000000b004291cb9c74dmr23141682pga.514.1661315023864; 
 Tue, 23 Aug 2022 21:23:43 -0700 (PDT)
Received: from [10.72.13.242] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a170903120600b0016784c93f23sm11449312plh.197.2022.08.23.21.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 21:23:43 -0700 (PDT)
Message-ID: <f517a073-fd73-0220-072c-ea054b643468@redhat.com>
Date: Wed, 24 Aug 2022 12:23:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 2/5] vdpa: Add vhost_vdpa_net_load_mq
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
References: <20220819171329.3597027-1-eperezma@redhat.com>
 <20220819171329.3597027-3-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220819171329.3597027-3-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


在 2022/8/20 01:13, Eugenio Pérez 写道:
> Same way as with the MAC, restore the expected number of queues at
> device's start.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   net/vhost-vdpa.c | 33 +++++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 1e0dbfcced..96fd3bc835 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -391,6 +391,35 @@ static int vhost_vdpa_net_load_mac(VhostVDPAState *s,
>       return 0;
>   }
>   
> +static int vhost_vdpa_net_load_mq(VhostVDPAState *s,
> +                                  const VirtIONet *n)
> +{
> +    uint64_t features = n->parent_obj.guest_features;
> +    ssize_t dev_written;
> +    void *cursor = s->cvq_cmd_out_buffer;
> +    if (!(features & BIT_ULL(VIRTIO_NET_F_MQ))) {
> +        return 0;
> +    }
> +
> +    *(struct virtio_net_ctrl_hdr *)cursor = (struct virtio_net_ctrl_hdr) {
> +        .class = VIRTIO_NET_CTRL_MQ,
> +        .cmd = VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET,
> +    };
> +    cursor += sizeof(struct virtio_net_ctrl_hdr);
> +    *(struct virtio_net_ctrl_mq *)cursor = (struct virtio_net_ctrl_mq) {
> +        .virtqueue_pairs = cpu_to_le16(n->curr_queue_pairs),
> +    };


Such casting is not elegant, let's just prepare buffer and then do the 
copy inside vhost_vdpa_net_cvq_add()?


> +    cursor += sizeof(struct virtio_net_ctrl_mq);
> +
> +    dev_written = vhost_vdpa_net_cvq_add(s, cursor - s->cvq_cmd_out_buffer,
> +                                             sizeof(virtio_net_ctrl_ack));
> +    if (unlikely(dev_written < 0)) {
> +        return dev_written;
> +    }
> +
> +    return *((virtio_net_ctrl_ack *)s->cvq_cmd_in_buffer) != VIRTIO_NET_OK;


So I think we should have a dedicated buffer just for ack, then there's 
no need for such casting.

Thanks


> +}
> +
>   static int vhost_vdpa_net_load(NetClientState *nc)
>   {
>       VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
> @@ -409,6 +438,10 @@ static int vhost_vdpa_net_load(NetClientState *nc)
>       if (unlikely(r < 0)) {
>           return r;
>       }
> +    r = vhost_vdpa_net_load_mq(s, n);
> +    if (unlikely(r)) {
> +        return r;
> +    }
>   
>       return 0;
>   }


