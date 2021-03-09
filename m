Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6770F33286C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 15:21:58 +0100 (CET)
Received: from localhost ([::1]:50512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJdFF-0004Dn-F2
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 09:21:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdBx-0002Ud-QJ; Tue, 09 Mar 2021 09:18:34 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:46455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdBv-00027u-4Q; Tue, 09 Mar 2021 09:18:33 -0500
Received: by mail-ej1-x62d.google.com with SMTP id r17so28059409ejy.13;
 Tue, 09 Mar 2021 06:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sOi7xz77dJm4L4wozwsnLGuhUW1u+TFIAmk6nHK5eqA=;
 b=q00wg0RGzz9GrCSP7bsLwTcB/J/ek9J+GaknD9EEPLZ+uTMFOlqJJBI8jLZgQbIeJg
 qRrpjag01iyIjqkeU/KU92UiIFJoser7VujSHCvPdgy/+ljdl7ZNCRd72ThxGikBOABZ
 5tICzdIuQ/Gh+QOa9q8aWWS9wYV3WUVKLpwC89nyyu7fF3VaF53FO7zNqpmwDiypB2iR
 T+p1OL/bAqK2fRHUX2OUnbQNdeJrl3pZTJsOXrwXIQbCjQiKc4f6UOLw7HsXuUGV4aVh
 QDO9WrNvkLJllkm6aqoUQWkzUyJfV1k1glZ7Ywist/TXyk6ZGjdYIbNBffXpLGer/Gsk
 c/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sOi7xz77dJm4L4wozwsnLGuhUW1u+TFIAmk6nHK5eqA=;
 b=UVaI6w2SaOJ2wGEMcOYosH043wOclxnMGu5oYp1nzTOxn1AYUSiYq/AQhWTES8qUjS
 G+oyxfCPN4lziBSaILEfI/sLmVp0Ge2ki9NndRYJGz4Spfu5h98EkL35jCOwC/HJtqB9
 EzXXrHgu/1tX2ehityNw7a4VcBtJswRlWNmOlgJUZunJMqraSdYS0GC9TItQe1xMwuCI
 nX6nPNwie6s4HR5o9sxs8uiODx0h7rtdFAJg8Q0gKER9Wq8rUp3VQ4v95tmDPusHtFMg
 FaRd2pKBhCVYJC51tmeotsv/ZedbicFbfM7HeTqlDLLso1t2qoz1nH/Id6NConRXQxt6
 250Q==
X-Gm-Message-State: AOAM530djXKU6my6iVE5fvlbZJqr98UbESC3/fPFjOg6a/ggtS39cufL
 TyuXMPJnFFSbYZK5R/fw1TGVw8nLbIg=
X-Google-Smtp-Source: ABdhPJw/uQR5E4w2gpyAFtMWHVqByxTMJQOfnByp74cUURMxrnPhWZ676Mr+ht29/J7H2VY9G8ctMw==
X-Received: by 2002:a17:906:39a:: with SMTP id
 b26mr21128895eja.158.1615299505863; 
 Tue, 09 Mar 2021 06:18:25 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m14sm8880130edd.63.2021.03.09.06.18.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 06:18:25 -0800 (PST)
Subject: Re: [PATCH v2 1/3] target/arm: Restrict v8M IDAU to TCG
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
References: <20210221222617.2579610-1-f4bug@amsat.org>
 <20210221222617.2579610-2-f4bug@amsat.org>
 <51ae2fad-f20e-27f2-2f7b-b7dca331dea3@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <75ce7727-caec-fd63-b2e6-9344e22cfa75@amsat.org>
Date: Tue, 9 Mar 2021 15:18:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <51ae2fad-f20e-27f2-2f7b-b7dca331dea3@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 2:41 PM, Claudio Fontana wrote:
> On 2/21/21 11:26 PM, Philippe Mathieu-Daudé wrote:
>> IDAU is specific to M-profile. KVM only supports A-profile.
>> Restrict this interface to TCG, as it is pointless (and
>> confusing) on a KVM-only build.
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> 
> This one breaks the KVM tests hard though (most of them).
> 
> I will try to figure out why.
> 
> Ciao,
> 
> Claudio
> 
> 
>> ---
>>  target/arm/cpu.c     | 7 -------
>>  target/arm/cpu_tcg.c | 8 ++++++++
>>  2 files changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index b8bc89e71fc..a772fd4926f 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -2380,12 +2380,6 @@ static const TypeInfo arm_cpu_type_info = {
>>      .class_init = arm_cpu_class_init,
>>  };
>>  
>> -static const TypeInfo idau_interface_type_info = {
>> -    .name = TYPE_IDAU_INTERFACE,
>> -    .parent = TYPE_INTERFACE,

Hmm this is an interface...

Is a CPU/machine trying to resolve it?

>> -    .class_size = sizeof(IDAUInterfaceClass),
>> -};
>> -
>>  static void arm_cpu_register_types(void)
>>  {
>>      const size_t cpu_count = ARRAY_SIZE(arm_cpus);
>> @@ -2399,7 +2393,6 @@ static void arm_cpu_register_types(void)
>>      if (cpu_count) {
>>          size_t i;
>>  
>> -        type_register_static(&idau_interface_type_info);
>>          for (i = 0; i < cpu_count; ++i) {
>>              arm_cpu_register(&arm_cpus[i]);
>>          }
>> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
>> index c29b434c60d..fb07a336939 100644
>> --- a/target/arm/cpu_tcg.c
>> +++ b/target/arm/cpu_tcg.c
>> @@ -14,6 +14,7 @@
>>  #include "hw/core/tcg-cpu-ops.h"
>>  #endif /* CONFIG_TCG */
>>  #include "internals.h"
>> +#include "target/arm/idau.h"
>>  
>>  /* CPU models. These are not needed for the AArch64 linux-user build. */
>>  #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
>> @@ -739,10 +740,17 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
>>      { .name = "pxa270-c5",   .initfn = pxa270c5_initfn },
>>  };
>>  
>> +static const TypeInfo idau_interface_type_info = {
>> +    .name = TYPE_IDAU_INTERFACE,
>> +    .parent = TYPE_INTERFACE,
>> +    .class_size = sizeof(IDAUInterfaceClass),
>> +};
>> +
>>  static void arm_tcg_cpu_register_types(void)
>>  {
>>      size_t i;
>>  
>> +    type_register_static(&idau_interface_type_info);
>>      for (i = 0; i < ARRAY_SIZE(arm_tcg_cpus); ++i) {
>>          arm_cpu_register(&arm_tcg_cpus[i]);
>>      }
>>
> 
> 

