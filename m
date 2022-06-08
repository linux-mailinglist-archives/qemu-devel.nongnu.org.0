Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1D15420EE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 06:21:08 +0200 (CEST)
Received: from localhost ([::1]:43196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nynBr-0007vj-9A
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 00:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nyn9t-00078E-4X
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 00:19:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nyn9q-0002D9-NM
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 00:19:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654661941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vSz4FMpXwCR5kBJF/zfY8Ms2NKL7B4j/W6zB+WEduAM=;
 b=Mnl8+QW87tW7AqQ4tayI1YjRGqp1ANbWSSsgF/PRqOyeBLVQHCqT/tbb1RKmoMW/7HadY0
 CdiXn45qsl/6525hAQV++pCrliRv5BasThE9BtZQRJMDq2xJYXO+jzc1Wtiqx7Hg+resUY
 NCm5yA4DhTgJjrUvCW9G97zMS0bxxTI=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-n2pkUoizPt-rj_ra_lpahQ-1; Wed, 08 Jun 2022 00:19:00 -0400
X-MC-Unique: n2pkUoizPt-rj_ra_lpahQ-1
Received: by mail-pg1-f197.google.com with SMTP id
 e18-20020a656492000000b003fa4033f9a7so9607619pgv.17
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 21:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vSz4FMpXwCR5kBJF/zfY8Ms2NKL7B4j/W6zB+WEduAM=;
 b=ZMWIG3sT2c52VmvikT6p2ctqdMf9wj/5StIBCzkWq4Ce4mh7lqfx4gnn9ReZdF3Ssc
 lR+OgZuQ6G1znxFdsoyDlM5S7/6mE4kuNSeR/RSa5rtK5W2uPOBp95GnPI+LkYrxqjGL
 TdNWcbvJRywfY1f7uHVV+fRju3yky1JTugTWovIhVoN83pncp7/JfTvF0WZu77Fs2XQG
 KDWSoDlH4zf3C1GfRALtpCRSYLwYlXE0Kne8A0HRev+u+g4swolDbE9uugdQbQNZBpsM
 ioS3ntNGn+IXos+aJs0n7cr4O1Ed0ImCb5Wi45fyFuMoneSa+2uI2uJzw085r9yMKI/i
 s97g==
X-Gm-Message-State: AOAM530crcXscRO7QJRh2Ght1UwO1TKSfjmitd/VoOY9spJTdQAR/28d
 9hXy5ffANCAt8AhEz1S8VSmtlo7R5KhfbCr2p4eZvaLBGEsKKx6XmjTjrmjZaWTGb+f5aAMfzQP
 Vhg82IMuuTP7njw0=
X-Received: by 2002:a63:8bc7:0:b0:3fc:bd28:c819 with SMTP id
 j190-20020a638bc7000000b003fcbd28c819mr27452606pge.378.1654661939508; 
 Tue, 07 Jun 2022 21:18:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLokpdAElRas6Y6XO9s93LT2qtPmBA72w6naSuyl2wjxyWP5ypdt0bGOYjyxmSWwhrA+ZDrA==
X-Received: by 2002:a63:8bc7:0:b0:3fc:bd28:c819 with SMTP id
 j190-20020a638bc7000000b003fcbd28c819mr27452588pge.378.1654661939222; 
 Tue, 07 Jun 2022 21:18:59 -0700 (PDT)
Received: from [10.72.13.97] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 t27-20020aa7947b000000b0051c0fe8fb8csm5996734pfq.95.2022.06.07.21.18.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 21:18:58 -0700 (PDT)
Message-ID: <4e097d14-9422-bff5-d52c-74ae9fceede1@redhat.com>
Date: Wed, 8 Jun 2022 12:18:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [RFC PATCH v8 11/21] vhost: Update kernel headers
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Eric Blake <eblake@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Parav Pandit <parav@mellanox.com>
References: <20220519191306.821774-1-eperezma@redhat.com>
 <20220519191306.821774-12-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220519191306.821774-12-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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


在 2022/5/20 03:12, Eugenio Pérez 写道:
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---


It's better to use the helpers in scripts/ and mentioned to which 
version is this synced.

Thanks


>   include/standard-headers/linux/vhost_types.h | 11 ++++++++-
>   linux-headers/linux/vhost.h                  | 25 ++++++++++++++++----
>   2 files changed, 30 insertions(+), 6 deletions(-)
>
> diff --git a/include/standard-headers/linux/vhost_types.h b/include/standard-headers/linux/vhost_types.h
> index 0bd2684a2a..ce78551b0f 100644
> --- a/include/standard-headers/linux/vhost_types.h
> +++ b/include/standard-headers/linux/vhost_types.h
> @@ -87,7 +87,7 @@ struct vhost_msg {
>   
>   struct vhost_msg_v2 {
>   	uint32_t type;
> -	uint32_t reserved;
> +	uint32_t asid;
>   	union {
>   		struct vhost_iotlb_msg iotlb;
>   		uint8_t padding[64];
> @@ -153,4 +153,13 @@ struct vhost_vdpa_iova_range {
>   /* vhost-net should add virtio_net_hdr for RX, and strip for TX packets. */
>   #define VHOST_NET_F_VIRTIO_NET_HDR 27
>   
> +/* Use message type V2 */
> +#define VHOST_BACKEND_F_IOTLB_MSG_V2 0x1
> +/* IOTLB can accept batching hints */
> +#define VHOST_BACKEND_F_IOTLB_BATCH  0x2
> +/* IOTLB can accept address space identifier through V2 type of IOTLB
> + * message
> + */
> +#define VHOST_BACKEND_F_IOTLB_ASID  0x3
> +
>   #endif
> diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost.h
> index 5d99e7c242..d42eb46efd 100644
> --- a/linux-headers/linux/vhost.h
> +++ b/linux-headers/linux/vhost.h
> @@ -89,11 +89,6 @@
>   
>   /* Set or get vhost backend capability */
>   
> -/* Use message type V2 */
> -#define VHOST_BACKEND_F_IOTLB_MSG_V2 0x1
> -/* IOTLB can accept batching hints */
> -#define VHOST_BACKEND_F_IOTLB_BATCH  0x2
> -
>   #define VHOST_SET_BACKEND_FEATURES _IOW(VHOST_VIRTIO, 0x25, __u64)
>   #define VHOST_GET_BACKEND_FEATURES _IOR(VHOST_VIRTIO, 0x26, __u64)
>   
> @@ -154,6 +149,26 @@
>   /* Get the config size */
>   #define VHOST_VDPA_GET_CONFIG_SIZE	_IOR(VHOST_VIRTIO, 0x79, __u32)
>   
> +/* Get the number of virtqueue groups. */
> +#define VHOST_VDPA_GET_GROUP_NUM	_IOR(VHOST_VIRTIO, 0x7A, unsigned int)
> +
> +/* Get the number of address spaces. */
> +#define VHOST_VDPA_GET_AS_NUM		_IOR(VHOST_VIRTIO, 0x7B, unsigned int)
> +
> +/* Get the group for a virtqueue: read index, write group in num,
> + * The virtqueue index is stored in the index field of
> + * vhost_vring_state. The group for this specific virtqueue is
> + * returned via num field of vhost_vring_state.
> + */
> +#define VHOST_VDPA_GET_VRING_GROUP	_IOWR(VHOST_VIRTIO, 0x7C,	\
> +					      struct vhost_vring_state)
> +/* Set the ASID for a virtqueue group. The group index is stored in
> + * the index field of vhost_vring_state, the ASID associated with this
> + * group is stored at num field of vhost_vring_state.
> + */
> +#define VHOST_VDPA_SET_GROUP_ASID	_IOW(VHOST_VIRTIO, 0x7D, \
> +					     struct vhost_vring_state)
> +
>   /* Get the count of all virtqueues */
>   #define VHOST_VDPA_GET_VQS_COUNT	_IOR(VHOST_VIRTIO, 0x80, __u32)
>   


