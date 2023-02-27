Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ACA6A4C3B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 21:26:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWk4T-0001DV-58; Mon, 27 Feb 2023 15:26:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWk4P-0001D1-UP
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 15:26:03 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWk4O-0006zH-2X
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 15:26:01 -0500
Received: by mail-pl1-x642.google.com with SMTP id p20so6851017plw.13
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 12:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BDeTj+J/22nMN720Gd3H2ETn00LmeBnchjc/wTnuog4=;
 b=EAObgI2qw74QHK+8hCkJz8AvIZZmBITIs/sYHA2Qlf0q57YpW/Dr7gUvwprNjgNAnn
 +tZotGe5/JI1mPTPCJRpK+sqr0VoxX5Fku22esRricaGbqDFSpqFRXKVIgNYAn9GkliW
 Oe9Dd22bF8X6W/0QHVVxzkPE/gHx6X2a8hxSBtmETuGQy4yQwP3yCW0Mo8hDvw6jVxbV
 Y2vIwM86mBNextdY4sttG0Wg+S3PF5SIwSirMluiN6LKsNGk1lNme2RkHCwC52QuLArf
 e9Xg5/aHPVqv6xyuWlZ0ByeYLl2EhBxOKbUv7CiCsssKfSyeLgGpXX5AfBheNrx1RH5D
 QWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BDeTj+J/22nMN720Gd3H2ETn00LmeBnchjc/wTnuog4=;
 b=6p0P4YMPIvE8RMDqvb6A0rFLD3YImFPXREcAZUk6CpfO6UyfyzrLjOhwj/07Y7PGJA
 /DfZIpPbzo8JEoNDZaNFzCe944avsZuJoO6Hc5j+ai67glSZlEf3RmgWhnJfi5Qo+qUy
 Fcu8CyAFWOUOGakbbt8fGBqQuTD/Jk2z1pq6Oo618OJ6thMNfqlGIgjy32JA/S/UJWwD
 tPhPIECg1x9ddbxmEz3Gp12/rr3BTbeIum+T+oF8hCTRaPjxn/tiWaRfZJfAAwVgzvRo
 aHKJKoNbaUp/4ura9j4th1pzMFKfL85ZgK9LnizvCzvCDZBFbCfWxYx3yIbt+4yHulgx
 2Czg==
X-Gm-Message-State: AO0yUKVYq6eNqKtvEZODMnlN1k/dOLmHt4eA/6VRx+rtn9qXq0sISX8x
 GSBjQcyetYcco6D2J9myMRfxzA==
X-Google-Smtp-Source: AK7set+Ks0aC8CRh4CLuUfbNCHNObCKFD90fNX9o+WEpCa8NNy9bsMTnaB8yMj6nDUaS4c+izcebqA==
X-Received: by 2002:a17:902:820d:b0:19c:d505:cdba with SMTP id
 x13-20020a170902820d00b0019cd505cdbamr66339pln.62.1677529558562; 
 Mon, 27 Feb 2023 12:25:58 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 u13-20020a170902714d00b00198e7d97171sm4989806plm.128.2023.02.27.12.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 12:25:58 -0800 (PST)
Message-ID: <e14f92fa-c3f2-6d14-2517-0ef41ff72911@linaro.org>
Date: Mon, 27 Feb 2023 10:25:53 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com> <Y/yY72L9wyjuv3Yz@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Y/yY72L9wyjuv3Yz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/27/23 01:50, Daniel P. Berrangé wrote:
> On Mon, Feb 27, 2023 at 12:10:49PM +0100, Thomas Huth wrote:
>> Hardly anybody still uses 32-bit x86 hosts today, so we should
>> start deprecating them to finally have less test efforts.
>> With regards to 32-bit KVM support in the x86 Linux kernel,
>> the developers confirmed that they do not need a recent
>> qemu-system-i386 binary here:
>>
>>   https://lore.kernel.org/kvm/Y%2ffkTs5ajFy0hP1U@google.com/
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   docs/about/deprecated.rst | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index 15084f7bea..98517f5187 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -196,6 +196,19 @@ CI coverage support may bitrot away before the deprecation process
>>   completes. The little endian variants of MIPS (both 32 and 64 bit) are
>>   still a supported host architecture.
>>   
>> +32-bit x86 hosts and ``qemu-system-i386`` (since 8.0)
>> +'''''''''''''''''''''''''''''''''''''''''''''''''''''
>> +
>> +Testing 32-bit x86 host OS support takes a lot of precious time during the
>> +QEMU contiguous integration tests, and considering that most OS vendors
>> +stopped shipping 32-bit variants of their x86 OS distributions and most
>> +x86 hardware from the past >10 years is capable of 64-bit, keeping the
>> +32-bit support alive is an inadequate burden for the QEMU project. Thus
>> +QEMU will soon drop the support for 32-bit x86 host systems and the
>> +``qemu-system-i386`` binary. Use ``qemu-system-x86_64`` (which is a proper
>> +superset of ``qemu-system-i386``) on a 64-bit host machine instead.
> 
> I feel like we should have separate deprecation entries for the
> i686 host support, and for qemu-system-i386 emulator binary, as
> although they're related they are independant features with
> differing impact.

Agreed.

> 32-bit x86 hosts
> ''''''''''''''''
> 
> Support for 32-bit x86 host deployments is increasingly uncommon in
> mainstream Linux distributions given the widespread availability of
> 64-bit x86 hardware. The QEMU project no longer considers 32-bit
> x86 support to be an effective use of its limited resources, and
> thus intends to discontinue it.
> 
> Current users of QEMU on 32-bit x86 hosts should either continue
> using existing releases of QEMU, with the caveat that they will
> no longer get security fixes, or migrate to a 64-bit platform
> which remains capable of running 32-bit guests if needed.
Ack.

> 
> ``qemu-system-i386`` binary removal
> '''''''''''''''''''''''''''''''''''
> 
> The ``qemu-system-x86_64`` binary can be used to run 32-bit guests
> by selecting a 32-bit CPU model, including KVM support on x86_64
> hosts. Once support for the 32-bit x86 host platform is discontinued,
> the ``qemu-system-i386`` binary will be redundant.

Missing "kvm" in this last sentence?  It is otherwise untrue for tcg.


> Current users are
> recommended to reconfigure their systems to use the ``qemu-system-x86_64``
> binary.

Ack.

> Same point for the next patch about 32-bit arm vs qemu-system-arm
> binary.

Ack.


r~

