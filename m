Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6033159D2DB
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 10:00:23 +0200 (CEST)
Received: from localhost ([::1]:37550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQOpi-0004Ig-9t
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 04:00:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQOic-0002l4-P8
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:53:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQOiW-00086d-IS
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:53:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661241175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jCD916b73vgd/rko7cWvRR1oBTggPhoZbr4avklyurk=;
 b=HLi7YqBHUz62ARvUIiRMiC9h7FTMU9gAETkVwW1zrQ847vKgUOu/l0703NUnx16Bm+Eygn
 XxDwkvjjEk7WERpmYLVVgAklrTSJOqvi1Kq85iIAJ4X47AIJAasmN/HI+ovOoxd/R0o5zc
 nU4sVvrdt0u62ArpM7+Ns4V4P2E+Jc4=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-333-lUR-zFTGOgCjAIv8fLSyBA-1; Tue, 23 Aug 2022 03:52:54 -0400
X-MC-Unique: lUR-zFTGOgCjAIv8fLSyBA-1
Received: by mail-pj1-f69.google.com with SMTP id
 bf3-20020a17090b0b0300b001fb29d80046so2141089pjb.0
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 00:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=jCD916b73vgd/rko7cWvRR1oBTggPhoZbr4avklyurk=;
 b=fAK63ttNqh4UJ0HdyxgpoOmDkby9AKHnrDN0wPrVTxG7KgXSSQ2GU4GnzSs4ugqlLj
 HPukoBCIDmbpmgbl+8vxh7VKyXM24RANsU6sZg3i0viXPlaXHIzM9ujY5mVfNh9kvWTA
 eYr9bcn/2stpIsOf1fcL+CxrQiKjYTAn6pK3gthUpxjizG9ngaueA/tlvUnfUZ3OPNf1
 a8qHCsQNtx2cXq69PM/r0HrLv1UCBFqZwrOyKg+2iYLJhI73PRerrqkwa+NtLxPLy/xO
 T3ZFYHBGb7aYBxZ7qkjcglpDzQUze6UnM5ZWbJRtpyDjG0T7WbweIm0KlCi1vR0OzUTi
 MzSw==
X-Gm-Message-State: ACgBeo0pHvxIgziRuzWQx4bianqRsLZwCz/BVf6JW3JMU/elZTpmgd+w
 jLtYMzmGUSM+GRdi7YB7Z3pWoekSGxhcPF+FumbZlZPLxhbzZqnF5jzSxVH22fN6ocGIqISbrfJ
 gAIiovj95qfc2sFI=
X-Received: by 2002:a63:f0a:0:b0:42a:fc7b:543e with SMTP id
 e10-20020a630f0a000000b0042afc7b543emr446893pgl.499.1661241173056; 
 Tue, 23 Aug 2022 00:52:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5Eg+xwmPKVN1KDvkxZ/sGSzhNH6RqfUObK4dLnJBcE6UJRDZy4JVDzFSAFZxt0XaKb14REAw==
X-Received: by 2002:a63:f0a:0:b0:42a:fc7b:543e with SMTP id
 e10-20020a630f0a000000b0042afc7b543emr446873pgl.499.1661241172744; 
 Tue, 23 Aug 2022 00:52:52 -0700 (PDT)
Received: from [10.72.13.141] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a170902eb8200b00172d0c7edf4sm6093062plg.106.2022.08.23.00.52.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 00:52:51 -0700 (PDT)
Message-ID: <3995c3ff-2806-b1aa-12e0-f4026253219d@redhat.com>
Date: Tue, 23 Aug 2022 15:52:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 09/24] vhost: introduce vhost_dev_virtqueue_stop()
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <d10274ce04b729e92402a040af7c4d9d23a4824d.1660611460.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <d10274ce04b729e92402a040af7c4d9d23a4824d.1660611460.git.kangjie.xu@linux.alibaba.com>
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
> Introduce vhost_dev_virtqueue_stop(), which can ummap the
> vrings and the desc of it.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   hw/virtio/vhost.c         | 9 +++++++++
>   include/hw/virtio/vhost.h | 3 +++
>   2 files changed, 12 insertions(+)
>
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index e467dfc7bc..1bca9ff48d 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1904,3 +1904,12 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
>   
>       return -ENOSYS;
>   }
> +
> +void vhost_dev_virtqueue_stop(struct vhost_dev *hdev, VirtIODevice *vdev,
> +                              int idx)
> +{
> +    vhost_virtqueue_unmap(hdev,
> +                          vdev,
> +                          hdev->vqs + idx,
> +                          idx);


So I think the unmap is not sufficient, we need backend specific 
support. E.g for vhost kernel, need a SET_BACKEND here?

Thanks


> +}
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index a346f23d13..574888440c 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -288,4 +288,7 @@ int vhost_dev_set_inflight(struct vhost_dev *dev,
>                              struct vhost_inflight *inflight);
>   int vhost_dev_get_inflight(struct vhost_dev *dev, uint16_t queue_size,
>                              struct vhost_inflight *inflight);
> +
> +void vhost_dev_virtqueue_stop(struct vhost_dev *hdev, VirtIODevice *vdev,
> +                              int idx);
>   #endif


