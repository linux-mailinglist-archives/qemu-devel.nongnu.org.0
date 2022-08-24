Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5959A59F18A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 04:57:07 +0200 (CEST)
Received: from localhost ([::1]:53418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQgZl-00047x-T3
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 22:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQgWl-00012z-PG
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 22:53:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQgWi-0007Ph-Sc
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 22:53:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661309636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z6bSLUTNPei0LublEBMAyIcDlnceRB1uiJ+kSQFSknU=;
 b=hGV1zsYC+KZ32EQsvbFd0cfQMKE+xKfHR+4ARhX1oxXpxxBWfxyv2fbmLrVvpS712a9A4C
 dMUpCUpkT665XqkxI42RFoa+BGHn7j7oshda8LcP9EpGA0S2GUQSPJA3XC41c0shXdBMjB
 ll1avoaZK7l+PVK3230maAMbEMde3uc=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-164-6rjJdSx1P6yq1Od7ImTwhw-1; Tue, 23 Aug 2022 22:53:54 -0400
X-MC-Unique: 6rjJdSx1P6yq1Od7ImTwhw-1
Received: by mail-pl1-f200.google.com with SMTP id
 p8-20020a170902e74800b0017307429ca3so1903707plf.17
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 19:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Z6bSLUTNPei0LublEBMAyIcDlnceRB1uiJ+kSQFSknU=;
 b=h13CNwkrN4kU3M1h2zWWGCCO82f9BnvRnG4Z12p5MsyPg3B+26M8s52QB0QgXTtxnI
 HpQMecP/pm9tWQve3GvuSFAnERGfTPzNkszqxQ0x/YZW16BN56B6biMRUpx0D2Gx16TW
 hnivYqOBxCBiU8g6T9kb0FJcclTtqpIb3u8k8i4scYqXSjc+188lEvPQS96sH8GWbJVM
 xLb/oS9ugNIKX8c669FZHIf1Hv4iq+8Ztr5Xx17jU5V81lzBrwYERN7crSRXkrlcGI1p
 m4zlE0GpGBz5pddpxIopI8SbVda8nfpVBuMq9AQqS+G6oQru7gdlFlKksXBlqo+Db0Xh
 vIMg==
X-Gm-Message-State: ACgBeo26mPY+i0+hYEOK9KU1noyeXB7YSfrVaiK9jIPFDQE1SOWTYghB
 Dzwv8uAO0CNG2LUgue7UfQsaE2cEkkhfGR6LQ1MQ/r+diPTb3jrz8qTlqQOWtSp18wpbhgS72wK
 ra7YdcZKQXEvwK7U=
X-Received: by 2002:a05:6a00:1341:b0:536:d73a:436c with SMTP id
 k1-20020a056a00134100b00536d73a436cmr8545766pfu.45.1661309633630; 
 Tue, 23 Aug 2022 19:53:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6E2QorN+SVvLRM6hrLzLi5pwC83WhD3JAZHeuanRRGVZsPKtKl1lmub61gNVcAw834NUdB6w==
X-Received: by 2002:a05:6a00:1341:b0:536:d73a:436c with SMTP id
 k1-20020a056a00134100b00536d73a436cmr8545744pfu.45.1661309633336; 
 Tue, 23 Aug 2022 19:53:53 -0700 (PDT)
Received: from [10.72.13.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 qe2-20020a17090b4f8200b001f510175984sm87476pjb.41.2022.08.23.19.53.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 19:53:52 -0700 (PDT)
Message-ID: <8fc12420-f171-e015-6666-0a40b1bdf85c@redhat.com>
Date: Wed, 24 Aug 2022 10:53:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 15/24] vhost-user: add op to enable or disable a single
 vring
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <9507fa8179afe9d02dfa03a3dbf6424cd5eba437.1660611460.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <9507fa8179afe9d02dfa03a3dbf6424cd5eba437.1660611460.git.kangjie.xu@linux.alibaba.com>
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


在 2022/8/16 09:06, Kangjie Xu 写道:
> The interface to set enable status for a single vring is lacked in
> VhostOps, since the vhost_set_vring_enable_op will manipulate all
> virtqueues in a device.
>
> Resetting a single vq will rely on this interface.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   hw/virtio/vhost-user.c            | 26 +++++++++++++++++++-------
>   include/hw/virtio/vhost-backend.h |  3 +++
>   2 files changed, 22 insertions(+), 7 deletions(-)
>
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 56033f7a92..8307976cda 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1199,6 +1199,22 @@ static int vhost_user_set_vring_base(struct vhost_dev *dev,
>       return vhost_set_vring(dev, VHOST_USER_SET_VRING_BASE, ring);
>   }
>   
> +static int vhost_user_set_single_vring_enable(struct vhost_dev *dev,
> +                                              int index,
> +                                              int enable)
> +{
> +    if (index < dev->vq_index || index >= dev->vq_index + dev->nvqs) {
> +        return -EINVAL;
> +    }
> +
> +    struct vhost_vring_state state = {
> +        .index = index,
> +        .num   = enable,
> +    };
> +
> +    return vhost_set_vring(dev, VHOST_USER_SET_VRING_ENABLE, &state);
> +}
> +
>   static int vhost_user_set_vring_enable(struct vhost_dev *dev, int enable)
>   {
>       int i;
> @@ -1208,13 +1224,8 @@ static int vhost_user_set_vring_enable(struct vhost_dev *dev, int enable)
>       }
>   
>       for (i = 0; i < dev->nvqs; ++i) {
> -        int ret;
> -        struct vhost_vring_state state = {
> -            .index = dev->vq_index + i,
> -            .num   = enable,
> -        };
> -
> -        ret = vhost_set_vring(dev, VHOST_USER_SET_VRING_ENABLE, &state);


Then I'd squash this into previous patch or re-roder to let this patch 
(vhost_user_set_single_vring_enable()) to be first.

Thanks


> +        int ret = vhost_user_set_single_vring_enable(dev, dev->vq_index + i,
> +                                                     enable);
>           if (ret < 0) {
>               /*
>                * Restoring the previous state is likely infeasible, as well as
> @@ -2668,6 +2679,7 @@ const VhostOps user_ops = {
>           .vhost_reset_vring = vhost_user_reset_vring,
>           .vhost_reset_device = vhost_user_reset_device,
>           .vhost_get_vq_index = vhost_user_get_vq_index,
> +        .vhost_set_single_vring_enable = vhost_user_set_single_vring_enable,
>           .vhost_set_vring_enable = vhost_user_set_vring_enable,
>           .vhost_requires_shm_log = vhost_user_requires_shm_log,
>           .vhost_migration_done = vhost_user_migration_done,
> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
> index f23bf71a8d..38f6b752ff 100644
> --- a/include/hw/virtio/vhost-backend.h
> +++ b/include/hw/virtio/vhost-backend.h
> @@ -83,6 +83,8 @@ typedef int (*vhost_reset_vring_op)(struct vhost_dev *dev,
>                                       struct vhost_vring_state *ring);
>   typedef int (*vhost_reset_device_op)(struct vhost_dev *dev);
>   typedef int (*vhost_get_vq_index_op)(struct vhost_dev *dev, int idx);
> +typedef int (*vhost_set_single_vring_enable_op)(struct vhost_dev *dev,
> +                                                int index, int enable);
>   typedef int (*vhost_set_vring_enable_op)(struct vhost_dev *dev,
>                                            int enable);
>   typedef bool (*vhost_requires_shm_log_op)(struct vhost_dev *dev);
> @@ -158,6 +160,7 @@ typedef struct VhostOps {
>       vhost_reset_device_op vhost_reset_device;
>       vhost_reset_vring_op vhost_reset_vring;
>       vhost_get_vq_index_op vhost_get_vq_index;
> +    vhost_set_single_vring_enable_op vhost_set_single_vring_enable;
>       vhost_set_vring_enable_op vhost_set_vring_enable;
>       vhost_requires_shm_log_op vhost_requires_shm_log;
>       vhost_migration_done_op vhost_migration_done;


