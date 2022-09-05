Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB795ACD66
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 10:06:48 +0200 (CEST)
Received: from localhost ([::1]:60316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV77i-0004r1-H7
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 04:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oV71x-0001cU-QY
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 04:00:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oV71r-0000WX-CK
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 04:00:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662364821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hIO+kZ9Yc3RAPcjnmjOSBiNhY5uMk72WUScbLb4IGyY=;
 b=VHFWaG1WlfIWtGJIPp/Z2WgENs7nZZmhrS1l4GKKKPk8m+wxsK4yJGNnl8hB4E0JF2kpB1
 cBUNT8XiZRj/K9yjYXsgQKKt67hnYKYXruCWTp2k16isnqyQrKxevU+pd6xSjpZrPWxJwv
 +vnUJkCiR/LmNGoIyxj43q7HBfG+a+Q=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-16-Bk_txi38PzmfVLP9FguHzQ-1; Mon, 05 Sep 2022 04:00:18 -0400
X-MC-Unique: Bk_txi38PzmfVLP9FguHzQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 e1-20020a17090a7c4100b001fd7e8c4eb1so3334077pjl.1
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 01:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=hIO+kZ9Yc3RAPcjnmjOSBiNhY5uMk72WUScbLb4IGyY=;
 b=KPrIsgkwD0m3uavHwCDuKOkKdDlgqmBm4QBtSozVD4xgeCUN7bYUOTj5LTD+uR3bin
 Q1U7gsevli/NkUrvn2BMr85iHF7obXDmdks98/9IjphJiUT/4EK6Dxt3dQlQDc868s9u
 qa37Wo/7+sgXi8KxzKvgb68zSmiU9zQDhQ+YHUy+eUZ3gFXndAHKR6TqNbZNZFN9TzjH
 Z8RitF+XMkmpeeDMNxMKpIjqXnRMD0FSMnyyHdC444IzSoBiDkZXF5zzPdjaZVUsoUp1
 JFFZw8Dc7g5sR10z1SmlNGufKH+n5Pw94/eMod5/oLiebmZbQKS0Zqhglcm2dw6Omy9g
 Vjtw==
X-Gm-Message-State: ACgBeo00wyhu4/cvdBUWIi3fw8mrY3gcfmech1IPXp8R4asNFOSvq5xj
 jARvmUIJU8BA8ZhZ6nqkGpz99Afvf5i99B+Fid1Jh5U2pZ3ZzmG4K8R3hMn/yMwFQwMrLDkpgsp
 bO9RHKB9s0d1ewEM=
X-Received: by 2002:a17:903:2350:b0:174:e5fe:9ce9 with SMTP id
 c16-20020a170903235000b00174e5fe9ce9mr34291934plh.118.1662364817164; 
 Mon, 05 Sep 2022 01:00:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4bU/aE2kLqWKJpSte0QuGUmJ79SclIfTWG1lmhpIV39koWbRRDsb7YGUFUuH9NosFQFBCFuA==
X-Received: by 2002:a17:903:2350:b0:174:e5fe:9ce9 with SMTP id
 c16-20020a170903235000b00174e5fe9ce9mr34291906plh.118.1662364816881; 
 Mon, 05 Sep 2022 01:00:16 -0700 (PDT)
Received: from [10.72.13.239] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a17090a130200b002006f15ad4fsm1031552pja.10.2022.09.05.01.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 01:00:16 -0700 (PDT)
Message-ID: <98b8fdea-9c8b-f333-3f78-0cf619eb96e6@redhat.com>
Date: Mon, 5 Sep 2022 16:00:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v3 07/15] virtio-pci: support queue enable
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1661414345.git.kangjie.xu@linux.alibaba.com>
 <a0d08cd3e3b6610c2cc413cf315295f851414904.1661414345.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <a0d08cd3e3b6610c2cc413cf315295f851414904.1661414345.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.978, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


在 2022/8/25 16:08, Kangjie Xu 写道:
> PCI devices support device specific vq enable.
>
> Based on this function, the driver can re-enable the virtqueue after the
> virtqueue is reset.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/virtio/virtio-pci.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 79b9e641dd..a53b5d9f1e 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1342,6 +1342,7 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
>                          proxy->vqs[vdev->queue_sel].used[0]);
>               proxy->vqs[vdev->queue_sel].enabled = 1;
>               proxy->vqs[vdev->queue_sel].reset = 0;
> +            virtio_queue_enable(vdev, vdev->queue_sel);
>           } else {
>               virtio_error(vdev, "wrong value for queue_enable %"PRIx64, val);
>           }


