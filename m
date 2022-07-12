Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 198F6571366
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 09:48:32 +0200 (CEST)
Received: from localhost ([::1]:44596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBAdD-0002rn-1o
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 03:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oBAI7-0005F6-HP
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:26:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oBAI4-000844-5G
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657610798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VTaAdrPcrOb0u1B504LMSe9I0gJZJe9GgSWejCCF64Q=;
 b=VTS564iNcIL4S5apEiMDJ0tL1UBETnEO5LLBl6rM2q2MBmIzVREoiv8hKJMG/v8Mq81cHf
 SWQaMYSOqriE5kL2ZieELubTAkrYiC+AtaCVWX12LtJ2AjsNcn2KhYtPs/GZZSVfl3ivjO
 GcZhAkMlKPmWtjr5TOdczMWzGio0sdI=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491--JyvNkDjPAGIJe6P4B5BDg-1; Tue, 12 Jul 2022 03:26:37 -0400
X-MC-Unique: -JyvNkDjPAGIJe6P4B5BDg-1
Received: by mail-pf1-f197.google.com with SMTP id
 x123-20020a626381000000b005254d5e6a0fso1882063pfb.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 00:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VTaAdrPcrOb0u1B504LMSe9I0gJZJe9GgSWejCCF64Q=;
 b=EoP9gjy3Vj9/O2TquEn2+yPdBCTR7lOooAkQAMgk/87JFKtV/hI44/IZf3xOo5l2ZJ
 LxgbJGhFI92MCjK1rgBpwZK1bTccbbh+n3CfvgR6/AIiV17AQUOY9e6+imwCTGmxW2xb
 crDxA2h01Z+WgA2TlYjQ4UnWCOdOpbWj2w16q8W7n4L/gBULpIwbIt5OlrCni72sPk/w
 fOq4a0BXagA3WrwqpdZ1B4eAFEuD23cKL7jtQ2nLDVoSuNpBrieSc/q4yoCSqyedQEaS
 c9EBszE8bOCbY8KWTUv6Ie9Ci/9/GxxUUU9kwkl6udSaDZyPbVd2RGIHK92lwBljYQGQ
 K3bg==
X-Gm-Message-State: AJIora95nQvfi/WffDsavuVxDWideC5jBC4cTREKTe4y+Fe5xxCmqvjH
 nqwRbvKvg4235Vs6aCbUtr6CBQ4XTTKv6Wc3SugJMZJw1xUB6oYtP8l2UWfNzv1hElGpZa/Oc1i
 SVYFSBfiCLzpbQjk=
X-Received: by 2002:a17:90b:1c8e:b0:1ee:e899:c612 with SMTP id
 oo14-20020a17090b1c8e00b001eee899c612mr2756326pjb.170.1657610796430; 
 Tue, 12 Jul 2022 00:26:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1swMRczijUzy1SiaXdOLfKs4oTOHH8BB6vXU4XCDQbB8RRtsheEn1GvT+6nsmMnqSbNEBwpwQ==
X-Received: by 2002:a17:90b:1c8e:b0:1ee:e899:c612 with SMTP id
 oo14-20020a17090b1c8e00b001eee899c612mr2756295pjb.170.1657610796199; 
 Tue, 12 Jul 2022 00:26:36 -0700 (PDT)
Received: from [10.72.12.111] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a63fd15000000b0040ca587fe0fsm5345464pgh.63.2022.07.12.00.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 00:26:35 -0700 (PDT)
Message-ID: <120c7e7b-1044-166c-a861-3efb03b9df8f@redhat.com>
Date: Tue, 12 Jul 2022 15:26:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [RFC PATCH v9 21/23] vdpa: Add vhost_vdpa_start_control_svq
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-22-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220706184008.1649478-22-eperezma@redhat.com>
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


在 2022/7/7 02:40, Eugenio Pérez 写道:
> As a first step we only enable CVQ first than others. Future patches add
> state restore.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   net/vhost-vdpa.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index e415cc8de5..77d013833f 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -370,6 +370,24 @@ static CVQElement *vhost_vdpa_cvq_alloc_elem(VhostVDPAState *s,
>       return g_steal_pointer(&cvq_elem);
>   }
>   
> +static int vhost_vdpa_start_control_svq(VhostShadowVirtqueue *svq,
> +                                        void *opaque)
> +{
> +    struct vhost_vring_state state = {
> +        .index = virtio_get_queue_index(svq->vq),
> +        .num = 1,
> +    };
> +    VhostVDPAState *s = opaque;
> +    struct vhost_dev *dev = s->vhost_vdpa.dev;
> +    struct vhost_vdpa *v = dev->opaque;
> +    int r;
> +
> +    assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
> +
> +    r = ioctl(v->device_fd, VHOST_VDPA_SET_VRING_ENABLE, &state);
> +    return r < 0 ? -errno : r;
> +}
> +
>   /**
>    * iov_size with an upper limit. It's assumed UINT64_MAX is an invalid
>    * iov_size.
> @@ -554,6 +572,7 @@ static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops = {
>       .avail_handler = vhost_vdpa_net_handle_ctrl_avail,
>       .used_handler = vhost_vdpa_net_handle_ctrl_used,
>       .detach_handler = vhost_vdpa_net_handle_ctrl_detach,
> +    .start = vhost_vdpa_start_control_svq,
>   };


I wonder if vhost_net_start() is something better than here. It knows 
all virtqueues and it can do whatever it wants, we just need to make 
shadow virtqueue visible there?

Thanks


>   
>   static NetClientState *net_vhost_vdpa_init(NetClientState *peer,


