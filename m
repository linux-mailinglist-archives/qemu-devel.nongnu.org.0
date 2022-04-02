Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4309C4EFDFA
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 04:39:22 +0200 (CEST)
Received: from localhost ([::1]:51822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naTfd-0001uk-3u
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 22:39:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1naTec-0001DS-JT
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 22:38:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1naTeZ-00023c-GY
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 22:38:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648867093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tl1iGaOe7nz2Uq1ovRipzvFskNjRALst+XuRlDRKf9w=;
 b=AgOgjZOexUxkt2mXhL55i9MoQs56AuyI3nnZhqo7MI1LuLlhcmIWE8JoHpcpJRDIP7x8b+
 aB5XcPY6mFwNILY7Gl1BQm8sMUiYNu6wQD3qaYtqGGSUbxsXyR9ri+JdjSBZZHv2yRevlX
 wiTy/7Y4vs9LbL5fEUDLQJEZ3h/2exw=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-7mI3223MPzaKL_am4iBpeg-1; Fri, 01 Apr 2022 22:38:10 -0400
X-MC-Unique: 7mI3223MPzaKL_am4iBpeg-1
Received: by mail-pl1-f200.google.com with SMTP id
 u8-20020a170903124800b0015195a5826cso2339868plh.4
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 19:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tl1iGaOe7nz2Uq1ovRipzvFskNjRALst+XuRlDRKf9w=;
 b=Cuho8MOAV/vvagjmpYlxOy7ubWDQpnrLMXnFei8zMrYvR2AvDuLdK2hLIMOBvFfI9j
 DbaNoOM93pXRUHTj0odyRhgfry3n3grUNZHrOkymXouxt3DmV21C4XfRy1wEAyvk4VF1
 4JTU4kVxVGx9ZJwXqld+SRYT/lHCbR1bgLePp94BW88YLLohEnZKnUb38lS0tEqa1JGg
 +skS9ZAAWWqpHPvqpUr1WKnCVhclYobiY2QFx85k9Vo1tEU1yLd8LDr2VNrJexFrl4XQ
 u7GBLuLi3zv/7/X12/hMnfik62Ec5rWjcWoTsj5nxN1A3O12w1skMX4cRbctMh+3Q2q3
 WXKg==
X-Gm-Message-State: AOAM533sfTWDZK01S2AQ1wrsIMx+xSizj8Fl9mELeG/xPcI83lBhBn9U
 6E26I4STisPuoJFbS7W+PPwOZfJxwEZzjerZaibnmh32aOH3wVJNM0m9ygEBnIWcK9aukigbh2Z
 urzi6ZRyQw+1K3Cs=
X-Received: by 2002:a17:90a:e552:b0:1ca:2d70:79ef with SMTP id
 ei18-20020a17090ae55200b001ca2d7079efmr9311034pjb.175.1648867089714; 
 Fri, 01 Apr 2022 19:38:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6Cz8uLUwJVMi5axBOGrMA02j8Fvugyzn5Esylh+rtiFaErrFtJJ18A9qMVaCSdscP1/2URg==
X-Received: by 2002:a17:90a:e552:b0:1ca:2d70:79ef with SMTP id
 ei18-20020a17090ae55200b001ca2d7079efmr9311021pjb.175.1648867089371; 
 Fri, 01 Apr 2022 19:38:09 -0700 (PDT)
Received: from [10.72.13.42] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 y11-20020aa793cb000000b004fb597d85b2sm4353692pff.160.2022.04.01.19.38.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 19:38:08 -0700 (PDT)
Message-ID: <c8e8459d-32b5-55ff-44f4-1f03edb8a597@redhat.com>
Date: Sat, 2 Apr 2022 10:38:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] vhost: Refactor vhost_reset_device() in VhostOps
To: Michael Qiu <qiudayu@archeros.com>, mst@redhat.com, si-wei.liu@oracle.com
References: <1648776683-23739-1-git-send-email-qiudayu@archeros.com>
 <1648811173-15293-1-git-send-email-qiudayu@archeros.com>
 <1648811173-15293-2-git-send-email-qiudayu@archeros.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <1648811173-15293-2-git-send-email-qiudayu@archeros.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eperezma@redhat.com, lingshan.zhu@intel.com, qemu-devel@nongnu.org,
 lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/4/1 下午7:06, Michael Qiu 写道:
> Currently in vhost framwork, vhost_reset_device() is misnamed.
> Actually, it should be vhost_reset_owner().
>
> In vhost user, it make compatible with reset device ops, but
> vhost kernel does not compatible with it, for vhost vdpa, it
> only implement reset device action.
>
> So we need seperate the function into vhost_reset_owner() and
> vhost_reset_device(). So that different backend could use the
> correct function.


I see no reason when RESET_OWNER needs to be done for kernel backend.

And if I understand the code correctly, vhost-user "abuse" RESET_OWNER 
for reset. So the current code looks fine?


>
> Signde-off-by: Michael Qiu <qiudayu@archeros.com>
> ---
>   hw/scsi/vhost-user-scsi.c         |  6 +++++-
>   hw/virtio/vhost-backend.c         |  4 ++--
>   hw/virtio/vhost-user.c            | 22 ++++++++++++++++++----
>   include/hw/virtio/vhost-backend.h |  2 ++
>   4 files changed, 27 insertions(+), 7 deletions(-)
>
> diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
> index 1b2f7ee..f179626 100644
> --- a/hw/scsi/vhost-user-scsi.c
> +++ b/hw/scsi/vhost-user-scsi.c
> @@ -80,8 +80,12 @@ static void vhost_user_scsi_reset(VirtIODevice *vdev)
>           return;
>       }
>   
> -    if (dev->vhost_ops->vhost_reset_device) {
> +    if (virtio_has_feature(dev->protocol_features,
> +                           VHOST_USER_PROTOCOL_F_RESET_DEVICE) &&
> +                           dev->vhost_ops->vhost_reset_device) {
>           dev->vhost_ops->vhost_reset_device(dev);
> +    } else if (dev->vhost_ops->vhost_reset_owner) {
> +        dev->vhost_ops->vhost_reset_owner(dev);


Actually, I fail to understand why we need an indirection via vhost_ops. 
It's guaranteed to be vhost_user_ops.


>       }
>   }
>   
> diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
> index e409a86..abbaa8b 100644
> --- a/hw/virtio/vhost-backend.c
> +++ b/hw/virtio/vhost-backend.c
> @@ -191,7 +191,7 @@ static int vhost_kernel_set_owner(struct vhost_dev *dev)
>       return vhost_kernel_call(dev, VHOST_SET_OWNER, NULL);
>   }
>   
> -static int vhost_kernel_reset_device(struct vhost_dev *dev)
> +static int vhost_kernel_reset_owner(struct vhost_dev *dev)
>   {
>       return vhost_kernel_call(dev, VHOST_RESET_OWNER, NULL);
>   }
> @@ -317,7 +317,7 @@ const VhostOps kernel_ops = {
>           .vhost_get_features = vhost_kernel_get_features,
>           .vhost_set_backend_cap = vhost_kernel_set_backend_cap,
>           .vhost_set_owner = vhost_kernel_set_owner,
> -        .vhost_reset_device = vhost_kernel_reset_device,
> +        .vhost_reset_owner = vhost_kernel_reset_owner,


I think we can delete the current vhost_reset_device() since it not used 
in any code path.

Thanks


>           .vhost_get_vq_index = vhost_kernel_get_vq_index,
>   #ifdef CONFIG_VHOST_VSOCK
>           .vhost_vsock_set_guest_cid = vhost_kernel_vsock_set_guest_cid,
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 6abbc9d..4412008 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1475,16 +1475,29 @@ static int vhost_user_get_max_memslots(struct vhost_dev *dev,
>       return 0;
>   }
>   
> +static int vhost_user_reset_owner(struct vhost_dev *dev)
> +{
> +    VhostUserMsg msg = {
> +        .hdr.request = VHOST_USER_RESET_OWNER,
> +        .hdr.flags = VHOST_USER_VERSION,
> +    };
> +
> +    return vhost_user_write(dev, &msg, NULL, 0);
> +}
> +
>   static int vhost_user_reset_device(struct vhost_dev *dev)
>   {
>       VhostUserMsg msg = {
> +        .hdr.request = VHOST_USER_RESET_DEVICE,
>           .hdr.flags = VHOST_USER_VERSION,
>       };
>   
> -    msg.hdr.request = virtio_has_feature(dev->protocol_features,
> -                                         VHOST_USER_PROTOCOL_F_RESET_DEVICE)
> -        ? VHOST_USER_RESET_DEVICE
> -        : VHOST_USER_RESET_OWNER;
> +    /* Caller must ensure the backend has VHOST_USER_PROTOCOL_F_RESET_DEVICE
> +     * support */
> +    if (!virtio_has_feature(dev->protocol_features,
> +                       VHOST_USER_PROTOCOL_F_RESET_DEVICE)) {
> +        return -EPERM;
> +    }
>   
>       return vhost_user_write(dev, &msg, NULL, 0);
>   }
> @@ -2548,6 +2561,7 @@ const VhostOps user_ops = {
>           .vhost_set_features = vhost_user_set_features,
>           .vhost_get_features = vhost_user_get_features,
>           .vhost_set_owner = vhost_user_set_owner,
> +        .vhost_reset_owner = vhost_user_reset_owner,
>           .vhost_reset_device = vhost_user_reset_device,
>           .vhost_get_vq_index = vhost_user_get_vq_index,
>           .vhost_set_vring_enable = vhost_user_set_vring_enable,
> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
> index 81bf310..affeeb0 100644
> --- a/include/hw/virtio/vhost-backend.h
> +++ b/include/hw/virtio/vhost-backend.h
> @@ -77,6 +77,7 @@ typedef int (*vhost_get_features_op)(struct vhost_dev *dev,
>                                        uint64_t *features);
>   typedef int (*vhost_set_backend_cap_op)(struct vhost_dev *dev);
>   typedef int (*vhost_set_owner_op)(struct vhost_dev *dev);
> +typedef int (*vhost_reset_owner_op)(struct vhost_dev *dev);
>   typedef int (*vhost_reset_device_op)(struct vhost_dev *dev);
>   typedef int (*vhost_get_vq_index_op)(struct vhost_dev *dev, int idx);
>   typedef int (*vhost_set_vring_enable_op)(struct vhost_dev *dev,
> @@ -150,6 +151,7 @@ typedef struct VhostOps {
>       vhost_get_features_op vhost_get_features;
>       vhost_set_backend_cap_op vhost_set_backend_cap;
>       vhost_set_owner_op vhost_set_owner;
> +    vhost_reset_owner_op vhost_reset_owner;
>       vhost_reset_device_op vhost_reset_device;
>       vhost_get_vq_index_op vhost_get_vq_index;
>       vhost_set_vring_enable_op vhost_set_vring_enable;


