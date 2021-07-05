Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC6F3BC397
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 23:21:25 +0200 (CEST)
Received: from localhost ([::1]:33160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0W1s-0007XW-Jb
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 17:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0W0r-0006mn-8d
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:20:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0W0m-0004UR-DW
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:20:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625520015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A03xc2F0wmPVlIgF6+trG5wIDIKA6oXHzGnJRmK8Ei8=;
 b=Vp6TlVb/WZJmzXesTD5DMySwSuAFW5nozZBcF8vtmuJG2K2loez1yociTxLHzhgrhSh+ZD
 h0dqN6nckvLiTfrVpoAyxSrqsIekEHMYYfzDNXLCdSPB/HH8H+ZDh04gB5lXI2GI2qTi1H
 0h+Y/HoYLT9Ib46OyYFhLhicJElxa+s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-ZB8sSsfjP8adaPqcwNc1BQ-1; Mon, 05 Jul 2021 17:20:14 -0400
X-MC-Unique: ZB8sSsfjP8adaPqcwNc1BQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 z127-20020a1c7e850000b02901e46e4d52c0so213157wmc.6
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 14:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A03xc2F0wmPVlIgF6+trG5wIDIKA6oXHzGnJRmK8Ei8=;
 b=e9q/Ba6gtyAl8gpbm/PW0wsVuoD8o3LplaEB9LWqDS8bihxznGOnbVL0H+Ut+387CF
 knMan3eWJUt7aSxjvbARMqkzE/nCVpd+7t8tpyY4ijhFa8LnES7TzgFUcQkLuppdHgqa
 tfeeHK1xKEbEUowTUDT+/fjLsIRrgKGgIglz+5/XMUJ1G9+IYx5ylODYm+S3oIS/+s9n
 hYX1wwPe4j46AwtkDXotqw09HMXbbsbQebukqqzJvYbwUGAwRmRhqUf+g1V7BHpRVGro
 04o7vVUBb8WAMJ2beBZfZdpuGs7kYmaxaowO5iQDe6r6Q+JroJ/2AO94oZVgDa4Gl+jY
 iL3w==
X-Gm-Message-State: AOAM533PfkV6Cup8LUn1UQ9CUrDt+fBszG0PKlpOHVGB7eQNVfSy1Sj1
 uj9+V8cKq06R8POUZoAA0VBHt6WwO2qb1oRMqtj1XWdz4hLHMx4P05Hz7KLuoSbvjE0ssxGHdsy
 ociugAh+dmm7ud/Q=
X-Received: by 2002:adf:f507:: with SMTP id q7mr17844196wro.243.1625520012407; 
 Mon, 05 Jul 2021 14:20:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySQXwpO1Fldv82JArZcYCiaX17wm7iomRQ0Euhd+KBP0+B71erAUr6QC957bgGXXHYIiP3MQ==
X-Received: by 2002:adf:f507:: with SMTP id q7mr17844175wro.243.1625520012137; 
 Mon, 05 Jul 2021 14:20:12 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id g15sm10821709wmh.16.2021.07.05.14.20.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 14:20:11 -0700 (PDT)
Subject: Re: [PATCH v4 0/4] avocado-qemu: New SMMUv3 and intel IOMMU tests
To: Willian Rampazzo <wrampazz@redhat.com>, Auger Eric <eric.auger@redhat.com>
References: <20210629143621.907831-1-eric.auger@redhat.com>
 <e59e1cf9-d22e-e5f2-dfce-9997d2f61e03@redhat.com>
 <a63cae4d-365f-2f48-2de1-be50197f6f4d@redhat.com>
 <656d8d2a-9317-9a97-15c6-d385027e6eab@redhat.com>
 <CAKJDGDY3YGRM8fMF_5woePOXc9L889q7ezzs_4mVYWcHEHyt2w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <118807da-16cd-e4c3-9b8b-e2e49ef686ca@redhat.com>
Date: Mon, 5 Jul 2021 23:20:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKJDGDY3YGRM8fMF_5woePOXc9L889q7ezzs_4mVYWcHEHyt2w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Xu <peterx@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Wainer Moschetta <wainersm@redhat.com>,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/21 11:10 PM, Willian Rampazzo wrote:
> Hi Eric,
> 
> On Mon, Jul 5, 2021 at 4:55 AM Eric Auger <eric.auger@redhat.com> wrote:
>>
>> Hi Wainer,
>>
>> On 7/1/21 1:22 AM, Wainer dos Santos Moschetta wrote:
>>> Hi,
>>>
>>> On 6/29/21 5:17 PM, Eric Auger wrote:
>>>> Hi Cleber, all,
>>>>
>>>> On 6/29/21 4:36 PM, Eric Auger wrote:
>>>>> This series adds ARM SMMU and Intel IOMMU functional
>>>>> tests using Fedora cloud-init images.
>>>>>
>>>>> ARM SMMU tests feature guests with and without RIL
>>>>> (range invalidation support) using respectively fedora 33
>>>>> and 31.  For each, we test the protection of virtio-net-pci
>>>>> and virtio-block-pci devices. Also strict=no and passthrough
>>>>> modes are tested. So there is a total of 6 tests.
>>>>>
>>>>> The series applies on top of Cleber's series:
>>>>> - [PATCH 0/3] Acceptance Tests: support choosing specific
>>>>>
>>>>> Note:
>>>>> - SMMU tests 2, 3, 5, 6 (resp. test_smmu_noril_passthrough and
>>>>> test_smmu_noril_nostrict) pass but the log reports:
>>>>> "WARN: Test passed but there were warnings during execution."
>>>>> This seems due to the lack of hash when fetching the kernel and
>>>>> initrd through fetch_asset():
>>>>> WARNI| No hash provided. Cannot check the asset file integrity.
>>>> I wanted to emphasize that point and wondered how we could fix that
>>>> issue. Looks a pity the tests get tagged as WARN due to a lack of sha1.
>>>> Any advice?
>>>
>>> As Willian mentioned somewhere, to supress the WARN you can pass the
>>> kernel and initrd checksums (sha1) to the fetch_asset() method.
>>>
>>> Below is an draft implementation. It would need to fill out the
>>> remaining checksums and adjust the `smmu.py` tests.
>>>
>>> - Wainer
>>>
>>> ----
>>>
>>> diff --git a/tests/acceptance/avocado_qemu/__init__.py
>>> b/tests/acceptance/avocado_qemu/__init__.py
>>> index 00eb0bfcc8..83637e2654 100644
>>> --- a/tests/acceptance/avocado_qemu/__init__.py
>>> +++ b/tests/acceptance/avocado_qemu/__init__.py
>>> @@ -312,6 +312,8 @@ class LinuxDistro:
>>>                  {'checksum':
>>> 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0',
>>>                  'pxeboot_url':
>>> "https://archives.fedoraproject.org/pub/archive/fedora/"
>>> "linux/releases/31/Everything/x86_64/os/images/pxeboot/",
>>> +                'pxeboot_initrd_chksum':
>>> 'dd0340a1b39bd28f88532babd4581c67649ec5b1',
>>> +                'pxeboot_vmlinuz_chksum':
>>> '5b6f6876e1b5bda314f93893271da0d5777b1f3c',
>> where did you get the checksum? I don't see any at the URL? Did you
>> generate it yourself?
> 
> It is possible to use the hash you generate from the downloaded file.
> 
> While I was reviewing this series, I thought it makes more sense to
> have Wainer's path applied first and then have your changes. I did
> this here, with the addition of myu suggestions in the series:
> https://gitlab.com/willianrampazzo/qemu/-/commits/test_eric_auger_v5.

Off-list review is a bit unhandy (in particular when asked on the list).

Why don't you post your improvements as v5? I don't think Eric will be
offended: this is the opposite, you are helping him to get his patches
merged ;)

> Feel free to pick it and resend a new version.
> 
> Wainer, check if you agree with the changes to your patch and ack it.
> 
> Regards,


