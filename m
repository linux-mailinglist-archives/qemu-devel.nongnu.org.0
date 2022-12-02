Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD506406C6
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 13:26:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p156w-0007Hy-Hl; Fri, 02 Dec 2022 07:25:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p156k-0007Eh-NK
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 07:25:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p156i-0000UH-4a
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 07:25:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669983930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DKYgmLMvch4czlAYGEg7apgs2lUtKUmzPUUeulSUXnA=;
 b=MLzhe1tgtD2N8j5RhSekq4/7CrR0joHmijZkcWIlFgg4PtuMRgsvBtPmamwHTYDFs+BdX7
 bPx/UoVAsCHPY1qz7+ul18WJI4UXFvmb60Khq6RPhDKU0QwB14kFZmxCcX1FtWOAYgueLX
 ETtXCNWY5gxLEjC8mH4JE8FZbgJhO38=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-643-ubRawkLKNiidEPwOktmyiQ-1; Fri, 02 Dec 2022 07:25:29 -0500
X-MC-Unique: ubRawkLKNiidEPwOktmyiQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 o5-20020a05600c510500b003cfca1a327fso2423684wms.8
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 04:25:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DKYgmLMvch4czlAYGEg7apgs2lUtKUmzPUUeulSUXnA=;
 b=5kPOH8kk4UKUuc6QHF+sVNk8FeMhYo0vKOlf88z/kH8laAcI7HOguU/qPXalDgZPBh
 QlEb7kPfJ8OiYJO8F+Y6CXyef1ec3GbJw/txxAUy+Nkexeoe1nKE45U1DgpxuC+iCPoO
 XX/hAv3K6RoR8884NwnVPNr5GejHjZjGnSpF5TOQXMVKMFju9wT/2GYORKb+/TDu4pw/
 voozQ0i3e5EwAPKXgTZF14jyPAZuCW5MLunFScXgjc/+VeYmvjDeHQIKJrLiaEItKlJI
 yievms9vb9/YQLLZFuRByGr0UtBz0HEJaApt2GH55vuCcmb7I+sjCNPfNkGRwHO2f07w
 YGnA==
X-Gm-Message-State: ANoB5plu8rJXyNA1z/0/+f9VHyrXKgZH3tJmjZAc0AMou9OGLORUjZXF
 Vi/qUvZmfZjVSsZgYjBkfp+uidwk3Cp+6/8K22ekblei6qDTsWvFuw24IUZIdfv4Rgt7ihIS//o
 PkztuBX1SHq7ZpI0=
X-Received: by 2002:a05:600c:15c5:b0:3d0:7909:c363 with SMTP id
 v5-20020a05600c15c500b003d07909c363mr6876009wmf.122.1669983928398; 
 Fri, 02 Dec 2022 04:25:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7/ivNPe8Ysg6l4cYmT4AkTpIWEoTMQqJNtMZiYubO9tRINykeOQpUeifiBWAGKAnvh2E0Jcg==
X-Received: by 2002:a05:600c:15c5:b0:3d0:7909:c363 with SMTP id
 v5-20020a05600c15c500b003d07909c363mr6875988wmf.122.1669983928033; 
 Fri, 02 Dec 2022 04:25:28 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-86.web.vodafone.de.
 [109.43.178.86]) by smtp.gmail.com with ESMTPSA id
 p33-20020a05600c1da100b003d070e45574sm8878791wms.11.2022.12.02.04.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 04:25:27 -0800 (PST)
Message-ID: <95226bbe-9658-660c-12bb-dbf82b28dbd5@redhat.com>
Date: Fri, 2 Dec 2022 13:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221130111559.52150-1-thuth@redhat.com>
 <CAFEAcA-hneP0SLUTW=_maTztra9gYnKgPeXevDcVu3jZZnDObA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH for-8.0] hw/misc: Move some arm-related files from
 specific_ss into softmmu_ss
In-Reply-To: <CAFEAcA-hneP0SLUTW=_maTztra9gYnKgPeXevDcVu3jZZnDObA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.258, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 01/12/2022 12.55, Peter Maydell wrote:
> On Wed, 30 Nov 2022 at 11:16, Thomas Huth <thuth@redhat.com> wrote:
>>
>> By removing #include "kvm-consts.h" from arm-powerctl.h (seems not to
>> be required there) and adjusting the header includes in some files, we
>> can move them from specific_ss into softmmu_ss, so that they only need
>> to be compiled once and not for qemu-system-arm and qemu-system-aarch64
>> individually.
> 
>> --- a/target/arm/arm-powerctl.h
>> +++ b/target/arm/arm-powerctl.h
>> @@ -11,8 +11,6 @@
>>   #ifndef QEMU_ARM_POWERCTL_H
>>   #define QEMU_ARM_POWERCTL_H
>>
>> -#include "kvm-consts.h"
>> -
>>   #define QEMU_ARM_POWERCTL_RET_SUCCESS QEMU_PSCI_RET_SUCCESS
>>   #define QEMU_ARM_POWERCTL_INVALID_PARAM QEMU_PSCI_RET_INVALID_PARAMS
>>   #define QEMU_ARM_POWERCTL_ALREADY_ON QEMU_PSCI_RET_ALREADY_ON
> 
> kvm-consts.h is where QEMU_PSCI_RET_SUCCESS etc are defined.
> So while the #include isn't strictly needed for compilation to work
> because arm-powerctl.h only creates the #define and doesn't use it,
> it does mean that any source file that uses the QEMU_ARM_POWERCTL_*
> now needs to include kvm-consts.h somehow itself. (Usually this is
> going to happen implicitly via target/arm/cpu.h, I think.)
> 
> I guess this is worth living with for the benefit of not
> compiling things twice. It could probably be untangled a little
> by e.g. moving the PSCI constants into their own header rather
> than defining them in kvm-consts.h, but I'm not sure if it's
> worth the effort right now.

Hmm, do we really need these QEMU_ARM_POWERCTL* redefinitions?
They seem hardly to be used outside of the arm-powerctl.[ch]
files:

$ grep -r  QEMU_ARM_POWERCTL * | grep -v target/arm/arm-powerctl
hw/misc/allwinner-cpucfg.c:    if (ret != QEMU_ARM_POWERCTL_RET_SUCCESS) {
target/arm/hvf/hvf.c:    assert(ret == QEMU_ARM_POWERCTL_RET_SUCCESS);
target/arm/psci.c:    assert(ret == QEMU_ARM_POWERCTL_RET_SUCCESS);

... so maybe we could rather change those spots to use the QEMU_PSCI_*
constants instead? ... or since they basically only check for success,
we could maybe use "if (ret) ..." and "assert(!ret)" there?

  Thomas


