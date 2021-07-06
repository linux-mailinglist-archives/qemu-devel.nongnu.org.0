Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 868073BC6F5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 09:08:28 +0200 (CEST)
Received: from localhost ([::1]:39426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0fBz-0002uG-3v
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 03:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1m0fAQ-0002Ah-5Y
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 03:06:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1m0fAD-0001Ib-Mx
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 03:06:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625555195;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oZ2El+Ud61zHdSDx30W6MtVGkyE0AmrCx+gXHuoUuC0=;
 b=Qo2gWxi3fiWJYonwKY+4UL2hYj/R/jdwCHYHBWP/M1NWB+hXS1j/SAt1I+iWI1VO38qKNb
 5yR9IDO27es2q+6V5nTmlEIOWXk3oxlLrYF3KZ/mHIwo/XcMRkwjbN2M1rbF+ZUE5K79DI
 rDzdJ7WtFRclWzhdNWMwUBO1EhEjDpk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-lXJzv9NUO_atyv15voNOdQ-1; Tue, 06 Jul 2021 03:06:34 -0400
X-MC-Unique: lXJzv9NUO_atyv15voNOdQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 u13-20020a5d6dad0000b029012e76845945so4757946wrs.11
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 00:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=oZ2El+Ud61zHdSDx30W6MtVGkyE0AmrCx+gXHuoUuC0=;
 b=efViAMhOzbKV+RHFbsVt4ojL2Ok5CAomGZ5Tj7a0whXcJyecF0NNhOjK1uAOyAeP0S
 MntcBM4pLKhQNiRmD8BV9kLs8o5VP8qYyuV6BCYDP0ryyHd9BXv61H/Uc9RJDijpFTjT
 lkq7T/jaK24AwVtYsZShp3Z7v2DRR2uwqTGlsrxyAbdgw9CTWDmFfb/aYTwgo6cSVgGn
 PfhBSdGgOZRBHuFwG40QODBcHalkwB3rysm4x4iRJ2/V44tGg/AkWwzrcUwrlXDW+X4J
 Go+cacEVgls/Z6OVHKHythgjVZfOvCo8/a18uLq9s6rxLQmzUEthjm8ZlKrZU48YtZGI
 1cew==
X-Gm-Message-State: AOAM5300IhB1ftXDZ2iJ2HL0jkTY9FkikKvBrGzc5ZdgrnQ+O22F2oQw
 DyegQ82BVYueo/hblyVZsFSBBfzUFIEUaZWFpa0MaBuK255DF13VyUIyhd0+czN2JU1mw3f2CRE
 GCwfpvQHsaitwEMc=
X-Received: by 2002:a5d:634e:: with SMTP id b14mr19512437wrw.96.1625555191676; 
 Tue, 06 Jul 2021 00:06:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyJ67YKpM+PNw/dRaJ8mmv1+7+ykmqXVn28YHleYUGOXB5GaSMereqA35uK+KM0lpcu9xc2w==
X-Received: by 2002:a5d:634e:: with SMTP id b14mr19512403wrw.96.1625555191382; 
 Tue, 06 Jul 2021 00:06:31 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id p16sm15112326wrs.52.2021.07.06.00.06.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 00:06:30 -0700 (PDT)
Subject: Re: [PATCH v4 0/4] avocado-qemu: New SMMUv3 and intel IOMMU tests
To: Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210629143621.907831-1-eric.auger@redhat.com>
 <e59e1cf9-d22e-e5f2-dfce-9997d2f61e03@redhat.com>
 <a63cae4d-365f-2f48-2de1-be50197f6f4d@redhat.com>
 <656d8d2a-9317-9a97-15c6-d385027e6eab@redhat.com>
 <CAKJDGDY3YGRM8fMF_5woePOXc9L889q7ezzs_4mVYWcHEHyt2w@mail.gmail.com>
 <118807da-16cd-e4c3-9b8b-e2e49ef686ca@redhat.com>
 <CAKJDGDbUsMei3nBfFxVCLK1UQdiE1nJBNsfuoeGXiP7eTxH4zQ@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <2b67e615-967d-0479-49a8-56599ae7b650@redhat.com>
Date: Tue, 6 Jul 2021 09:06:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAKJDGDbUsMei3nBfFxVCLK1UQdiE1nJBNsfuoeGXiP7eTxH4zQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Reply-To: eric.auger@redhat.com
Cc: Peter Xu <peterx@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Wainer Moschetta <wainersm@redhat.com>,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi William, Philippe,

On 7/5/21 11:24 PM, Willian Rampazzo wrote:
> On Mon, Jul 5, 2021 at 6:20 PM Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>> On 7/5/21 11:10 PM, Willian Rampazzo wrote:
>>> Hi Eric,
>>>
>>> On Mon, Jul 5, 2021 at 4:55 AM Eric Auger <eric.auger@redhat.com> wrote:
>>>> Hi Wainer,
>>>>
>>>> On 7/1/21 1:22 AM, Wainer dos Santos Moschetta wrote:
>>>>> Hi,
>>>>>
>>>>> On 6/29/21 5:17 PM, Eric Auger wrote:
>>>>>> Hi Cleber, all,
>>>>>>
>>>>>> On 6/29/21 4:36 PM, Eric Auger wrote:
>>>>>>> This series adds ARM SMMU and Intel IOMMU functional
>>>>>>> tests using Fedora cloud-init images.
>>>>>>>
>>>>>>> ARM SMMU tests feature guests with and without RIL
>>>>>>> (range invalidation support) using respectively fedora 33
>>>>>>> and 31.  For each, we test the protection of virtio-net-pci
>>>>>>> and virtio-block-pci devices. Also strict=no and passthrough
>>>>>>> modes are tested. So there is a total of 6 tests.
>>>>>>>
>>>>>>> The series applies on top of Cleber's series:
>>>>>>> - [PATCH 0/3] Acceptance Tests: support choosing specific
>>>>>>>
>>>>>>> Note:
>>>>>>> - SMMU tests 2, 3, 5, 6 (resp. test_smmu_noril_passthrough and
>>>>>>> test_smmu_noril_nostrict) pass but the log reports:
>>>>>>> "WARN: Test passed but there were warnings during execution."
>>>>>>> This seems due to the lack of hash when fetching the kernel and
>>>>>>> initrd through fetch_asset():
>>>>>>> WARNI| No hash provided. Cannot check the asset file integrity.
>>>>>> I wanted to emphasize that point and wondered how we could fix that
>>>>>> issue. Looks a pity the tests get tagged as WARN due to a lack of sha1.
>>>>>> Any advice?
>>>>> As Willian mentioned somewhere, to supress the WARN you can pass the
>>>>> kernel and initrd checksums (sha1) to the fetch_asset() method.
>>>>>
>>>>> Below is an draft implementation. It would need to fill out the
>>>>> remaining checksums and adjust the `smmu.py` tests.
>>>>>
>>>>> - Wainer
>>>>>
>>>>> ----
>>>>>
>>>>> diff --git a/tests/acceptance/avocado_qemu/__init__.py
>>>>> b/tests/acceptance/avocado_qemu/__init__.py
>>>>> index 00eb0bfcc8..83637e2654 100644
>>>>> --- a/tests/acceptance/avocado_qemu/__init__.py
>>>>> +++ b/tests/acceptance/avocado_qemu/__init__.py
>>>>> @@ -312,6 +312,8 @@ class LinuxDistro:
>>>>>                  {'checksum':
>>>>> 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0',
>>>>>                  'pxeboot_url':
>>>>> "https://archives.fedoraproject.org/pub/archive/fedora/"
>>>>> "linux/releases/31/Everything/x86_64/os/images/pxeboot/",
>>>>> +                'pxeboot_initrd_chksum':
>>>>> 'dd0340a1b39bd28f88532babd4581c67649ec5b1',
>>>>> +                'pxeboot_vmlinuz_chksum':
>>>>> '5b6f6876e1b5bda314f93893271da0d5777b1f3c',
>>>> where did you get the checksum? I don't see any at the URL? Did you
>>>> generate it yourself?
>>> It is possible to use the hash you generate from the downloaded file.
>>>
>>> While I was reviewing this series, I thought it makes more sense to
>>> have Wainer's path applied first and then have your changes. I did
>>> this here, with the addition of myu suggestions in the series:
>>> https://gitlab.com/willianrampazzo/qemu/-/commits/test_eric_auger_v5.
>> Off-list review is a bit unhandy (in particular when asked on the list).
>>
>> Why don't you post your improvements as v5? I don't think Eric will be
>> offended: this is the opposite, you are helping him to get his patches
>> merged ;)
> Oh, I did review each of his patches in the list and also already made
> the changes to speed up the process :)

Yes the review is really helpful. I will have a double check at your
changes and respin quickly.
>
> He mentioned today to me that his series is still depending on one
> from Cleber that was not merged yet, so we need to wait for that.
Yep. The soft freeze is quickly approaching and that would be cool to
see those tests landing upstream.

Thanks

Eric
>
>>> Feel free to pick it and resend a new version.
>>>
>>> Wainer, check if you agree with the changes to your patch and ack it.
>>>
>>> Regards,


