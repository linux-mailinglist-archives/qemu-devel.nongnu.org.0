Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA8A3C1F1A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:52:32 +0200 (CEST)
Received: from localhost ([::1]:46034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1jR9-0006sE-JY
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m1j0O-0006zX-AV
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 01:24:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m1j0K-00057H-Fj
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 01:24:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625808287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+R4y6q4/oiTZ1AJAmdXiwDMHW94Onmmut9pwir4eEIw=;
 b=EcHG5LpB+rHn2XXjDpQ+YwKttx2Ek9Twk89QnqnYlzlb9MUHUAAXiBRtmddPKqg19QGba8
 DNOG85s3OEP9HVHvgCseka+hVPO4kNBQMaiiTVBFmRt3gE7P93nH53+dVuSPmswavY7Ipt
 8+mAu6XbN6Aa4yo4oHYDLQ5pXn5LNjQ=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-5xzc-pAYPm6XprqXf-6Cyw-1; Fri, 09 Jul 2021 01:24:46 -0400
X-MC-Unique: 5xzc-pAYPm6XprqXf-6Cyw-1
Received: by mail-pl1-f199.google.com with SMTP id
 p8-20020a1709028a88b029011c6ee150f3so2817863plo.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 22:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=+R4y6q4/oiTZ1AJAmdXiwDMHW94Onmmut9pwir4eEIw=;
 b=uCj6q/PPcmC/KlgiIgqUCjsLWGjrMZ2A6lVYwL5i9fquL4ciYk9XpztYvsuV2Mzf34
 SBbOu+aL4MMnDAFqPD4MNL1NCSwLzR1AiSBwrsR0llNr3fuQ9alsH2hl9QNxfC3xw5ec
 suP/F6Pau/orXes22RpL+oPBleWHQnaHY6xQxPdGFM13QxhVydlLJuXMekFI4AjUwkQA
 zJNJ/YB8rTWsey/94WLhVTZw4k+SpYwsh1RjC2k9dkcje8iKIC2ZWLS8RJrOiXLZ7qna
 GLqUk9WIYs+VRo8cXcTQQ2manRB6QtrEFoISzvRwZcYE+WTMsaaTZMXd6NLobYNS5YyW
 tv3w==
X-Gm-Message-State: AOAM533BzsA7H2rYGdv/PAOj47IkKjko6haUYkhXukpdultTecGoVWNU
 siGCh+5zl4RUAxxC2iM2q8OMpjIE6F3Z/EzZZXh2iG1SiaWJLBJKDOvNHazu5/f03vzofsDMfdU
 AbeXAGUXJVwkadNisJYEknRUM6YOHzDtIkxiLG+i+CBBWOvMxl11CVSdZs4Gn4zL45Q0=
X-Received: by 2002:a63:a545:: with SMTP id r5mr532272pgu.204.1625808284870;
 Thu, 08 Jul 2021 22:24:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNbxhYqnm8cqs9ZTvYIoafWYv+Mue7jrdQCT2oTjeJR/PE2/dX1L2507Dp31RFHkoVLcxjaQ==
X-Received: by 2002:a63:a545:: with SMTP id r5mr532242pgu.204.1625808284478;
 Thu, 08 Jul 2021 22:24:44 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id ch6sm11445133pjb.55.2021.07.08.22.24.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 22:24:44 -0700 (PDT)
Subject: Re: [PATCH v8 4/9] vhost-vdpa: add support for config interrupt call
 back
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210706072030.32365-1-lulu@redhat.com>
 <20210706072030.32365-5-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <158573d9-de56-7dc3-444a-645dcfb31add@redhat.com>
Date: Fri, 9 Jul 2021 13:24:41 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706072030.32365-5-lulu@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/7/6 ÏÂÎç3:20, Cindy Lu Ð´µÀ:
> Add new call back function in vhost-vdpa, this call back function only
> supported in vhost-vdpa backend
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/virtio/trace-events | 2 ++
>   hw/virtio/vhost-vdpa.c | 7 +++++++
>   2 files changed, 9 insertions(+)
>
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index c62727f879..152db5917d 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -52,6 +52,8 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int index, int fd) "dev: %p index:
>   vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRIx64
>   vhost_vdpa_set_owner(void *dev) "dev: %p"
>   vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
> +vhost_vdpa_set_config_call(void *dev, int fd)"dev: %p fd: %d"
> +
>   
>   # virtio.c
>   virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned out_num) "elem %p size %zd in_num %u out_num %u"
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 01d2101d09..58075da9d9 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -545,6 +545,12 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
>       trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
>       return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
>   }
> +static int vhost_vdpa_set_config_call(struct vhost_dev *dev,
> +                                       int fd)
> +{
> +    trace_vhost_vdpa_set_config_call(dev, fd);
> +    return vhost_vdpa_call(dev, VHOST_VDPA_SET_CONFIG_CALL, &fd);
> +}
>   
>   static int vhost_vdpa_get_features(struct vhost_dev *dev,
>                                        uint64_t *features)
> @@ -611,4 +617,5 @@ const VhostOps vdpa_ops = {
>           .vhost_get_device_id = vhost_vdpa_get_device_id,
>           .vhost_vq_get_addr = vhost_vdpa_vq_get_addr,
>           .vhost_force_iommu = vhost_vdpa_force_iommu,
> +        .vhost_set_config_call = vhost_vdpa_set_config_call,
>   };


