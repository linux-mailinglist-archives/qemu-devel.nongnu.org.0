Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A274F6509AC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 10:59:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Cuy-0003Fk-UP; Mon, 19 Dec 2022 04:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p7Cue-0003Ea-8U
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 04:58:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p7Cuc-0003DK-IL
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 04:58:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671443901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=haUmNBkFr0its1sRr8B+7YvWntIVVkSALPOfoeL8Gls=;
 b=jOtE4+YeUhLFo+x5gLCLx7+iUMmQTgRI/oz/LndSuBtHrGReHs/auopMFWfuZEE0aAipHz
 lxtmQGoHyyQydhecX7HWdjwx5MlqB7DxItEX1ev0//3/BB2hqz3k0omrRTG4R2d6zsyf8E
 Fm7WeJfaJtm8ntcmJAEU6OQwd4ap83I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-352-h4GCskdkOIusleb6fo0x6A-1; Mon, 19 Dec 2022 04:58:19 -0500
X-MC-Unique: h4GCskdkOIusleb6fo0x6A-1
Received: by mail-wm1-f71.google.com with SMTP id
 f20-20020a7bc8d4000000b003d1cda5bd6fso1650429wml.9
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 01:58:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=haUmNBkFr0its1sRr8B+7YvWntIVVkSALPOfoeL8Gls=;
 b=3uwXOOzqrt+cs8ydDblFVqhsiX6ixH0fyOAZl4lZdrbeJhsquutrE29NWaaEIeIsIx
 tUnyq/BmSGBwhuEjUP+rp7fkQ1KJB0/dbWIgMTjZoLVxL12qPCfRjnhMWZxHf8NX8Nzs
 m7fcQHlBzUXSrJwztmtCQn079Xa7UAoznPulEmQCZJ4wdxov3R2qwSU1a+C7p/UhdLkv
 LD1GfaJMxxd6lBhDanbqH0h11W0c8jm+IMbRTqujWBQE+2p+Yuq+TVnPk/7oY1T/q2pW
 d2YX+LFcssVHgbsxAOs2jm+MwZpxMAfIRnqIr58Rokk9XU6TSWOpGgQAMyB8cHf+k4Im
 XZPA==
X-Gm-Message-State: ANoB5pn0s1EOpU27UqSqJVX7ilSvUHD7uxBVW1gjAZUTHS3VGLRTubQZ
 4M50GBaHWGVceFtsjidLB8yQgv0mkbzqtNDmXpCcs4FpNHCUo9XnY9kFma2QWLXH2s57D6wDoBH
 LQplZGMQhcuOTs3Y=
X-Received: by 2002:a5d:53c5:0:b0:242:57bb:ee0f with SMTP id
 a5-20020a5d53c5000000b0024257bbee0fmr25492656wrw.25.1671443897827; 
 Mon, 19 Dec 2022 01:58:17 -0800 (PST)
X-Google-Smtp-Source: AA0mqf44eUCC5cg48ByUPSbPgMXL3hVtygiiaysVGz9L/KEkxIvat1sCuPGVezi6XNcDI6UTc2IBVg==
X-Received: by 2002:a5d:53c5:0:b0:242:57bb:ee0f with SMTP id
 a5-20020a5d53c5000000b0024257bbee0fmr25492647wrw.25.1671443897574; 
 Mon, 19 Dec 2022 01:58:17 -0800 (PST)
Received: from [192.168.3.108] (p5b0c604b.dip0.t-ipconnect.de. [91.12.96.75])
 by smtp.gmail.com with ESMTPSA id
 w16-20020adfee50000000b002420dba6447sm9460638wro.59.2022.12.19.01.58.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 01:58:17 -0800 (PST)
Message-ID: <302262b2-e928-7013-3f4e-4ab5a9616844@redhat.com>
Date: Mon, 19 Dec 2022 10:58:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2] hostmem: Honor multiple preferred nodes if possible
Content-Language: en-US
To: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 qemu-devel@nongnu.org
Cc: imammedo@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com
References: <a0b4adce1af5bd2344c2218eb4a04b3ff7bcfdb4.1671097918.git.mprivozn@redhat.com>
 <f06e436f-223a-9318-d631-c9d5c711af1b@redhat.com>
 <c7fc7797-6696-e9d8-8c1a-dd4b86cc2781@redhat.com>
 <536107c6-b142-d5aa-0d94-4277a5c5af15@redhat.com>
 <e264e466-5cff-3b7f-9850-ba203ce02828@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <e264e466-5cff-3b7f-9850-ba203ce02828@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 19.12.22 10:57, Michal Prívozník wrote:
> On 12/19/22 10:55, David Hildenbrand wrote:
>> On 16.12.22 14:47, Michal Prívozník wrote:
>>> On 12/16/22 14:41, David Hildenbrand wrote:
>>>> On 15.12.22 10:55, Michal Privoznik wrote:
>>>>> If a memory-backend is configured with mode
>>>>> HOST_MEM_POLICY_PREFERRED then
>>>>> host_memory_backend_memory_complete() calls mbind() as:
>>>>>
>>>>>      mbind(..., MPOL_PREFERRED, nodemask, ...);
>>>>>
>>>>> Here, 'nodemask' is a bitmap of host NUMA nodes and corresponds
>>>>> to the .host-nodes attribute. Therefore, there can be multiple
>>>>> nodes specified. However, the documentation to MPOL_PREFERRED
>>>>> says:
>>>>>
>>>>>      MPOL_PREFERRED
>>>>>        This mode sets the preferred node for allocation. ...
>>>>>        If nodemask specifies more than one node ID, the first node
>>>>>        in the mask will be selected as the preferred node.
>>>>>
>>>>> Therefore, only the first node is honored and the rest is
>>>>> silently ignored. Well, with recent changes to the kernel and
>>>>> numactl we can do better.
>>>>>
>>>>> The Linux kernel added in v5.15 via commit cfcaa66f8032
>>>>> ("mm/hugetlb: add support for mempolicy MPOL_PREFERRED_MANY")
>>>>> support for MPOL_PREFERRED_MANY, which accepts multiple preferred
>>>>> NUMA nodes instead.
>>>>>
>>>>> Then, numa_has_preferred_many() API was introduced to numactl
>>>>> (v2.0.15~26) allowing applications to query kernel support.
>>>>>
>>>>> Wiring this all together, we can pass MPOL_PREFERRED_MANY to the
>>>>> mbind() call instead and stop ignoring multiple nodes, silently.
>>>>>
>>>>> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +#ifdef HAVE_NUMA_SET_PREFERRED_MANY
>>
>> That should be HAVE_NUMA_HAS_PREFERRED_MANY, right?
>>
> 
> Oops, yes. Do you want me to send v3?

I'll fixup. I just queued the fixed-up patch to

https://github.com/davidhildenbrand/qemu.git mem-next

Please double-check. Thanks!

-- 
Thanks,

David / dhildenb


