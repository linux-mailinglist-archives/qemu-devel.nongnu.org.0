Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC08A69C548
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 07:17:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTzTB-0001mh-K2; Mon, 20 Feb 2023 01:16:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pTzT9-0001mP-Ih
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 01:16:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pTzT7-0005BZ-OS
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 01:16:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676873767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7NEWdPocEWGNu+5T59CvRuPufptA/2hhFe6k9qDBp3o=;
 b=f+ilHa6P/BpQV5Ica7waDVbsh7okitN8LM8PDnCxLVB7hWQJOnIBqguogmsEsSDjXbZEoq
 x+nsvfcO6ZmwS/Ykevv5G0axhTHi2PWP7ymKqDvlRjWXZN4ejCUeQ7SskP0fh4vQA2JUfR
 Zq/4ZCcbhobDjWNkUoGT5sTD9Ra9O6o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-567-G3Y5fSkvOOO_51YfNKxYLA-1; Mon, 20 Feb 2023 01:16:06 -0500
X-MC-Unique: G3Y5fSkvOOO_51YfNKxYLA-1
Received: by mail-wr1-f69.google.com with SMTP id
 d11-20020a056000186b00b002bde0366b11so129075wri.7
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 22:16:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7NEWdPocEWGNu+5T59CvRuPufptA/2hhFe6k9qDBp3o=;
 b=OhhPV2HJfbMJPeXK8UErl5vKzxB9JeLDs/bzQB4jCMip9F893Tc34b9/Cx9DVsmx9R
 JI9LZPC/3H+Af05vZtjDDr4CcXDSWDrbcr+0ZGpbY3IH6ugk0p/zNbAbFvnuWQeqCV81
 b+ZdhvO0OLGAXkWQ87URLi1HN8siyZRwKC3LH7OCb1Q3pxMAaUbbO8+uy9xW2+DHzdmm
 pHKh/FwWXgCXDhHkFgbspr/2nSsD3gD9UZBI3u8/OE/CvwBA2MfYehyyz0K+XYkkKfx7
 YOnd9eEsYnT73AX+qW4FIcxL8c+Cl9gn3rqA0WVysvdF+1kl+wSO6RPYBUtNghQUdJvP
 JGOQ==
X-Gm-Message-State: AO0yUKX/RtctQjjLFpfKxTVFwYHFYMay/Z8Hw7re4YbVd/mxth4zeeKI
 NzagHoLWaDEtRCANlTRduqKlIx0x182cMl+m6acUafbDmjKF52tJqC9XKXbyKRZrosHphicjkqE
 w77WHsngvT9TA7fM=
X-Received: by 2002:a05:600c:43d5:b0:3e2:1d1e:78dc with SMTP id
 f21-20020a05600c43d500b003e21d1e78dcmr8227848wmn.36.1676873765028; 
 Sun, 19 Feb 2023 22:16:05 -0800 (PST)
X-Google-Smtp-Source: AK7set9sYrh8RjeImmzF79BXAoGGWDB11FOESinbR+2P8b3RRF9bYhak1OhEKG1finynV5BpmWnj1Q==
X-Received: by 2002:a05:600c:43d5:b0:3e2:1d1e:78dc with SMTP id
 f21-20020a05600c43d500b003e21d1e78dcmr8227821wmn.36.1676873764636; 
 Sun, 19 Feb 2023 22:16:04 -0800 (PST)
Received: from [192.168.8.104] (tmo-100-40.customers.d1-online.com.
 [80.187.100.40]) by smtp.gmail.com with ESMTPSA id
 t16-20020a05600c2f9000b003dc521f336esm12895288wmn.14.2023.02.19.22.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Feb 2023 22:16:03 -0800 (PST)
Message-ID: <ee04b184-75e3-7c4a-856f-4543f51f8412@redhat.com>
Date: Mon, 20 Feb 2023 07:16:01 +0100
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
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 0/7] Python: Drop support for Python 3.6
In-Reply-To: <CAFn=p-YnR-hFAg=yxCi7oNKHXirMqv2vJSYmaY8VBPq+Q2UVbA@mail.gmail.com>
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

On 17/02/2023 21.46, John Snow wrote:
> On Thu, Feb 16, 2023 at 5:58 AM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 15/02/2023 20.05, Markus Armbruster wrote:
>>> The discussion under PATCH 6 makes me think there's a bit of confusion
>>> about the actual impact of dropping support for Python 3.6.  Possibly
>>> because it's spelled out in the commit message of PATCH 7.  Let me
>>> summarize it in one sentence:
>>>
>>>       *** All supported host systems continue to work ***
>>>
>>> Evidence: CI remains green.
>>
>> The CI remains green since one of the patches disabled the building of the
>> docs on CentOS 8. That's not how I'd describe "continue to work", at least
>> not in the same extend as before.
>>
>>> On some supported host systems, different packages need to be installed.
>>> On CentOS 8, for instance, we need to install Python 3.8.13 or 3.9.16
>>> instead of 3.6.8.  Let me stress again: same repository, different
>>> package.  No downsides I can see.
>>>
>>> The *one* exception is Sphinx on CentOS 8.  CentOS 8 does not ship a
>>> version of Sphinx that works with Python 3.7 or newer.  This series
>>> proposes to simply stop building the docs there, unless the user
>>> provides a suitable version of Sphinx (which is easy enough with pip).
>>
>> I think we've all understood that. The thing that you obviously did not
>> understood: This breaks our support statement.
>> I'm pretty sure that you could also build the whole QEMU suite successfully
>> on an ancient CentOS 7 or Ubuntu 18.04 system if you manually install a
>> newer version of GCC and some of the required libraries first. But that's
>> not how we understand our support statement.
>>
>> Sure, you can argue that you can use "pip install" to get a newer version of
>> Sphinx on RHEL 8 / CentOS 8 to continue building the docs there - but is
>> that really that much different from installing a newer version of GCC and
>> libraries on an ancient distro that we do not officially support anymore?
>> I'd say no. You also have to consider that not every build host has access
>> to the internet, maybe some companies only have an internal mirror of the
>> distro packages in their intranet (I remember some discussion about such a
>> case in the past) - so while you were perfectly fine to build the whole of
>> QEMU on a CentOS 8 there before this change, you could now not build parts
>> of QEMU anymore there due to the missing possibility to run "pip install"
>> without full internet connection.
> 
> There are good points elsewhere in this thread and I am taking notes,
> but this critique caught my eye as something I was not specifically
> planning around, so I wanted to get an elaboration here if I may.
> 
> Do we have a support statement for this? I find this critique somewhat
> surprising -- If we don't have internet, how did we get the other 20
> to 30 dependencies needed to build QEMU? To what extent are we
> *required* to preserve a build that works without internet access?

It's not written in stone, but I saw it this way: If I have a complete 
mirror of a distro repository in my intrAnet, I can use that mirror to set 
up a QEMU build host system that has no access to the internet. Or maybe 
think of a DVD image(s) with all distro packages that you use to install a 
host without network access (and you copy the QEMU tarball there via USB 
stick). I think it's not that uncommon to have such scenarios out there.

For example, do you remember that SDL 1.2 discussion a some years ago? See:

  https://www.mail-archive.com/qemu-devel@nongnu.org/msg631628.html

It was not exactly the same situation, since those folks were even unable to 
install a SDL2-devel package on their pre-installed hosts, though it was 
theoretically available as an update in their distro, but I think it gives 
an impression of what people are using and expecting out there... (and no, 
I'm not happy with this, I'd also rather love if we could move faster in the 
QEMU project sometimes).

  Thomas


