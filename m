Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBE169DFCD
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 13:01:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pURKU-0000p2-Ld; Tue, 21 Feb 2023 07:01:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pURKR-0000j9-8h
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:01:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pURKP-0004C8-Cz
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:01:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676980860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JWFjLHZIUU5AAKesF/5JXFt0neepuAqDKpDyfy3VtCU=;
 b=emU/Hhyy51hy9qGCHYB8es+06fPW1GAXn9ybDmiaYcyCkSREgagOLnfMWdrhuIxSgpzEYi
 024oNsAFnFyPKDMppCFSThE3ri5Zq7RiTqQsAjae54oc5raGM1upjkSSe/LKi5pHSNRAMi
 8ieeaexKyJK8+jgTKnl4xtngWy9hTW0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-13-aVTlQZRIMKW_t1i5Pm0IKg-1; Tue, 21 Feb 2023 07:00:57 -0500
X-MC-Unique: aVTlQZRIMKW_t1i5Pm0IKg-1
Received: by mail-wm1-f70.google.com with SMTP id
 l23-20020a7bc457000000b003e206cbce8dso1963381wmi.7
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 04:00:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JWFjLHZIUU5AAKesF/5JXFt0neepuAqDKpDyfy3VtCU=;
 b=tMLXUXz38DPwQjL2x3DJRasKJ3chmMcjsc+LeDyam7nahFesWyZIB/uUPj1PK6JD3O
 QFEpgeOHRzeBrbIqI93Co/TCBQd7KuvObIKm6U4LY9EY6YzXSWbyFgo4tE/FG/+P61O7
 hUbG5hMd6Zw7/q7bQMJDQulaBG+xJ5rqoM/jk7i4IlZH0ax72nxj7yQgHf2Egl+u4HuO
 W5rI7TnGTXri9SGAhKbowKcEiXElZ5s9N755bRYvh/P9DFyc1ySLaQVFPAX6n/yGLkPe
 ba8QaTv+WaT5Oh12HDQpKOULCoTnzC3xuoRLy4QV3OKR3+POKjy/FHwzF58UyfwKAtB8
 qD1g==
X-Gm-Message-State: AO0yUKWrVu01OPdr10y+O4xJePpuLMEzGG4ftLmPAw7Xn/Zx7M61UEfs
 LL6ST7+l0jLEAyEsACynZrTxL2qoqHJG0uwTPFIdZfBbfKkTJxz0MRr/l/YrhlnxyQL7KZ+PQkg
 0BrvuGC7GLFITULA=
X-Received: by 2002:a05:600c:16c9:b0:3e2:9b3:3cb4 with SMTP id
 l9-20020a05600c16c900b003e209b33cb4mr1836630wmn.5.1676980856116; 
 Tue, 21 Feb 2023 04:00:56 -0800 (PST)
X-Google-Smtp-Source: AK7set87Nx8PemWmDlTl1KewBLUTO515V+xoP5U8hoz6L87CRvZnkMY9nuZe/j7VCPVyj9jGquqZ6g==
X-Received: by 2002:a05:600c:16c9:b0:3e2:9b3:3cb4 with SMTP id
 l9-20020a05600c16c900b003e209b33cb4mr1836606wmn.5.1676980855784; 
 Tue, 21 Feb 2023 04:00:55 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 az17-20020a05600c601100b003dd1bd0b915sm14770405wmb.22.2023.02.21.04.00.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 04:00:55 -0800 (PST)
Message-ID: <f3dca04e-13a0-045d-a649-7ea4f0e9dbd8@redhat.com>
Date: Tue, 21 Feb 2023 13:00:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: John Snow <jsnow@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Kevin Wolf <kwolf@redhat.com>
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <87v8k2ycjb.fsf@pond.sub.org>
 <a2783906-cad2-2d47-5bbb-66d799b2a4b8@redhat.com>
 <CAFn=p-YnR-hFAg=yxCi7oNKHXirMqv2vJSYmaY8VBPq+Q2UVbA@mail.gmail.com>
 <ee04b184-75e3-7c4a-856f-4543f51f8412@redhat.com>
 <CAFn=p-ZW6ZDhrHAdu-TOarwsea2FNwK7tmN-REaWx23u-nBTZw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 0/7] Python: Drop support for Python 3.6
In-Reply-To: <CAFn=p-ZW6ZDhrHAdu-TOarwsea2FNwK7tmN-REaWx23u-nBTZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 20/02/2023 20.56, John Snow wrote:
> On Mon, Feb 20, 2023 at 1:16 AM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 17/02/2023 21.46, John Snow wrote:
>>> On Thu, Feb 16, 2023 at 5:58 AM Thomas Huth <thuth@redhat.com> wrote:
>>>>
>>>> On 15/02/2023 20.05, Markus Armbruster wrote:
>>>>> The discussion under PATCH 6 makes me think there's a bit of confusion
>>>>> about the actual impact of dropping support for Python 3.6.  Possibly
>>>>> because it's spelled out in the commit message of PATCH 7.  Let me
>>>>> summarize it in one sentence:
>>>>>
>>>>>        *** All supported host systems continue to work ***
>>>>>
>>>>> Evidence: CI remains green.
>>>>
>>>> The CI remains green since one of the patches disabled the building of the
>>>> docs on CentOS 8. That's not how I'd describe "continue to work", at least
>>>> not in the same extend as before.
>>>>
>>>>> On some supported host systems, different packages need to be installed.
>>>>> On CentOS 8, for instance, we need to install Python 3.8.13 or 3.9.16
>>>>> instead of 3.6.8.  Let me stress again: same repository, different
>>>>> package.  No downsides I can see.
>>>>>
>>>>> The *one* exception is Sphinx on CentOS 8.  CentOS 8 does not ship a
>>>>> version of Sphinx that works with Python 3.7 or newer.  This series
>>>>> proposes to simply stop building the docs there, unless the user
>>>>> provides a suitable version of Sphinx (which is easy enough with pip).
>>>>
>>>> I think we've all understood that. The thing that you obviously did not
>>>> understood: This breaks our support statement.
>>>> I'm pretty sure that you could also build the whole QEMU suite successfully
>>>> on an ancient CentOS 7 or Ubuntu 18.04 system if you manually install a
>>>> newer version of GCC and some of the required libraries first. But that's
>>>> not how we understand our support statement.
>>>>
>>>> Sure, you can argue that you can use "pip install" to get a newer version of
>>>> Sphinx on RHEL 8 / CentOS 8 to continue building the docs there - but is
>>>> that really that much different from installing a newer version of GCC and
>>>> libraries on an ancient distro that we do not officially support anymore?
>>>> I'd say no. You also have to consider that not every build host has access
>>>> to the internet, maybe some companies only have an internal mirror of the
>>>> distro packages in their intranet (I remember some discussion about such a
>>>> case in the past) - so while you were perfectly fine to build the whole of
>>>> QEMU on a CentOS 8 there before this change, you could now not build parts
>>>> of QEMU anymore there due to the missing possibility to run "pip install"
>>>> without full internet connection.
>>>
>>> There are good points elsewhere in this thread and I am taking notes,
>>> but this critique caught my eye as something I was not specifically
>>> planning around, so I wanted to get an elaboration here if I may.
>>>
>>> Do we have a support statement for this? I find this critique somewhat
>>> surprising -- If we don't have internet, how did we get the other 20
>>> to 30 dependencies needed to build QEMU? To what extent are we
>>> *required* to preserve a build that works without internet access?
>>
>> It's not written in stone, but I saw it this way: If I have a complete
>> mirror of a distro repository in my intrAnet, I can use that mirror to set
>> up a QEMU build host system that has no access to the internet. Or maybe
>> think of a DVD image(s) with all distro packages that you use to install a
>> host without network access (and you copy the QEMU tarball there via USB
>> stick). I think it's not that uncommon to have such scenarios out there.
>>
>> For example, do you remember that SDL 1.2 discussion a some years ago? See:
>>
>>    https://www.mail-archive.com/qemu-devel@nongnu.org/msg631628.html
>>
>> It was not exactly the same situation, since those folks were even unable to
>> install a SDL2-devel package on their pre-installed hosts, though it was
>> theoretically available as an update in their distro, but I think it gives
>> an impression of what people are using and expecting out there... (and no,
>> I'm not happy with this, I'd also rather love if we could move faster in the
>> QEMU project sometimes).
>>
>>    Thomas
> 
> Well, in this case I believe our support policy generally is written
> to require a fully up-to-date version of the LTS distros, e.g. we
> don't really test against "release day" 16.04, in the same way we
> don't offer support for RHEL 8.0, just the latest point release.

Yes, sure, that's what I meant with "not exactly the same situation" ... it 
was just an example of people trying to compile QEMU offline.

> I think really all we need is the ability to know a priori what we
> need to build QEMU before going offline without any last second
> surprises during configure, make, or make check. Right?

I think it should be OK with the patch that Paolo suggested for the support 
policy and maybe a note somewhere that you have to make sure to install a 
newer Sphinx with pip in case you still want to build the docs on older 
enterprise distros...

  Thomas


