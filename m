Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8ECC6ABE4A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 12:36:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ98p-00054S-WD; Mon, 06 Mar 2023 06:36:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZ98k-000542-U0
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:36:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZ98j-0000Y3-Eo
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:36:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678102584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k88LDjBowl8ShJrSQQkB5Wn3wGgQZsAH1ROlv/5TxBU=;
 b=XEJbxX4NIczaqQI6awZXss0E+StdmZ30h1o6WvKgT5ZgWFYq2H9q0+cU75dOhrW+Jge+ER
 zyVaxmXPwYLEt4nV11GhoXAWOXqi9WK/Mr+X9RUWfxdoWMCFYsQhLIS8ckBuARxyVFoC/S
 jhZE9wCb3Fs8om++hA8//0cu3WJXyzg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-bJyYyvBJM5GVcZalG1-vgg-1; Mon, 06 Mar 2023 06:36:23 -0500
X-MC-Unique: bJyYyvBJM5GVcZalG1-vgg-1
Received: by mail-wm1-f70.google.com with SMTP id
 e17-20020a05600c219100b003e21fa60ec1so3632388wme.2
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 03:36:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678102582;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k88LDjBowl8ShJrSQQkB5Wn3wGgQZsAH1ROlv/5TxBU=;
 b=QNdnXHNe3+x1kOyNPhOI+dNrHR/bVGs+jhP0bPFaeydna2a12vHYmNo864HPofqp5Z
 jmfPwnImD/kH9v4x4qD4WtYoBUnSTIkVRUKbr+N9u9dv4dLnDJjKuJ+usPEAFct44SME
 mUgq2AVg00HqQNEhnnYJilIllcz+PtkLrsqx7O8g5ZHy2fQOAo+k59EWu7ipTL8k/ysR
 zPWvx/+E+uCiQW+ty9ZUYDl61gRI1Nmfb+g266RdY3op+vRRd6s7gvhpVkfxXkbEWn2v
 SWnWKTxMTDBXMtmI9v5p0ahoBQ1SLxEIpiQ5Nh2EABbjeoEdui4HrneIpLAI1Osl4OBL
 2xCQ==
X-Gm-Message-State: AO0yUKUquHHu5BRU7Urnub0tkqIznol5ZKGiFPTbUmfq9Lln//OIbTqt
 8CPFy6IcrzFfDQ3SOexH3/LHEZ+xMkTQQR3OAAipoxjnOA1y8l7zvkTt+DOgEEeWyaDI+sblSlx
 iaNR6K1xQ3tONedM=
X-Received: by 2002:adf:f387:0:b0:2c7:acc:8636 with SMTP id
 m7-20020adff387000000b002c70acc8636mr6702631wro.37.1678102582761; 
 Mon, 06 Mar 2023 03:36:22 -0800 (PST)
X-Google-Smtp-Source: AK7set+9LfuSM3n2GuSDJLx8XR2EY0KcsK0M/rSGfrY4uPWVGVKxZUtOCEy3RldwmZsdcOmCMEANyw==
X-Received: by 2002:adf:f387:0:b0:2c7:acc:8636 with SMTP id
 m7-20020adff387000000b002c70acc8636mr6702616wro.37.1678102582512; 
 Mon, 06 Mar 2023 03:36:22 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-59.web.vodafone.de.
 [109.43.177.59]) by smtp.gmail.com with ESMTPSA id
 e5-20020a5d5945000000b002c3f9404c45sm9636194wri.7.2023.03.06.03.36.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 03:36:21 -0800 (PST)
Message-ID: <fd14583a-9c72-8703-2586-73422abaa59c@redhat.com>
Date: Mon, 6 Mar 2023 12:36:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] virtio: refresh vring region cache after updating a
 virtqueue size
Content-Language: en-US
To: =?UTF-8?Q?Carlos_L=c3=b3pez?= <clopez@suse.de>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "open list:virtio-ccw" <qemu-s390x@nongnu.org>
References: <20230302101447.4499-1-clopez@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230302101447.4499-1-clopez@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02/03/2023 11.14, Carlos López wrote:
> When a virtqueue size is changed by the guest via
> virtio_queue_set_num(), its region cache is not automatically updated.
> If the size was increased, this could lead to accessing the cache out
> of bounds. For example, in vring_get_used_event():
> 
>      static inline uint16_t vring_get_used_event(VirtQueue *vq)
>      {
>          return vring_avail_ring(vq, vq->vring.num);
>      }
> 
>      static inline uint16_t vring_avail_ring(VirtQueue *vq, int i)
>      {
>          VRingMemoryRegionCaches *caches = vring_get_region_caches(vq);
>          hwaddr pa = offsetof(VRingAvail, ring[i]);
> 
>          if (!caches) {
>              return 0;
>          }
> 
>          return virtio_lduw_phys_cached(vq->vdev, &caches->avail, pa);
>      }
> 
> vq->vring.num will be greater than caches->avail.len, which will
> trigger a failed assertion down the call path of
> virtio_lduw_phys_cached().
> 
> Fix this by calling virtio_queue_update_rings() after
> virtio_queue_set_num() if we are not already calling
> virtio_queue_set_rings().
> 
> Signed-off-by: Carlos López <clopez@suse.de>
> ---
>   hw/s390x/virtio-ccw.c   | 1 +
>   hw/virtio/virtio-mmio.c | 5 ++---
>   hw/virtio/virtio-pci.c  | 1 +
>   3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
> index e33e5207ab..89891ac58a 100644
> --- a/hw/s390x/virtio-ccw.c
> +++ b/hw/s390x/virtio-ccw.c
> @@ -237,6 +237,7 @@ static int virtio_ccw_set_vqs(SubchDev *sch, VqInfoBlock *info,
>                   return -EINVAL;
>               }
>               virtio_queue_set_num(vdev, index, num);
> +            virtio_queue_update_rings(vdev, index);
>           } else if (virtio_queue_get_num(vdev, index) > num) {
>               /* Fail if we don't have a big enough queue. */
>               return -EINVAL;

FWIW, s390 part:
Acked-by: Thomas Huth <thuth@redhat.com>


