Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF78C375180
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 11:28:57 +0200 (CEST)
Received: from localhost ([::1]:38546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leaJU-000545-BY
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 05:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lea2D-0007RL-Rh
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:11:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lea2A-0005EO-UN
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:11:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620292262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o0d7SYP2f2sPz7N+yzuZHydGhsGPyoutIF/gDaHqA6g=;
 b=Qh78NFynLEO7pu0mzkZa1pMQtna/RISEYENZqz48eAAQua+XxWGlVaHA8swauMs3CIcqum
 YcjF90OVOId9woZqVzqUesH0+QqcSjpxg4vnTA+KyT1SRI18v4p7M4hVbqjoLR6D5dRbQK
 iwZtcXHM4dv+mgPf011z5xuyndEhnQQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-9DV6CHZwMoWovw8Zqs7oZw-1; Thu, 06 May 2021 05:11:00 -0400
X-MC-Unique: 9DV6CHZwMoWovw8Zqs7oZw-1
Received: by mail-wr1-f72.google.com with SMTP id
 88-20020adf95610000b029010758d8d7e2so1898281wrs.19
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 02:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o0d7SYP2f2sPz7N+yzuZHydGhsGPyoutIF/gDaHqA6g=;
 b=gpU/R0IXq2K6zpi4oKi+5nppXVdGSR8aM7UbM0G3s3vsRSurAmZpXfK1ZAT+XtGzsv
 xPMZ/ipGloFnrq/Lmcq/D8DI2QJ6GlnI1QrqWlMqoXY+F/U/zucqJqiMl3CxTs6vHWYS
 assWZSCPkoDT7Zu1sd9BlyXHtbzLKCHmIqGWQ5ZFUt9GlKMCtG5DaAnksRdQ3VC8ONoo
 7c5mbkIpa4zit+r/Gp3slhk5HYx+iO0jDKMZFUux1MfAmorWex2NIpzAzolL166fq6vz
 MLuMJT7m0wyg/JHxFZfaQDgp/rxgypi2Id93I2Vgbt2MmgFc80iWnenPWKK8zUnNh11q
 L84w==
X-Gm-Message-State: AOAM530Qrk9cV0jAinjy+gEibAoxAJAV5dgUL6vjpUzqDT0RGqOvIGG5
 vu/U+GCvMrgPMRUWOEBJhl83rGv+TekC5RUuXPKdhPt0Y/iL9P9Kvji/CCb9A2+QAflE10IpzDV
 OGOt0dbgRC0bZHiI=
X-Received: by 2002:a5d:4602:: with SMTP id t2mr3807358wrq.190.1620292259215; 
 Thu, 06 May 2021 02:10:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhxtMennc2+ZXN7A0lx7UohQOhXFMui8H4Sn76IhQqBG3b0awqiPdVmlPmwy36qKbKZNLVPQ==
X-Received: by 2002:a5d:4602:: with SMTP id t2mr3807329wrq.190.1620292259023; 
 Thu, 06 May 2021 02:10:59 -0700 (PDT)
Received: from [192.168.1.19] (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr.
 [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id t7sm3152728wrw.60.2021.05.06.02.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 02:10:58 -0700 (PDT)
Subject: Re: [PATCH v26 00/20] i386 cleanup PART 2
To: Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>
References: <20210301085450.1732-1-cfontana@suse.de>
 <cfeead83-4890-bdd8-c5cb-9bdb2ca24abb@suse.de> <875z21aghn.fsf@linaro.org>
 <50c3c1e6-cc62-ee50-874b-72615d7bfac7@suse.de> <87o8dpo4ww.fsf@linaro.org>
 <03b6b51e-71d7-a2c9-4d3d-db1ac77a1484@redhat.com>
 <20210505193141.4tb6k5cupbovctbs@habkost.net>
 <a6049846-2edf-c22f-0b7b-5a9f087223ab@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a6f5e405-039a-a055-ffec-dd9e65bf209e@redhat.com>
Date: Thu, 6 May 2021 11:10:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a6049846-2edf-c22f-0b7b-5a9f087223ab@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/21 9:55 AM, Claudio Fontana wrote:
> On 5/5/21 9:31 PM, Eduardo Habkost wrote:
>> On Wed, May 05, 2021 at 02:15:29PM +0200, Philippe Mathieu-Daudé wrote:
>>> On 5/5/21 12:04 PM, Alex Bennée wrote:
>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>> On 3/8/21 3:02 PM, Alex Bennée wrote:
>>>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> anything else for me to do here?
>>>>>>
>>>>>> It looks to me that this series is looking pretty good. Every patch has
>>>>>> at least one review so I think it's just waiting on the maintainers to
>>>>>> pick it up.
>>>>>>
>>>>>> Paolo/Richard - are you intending to take the series as is or are you
>>>>>> waiting for something else? I'd like to see the patch delta reduced for
>>>>>> the ARM cleanup work which is still ongoing.
>>>>>
>>>>> I am a bit at a loss here, as this has been reviewed for a while, but nothing is happening.
>>>>> Rebasing is starting to become more and more draining;
>>>>
>>>> This is still the latest re-factor right?
>>>>
>>>>   Subject: [PATCH v28 00/23] i386 cleanup PART 2
>>>>   Date: Mon, 22 Mar 2021 14:27:36 +0100
>>>>   Message-Id: <20210322132800.7470-1-cfontana@suse.de>
>>>>
>>>>> I am seeing some changes from Phil that redo some of the patches here (like target arch user),
>>>>> maybe you would like to drive this?
>>>>
>>>> AIUI his changes where to get qtest passing.
>>>
>>> I hadn't read Claudio's mail, I think he's mentioning commit 46369b50ee3
>>>
>>>     meson: Introduce meson_user_arch source set for arch-specific user-mode
>>>
>>>     Similarly to the 'target_softmmu_arch' source set which allows
>>>     to restrict target-specific sources to system emulation, add
>>>     the equivalent 'target_user_arch' set for user emulation.
>>>
>>> The patch only contains 6 lines in 2 hunks, if it introduced a conflict
>>> it should be trivial to resolve (I wasn't expecting it to conflict with
>>> your work when I merged it TBH).

> I'd suggest to move the discussions about the ARM series to the arm series thread.
> 
> I am concerned here about the groundwork and x86 part.

OK sorry, I was explaining the IRC chat.

Is there any issue rebasing the groundwork on top of commit 46369b50ee3?

Maybe my qtest/accel series is irrelevant to your x86 part, TBH I don't
remember.

Regards,

Phil.


