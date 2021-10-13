Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE60E42B3E5
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 05:58:22 +0200 (CEST)
Received: from localhost ([::1]:39986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maVPJ-0001am-M0
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 23:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1maVOA-0000pG-K1
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 23:57:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1maVO8-0000vY-MF
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 23:57:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634097427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OfEv3P2XE+BIrw1JNXoxGqnhbGwSlGRDfuMPFt5ERNQ=;
 b=FvmWYPxrW9kFFRYsa/OqDIe/3r+KJScXQW1zPk/+CiaxeouAEUwAvN53jPqGb4sBSq6uO8
 M2U5Xe/fUtRHy53IzcGcGdrKrbqILfqWK655al8IiotDUqpH6ouHOevM6w6NmEMRHDo7Mv
 CDFSc9cU9zLpalLU9PLCJWt2ANj2QVM=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-Dfje8LcvPryQ37Jo1PcEog-1; Tue, 12 Oct 2021 23:57:06 -0400
X-MC-Unique: Dfje8LcvPryQ37Jo1PcEog-1
Received: by mail-pg1-f200.google.com with SMTP id
 s19-20020a63e813000000b00287d976d152so741820pgh.3
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 20:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=OfEv3P2XE+BIrw1JNXoxGqnhbGwSlGRDfuMPFt5ERNQ=;
 b=cfDRYEJROPsadFLl4+HfQ7h45WkCLFC9i/x4aB1F/7KRJR9SKGiutphJH2C+FNlwR5
 pdE80ijXxplPcAYbNjhNAw2BS/HgmerW4Lvhfl8yk15JbW+HIQz5r0jLNhpFtfFSkoZe
 XLnn6NgF/H6l2TF0BCsju+cn+3TiqqSD96bE+73apTORitAotShSuh6Wp7Ctm8flDS0I
 k1g6XQGSx8CuQ/b5nqLPjIktQtpmrKyJFSsfRIOwpsGqktNBlQekaibeqp4WTAVK7gdT
 xIHid1lC5H/GkhTqZMUA8aiIy2MEAD574Zx6VY+xwYRZNSCngoHEi/P25IFdA6LpRiDY
 LQng==
X-Gm-Message-State: AOAM533oWyPkMTkMycIYH9AkQxnaUiFALGiVvtGYMs8FcTo6gb4bI+wZ
 pmwgUgBvEqtt1ax543C0XH8bD3U3eYy1e6RUhYDwWgdIxrJKI5tD92ZRq6lJ2wUFVg28koO/6IY
 wwWBlae+mXkYB0No=
X-Received: by 2002:a17:90a:b314:: with SMTP id
 d20mr10817557pjr.174.1634097425660; 
 Tue, 12 Oct 2021 20:57:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZOF+K/NFHFlr2aR3JavlxxijfcUZA9fvRfDnc4w62lBlPtcRrDNXxsbc0AxbzFG+lWfEKjQ==
X-Received: by 2002:a17:90a:b314:: with SMTP id
 d20mr10817540pjr.174.1634097425406; 
 Tue, 12 Oct 2021 20:57:05 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id k1sm4143302pjj.54.2021.10.12.20.57.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 20:57:05 -0700 (PDT)
Subject: Re: [RFC PATCH v4 13/20] vdpa: Save host and guest features
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-14-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <37bddd4a-eeae-33c3-45f5-3d9070a25513@redhat.com>
Date: Wed, 13 Oct 2021 11:56:59 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211001070603.307037-14-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/10/1 下午3:05, Eugenio Pérez 写道:
> Those are needed for SVQ: Host ones are needed to check if SVQ knows
> how to talk with the device and for feature negotiation, and guest ones
> to know if SVQ can talk with it.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   include/hw/virtio/vhost-vdpa.h |  2 ++
>   hw/virtio/vhost-vdpa.c         | 31 ++++++++++++++++++++++++++++---
>   2 files changed, 30 insertions(+), 3 deletions(-)
>
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> index fddac248b3..9044ae694b 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -26,6 +26,8 @@ typedef struct vhost_vdpa {
>       int device_fd;
>       uint32_t msg_type;
>       MemoryListener listener;
> +    uint64_t host_features;
> +    uint64_t guest_features;


Any reason that we can't use the features stored in VirtioDevice?

Thanks


>       bool shadow_vqs_enabled;
>       GPtrArray *shadow_vqs;
>       struct vhost_dev *dev;
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 6c5f4c98b8..a057e8277d 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -439,10 +439,19 @@ static int vhost_vdpa_set_mem_table(struct vhost_dev *dev,
>       return 0;
>   }
>   
> -static int vhost_vdpa_set_features(struct vhost_dev *dev,
> -                                   uint64_t features)
> +/**
> + * Internal set_features() that follows vhost/VirtIO protocol for that
> + */
> +static int vhost_vdpa_backend_set_features(struct vhost_dev *dev,
> +                                           uint64_t features)
>   {
> +    struct vhost_vdpa *v = dev->opaque;
> +
>       int ret;
> +    if (v->host_features & BIT_ULL(VIRTIO_F_QUEUE_STATE)) {
> +        features |= BIT_ULL(VIRTIO_F_QUEUE_STATE);
> +    }
> +
>       trace_vhost_vdpa_set_features(dev, features);
>       ret = vhost_vdpa_call(dev, VHOST_SET_FEATURES, &features);
>       uint8_t status = 0;
> @@ -455,6 +464,17 @@ static int vhost_vdpa_set_features(struct vhost_dev *dev,
>       return !(status & VIRTIO_CONFIG_S_FEATURES_OK);
>   }
>   
> +/**
> + * Exposed vhost set features
> + */
> +static int vhost_vdpa_set_features(struct vhost_dev *dev,
> +                                   uint64_t features)
> +{
> +    struct vhost_vdpa *v = dev->opaque;
> +    v->guest_features = features;
> +    return vhost_vdpa_backend_set_features(dev, features);
> +}
> +
>   static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
>   {
>       uint64_t features;
> @@ -673,12 +693,17 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
>   }
>   
>   static int vhost_vdpa_get_features(struct vhost_dev *dev,
> -                                     uint64_t *features)
> +                                   uint64_t *features)
>   {
>       int ret;
>   
>       ret = vhost_vdpa_call(dev, VHOST_GET_FEATURES, features);
>       trace_vhost_vdpa_get_features(dev, *features);
> +
> +    if (ret == 0) {
> +        struct vhost_vdpa *v = dev->opaque;
> +        v->host_features = *features;
> +    }
>       return ret;
>   }
>   


