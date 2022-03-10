Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F13B14D483E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:38:36 +0100 (CET)
Received: from localhost ([::1]:36700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJ00-0005dH-2Q
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:38:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSIvI-00010V-60
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 08:33:44 -0500
Received: from [2a00:1450:4864:20::32b] (port=46962
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSIvF-0005p2-Ez
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 08:33:43 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so3385100wmp.5
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 05:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W47uOjYdPk8ZZnXndGzevkct7+uY/n/aQFgn3eXXmSU=;
 b=fpsfDcvirDSyxtJ5D/8M9hM+sBfkUXOSIS7V0sL06nGUJnna5jGala0jvtT2lH/ZZG
 7hq0xUS+XaZQPTbWdlj80KwxPxUpw4eMrMK4lw6Y4NSD6DFqZME6+vnSb4MpOr0wU5JB
 QPPZelN7uSqNOrdBkUd81/YGQtwZmmSpsM8dJVxRv9Icm0977g0OkVbvzZZriwT8H/Eg
 jB8M/Z1vcK/BMo0K4OggMgH4NANQwGvCPn3U0WtM82Y8SumzGT7hyPYjbn1MuddTS0JU
 uKiq4SShUOy0EnK1XOmcCQhYc721ocQoSYBevYXUGB61VNX1h+/8piRtBt7/tfwIwERj
 rqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W47uOjYdPk8ZZnXndGzevkct7+uY/n/aQFgn3eXXmSU=;
 b=CYhJLAjNisTNrBlRmF71zIyxRwQcStYpgTFAz2PkRwnjT00Ta5pkUX/pcx/2ltzQ0B
 8i6bcErjTuO5qHNRJ6l4cZFdfBUX9Aept8PS2YbCfuaX3lRAkSkI427u5WIOZPo243Mi
 Rk7QzUXtpwm26ph0usOEdZROE+ZBNzLf3qZmsuOggJ8HSPOxHsBtFbO4hBE5xgJ6q5tn
 FUrjb/wFQk0QvwmC6eK6ZqqHagl1pO4L1Y6plob0FRGqqLEuCDzXWvIZ1eimksxoUnw9
 GD9kD/EhF9WqXR4FqPASlIhWcFpefeynW64j7wD5ooMotfeXNe4nAO3isAf2x5BWO10h
 zFkg==
X-Gm-Message-State: AOAM532h+lJWLYtkSWvWnjofONEPkBoEPp7rNkdpcIQAhloxmbDsA8B3
 8alN1efMovMmbMNLPjip7onoF3ZZgdQ=
X-Google-Smtp-Source: ABdhPJxOMLI15q0pqDKUmYvixFvBulJr6w0rUKcahYjLc844TpLbQwhbB6P8ZFn3YaB/uV0sU78ysA==
X-Received: by 2002:a05:600c:3b21:b0:389:9738:be0f with SMTP id
 m33-20020a05600c3b2100b003899738be0fmr3512120wms.9.1646919219885; 
 Thu, 10 Mar 2022 05:33:39 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 n188-20020a1ca4c5000000b00389c692a3b5sm6989861wme.42.2022.03.10.05.33.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 05:33:39 -0800 (PST)
Message-ID: <68be37c4-a13a-1f0f-b6c7-368cd7dbc01e@redhat.com>
Date: Thu, 10 Mar 2022 14:33:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH-for-7.0] softmmu: List CPU types again
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 qemu-devel@nongnu.org
References: <20220310115502.3311-1-philippe.mathieu.daude@gmail.com>
 <0061fb85-fbe5-9304-6e6b-ae82bbf47482@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <0061fb85-fbe5-9304-6e6b-ae82bbf47482@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/22 13:23, Thomas Huth wrote:
> On 10/03/2022 12.55, Philippe Mathieu-Daudé wrote:
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> Commit e0220bb5b2 made cpus.c target-agnostic but didn't notice
>> the cpu_list() function is only defined in target-specific code
>> in "cpu.h". Extract list_cpus() from the generic cpus.c into a
>> new target-specific unit.

Let's just use cpu.c in the root, and move the prototype to 
include/exec/cpu-common.h.  The function can be used just fine by 
linux-user and bsd-user as well, it's not softmmu-specific.

Paolo

>> Fixes: e0220bb5b2 ("softmmu: Build target-agnostic objects once")
>> Reported-by: Max Filippov <jcmvbkbc@gmail.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   softmmu/cpus.c      |  8 --------
>>   softmmu/cpus_list.c | 36 ++++++++++++++++++++++++++++++++++++
>>   softmmu/meson.build |  1 +
>>   3 files changed, 37 insertions(+), 8 deletions(-)
>>   create mode 100644 softmmu/cpus_list.c
>>
>> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
>> index e1d84c8ccb..7b75bb66d5 100644
>> --- a/softmmu/cpus.c
>> +++ b/softmmu/cpus.c
>> @@ -728,14 +728,6 @@ int vm_stop_force_state(RunState state)
>>       }
>>   }
>> -void list_cpus(const char *optarg)
>> -{
>> -    /* XXX: implement xxx_cpu_list for targets that still miss it */
>> -#if defined(cpu_list)
>> -    cpu_list();
>> -#endif
>> -}
>> -
>>   void qmp_memsave(int64_t addr, int64_t size, const char *filename,
>>                    bool has_cpu, int64_t cpu_index, Error **errp)
>>   {
>> diff --git a/softmmu/cpus_list.c b/softmmu/cpus_list.c
>> new file mode 100644
>> index 0000000000..59ef604423
>> --- /dev/null
>> +++ b/softmmu/cpus_list.c
> 
> The other cpu*.c files in softmmu use a "-" instead of "_", so I'd also 
> use a "-" for cpu-list.c.
> 
> 
>> @@ -0,0 +1,36 @@
>> +/*
>> + * QEMU per target CPU list
>> + *
>> + * Copyright (c) 2003-2008 Fabrice Bellard
> 
> If you look at the history, Fabrice was hardly involved in this 
> function, so I think it should be ok to drop this line in the new file.
> 
>> + * Permission is hereby granted, free of charge, to any person 
>> obtaining a copy
>> + * of this software and associated documentation files (the 
>> "Software"), to deal
>> + * in the Software without restriction, including without limitation 
>> the rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, 
>> and/or sell
>> + * copies of the Software, and to permit persons to whom the Software is
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be 
>> included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
>> EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>> MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT 
>> SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES 
>> OR OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
>> ARISING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
>> DEALINGS IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "sysemu/cpus.h"
>> +#include "cpu.h"
>> +
>> +void list_cpus(const char *optarg)
>> +{
>> +    /* XXX: implement xxx_cpu_list for targets that still miss it */
>> +#if defined(cpu_list)
>> +    cpu_list();
>> +#endif
>> +}
>> +
> 
> No empty new lines at the end of files, please.
> 
>   Thomas
> 
> 


