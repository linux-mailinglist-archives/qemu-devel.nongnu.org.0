Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8911A6BC937
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 09:32:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcj1A-0002J6-CS; Thu, 16 Mar 2023 04:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pcj18-0002Ij-AR
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 04:31:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pcj16-0002w5-H3
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 04:31:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678955479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m0O62/GA4BwqiDEx5i6d+EKCiWP9v1pf5u07YS9yaL8=;
 b=Q/iGbkudxf+6seg3+fefesRzka1/ecsMHgbIoXf9C7ZfqST7C7UR7b3oV/KsIoE9+T4oCN
 OQjWaEZzlK0DSDPI517QYwFu8a64TyTSSAUit8y1DlccTCA1G6bu79YzwF5Yf4WE/Fk9g0
 FeFdm2Zuv/JJmAtiJDWs7T6SrszN73A=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-ISZxKFGtOMafbyDmH8g5fw-1; Thu, 16 Mar 2023 04:31:18 -0400
X-MC-Unique: ISZxKFGtOMafbyDmH8g5fw-1
Received: by mail-ed1-f71.google.com with SMTP id
 dn8-20020a05640222e800b004bd35dd76a9so1950622edb.13
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 01:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678955477;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m0O62/GA4BwqiDEx5i6d+EKCiWP9v1pf5u07YS9yaL8=;
 b=RSsJCuZbtftZ2Hf7GS9uLcwVIyGTemZf2BwC9FJ10j+gB7CUEcGikHPgw2TP80Cfz+
 caDs3U/hMRSqKU4zkDcsrqD/lRcUHyI4MOzFPA/FgVB2yI9XIqAI5rw/Zv1dfRrMhLmX
 UWfl4E/wVnXmTQAFghmah4YaEA3E6k0OeTsd7ChbJEJcxP3YaZGH3PV8x3d+86klgShI
 MBAIVm4cwWOMPNvow5CyUMZt4aTEUHvN09FyoOablsaQbrLKfCVKkG2F7lNRpIGC5Y6N
 65EWKY9l8e41fdEH0M7KOnwYcHpg/Qq6ocT95l1g5EmWI60Lt8KWdvYEMdZXzKCJ+wfD
 m3oQ==
X-Gm-Message-State: AO0yUKUyTrw/5IbWvRlIIhLnFAIqxEv0vJrCqJkKH6qdE5d19kyzhrqq
 AgJhNg13KPJh79W/4/Fl8dW41dIejd36Qbg6K1yOPMF9FhyY9xraxPmbr0rjLdG1x1gLt6Z+mzS
 RO8Utxx4N6eH8K1g=
X-Received: by 2002:a17:906:c047:b0:8f1:937c:f450 with SMTP id
 bm7-20020a170906c04700b008f1937cf450mr9221343ejb.13.1678955477013; 
 Thu, 16 Mar 2023 01:31:17 -0700 (PDT)
X-Google-Smtp-Source: AK7set/i8MBX0ZY/mN9ZucMPcNTRtqI1rm9MpPSwTVQyfw72GnPQg8cPpBTmOlJbVLOdaoOIT/Oi9w==
X-Received: by 2002:a17:906:c047:b0:8f1:937c:f450 with SMTP id
 bm7-20020a170906c04700b008f1937cf450mr9221326ejb.13.1678955476669; 
 Thu, 16 Mar 2023 01:31:16 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-151.web.vodafone.de.
 [109.43.176.151]) by smtp.gmail.com with ESMTPSA id
 u20-20020a17090617d400b0092be4b381b7sm3527751eje.81.2023.03.16.01.31.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 01:31:16 -0700 (PDT)
Message-ID: <632e7256-34f5-ca87-ff60-a5c11aa1dd7f@redhat.com>
Date: Thu, 16 Mar 2023 09:31:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Andrew Randrianasulu <randrianasulu@gmail.com>
Cc: qemu-discuss@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
References: <CA+rFky6A9Q_5sJ4WDO-Z2HBT59qiNgr8A-xk+O7-gnAMZmHt2A@mail.gmail.com>
 <f06fddef-1e40-1858-2715-50a0518a97f6@linaro.org>
 <CA+rFky5=kc0Pwf3RRhuKrBqtRVkmtm=NDKhrVgJV2_Ame2nUOQ@mail.gmail.com>
 <c33b0e07-5c46-6ebe-fe4c-5308ce508a70@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: dropping 32-bit host support
In-Reply-To: <c33b0e07-5c46-6ebe-fe4c-5308ce508a70@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 16/03/2023 08.36, Philippe Mathieu-Daudé wrote:
> On 16/3/23 08:17, Andrew Randrianasulu wrote:
>>
>> чт, 16 мар. 2023 г., 10:05 Philippe Mathieu-Daudé <philmd@linaro.org 
>> <mailto:philmd@linaro.org>>:
>>
>>     Hi Andrew,
>>
>>     On 16/3/23 01:57, Andrew Randrianasulu wrote:
>>      > Looking at https://wiki.qemu.org/ChangeLog/8.0
>>     <https://wiki.qemu.org/ChangeLog/8.0>
>>      > <https://wiki.qemu.org/ChangeLog/8.0
>>     <https://wiki.qemu.org/ChangeLog/8.0>>
>>      >
>>      > ===
>>      > System emulation on 32-bit x86 and ARM hosts has been deprecated.
>>     The
>>      > QEMU project no longer considers 32-bit x86 and ARM support for
>>     system
>>      > emulation to be an effective use of its limited resources, and thus
>>      > intends to discontinue.
>>      >
>>      >   ==
>>      >
>>      > well, I guess arguing from memory-consuption point on 32 bit x86
>>     hosts
>>      > (like my machine where I run 32 bit userspace on 64 bit kernel)

All current PCs have multiple gigabytes of RAM, so using a 32-bit userspace 
to save some few bytes sounds weird.

(and in case you're talking about a very old PC that cannot be extened 
anymore, you're likely better off with an older version of QEMU anyway)

>>
>>     If you use a 64-bit kernel, then your host is 64-bit :)
>>
>>
>>
>> No, I mean *kernel* is 64 bit yet userspace (glibc, X , ...) all 32bit. 
>> So, qemu naturally will be 32-bit binary on my system.
> 
> This configuration is still supported!
> 
> Thomas, should we clarify yet again? Maybe adding examples?

There are two aspects here:

1) 32-bit KVM support - this won't be supported in the future anymore. Since 
running a 32-bit QEMU on a 64-bit kernel still uses the 32-bit KVM API, KVM 
also won't be possible anymore with a QEMU that has been compiled in 32-bit 
mode.

2) Compiling a 32-bit QEMU binary won't be officially supported anymore. We 
won't waste any more precious CI minutes on this (which is where we're 
struggling the most currently), and likely no active support for finding and 
fixing bugs. But I guess we won't actively disable this possibility 
(especially since we did not deprecate the corresponding 32-bit linux-user 
emulation yet, so the emulation code will mostly still stay around).

In the long run, we likely want to get rid of the separate compilation of 
the qemu-system-i386 binary, too, but that's still to be discussed. E.g. we 
could add a special run mode to the qemu-system-x86_64 instead that makes 
sure that the guest can only run in 32-bit mode.

>>     host: hardware where you run QEMU
>>     guest: what is run within QEMU
>>
>>     Running 32-bit *guest* on your 64-bit *host* is still supported.

If the complete userspace is 32-bit, I'd rather consider it a 32-bit host.

>> [...] I also ran qemu-system-ppc on Huawei Matepad T8 (32 bit Android, 
>> too) for emulating old mac os 9. Yes, I can wait 10 min per guest boot. 
>> Fedora 36 armhf boots even slower on emulation!

Yes, but for such scenarios, you can also use older versions of QEMU, you 
don't need the latest and greatest shiny QEMU version.

>> Well, sometimes simple patch restores functionality. I patched for example 
>> olive-editor to run on 32 bit, and before this intel embree (raytracing 
>> kernels for Lux renderer). So, _sometimes_ it really not that costly. 
>> While if this CI thing really runs per-commit and thrown away each result 
>> ... may be letting interested users to build things on their own machines 
>> (and share patches, if they develop them, publicly) actually good idea.

The problem is really that we don't have unlimited resources in the QEMU 
project. Currently we're heavily struggling with the load in the CI, but 
also pure man power is always very scarce. So at one point in time, you have 
to decide to say good bye to some old and hardly used features - at least to 
stop testing and actively supporting it. If you want to continue testing and 
fixing bugs for such host systems, that's fine, of course, but don't expect 
the QEMU developers to do that job in the future.

  Thomas


