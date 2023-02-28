Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EFC6A6021
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 21:06:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX6E9-0006E9-OX; Tue, 28 Feb 2023 15:05:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pX6E7-0006Da-Kr
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 15:05:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pX6E1-0006Qn-Ms
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 15:05:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677614722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nQd+QhpwRnF3wyVrQuuVP52v3cZ2QpqTThkyv4Fl8ik=;
 b=LYSWGNG0eOszSCKFPF0C8unmwdKsNqrMLKfgybPOEjduXO/VySO2MdoPMMjHhH/feepGA+
 FuIdQkhfgaynGlptWX/TUrzCyrXY8cHUnnsLRrnAdX8k0xrXUkwsJpnw202ckDZLtgJMHX
 VWIuK7ktUi5l5pildVNun7OXLEPzS2A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-166-6w6wdX9nP2WkaSPwOL1uAw-1; Tue, 28 Feb 2023 15:05:20 -0500
X-MC-Unique: 6w6wdX9nP2WkaSPwOL1uAw-1
Received: by mail-wm1-f69.google.com with SMTP id
 x18-20020a1c7c12000000b003e1e7d3cf9fso7365795wmc.3
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 12:05:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nQd+QhpwRnF3wyVrQuuVP52v3cZ2QpqTThkyv4Fl8ik=;
 b=kbbkKKTQRCAWD+xvQCZvJVSBqkFhPntQP5MROMmZksya4KM11kUUVYeJTdyQtisoL7
 MZKvOF1EGhayVGeRUlbsFpnJchK80skx1m7/RfbP83k0mug0zpbZw3I+Q6t8UhmYejXM
 Ls0aR2cvJW0sWBFmL5oUE6Tior9pX/gARHKCTs+wHQLU4AystM+FpEJJV2p9HDb7uxXx
 wp4u4f9DjyakzbbBUfOt5Ugjsx+b1C8QDNhA+2ZhEzC4CaLxJzLDVr0iZ9jMS9Z7vk8w
 NHISmCDEaSoWCEhwD04KG+z7r5A5qrOpq7W5neq0rP/GOaDpw1osiNyRSkbef0t4ADXL
 lCAg==
X-Gm-Message-State: AO0yUKUaPdJlfzE0fFlNWCCDl1Y0mYSS0/srxK2amrV6HqRBqmCxknYm
 3DiuZh5U/0galAbWkmR7kjhVwvXCu0+KKxXzgb2eHdv4lC3GYOUSK9gxt+flDBp7nXGjVX5PJ3+
 3JkDOABXWH/PlhBQ=
X-Received: by 2002:adf:e945:0:b0:2c7:17a0:c6b5 with SMTP id
 m5-20020adfe945000000b002c717a0c6b5mr2892268wrn.34.1677614719636; 
 Tue, 28 Feb 2023 12:05:19 -0800 (PST)
X-Google-Smtp-Source: AK7set9MmF9eZGPOsdEoWMFU4L/R5a85Aqi1pG3SMRTtHFB4tUvsUD1H2dNf0t4BROa+7hwk1Y3Vhg==
X-Received: by 2002:adf:e945:0:b0:2c7:17a0:c6b5 with SMTP id
 m5-20020adfe945000000b002c717a0c6b5mr2892258wrn.34.1677614719335; 
 Tue, 28 Feb 2023 12:05:19 -0800 (PST)
Received: from [192.168.8.100] (tmo-112-221.customers.d1-online.com.
 [80.187.112.221]) by smtp.gmail.com with ESMTPSA id
 c16-20020a05600c0ad000b003e214803343sm16622509wmr.46.2023.02.28.12.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 12:05:18 -0800 (PST)
Message-ID: <99a83e65-273a-ea1b-e7d9-bbdd8ca32145@redhat.com>
Date: Tue, 28 Feb 2023 21:05:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <Y/z4rwv09Ckhbtfp@redhat.com>
 <001bedba-b12f-4dd8-0866-7ccb9ce877d0@redhat.com>
 <Y/3C+jC3Lk5MJxfu@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/2] Deprecate support for 32-bit x86 and arm hosts
In-Reply-To: <Y/3C+jC3Lk5MJxfu@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 28/02/2023 10.01, Daniel P. Berrangé wrote:
> On Tue, Feb 28, 2023 at 08:39:49AM +0100, Thomas Huth wrote:
>> On 27/02/2023 19.38, Daniel P. Berrangé wrote:
>>> On Mon, Feb 27, 2023 at 12:10:48PM +0100, Thomas Huth wrote:
>>>> We're struggling quite badly with our CI minutes on the shared
>>>> gitlab runners, so we urgently need to think of ways to cut down
>>>> our supported build and target environments. qemu-system-i386 and
>>>> qemu-system-arm are not really required anymore, since nobody uses
>>>> KVM on the corresponding systems for production anymore, and the
>>>> -x86_64 and -arch64 variants are a proper superset of those binaries.
>>>> So it's time to deprecate them and the corresponding 32-bit host
>>>> environments now.
>>>>
>>>> This is a follow-up patch series from the previous discussion here:
>>>>
>>>>    https://lore.kernel.org/qemu-devel/20230130114428.1297295-1-thuth@redhat.com/
>>>>
>>>> where people still mentioned that there is still interest in certain
>>>> support for 32-bit host hardware. But as far as I could see, there is
>>>> no real need for 32-bit host support for system emulation on x86 and
>>>> arm anymore, so it should be fine if we drop these host environments
>>>> now (these are also the two architectures that contribute the most to
>>>> the long test times in our CI, so we would benefit a lot by dropping
>>>> those).
>>>
>>> Your description here is a little ambiguous about what's being
>>> proposed. When you say dropping 32-bit host support do you mean
>>> just for the system emulator binaries, or for QEMU entirely ?
>>
>> Just for system emulation. Some people said that user emulation still might
>> be useful for some 32-bit environments.
>>
>>> And when the deprecation period is passed, are you proposing
>>> to actively prevent 32-bit builds, or merely stopping CI testing
>>> and leave 32-bit builds still working if people want them ?
>>
>> CI is the main pain point, so that's the most important thing. So whether we
>> throw a warning or a hard error while configuring the build, I don't care
>> too much.
> 
> If we're merely wanting to drop CI support, we can do that any time and
> deprecation is not required/expected.  We should only be using deprecation
> where we're explicitly intending that the code will cease to work.

Well, without CI, I assume that the code will bitrot quite fast (considering 
that there are continuous improvements to TCG, for example). And who's then 
still volunteering to fix bugs that have crept in months ago, for a host 
architecture that nobody really uses anymore?
Clearly, 32-bit x86 host is pretty much dead nowadays, especially for 
programs like QEMU that need beefy host hardware. Why do we still waste our 
time with this?

  Thomas


