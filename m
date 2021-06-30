Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A34E3B7DB8
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 08:55:11 +0200 (CEST)
Received: from localhost ([::1]:60844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyU7p-0007aV-R7
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 02:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lyU6h-0006uZ-UL
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 02:53:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lyU6e-0000fg-MM
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 02:53:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625036033;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zdrkmhtcw5o3roKjcyxQLlKmGw12+PmcYw58wJYeIrg=;
 b=X4PtlALlZiCeYluCzFdhf2U+vdWc7vf3N9siJG+LIVRJEsCvZD+gp7sPuTgWOsUCJHT75Q
 7cV881cxSTThRwuEUw7Ea5jpBMPJGXiSkRc7zw9OGFhEhy9nGihYrolKM6A1YZTC3Y/nZu
 0/B7kGSZWCiaYV6lLyd8eyWRURJSr04=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-keFo89CANhiIOeiEWOruLA-1; Wed, 30 Jun 2021 02:53:51 -0400
X-MC-Unique: keFo89CANhiIOeiEWOruLA-1
Received: by mail-wr1-f72.google.com with SMTP id
 b3-20020a05600018a3b029011a84f85e1cso488320wri.10
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 23:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Zdrkmhtcw5o3roKjcyxQLlKmGw12+PmcYw58wJYeIrg=;
 b=rbEANEF5r5l5LFzCMhVUF1OuxXHMMGRtO27Xf5BLTb29pJ99h4iLHMMEpmO+8gG2j4
 LDLSr0hM4YNaTgySiJAz5YcueoZQq+FRI1DVrFKd/IrKbKTkpMmSCcsFku3oIDjPeQjd
 3x2PzubfmcydWA97op1rdtupHDT3vuBRu4GnpiUC47kY8+ntqqhqLNFp5nc4hoCRgHwu
 V4CzPVe8tIQGszuo2jKFKZkdN2JjmN4Ja1UrW/s3H9Ma9HNj0ZfQM/gVLp7jNuZQTvDc
 lI0m7qCgoHDiWZgWSovaPOU6DHVObyQBrnU2uh5Qzgrhbula9tWAs0RFd3sFavJaXXj6
 W2mg==
X-Gm-Message-State: AOAM53331sQuHnYWrS97HflxureG7DGLpFxVDvInbavu+NYIYsFHSLSg
 x9Mn7SRJRShRMhv5mvdxm+W/o8DAeZ3iagCTYKFB0jmPaSRZJ5SBDlJxvEvXLeH4RuGh+gmbdPP
 L+9ndtcrcMTydkGk=
X-Received: by 2002:adf:fd8e:: with SMTP id d14mr17612612wrr.361.1625036029950; 
 Tue, 29 Jun 2021 23:53:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwl84Rb3sLlalPGfifX7Q9lrOOQww4GkmO5ouTnR0Twzi18hxLtPUuQJnjZD6HBqrSuD8xi3Q==
X-Received: by 2002:adf:fd8e:: with SMTP id d14mr17612583wrr.361.1625036029623; 
 Tue, 29 Jun 2021 23:53:49 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id e15sm21790614wrm.60.2021.06.29.23.53.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 23:53:48 -0700 (PDT)
Subject: Re: [PATCH v4 0/4] avocado-qemu: New SMMUv3 and intel IOMMU tests
To: Willian Rampazzo <wrampazz@redhat.com>
References: <20210629143621.907831-1-eric.auger@redhat.com>
 <e59e1cf9-d22e-e5f2-dfce-9997d2f61e03@redhat.com>
 <CAKJDGDbSqhuqdHBm1hA9bttAQakj81RHxjiTtQ6YhXsjxjNtMA@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <f35e63ff-a0f3-e041-5823-c370c95c0ae7@redhat.com>
Date: Wed, 30 Jun 2021 08:53:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAKJDGDbSqhuqdHBm1hA9bttAQakj81RHxjiTtQ6YhXsjxjNtMA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Reply-To: eric.auger@redhat.com
Cc: qemu-devel <qemu-devel@nongnu.org>, peterx@redhat.com,
 Wainer Moschetta <wainersm@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi William,

On 6/29/21 10:38 PM, Willian Rampazzo wrote:
> On Tue, Jun 29, 2021 at 5:17 PM Eric Auger <eric.auger@redhat.com> wrote:
>> Hi Cleber, all,
>>
>> On 6/29/21 4:36 PM, Eric Auger wrote:
>>> This series adds ARM SMMU and Intel IOMMU functional
>>> tests using Fedora cloud-init images.
>>>
>>> ARM SMMU tests feature guests with and without RIL
>>> (range invalidation support) using respectively fedora 33
>>> and 31.  For each, we test the protection of virtio-net-pci
>>> and virtio-block-pci devices. Also strict=no and passthrough
>>> modes are tested. So there is a total of 6 tests.
>>>
>>> The series applies on top of Cleber's series:
>>> - [PATCH 0/3] Acceptance Tests: support choosing specific
>>>
>>> Note:
>>> - SMMU tests 2, 3, 5, 6 (resp. test_smmu_noril_passthrough and
>>> test_smmu_noril_nostrict) pass but the log reports:
>>> "WARN: Test passed but there were warnings during execution."
>>> This seems due to the lack of hash when fetching the kernel and
>>> initrd through fetch_asset():
>>> WARNI| No hash provided. Cannot check the asset file integrity.
>> I wanted to emphasize that point and wondered how we could fix that
>> issue. Looks a pity the tests get tagged as WARN due to a lack of sha1.
>> Any advice?
> Hi Eric,
>
> We had that discussion some weeks ago regarding the WARN status of a
> test when the file hash is not provided for the fetch call. We agreed
> that a WARN is not a harmful status, and it would be okay.
>
> When we got the request to add the message regarding a missing hash of
> a downloaded file, we concluded that it would not make sense to set it
> like a normal message in the logs because no one would open the logs
> and see the message if the test succeed.
>
> If you think a WARN may be considered a harmful status, let us know,
> and we can try to adjust it so that users see the message when a hash
> is not provided without setting the test status as WARN.
>
> On the other hand, you can always add the hash if you have access to it.
>
> I hope it helps somehow,
It does, thank you for your reply.

Maybe we should tag the tests with warnings as PASS in the last summary
RESULT line and keep the individual test result lines as they are.

Currently it is not obvious the tests has passed if you look at the last
line. See my logs below.



 (1/6) tests/acceptance/smmu.py:SMMU.test_smmu_noril: PASS (106.83 s)
 (2/6) tests/acceptance/smmu.py:SMMU.test_smmu_noril_passthrough: WARN:
Test passed but there were warnings during execution. Check the log for
details. (112.23 s)
 (3/6) tests/acceptance/smmu.py:SMMU.test_smmu_noril_nostrict: WARN:
Test passed but there were warnings during execution. Check the log for
details. (110.77 s)
 (4/6) tests/acceptance/smmu.py:SMMU.test_smmu_ril: PASS (135.18 s)
 (5/6) tests/acceptance/smmu.py:SMMU.test_smmu_ril_passthrough: WARN:
Test passed but there were warnings during execution. Check the log for
details. (115.98 s)
 (6/6) tests/acceptance/smmu.py:SMMU.test_smmu_ril_nostrict: WARN: Test
passed but there were warnings during execution. Check the log for
details. (137.16 s)
RESULTS    : PASS 2 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 4 | INTERRUPT 0 |
CANCEL 0

Thanks

Eric

>
> Willian
>
>> Best Regards
>>
>> Eric
>>> History:
>>> v3 -> v4:
>>> - I added Wainer's refactoring of KNOWN_DISTROS
>>> into a class (last patch) and took into account his comments.
>>>
>>> v2 -> v3:
>>> - Added Intel IOMMU tests were added. Different
>>> operating modes are tested such as strict, caching mode, pt.
>>>
>>> Best Regards
>>>
>>> Eric
>>>
>>> The series and its dependencies can be found at:
>>> https://github.com/eauger/qemu/tree/avocado-qemu-v4
>>>
>>> Eric Auger (3):
>>>   Acceptance Tests: Add default kernel params and pxeboot url to the
>>>     KNOWN_DISTROS collection
>>>   avocado_qemu: Add SMMUv3 tests
>>>   avocado_qemu: Add Intel iommu tests
>>>
>>> Wainer dos Santos Moschetta (1):
>>>   avocado_qemu: Fix KNOWN_DISTROS map into the LinuxDistro class
>>>
>>>  tests/acceptance/avocado_qemu/__init__.py | 118 +++++++++++++------
>>>  tests/acceptance/intel_iommu.py           | 115 +++++++++++++++++++
>>>  tests/acceptance/smmu.py                  | 132 ++++++++++++++++++++++
>>>  3 files changed, 332 insertions(+), 33 deletions(-)
>>>  create mode 100644 tests/acceptance/intel_iommu.py
>>>  create mode 100644 tests/acceptance/smmu.py
>>>


