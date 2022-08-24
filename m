Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A9059F184
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 04:52:04 +0200 (CEST)
Received: from localhost ([::1]:36936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQgUs-0000NP-V4
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 22:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQgTf-0007EZ-6G
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 22:50:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQgTc-00077p-R8
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 22:50:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661309443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RQC4dyLOU89DlGprYjcuHcLrWKKLMlg8fueKZDXU+to=;
 b=NPAkga4PWa28iYHgMQB0wktTMy0siP3vP64thPdRIKhb17Ip5178J4aKJPCagBRc7iq9aH
 7YGDv9dSWjNgPUdtwthGfMuWR6GXhlKfEln5YHTO0dgGu7lt5TBU8ijcQ1yqT9zd3cw02A
 g/63kFnJ3wPLAivN8G0I99lc34+bkWY=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-557-icTCxFyvP1WR42k66WfmEQ-1; Tue, 23 Aug 2022 22:50:42 -0400
X-MC-Unique: icTCxFyvP1WR42k66WfmEQ-1
Received: by mail-pl1-f197.google.com with SMTP id
 s8-20020a170902ea0800b00172e456031eso5213551plg.3
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 19:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=RQC4dyLOU89DlGprYjcuHcLrWKKLMlg8fueKZDXU+to=;
 b=R7WAZbEvUaWFH83NsfHskMcw3m/oWVIm0wuGXCGp6J1kApKJWwGv+poH6NBT4t5j6l
 2Qqasu9I30f9eSh8TTQx5LVFKI62ah1aB+ttqMNjPx30sBqGopGUnWHBHCuOI/pSVEFw
 qNkDAutIPWioFErRoIEDXne1dBLNP0C/SdFKfZk1qjQuLD6ksqX8ynJ6fr/WWv9DSNx0
 zm5CKl2Kld4IgB5SiVK2R30WcAj0ZbO5b6j7pqgDPBEVcZ0D+HZuUzRj3dauOfOqk4s9
 rV3n//B0FRTtulpZx4lMOrFg8swrtPMVaR+J9uC2YU6N2daNXG251UrmRGQg3k9amWpi
 a6KA==
X-Gm-Message-State: ACgBeo1sMHvLsr+ns/g4Ntn2bpBtiAUhxqlGP56x2niwMh51jtVYUMi+
 3hc8OPmc3KukDvtue7BdjPmtRJ6S2MP7+2jvYzi1nE9NXl5l+HHm8ex/kFaIqWTbbZBbxi+rSpS
 LU4wGo/o+Uu3Mqe0=
X-Received: by 2002:a17:90b:4d0f:b0:1f7:ae99:b39d with SMTP id
 mw15-20020a17090b4d0f00b001f7ae99b39dmr6152544pjb.237.1661309441420; 
 Tue, 23 Aug 2022 19:50:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR70XC8UCAE9KIR3U/WhhNN3eMzqwTek2QTwsDXSYMDwZMRfoBkG4ADus3TJ+fwF/qcVTUYLHA==
X-Received: by 2002:a17:90b:4d0f:b0:1f7:ae99:b39d with SMTP id
 mw15-20020a17090b4d0f00b001f7ae99b39dmr6152528pjb.237.1661309441185; 
 Tue, 23 Aug 2022 19:50:41 -0700 (PDT)
Received: from [10.72.13.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170902654c00b00172ad9674e5sm3128420pln.291.2022.08.23.19.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 19:50:40 -0700 (PDT)
Message-ID: <cc0089af-dd5f-6d4f-0584-1a75e89c0408@redhat.com>
Date: Wed, 24 Aug 2022 10:50:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 14/24] vhost-user: introduce vhost_reset_vring()
 interface
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <d25d72a6e6a678e1acf861622232180d7c0a5dc8.1660611460.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <d25d72a6e6a678e1acf861622232180d7c0a5dc8.1660611460.git.kangjie.xu@linux.alibaba.com>
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


在 2022/8/16 09:06, Kangjie Xu 写道:
> Introduce the interface vhost_reset_vring(). The interface is a wrapper
> to send a VHOST_USER_RESET_VRING message to the back-end. It will reset
> an individual vring in the back-end. Meanwhile, it will wait for a reply
> to ensure the reset has been completed.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   hw/virtio/vhost-user.c            | 41 +++++++++++++++++++++++++++++++
>   include/hw/virtio/vhost-backend.h |  3 +++
>   2 files changed, 44 insertions(+)
>
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 75b8df21a4..56033f7a92 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -126,6 +126,7 @@ typedef enum VhostUserRequest {
>       VHOST_USER_GET_MAX_MEM_SLOTS = 36,
>       VHOST_USER_ADD_MEM_REG = 37,
>       VHOST_USER_REM_MEM_REG = 38,
> +    VHOST_USER_RESET_VRING = 41,
>       VHOST_USER_MAX
>   } VhostUserRequest;
>   
> @@ -1498,6 +1499,45 @@ static int vhost_user_get_max_memslots(struct vhost_dev *dev,
>       return 0;
>   }
>   
> +static int vhost_user_reset_vring(struct vhost_dev *dev,
> +                                  struct vhost_vring_state *ring)
> +{
> +    int ret;
> +    VhostUserMsg msg = {
> +        .hdr.request = VHOST_USER_RESET_VRING,
> +        .hdr.flags = VHOST_USER_VERSION,


Do we need VHOST_USER_NEED_REPLY_MASK here?

Other looks good.

Thanks


> +        .payload.state = *ring,
> +        .hdr.size = sizeof(msg.payload.state),
> +    };
> +
> +    if (!virtio_has_feature(dev->acked_features, VIRTIO_F_RING_RESET)) {
> +        return -ENOTSUP;
> +    }
> +
> +    ret = vhost_user_write(dev, &msg, NULL, 0);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    ret = vhost_user_read(dev, &msg);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    if (msg.hdr.request != VHOST_USER_RESET_VRING) {
> +        error_report("Received unexpected msg type. Expected %d received %d",
> +                     VHOST_USER_RESET_VRING, msg.hdr.request);
> +        return -EPROTO;
> +    }
> +
> +    if (msg.hdr.size != sizeof(msg.payload.state)) {
> +        error_report("Received bad msg size.");
> +        return -EPROTO;
> +    }
> +
> +    return 0;
> +}
> +
>   static int vhost_user_reset_device(struct vhost_dev *dev)
>   {
>       VhostUserMsg msg = {
> @@ -2625,6 +2665,7 @@ const VhostOps user_ops = {
>           .vhost_set_features = vhost_user_set_features,
>           .vhost_get_features = vhost_user_get_features,
>           .vhost_set_owner = vhost_user_set_owner,
> +        .vhost_reset_vring = vhost_user_reset_vring,
>           .vhost_reset_device = vhost_user_reset_device,
>           .vhost_get_vq_index = vhost_user_get_vq_index,
>           .vhost_set_vring_enable = vhost_user_set_vring_enable,
> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
> index eab46d7f0b..f23bf71a8d 100644
> --- a/include/hw/virtio/vhost-backend.h
> +++ b/include/hw/virtio/vhost-backend.h
> @@ -79,6 +79,8 @@ typedef int (*vhost_get_features_op)(struct vhost_dev *dev,
>                                        uint64_t *features);
>   typedef int (*vhost_set_backend_cap_op)(struct vhost_dev *dev);
>   typedef int (*vhost_set_owner_op)(struct vhost_dev *dev);
> +typedef int (*vhost_reset_vring_op)(struct vhost_dev *dev,
> +                                    struct vhost_vring_state *ring);
>   typedef int (*vhost_reset_device_op)(struct vhost_dev *dev);
>   typedef int (*vhost_get_vq_index_op)(struct vhost_dev *dev, int idx);
>   typedef int (*vhost_set_vring_enable_op)(struct vhost_dev *dev,
> @@ -154,6 +156,7 @@ typedef struct VhostOps {
>       vhost_set_backend_cap_op vhost_set_backend_cap;
>       vhost_set_owner_op vhost_set_owner;
>       vhost_reset_device_op vhost_reset_device;
> +    vhost_reset_vring_op vhost_reset_vring;
>       vhost_get_vq_index_op vhost_get_vq_index;
>       vhost_set_vring_enable_op vhost_set_vring_enable;
>       vhost_requires_shm_log_op vhost_requires_shm_log;


