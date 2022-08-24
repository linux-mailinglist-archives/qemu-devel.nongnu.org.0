Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E9D59F5EC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 11:09:45 +0200 (CEST)
Received: from localhost ([::1]:47732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQmOO-0002KB-1P
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 05:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQmEm-0002WL-La
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 04:59:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQmEk-0003Za-IM
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 04:59:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661331586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=guMcP4+aK1GLTRMNIiqKWHGskbXe9swTXjdZO9W2JuQ=;
 b=AlKWhX/PKo3LZpcgtoDriDzZndqDW0SxJqKuDRR2o58bQ9n0Tl/SRb/CKMrLj8zWrtT8Yz
 TpB5AWb+0urQvlrVPpjXclq2CDCceFZxVIU/3Fbg/w8II7czq9dmbI343LWvaL7w0oopds
 2hz8PVhtgDF42+j2FH2nLv5zktWh4xI=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-122-KOEaW5zANEWJnX7gf5kHOA-1; Wed, 24 Aug 2022 04:59:44 -0400
X-MC-Unique: KOEaW5zANEWJnX7gf5kHOA-1
Received: by mail-pl1-f199.google.com with SMTP id
 h12-20020a170902f54c00b0016f8858ce9bso10572350plf.9
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 01:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=guMcP4+aK1GLTRMNIiqKWHGskbXe9swTXjdZO9W2JuQ=;
 b=fhACsfzZLtvUiDszjgJCfnlA2Oj3YVJDW6d6Sdz9G2ttQwpYlhgASUVvtxHUSUCXq+
 dQoxsYWLXMuAPTSUi3Q+CSnnXuoXQoo5Caz4KblmlPAts3Y+wR+SgBIAlKduFsjrKH0Y
 JM57wSpKSMWaqLY2vIHas56qtq8p/CA/0jCrbIaXr0SxIK7cbqGrORSwDpVVXagK+waR
 2S7STbMwSF7vlIjsjT9OXXypKRCiKc736Pw+qXmb5+DuP8eu0kluldonI3CrX06uv2gX
 0m7xVa9Bu0hEdDOXxdUoM05Uny2+OlPVzTv5imlEOqtHB6tWxLtNxHfbDNWo8J7yI+7O
 Upbw==
X-Gm-Message-State: ACgBeo2+JN8SVWyDxeBT7rW6hLfW0QeHJ5fycOcC3dUmQOrklvQE8Pgx
 /3LzKt/mrryy3TS+KuCvrmBlW6YkFIMGDjeCa4j07KN1r7xhvh8Jq7D72SQ7saxoGS1AeJDhi9z
 Y2aQyYBz6xH7H3OM=
X-Received: by 2002:a17:902:cf0f:b0:172:b103:e019 with SMTP id
 i15-20020a170902cf0f00b00172b103e019mr28094418plg.84.1661331583730; 
 Wed, 24 Aug 2022 01:59:43 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4rTHifnmlNAuUfdpxgcXDbdWpr274CH+AuV6t80bWgmcFyQW32Eyiwde/N6C71euuQAJBGSA==
X-Received: by 2002:a17:902:cf0f:b0:172:b103:e019 with SMTP id
 i15-20020a170902cf0f00b00172b103e019mr28094400plg.84.1661331583474; 
 Wed, 24 Aug 2022 01:59:43 -0700 (PDT)
Received: from [10.72.13.130] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a170902f70a00b00172633fc236sm11969193plo.174.2022.08.24.01.59.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 01:59:42 -0700 (PDT)
Message-ID: <5812b7ed-3983-6b39-0c44-e1701ca4ecf0@redhat.com>
Date: Wed, 24 Aug 2022 16:59:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 07/24] virtio-pci: support queue enable
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com,
 hengqi@linux.alibaba.com, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <6dda660c634b2a35c3dea46a98e63fb2ef3a36c9.1660611460.git.kangjie.xu@linux.alibaba.com>
 <1824ba40-9460-4c5d-9a27-820a51355ba3@redhat.com>
 <9fb3e2b4-9f78-5da1-3ab6-0ec53f03b628@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <9fb3e2b4-9f78-5da1-3ab6-0ec53f03b628@linux.alibaba.com>
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


在 2022/8/23 16:20, Kangjie Xu 写道:
>
> 在 2022/8/23 15:44, Jason Wang 写道:
>>
>> 在 2022/8/16 09:06, Kangjie Xu 写道:
>>> PCI devices support vq enable.
>>
>>
>> Nit: it might be "support device specific vq enable"
>>
>>
> Get it.
>>>
>>> Based on this function, the driver can re-enable the virtqueue after 
>>> the
>>> virtqueue is reset.
>>>
>>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>>> ---
>>>   hw/virtio/virtio-pci.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
>>> index ec8e92052f..3d560e45ad 100644
>>> --- a/hw/virtio/virtio-pci.c
>>> +++ b/hw/virtio/virtio-pci.c
>>> @@ -1335,6 +1335,7 @@ static void virtio_pci_common_write(void 
>>> *opaque, hwaddr addr,
>>> proxy->vqs[vdev->queue_sel].avail[0],
>>> ((uint64_t)proxy->vqs[vdev->queue_sel].used[1]) << 32 |
>>> proxy->vqs[vdev->queue_sel].used[0]);
>>> +            virtio_queue_enable(vdev, vdev->queue_sel);
>>>               proxy->vqs[vdev->queue_sel].enabled = 1;
>>>               proxy->vqs[vdev->queue_sel].reset = 0;
>>
>>
>> Any reason we do it before the assignment of 1? It probably means the 
>> device specific method can't depend on virtio_queue_enabled()?
>>
>> Thanks
>>
> Sorry, I don't get why device specific method can't depend on 
> virtio_queue_enabled().


I meant if the device specific method call virtio_queue_enabled() it 
will return false in this case, is this intended?


>
> Before virtio_queue_enable() is done, virtqueue should always be not 
> ready and disabled.
>
> Otherwise, If we put it after the assignment of enabled to 1, the 
> virtqueue may be accessed illegally and may cause panic, because the 
> virtqueue is still being intialized and being configured.


How? Shouldn't we make transport ready before making device 
virtqueue(device) ready?

Thanks


>
> Thanks
>
>>
>>>           } else {
>


