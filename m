Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FACC4A2D10
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 09:25:23 +0100 (CET)
Received: from localhost ([::1]:47816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDj2w-0001VF-Fo
	for lists+qemu-devel@lfdr.de; Sat, 29 Jan 2022 03:25:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nDiyC-0008C9-2i
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 03:20:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nDiy9-0006Hn-Qn
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 03:20:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643444423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RUvaXBeYFYqIFBRUBXZDha8iyJ6iXQ2Wr2dPtTHLNxk=;
 b=Ue+DXkBiDPhJj46gpMzy+sc4kdGA5quNGJYjNqoBmsvbrh/K7QvA9JFLmJaY0jwO69SFhq
 +LqYc41Cc4X5PqC7fkc+gegA+DBMXXSlqY/JgWnKR2OlzjRCrmmaYl7nNz+009uahT2F+v
 5fJZPrvtUm+G5NRgnaYwGy1KWVP/cPE=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-Rh1ReyitNNqTiBm8tCaq9w-1; Sat, 29 Jan 2022 03:20:20 -0500
X-MC-Unique: Rh1ReyitNNqTiBm8tCaq9w-1
Received: by mail-pj1-f70.google.com with SMTP id
 q1-20020a17090a064100b001b4d85cbaf7so7608124pje.9
 for <qemu-devel@nongnu.org>; Sat, 29 Jan 2022 00:20:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RUvaXBeYFYqIFBRUBXZDha8iyJ6iXQ2Wr2dPtTHLNxk=;
 b=3zBmyefhlIBvBgbE2Y15r5978U05k0cAED0F8v/wJJqEo5IPEliVVhiE2gApYWI8Ca
 +50oKEr/jADxvF+/FOKcc/6dkI4lWMymJgi8sw5ZXOFDQ3vk0g7Fj4escAPLUooPSsGT
 q0fjFVQAtsxA/xedcmF4w+nOLsjl5PT50ko4Uka5aZUR0bKO+56xq7oyPcv7JFaT3vGM
 /faZe8qwXnzF6dVRHhTjBM2070/vV4RIC+LCvDE6CfXJFZLrmUpcmnZVoZcBUl93qzwQ
 ONIarSUA/ro6oCVzj9Tg0GtAw0uZRQIaFuTgQQFHr1m8MZfQK/sattrcy9cl3gZ77WKh
 ID2w==
X-Gm-Message-State: AOAM533pgEE0giy//Q2CgfvvbigHVWDbLF8Dm8ZQKRErpFDds4Mg+CaE
 Q4Y7yG6Mj1yeTWlV4eJNeyAxu1Fqf2MxDPsQPLZCMwx2DPY4ropP8osBXJ8CQDJy9aJ81GY92xt
 rPkodcxa38zJTF/w=
X-Received: by 2002:a17:90b:911:: with SMTP id
 bo17mr13915830pjb.165.1643444419363; 
 Sat, 29 Jan 2022 00:20:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6gwpcpp5qLQfr02/uT3lvvEljwPojpW9Is/AeoJ/I/4YeaoiQIQITWzDGqSTgHxTKumlLRA==
X-Received: by 2002:a17:90b:911:: with SMTP id
 bo17mr13915795pjb.165.1643444419113; 
 Sat, 29 Jan 2022 00:20:19 -0800 (PST)
Received: from [10.72.12.112] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id oj7sm4958823pjb.43.2022.01.29.00.20.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Jan 2022 00:20:18 -0800 (PST)
Message-ID: <f0e549eb-3485-01f5-88cb-f5681fc74abc@redhat.com>
Date: Sat, 29 Jan 2022 16:20:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 16/31] vhost: pass queue index to vhost_vq_get_addr
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-17-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220121202733.404989-17-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/1/22 上午4:27, Eugenio Pérez 写道:
> Doing that way allows vhost backend to know what address to return.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 7b03efccec..64b955ba0c 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -798,9 +798,10 @@ static int vhost_virtqueue_set_addr(struct vhost_dev *dev,
>                                       struct vhost_virtqueue *vq,
>                                       unsigned idx, bool enable_log)
>   {
> -    struct vhost_vring_addr addr;
> +    struct vhost_vring_addr addr = {
> +        .index = idx,
> +    };
>       int r;
> -    memset(&addr, 0, sizeof(struct vhost_vring_addr));
>   
>       if (dev->vhost_ops->vhost_vq_get_addr) {
>           r = dev->vhost_ops->vhost_vq_get_addr(dev, &addr, vq);
> @@ -813,7 +814,6 @@ static int vhost_virtqueue_set_addr(struct vhost_dev *dev,
>           addr.avail_user_addr = (uint64_t)(unsigned long)vq->avail;
>           addr.used_user_addr = (uint64_t)(unsigned long)vq->used;
>       }


I'm a bit lost in the logic above, any reason we need call 
vhost_vq_get_addr() :) ?

Thanks


> -    addr.index = idx;
>       addr.log_guest_addr = vq->used_phys;
>       addr.flags = enable_log ? (1 << VHOST_VRING_F_LOG) : 0;
>       r = dev->vhost_ops->vhost_set_vring_addr(dev, &addr);


