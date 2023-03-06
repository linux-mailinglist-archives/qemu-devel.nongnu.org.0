Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 865AB6ABDAC
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 12:05:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ8ee-0007YD-6g; Mon, 06 Mar 2023 06:05:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZ8eb-0007Xw-Ei
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:05:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZ8eZ-0003Vo-B1
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:05:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678100710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BeUYpfgd+lsAVW3L4baCtrH3GvgAWNhhdoVAcefcMPg=;
 b=fg6vsIEnPT5y1TO0AgvwNlq48fbSf8jKoDxccFzX7kLm73lBLD6cFldpPS9auFZxjVk1tr
 dbRnIkZYdCEJiEEaFlWC/4rScTZ/eVG2JyvBayGj6jn0MSXf4uAzXZHodLsdlXKgz398Ps
 s+NVIkVApmO3Mi9qYl2CGkMxxpKuR2k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-hFaFqJKbNqSELKMuMm014Q-1; Mon, 06 Mar 2023 06:05:09 -0500
X-MC-Unique: hFaFqJKbNqSELKMuMm014Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 e22-20020a05600c219600b003e000facbb1so6588907wme.9
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 03:05:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678100708;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BeUYpfgd+lsAVW3L4baCtrH3GvgAWNhhdoVAcefcMPg=;
 b=pqmOcnlyjwQDkDxNOQqpJ5ZNkcvaVnQ2bbImSQ4TFF2hBwzng5NCI2UX8GOIGMU00E
 /RUh9yrTkZP+OdHqHotjqLnXtIuFrpXCoXu34YVXejWB1pAdwb+YCtq8BC4Xi4rPxmuM
 LvPIG5WKUwL1jsQdurKu4GDl30HS1kY9NDf4LZaamHvqE+URWfBGxuPlOYvCUbXWxwhz
 xhJ2BAaI/F4yNurxQcET+iv6sVGH6MKc7YXaUvwUrDIZFH0BPNwkRKoj9A18iUcxtxmx
 oPxTowXBlqT6eBn1PeBWRleM8oVtg/Sb6QrWuu16z3CHQwYL54+a4OelM43N8cxPwwcO
 N0Zg==
X-Gm-Message-State: AO0yUKUmFV4tsfWxbJwZtIZWpV4PmLWI/39mx/nsQXq+5u+vcEVlnO3Q
 EzzT/+6qaINJH6VpWKxiNoSWAZuCHwHg7kTAqjVyiwjJ5kwMNPhZcUuxNqTAhTZCTQz2+BbP6Ld
 mmH0USVFYOqHPJaGikRGzLb4=
X-Received: by 2002:adf:fc4f:0:b0:2ce:5056:7220 with SMTP id
 e15-20020adffc4f000000b002ce50567220mr4201433wrs.51.1678100708047; 
 Mon, 06 Mar 2023 03:05:08 -0800 (PST)
X-Google-Smtp-Source: AK7set/oeYanJzk0TEmcyWvNneMMKPhB2FVMDwv76PbGptEZNolCf+p0Xun46BrkTKTOA6aOraK+tw==
X-Received: by 2002:adf:fc4f:0:b0:2ce:5056:7220 with SMTP id
 e15-20020adffc4f000000b002ce50567220mr4201416wrs.51.1678100707705; 
 Mon, 06 Mar 2023 03:05:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 v28-20020a5d591c000000b002c6e8af1037sm9495170wrd.104.2023.03.06.03.05.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 03:05:07 -0800 (PST)
Message-ID: <f04bc012-96ad-fb6c-6edf-9afefc8607e7@redhat.com>
Date: Mon, 6 Mar 2023 12:05:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 00/13] vfio/migration: Device dirty page tracking
To: Joao Martins <joao.m.martins@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230305135734.71d54dd1.alex.williamson@redhat.com>
 <d8c298a7-41a3-49bf-6c5c-b071b1398160@oracle.com>
 <20230305191913.562b7a85.alex.williamson@redhat.com>
 <73116eef-872b-5845-4a95-01d6155f288e@oracle.com>
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <73116eef-872b-5845-4a95-01d6155f288e@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 3/6/23 10:45, Joao Martins wrote:
> On 06/03/2023 02:19, Alex Williamson wrote:
>> On Sun, 5 Mar 2023 23:33:35 +0000
>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>
>>> On 05/03/2023 20:57, Alex Williamson wrote:
>>>> On Sat,  4 Mar 2023 01:43:30 +0000
>>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>>>    
>>>>> Hey,
>>>>>
>>>>> Presented herewith a series based on the basic VFIO migration protocol v2
>>>>> implementation [1].
>>>>>
>>>>> It is split from its parent series[5] to solely focus on device dirty
>>>>> page tracking. Device dirty page tracking allows the VFIO device to
>>>>> record its DMAs and report them back when needed. This is part of VFIO
>>>>> migration and is used during pre-copy phase of migration to track the
>>>>> RAM pages that the device has written to and mark those pages dirty, so
>>>>> they can later be re-sent to target.
>>>>>
>>>>> Device dirty page tracking uses the DMA logging uAPI to discover device
>>>>> capabilities, to start and stop tracking, and to get dirty page bitmap
>>>>> report. Extra details and uAPI definition can be found here [3].
>>>>>
>>>>> Device dirty page tracking operates in VFIOContainer scope. I.e., When
>>>>> dirty tracking is started, stopped or dirty page report is queried, all
>>>>> devices within a VFIOContainer are iterated and for each of them device
>>>>> dirty page tracking is started, stopped or dirty page report is queried,
>>>>> respectively.
>>>>>
>>>>> Device dirty page tracking is used only if all devices within a
>>>>> VFIOContainer support it. Otherwise, VFIO IOMMU dirty page tracking is
>>>>> used, and if that is not supported as well, memory is perpetually marked
>>>>> dirty by QEMU. Note that since VFIO IOMMU dirty page tracking has no HW
>>>>> support, the last two usually have the same effect of perpetually
>>>>> marking all pages dirty.
>>>>>
>>>>> Normally, when asked to start dirty tracking, all the currently DMA
>>>>> mapped ranges are tracked by device dirty page tracking. If using a
>>>>> vIOMMU we block live migration. It's temporary and a separate series is
>>>>> going to add support for it. Thus this series focus on getting the
>>>>> ground work first.
>>>>>
>>>>> The series is organized as follows:
>>>>>
>>>>> - Patches 1-7: Fix bugs and do some preparatory work required prior to
>>>>>    adding device dirty page tracking.
>>>>> - Patches 8-10: Implement device dirty page tracking.
>>>>> - Patch 11: Blocks live migration with vIOMMU.
>>>>> - Patches 12-13 enable device dirty page tracking and document it.
>>>>>
>>>>> Comments, improvements as usual appreciated.
>>>>
>>>> Still some CI failures:
>>>>
>>>> https://gitlab.com/alex.williamson/qemu/-/pipelines/796657474
>>>>
>>>> The docker failures are normal, afaict the rest are not.  Thanks,
>>>>    
>>>
>>> Ugh, sorry
>>>
>>> The patch below scissors mark (and also attached as a file) fixes those build
>>> issues. I managed to reproduce on i386 target builds, and these changes fix my
>>> 32-bit build.
>>>
>>> I don't have a working Gitlab setup[*] though to trigger the CI to enable to
>>> wealth of targets it build-tests. If you could kindly test the patch attached in
>>> a new pipeline (applied on top of the branch you just build) below to understand
>>> if the CI gets happy. I will include these changes in the right patches (patch 8
>>> and 10) for the v4 spin.
>>
>> Looks like this passes:
>>
>> https://gitlab.com/alex.williamson/qemu/-/pipelines/796750136
>>
> Great, I've staged this fixes in patches 8&10!
> 
> I have a sliver of hope that we might still make it by soft freeze (tomorrow?).
> If you think it can still make it, should the rest of the series is good, then I
> can follow up v4 today/tomorrow. Thoughts?

I would say, wait and see if a v4 is needed first. These changes are
relatively easy to fold in.

C.



> 
> 	Joao
> 


