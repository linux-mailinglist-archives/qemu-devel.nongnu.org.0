Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D556A53EF
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 08:53:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWunD-00010Y-29; Tue, 28 Feb 2023 02:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWunA-000100-9T
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 02:52:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWun8-0001HH-Ih
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 02:52:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677570773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RR2BvpBOXOzqZ7NvVjkZwdvjAhudEm7tI8s4OdXgmN4=;
 b=SR5xnMtdj88I+fOo9lz4u8wnQXB1fKF7rgv82uKJMWEEtXuDNk745+RPQqa8B8zWZ4hEt+
 4JBTVYHT694bek9p+ueHMK9FSrDCsjswRQX9V8rO+KPukdru3ICQxusjjDv9rqah3EWxcE
 shNILCbZIpRgwzgaQkUdZYtat3ZVfig=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-68-pgzsrBnbM7SUtnildAF4Ww-1; Tue, 28 Feb 2023 02:52:52 -0500
X-MC-Unique: pgzsrBnbM7SUtnildAF4Ww-1
Received: by mail-wm1-f71.google.com with SMTP id
 s18-20020a7bc392000000b003deaf780ab6so3929910wmj.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 23:52:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RR2BvpBOXOzqZ7NvVjkZwdvjAhudEm7tI8s4OdXgmN4=;
 b=NQNKVN/Jqikg6MOj9X77tAKOYLZxul/0WMVGcJyRWRnF9bi8nK1lssncJZRCbsNx0V
 HtPsDB4gyc6QO+rbLXzTRMLr0Aew3Ad/BptgVar31blhQFDfAKQ07iHQ5Bs5arfCX19R
 DUyd5baE0KTJhMfIUvWRAcEFFLyprlhmwnI5vDL2wZPX0P0L50Ps0c60cvMFiXIzGn38
 335XP/0O7sQ34AgGaGKuWo7FDLQTflHEebM0yqLeqCGwDAWLtufoKerXJ1j40PxD4Pb6
 2ExNUTZvdoEoQH6YUSX/MUOErWpVXzxGy2VIkA0cy0EMMdSGkgTWbfj0hV9fsbAtT4vi
 72fw==
X-Gm-Message-State: AO0yUKWHo4jANRt+/7LAr1sO2XdilNtnwuMkx6PvhMmjyn0q9DZmdx84
 Xd3y+xe71gDkJAnlnua29PZpc51y85xtCOFuuvaZVh16diuRAHV9dZ+grbUoNMCQruA2f6qa9mE
 Uk7vYyYwm3suS3kE=
X-Received: by 2002:a05:600c:4f45:b0:3e2:24a0:ba26 with SMTP id
 m5-20020a05600c4f4500b003e224a0ba26mr1281590wmq.16.1677570771144; 
 Mon, 27 Feb 2023 23:52:51 -0800 (PST)
X-Google-Smtp-Source: AK7set+ci1F5345rugsjKD5i5qcI5nYxBh17WE97j1xttoOVVrF5Kg3psWnYfbVkr8cqSXw8dyl8Yg==
X-Received: by 2002:a05:600c:4f45:b0:3e2:24a0:ba26 with SMTP id
 m5-20020a05600c4f4500b003e224a0ba26mr1281570wmq.16.1677570770820; 
 Mon, 27 Feb 2023 23:52:50 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-75.web.vodafone.de.
 [109.43.177.75]) by smtp.gmail.com with ESMTPSA id
 d10-20020a05600c3aca00b003eb369abd92sm10529537wms.2.2023.02.27.23.52.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 23:52:50 -0800 (PST)
Message-ID: <697e536d-eb65-32d9-279f-b2e6ab5e718a@redhat.com>
Date: Tue, 28 Feb 2023 08:52:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com> <Y/yY72L9wyjuv3Yz@redhat.com>
 <e14f92fa-c3f2-6d14-2517-0ef41ff72911@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <e14f92fa-c3f2-6d14-2517-0ef41ff72911@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 27/02/2023 21.25, Richard Henderson wrote:
> On 2/27/23 01:50, Daniel P. Berrangé wrote:
>> On Mon, Feb 27, 2023 at 12:10:49PM +0100, Thomas Huth wrote:
>>> Hardly anybody still uses 32-bit x86 hosts today, so we should
>>> start deprecating them to finally have less test efforts.
>>> With regards to 32-bit KVM support in the x86 Linux kernel,
>>> the developers confirmed that they do not need a recent
>>> qemu-system-i386 binary here:
>>>
>>>   https://lore.kernel.org/kvm/Y%2ffkTs5ajFy0hP1U@google.com/
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   docs/about/deprecated.rst | 13 +++++++++++++
>>>   1 file changed, 13 insertions(+)
>>>
>>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>>> index 15084f7bea..98517f5187 100644
>>> --- a/docs/about/deprecated.rst
>>> +++ b/docs/about/deprecated.rst
>>> @@ -196,6 +196,19 @@ CI coverage support may bitrot away before the 
>>> deprecation process
>>>   completes. The little endian variants of MIPS (both 32 and 64 bit) are
>>>   still a supported host architecture.
>>> +32-bit x86 hosts and ``qemu-system-i386`` (since 8.0)
>>> +'''''''''''''''''''''''''''''''''''''''''''''''''''''
>>> +
>>> +Testing 32-bit x86 host OS support takes a lot of precious time during the
>>> +QEMU contiguous integration tests, and considering that most OS vendors
>>> +stopped shipping 32-bit variants of their x86 OS distributions and most
>>> +x86 hardware from the past >10 years is capable of 64-bit, keeping the
>>> +32-bit support alive is an inadequate burden for the QEMU project. Thus
>>> +QEMU will soon drop the support for 32-bit x86 host systems and the
>>> +``qemu-system-i386`` binary. Use ``qemu-system-x86_64`` (which is a proper
>>> +superset of ``qemu-system-i386``) on a 64-bit host machine instead.
>>
>> I feel like we should have separate deprecation entries for the
>> i686 host support, and for qemu-system-i386 emulator binary, as
>> although they're related they are independant features with
>> differing impact.
> 
> Agreed.

OK, fair, I'll rework my patch according to your suggestion, Daniel.

>> 32-bit x86 hosts
>> ''''''''''''''''
>>
>> Support for 32-bit x86 host deployments is increasingly uncommon in
>> mainstream Linux distributions given the widespread availability of
>> 64-bit x86 hardware. The QEMU project no longer considers 32-bit
>> x86 support to be an effective use of its limited resources, and
>> thus intends to discontinue it.
>>
>> Current users of QEMU on 32-bit x86 hosts should either continue
>> using existing releases of QEMU, with the caveat that they will
>> no longer get security fixes, or migrate to a 64-bit platform
>> which remains capable of running 32-bit guests if needed.
> Ack.
> 
>>
>> ``qemu-system-i386`` binary removal
>> '''''''''''''''''''''''''''''''''''
>>
>> The ``qemu-system-x86_64`` binary can be used to run 32-bit guests
>> by selecting a 32-bit CPU model, including KVM support on x86_64
>> hosts. Once support for the 32-bit x86 host platform is discontinued,
>> the ``qemu-system-i386`` binary will be redundant.
> 
> Missing "kvm" in this last sentence?  It is otherwise untrue for tcg.

I assume that Daniel only thought of 32-bit x86 hosts here, but indeed, it's 
untrue for non-x86 32-bit hosts. So this really should refer to KVM on 
32-bit x86 hosts instead. I'll rephrase it in v2.

  Thomas


