Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C2269C7A2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:25:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2JK-0002Eo-Qa; Mon, 20 Feb 2023 04:18:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pU2Gv-0007EG-C9
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:15:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pU2Gs-0004I6-NJ
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:15:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676884541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lSdD1Zk9qDQXe02xtdMd0IbCJTGRDYlrK9A/K8vlWho=;
 b=MiY6p/B9QmA+MP4WK9+ZesQZ9qqeErSm+q4AC731Qvya32YeYSungoI9P/FnxAWL2kbsWM
 ebPC0CTxGkf9NO3DrsGZsbe3Y/jlzf5HEpmQsnsLsbhcRxntG3glcO+paks62ZJz1gmVyO
 bb6nTvsMy5eZ44dr/9PICkI5T9eM2ss=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-19-bFa76ss8M2G5bOsu1izKow-1; Mon, 20 Feb 2023 04:15:39 -0500
X-MC-Unique: bFa76ss8M2G5bOsu1izKow-1
Received: by mail-wm1-f72.google.com with SMTP id
 t1-20020a7bc3c1000000b003dfe223de49so377439wmj.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:15:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lSdD1Zk9qDQXe02xtdMd0IbCJTGRDYlrK9A/K8vlWho=;
 b=q6isS/OfXKtZTkG1YAob63119PUqY5oMxOhCfNZC3tqA8Yx/0UekgfLEXSX2OmoZ5S
 Gp2m1gpmJSqH37JdY8NfHZPI/T36m+rTIdrVL8XpDpK/FdsXKzP/kiek0jul9vm/pQhw
 gppfA4LeGmXsId0IzHdYRGBbG2sVUXRTeYWWLJFbM/ErAM/ZyEr1bBOtl5Vjq2bLCWHX
 QtT3F4jvKS0A9s/sROLJB2z4YXalHzGB02OO1ERYnD8K0PrRBuXjO18SNiXWYG6TJeCh
 COMuw6/0L5TeM6myPipGclvZSMYNDVOihOio5KvRxXUExpvau1zsLVlF8VtRh3UlQXjP
 nHdQ==
X-Gm-Message-State: AO0yUKWd7fjveUYm4BMEi4r4ZEsMdYlFePUUy8werRSbYXZcaT0xI+Zl
 qtjQZkP/DGAj5fbWkuxFMSzIN7qbDujtnryaWNhVfEG7nyGj4vxrMb6pBI6Rt07VyYgpjSHDVoh
 TChoP93cAUDAvhh4=
X-Received: by 2002:a05:600c:4d89:b0:3e0:1a9:b1e0 with SMTP id
 v9-20020a05600c4d8900b003e001a9b1e0mr342308wmp.25.1676884538628; 
 Mon, 20 Feb 2023 01:15:38 -0800 (PST)
X-Google-Smtp-Source: AK7set/ECv61uI0/dBX9R38JtuRAVJCV4u9s8Eoz48JFATTveIQcy876MwX7JhNLrUTz9pC3ya4aHA==
X-Received: by 2002:a05:600c:4d89:b0:3e0:1a9:b1e0 with SMTP id
 v9-20020a05600c4d8900b003e001a9b1e0mr342288wmp.25.1676884538286; 
 Mon, 20 Feb 2023 01:15:38 -0800 (PST)
Received: from ?IPV6:2003:cb:c705:8300:e519:4218:a8b5:5bec?
 (p200300cbc7058300e5194218a8b55bec.dip0.t-ipconnect.de.
 [2003:cb:c705:8300:e519:4218:a8b5:5bec])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a1c4c08000000b003e1f319b87bsm13477799wmf.24.2023.02.20.01.15.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 01:15:37 -0800 (PST)
Message-ID: <bbbd3382-f33c-1e8a-789b-dec1c4766730@redhat.com>
Date: Mon, 20 Feb 2023 10:15:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Yangming <yangming73@huawei.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "wangzhigang (O)" <wangzhigang17@huawei.com>,
 "zhangliang (AG)" <zhangliang5@huawei.com>, xiqi <xiqi2@huawei.com>
References: <8c6d264163574d8b886afdd3e4b77a2d@huawei.com>
 <0a0e1f05073d44a38a35e270ca735819@huawei.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: Optimization for the virtio-balloon feature on the ARM platform
In-Reply-To: <0a0e1f05073d44a38a35e270ca735819@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 20.02.23 02:33, Yangming via wrote:
> Dear QEMU maintainers,
> 
> I am writing to discuss a possible optimization for the virtio-balloon 
> feature on the ARM platform. The ‘virtio_balloon_set_config’ function is 
> called frequently during the balloon inflation process, and its 
> subfunction ‘get_current_ram_size’ needs to traverse the virtual 
> machine's memory modules in order to count the current virtual machine's 
> memory (i.e initial ram size + hotplugged memory). This can be very time 
> consuming on the ARM platform, as the ARM virtual machine has much more 
> complex memory modules than the x86 virtual machine.
> 
> Therefore, I suggest introducing a global variable, ‘total_ram_size’, 
> that would be updated only when the balloon is initialized and hotplug 
> memory has completed. This would increase the efficiency of balloon 
> inflation by more than 60% on the ARM platform.
> 
> The following code is part of the optimization for balloon:
> 
> --- a/qemu/hw/virtio/virtio-balloon.c
> 
> +++ b/qemu/hw/virtio/virtio-balloon.c
> 
> static void virtio_balloon_set_config(…)
> 
> …
> 
> -    ram_addr_t vm_ram_size = get_current_ram_size();
> 
> +   ram_addr_t vm_ram_size = total_ram_size;
> 
> …
> 
> I hope this suggestion could be considered or discussed by QEMU 
> developers. I would love to seeing this improvement added to QEMU in the 
> future.

I'd suggest keeping track of the plugged DIMM size inside 
ms->device_memory->dimm_size. We can update it from 
pc_dimm_plug/pc_dimm_unplug. We just have to make sure to exclude NVDIMMs.

We can then optimize get_current_ram_size() to return "ms->ram_size + 
ms->device_memory->dimm_size", of course taking care of 
ms->device_memory == NULL on some machines.

-- 
Thanks,

David / dhildenb


