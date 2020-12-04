Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 803B62CEF6D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 15:10:50 +0100 (CET)
Received: from localhost ([::1]:39218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klBnN-0004vZ-JH
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 09:10:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klBlf-0004JQ-Ft
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 09:09:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klBlc-0006xC-VB
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 09:09:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607090940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hrEKNlds9jNPkmf3UYRCFbHF3tDaMp0A/ThAyyhpwe0=;
 b=ZsWUAh4VV9NRrIBnR9uaM563i0KvsjEWD4ksVjqy1e9G4bIXQgThIqQZdWHy+ea5J8NyMh
 DYC6978I6yOMgV4BpBtLl5o0jhfmSAaBA3+BkojReRCu/GfNOh7iZ61dM6qOAmyQCR98FZ
 j8rUTCJQMFZzbhl3L9ZmxXdsiPWfOms=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-Q3lvJVV_P92tkpK_Clpupg-1; Fri, 04 Dec 2020 09:08:57 -0500
X-MC-Unique: Q3lvJVV_P92tkpK_Clpupg-1
Received: by mail-ej1-f70.google.com with SMTP id f21so2105145ejf.11
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 06:08:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hrEKNlds9jNPkmf3UYRCFbHF3tDaMp0A/ThAyyhpwe0=;
 b=NJL8Xk/nNCmLrlmCQEj5qkgsZBMVuRPqlRDBuF0w+C8gv5wnw1KdVy27Si42Z85TjF
 8F3xfzQLGZTzmC5t0wwv2gk5fpmycJiFV34af/ISgPw7s3hJ1pg2hAuIa71nvSK3KnXi
 Z7aDQuGKOzLGHH+7OtP2sv9HIkBSzyQNpktTcSrZ7KPOI6u7/0Znap92M/CuA2yidIRQ
 Z4GOj5wTk71mT6YsM/enjl95VwekWhnJhEqOAkwDxN8SxsOxTpF8utJ+QJr2Od3XaX9n
 Le65mSlu8UdP6amMe2kTsdwCLfP50yer+/Q5zE+I4wUHgwf9CiF/yH80F4yDDt2d1J3x
 m4hA==
X-Gm-Message-State: AOAM532fVUBMr8W84so40DW5eAIVZLIEzfXI048FMaXVX0pNHPqw4QLa
 tmZLEeLOp/Xg+9YjoSRMLCFaxejZQvvdZk/rPMxwupgpgfQr+DkCtKxMJtRTQBW+ONe8QFMjMGw
 zdkHitchQis2bCVE=
X-Received: by 2002:a05:6402:d09:: with SMTP id
 eb9mr7534637edb.71.1607090935334; 
 Fri, 04 Dec 2020 06:08:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBV7Q3RYNxghFf0PbjoSXpu4ny0NujeHpOEsfJKNrwqOmGxGAENxSb/PZtgsakqXXLJLKO/A==
X-Received: by 2002:a05:6402:d09:: with SMTP id
 eb9mr7534597edb.71.1607090935102; 
 Fri, 04 Dec 2020 06:08:55 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id ov22sm3231676ejb.23.2020.12.04.06.08.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Dec 2020 06:08:54 -0800 (PST)
Subject: Re: [PATCH-for-5.2? 1/1] Acceptance tests: bump Fedora to 32
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
References: <20201202215747.2719507-1-crosa@redhat.com>
 <20201202215747.2719507-2-crosa@redhat.com>
 <b00dc7be-cf66-34a0-3260-2a9cfcddde77@redhat.com>
 <20201203165033.GB2787993@localhost.localdomain>
 <20201203170233.GK2952498@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5ee763b3-379e-45f7-2716-9b7e073d3ec7@redhat.com>
Date: Fri, 4 Dec 2020 15:08:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201203170233.GK2952498@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/3/20 6:02 PM, Daniel P. Berrangé wrote:
> On Thu, Dec 03, 2020 at 11:50:33AM -0500, Cleber Rosa wrote:
>> On Thu, Dec 03, 2020 at 10:37:01AM +0100, Philippe Mathieu-Daudé wrote:
>>> On 12/2/20 10:57 PM, Cleber Rosa wrote:
>>>> Currently in use Fedora 31 has been moved out of the standard download
>>>> locations that are supported by the functionality provided by
>>>> avocado.utils.vmimage.  So right now, the boot_linux.py tests will get
>>>> canceled by not being able to find those specific images.
>>>>
>>>> Ideally, this would be bumped to version 33.  But, I've found issues
>>>> with the aarch64 images, with various systemd services failing to
>>>> start.  So to keep all archs consistent, I've settled on 32.
>>>>
>>>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>>>> ---
>>>>  tests/acceptance/boot_linux.py | 12 ++++++------
>>>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
>>>> index 1da4a53d6a..0824de008e 100644
>>>> --- a/tests/acceptance/boot_linux.py
>>>> +++ b/tests/acceptance/boot_linux.py
>>>> @@ -42,13 +42,13 @@ class BootLinuxBase(Test):
>>>>          vmimage.QEMU_IMG = qemu_img
>>>>  
>>>>          self.log.info('Downloading/preparing boot image')
>>>> -        # Fedora 31 only provides ppc64le images
>>>> +        # Fedora 32 only provides ppc64le images
>>>>          image_arch = self.arch
>>>>          if image_arch == 'ppc64':
>>>>              image_arch = 'ppc64le'
>>>>          try:
>>>>              boot = vmimage.get(
>>>> -                'fedora', arch=image_arch, version='31',
>>>> +                'fedora', arch=image_arch, version='32',
>>>
>>> I already expressed my view on this (latest QEMU should be
>>> able to use at least f31 - which was tested - and eventually
>>> f33 - which is coverage extension). I'm not going to vouch
>>> this change. If other maintainers are happy with it, I don't
>>> mind this gets merged.
>>>
>>> BTW I don't see why this is urgent for 5.2.
>>>
>>> Phil.
>>>
>>
>> Hi Phil,
>>
>> Are you implying that, in your opinion, QEMU (say 5.2) should somehow
>> provide compatibility with Fedora 31 because it was used during the
>> entire cycle?  I sympathize with that, but, QEMU is not really
>> advertising compatibility support with specific Linux Distros, is it?

What I don't understand is why you remove F31 and not simply add a F32
test. Why should I stop testing F31 if I have it cached?

>>
>> And, assuming that the issues I found on the Fedora 33 aarch64 image
>> can not be worked around, would you suggest not moving to 32?  I mean,
>> I don't see a reason why QEMU shouldn't be able to use at least Fedora
>> 32, which is a currently *active* version (different from 31).
> 
> I think the problem with the Fedora acceptance is that we'll be constantly
> chasing a moving target. Every URL we pick will go away 6-12 months later.
> IOW, while the acceptance test pass today, in 6 months time they'll be
> failing.  IOW,  switching to F32 doesn't solve the root cause, it just
> pushs the problem down the road for 6 months until F32 is EOL and hits
> the same URL change problem.
> 
> One way to avoid this is to *not* actually  test a current Fedora.
> Instead intentionally point at an EOL Fedora release whose URL has
> already moved to the archive site which is long term stable.

I agree with Daniel, 'acceptance' test must not fail.

Having an archived image allow us to not rely on external disappearing
storage.

> 
> Regards,
> Daniel
> 


