Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E464D580A4A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 06:19:57 +0200 (CEST)
Received: from localhost ([::1]:47530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGC33-00077r-0t
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 00:19:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGC1D-0004ib-8P
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:18:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGC1A-0005VS-8O
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:18:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658809079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZ3UaFVW+UWTyB8F/JltgA2JaObnHtvhRPf6/Wdx1ZU=;
 b=ZGfVuHGepTiC34jSMsX2ipNdjKQbu0HH9W1eI2WOJmNUy8JBE5Ur1Ki5uQptFCdC+2/WhW
 soyc1NqSo/oJVyZCwaVNwE7im7kHjSY+8OPDSgxBDngTdwlXV/7uQgvOUNfca29iyPHBh7
 90oWckWhX/BYbxnalYRSrkK3Scbf8Ns=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-ntQIaetrMt267w8srrrgUA-1; Tue, 26 Jul 2022 00:17:57 -0400
X-MC-Unique: ntQIaetrMt267w8srrrgUA-1
Received: by mail-pf1-f197.google.com with SMTP id
 y37-20020a056a001ca500b00528bbf82c1eso4375330pfw.10
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 21:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eZ3UaFVW+UWTyB8F/JltgA2JaObnHtvhRPf6/Wdx1ZU=;
 b=ykwSa9AqaG5ITD7StZwadf41KUTq0wMPevrdeOw6wvn1FzXUeUGBEZLwkhr3hT/tja
 J/TXZFKzdTKk44tpyhRTpz5KX97PuGA0URTBJWYXS534CqXIFFz2DlyZnsIUIuuLXBR5
 tmjrn4rXnV8CeCs46lOJZyaMuFti2kB/mIG1IQMcvpfvkpE4s2BMmEAiDlCk8upMCsyg
 b6KYtOXxZGpFqF1kXuYjvt1YWNSJeR2JxlNnSjkAcnqNBK8iLW2jhuyApBaLFBp0tY9r
 cFXPcVwsuCWXoHefgnap/BffR8YV2HSzPtLPr4xAsffAMD8dXynu+bVllWlCGgUApOiV
 e0pQ==
X-Gm-Message-State: AJIora+ekRlyz9okX/Bdr5K26awa6Vl5x5rp3sT9XcJjxjDNeY8LQEyC
 9l4l/oN2/Oal7nffFNM9eG36ZWvHe9JzQwGPL2lteYQmTbUU1+4q6hNAaZiBVpBxZR8BikU+ZHl
 un5MJ3MsrhVriDJk=
X-Received: by 2002:a63:91c1:0:b0:41a:4ceb:bc57 with SMTP id
 l184-20020a6391c1000000b0041a4cebbc57mr13050477pge.263.1658809075890; 
 Mon, 25 Jul 2022 21:17:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1urZ9vuP+3Q90elgUT763VE3hgrbDPH2F7KaeyMPT1u+sfaVpr7WylvG9zJgCVGWp73D9P/8w==
X-Received: by 2002:a63:91c1:0:b0:41a:4ceb:bc57 with SMTP id
 l184-20020a6391c1000000b0041a4cebbc57mr13050465pge.263.1658809075602; 
 Mon, 25 Jul 2022 21:17:55 -0700 (PDT)
Received: from [10.72.12.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 o4-20020aa79784000000b0052553215444sm10396259pfp.101.2022.07.25.21.17.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 21:17:55 -0700 (PDT)
Message-ID: <9211abdb-cf8c-f24f-7947-5f1cf23d1ae6@redhat.com>
Date: Tue, 26 Jul 2022 12:17:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 13/16] virtio: introduce queue_enable in virtio
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <a7a06e68bde2cf8c57fbf2c95b095b9f86eb527f.1658141552.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <a7a06e68bde2cf8c57fbf2c95b095b9f86eb527f.1658141552.git.kangjie.xu@linux.alibaba.com>
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


在 2022/7/18 19:17, Kangjie Xu 写道:
> Introduce the interface queue_enable() in VirtioDeviceClass and the
> fucntion virtio_queue_enable() in virtio, it can be called when
> VIRTIO_PCI_COMMON_Q_ENABLE is written.


I'd suggest to split this series into two.

1) queue_enable

2) queue_reset

The patch looks good to me.

Thanks


>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   hw/virtio/virtio-pci.c     | 1 +
>   hw/virtio/virtio.c         | 9 +++++++++
>   include/hw/virtio/virtio.h | 2 ++
>   3 files changed, 12 insertions(+)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 35e8a5101a..85e1840479 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1335,6 +1335,7 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
>                          proxy->vqs[vdev->queue_sel].avail[0],
>                          ((uint64_t)proxy->vqs[vdev->queue_sel].used[1]) << 32 |
>                          proxy->vqs[vdev->queue_sel].used[0]);
> +            virtio_queue_enable(vdev, vdev->queue_sel);
>               proxy->vqs[vdev->queue_sel].enabled = 1;
>               proxy->vqs[vdev->queue_sel].reset = 0;
>           } else {
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 0e9d41366f..82eb9dd4f2 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2050,6 +2050,15 @@ void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
>       __virtio_queue_reset(vdev, queue_index);
>   }
>   
> +void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
> +{
> +    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> +
> +    if (k->queue_enable) {
> +        k->queue_enable(vdev, queue_index);
> +    }
> +}
> +
>   void virtio_reset(void *opaque)
>   {
>       VirtIODevice *vdev = opaque;
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 879394299b..085997d8f3 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -131,6 +131,7 @@ struct VirtioDeviceClass {
>       void (*reset)(VirtIODevice *vdev);
>       void (*set_status)(VirtIODevice *vdev, uint8_t val);
>       void (*queue_reset)(VirtIODevice *vdev, uint32_t queue_index);
> +    void (*queue_enable)(VirtIODevice *vdev, uint32_t queue_index);
>       /* For transitional devices, this is a bitmap of features
>        * that are only exposed on the legacy interface but not
>        * the modern one.
> @@ -270,6 +271,7 @@ int virtio_queue_set_host_notifier_mr(VirtIODevice *vdev, int n,
>   int virtio_set_status(VirtIODevice *vdev, uint8_t val);
>   void virtio_reset(void *opaque);
>   void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index);
> +void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index);
>   void virtio_update_irq(VirtIODevice *vdev);
>   int virtio_set_features(VirtIODevice *vdev, uint64_t val);
>   


