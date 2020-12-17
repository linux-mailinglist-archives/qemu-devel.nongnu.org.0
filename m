Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B802DD4F7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 17:11:29 +0100 (CET)
Received: from localhost ([::1]:36744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpvsE-0006Fx-98
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 11:11:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpvrK-0005jM-8b
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:10:31 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:41206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpvrI-0003zx-JB
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:10:30 -0500
Received: by mail-ej1-x636.google.com with SMTP id ce23so38669636ejb.8
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 08:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c3hrNvcIPuITYrA8MWN2775toS4HvsiIPcUn5PuAgdQ=;
 b=m41AI2XkgIXentjb+tk4+fRm1jhNc5OuzvlX2edVfdTiRdmNlWXxQr/dAXHXhALd4Z
 JcHEKDw675qS9oz9bGrHyppQvOhErEkGHRmLj4I6KDT0wbg0aYx8yCEGNtXw2+eeZ0YX
 +A7fYdkXujd5knSOZOU4oD4osVsExti6envkdTcdaIWpg0G5CkkW7B0zbQ9TVG3YBci3
 q9HxXMlDx+uhWC8gdQciajqp8eocV/jGOPZpmaMBfw3WSRHkiuX6D8iHZyW0YgDX7zcn
 d79K7QbQHtO4ARM62nMPTGU3udkQ8yfFelOtAzod7dql4YWztlSwgI7NZTQm9I2XVeiB
 ZBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c3hrNvcIPuITYrA8MWN2775toS4HvsiIPcUn5PuAgdQ=;
 b=MYOW8aLfe0FuwqGr/A2vPM9vicK5H49BPFag98F/qHy3wygyQd699huxwcLtpS9arZ
 ohEwQ+hsOofjD7Q2sbT4exnyzDOTA7BtYu0Nwq4ygsgR4cfaj2efndDSXiLb6A1Jc0rC
 l6ZchZOmMJAMEXbPUbGMAQ0PV9lrZAs7fRZnPJH0OuXB7Scf1PRiJAz5zjyOoIq/ZNbu
 e/qlhsURK80uctwWTC+MDCJjPWiTQi07lttaCe7kjrkzfStRLNWvzJgVe0cEy/eyr0aZ
 ckQcmAJI0U4Y5e0Iu3LTXOs81ucULexvDx2XqPJwBn+6kFdTrHc5UbYhR8Pg0mk2Uf/w
 e6tA==
X-Gm-Message-State: AOAM5336nl80PXWzErxZ/GltgTZgiJu2o+IZiuIQh0JBwgW76LhUF4JV
 H6yRJbZTx+ox0cstSngOLzA=
X-Google-Smtp-Source: ABdhPJzghEbwm8BYj5lLUQtC13RKpRvW+uJlLFpG3W+4/DKFW62mPXJTnPvzMkRyTABEIT00VsV35w==
X-Received: by 2002:a17:906:b7cc:: with SMTP id
 fy12mr35975136ejb.44.1608221427102; 
 Thu, 17 Dec 2020 08:10:27 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id j7sm4182703ejj.27.2020.12.17.08.10.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Dec 2020 08:10:25 -0800 (PST)
Subject: Re: [PATCH 2/4] linux-user/mips64: Support o32 ABI syscalls
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20201119161710.1985083-1-f4bug@amsat.org>
 <20201119161710.1985083-3-f4bug@amsat.org>
 <a081586a-c136-3766-6c28-9c054b24e84b@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e1e6feeb-3bb3-d628-a87f-3696e9809d01@amsat.org>
Date: Thu, 17 Dec 2020 17:10:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <a081586a-c136-3766-6c28-9c054b24e84b@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Maciej W. Rozycki" <macro@linux-mips.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/20 11:40 AM, Laurent Vivier wrote:
> Le 19/11/2020 à 17:17, Philippe Mathieu-Daudé a écrit :
>> o32 ABI syscalls start at offset 4000.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  linux-user/mips64/syscall_nr.h | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/linux-user/mips64/syscall_nr.h b/linux-user/mips64/syscall_nr.h
>> index 672f2fa51cb..6579421fa63 100644
>> --- a/linux-user/mips64/syscall_nr.h
>> +++ b/linux-user/mips64/syscall_nr.h
>> @@ -1,4 +1,7 @@
>> -#ifdef TARGET_ABI_MIPSN32
>> +#if defined(TARGET_ABI_MIPSO32)
>> +#define TARGET_SYSCALL_OFFSET 4000
> 
> The value of the offset is hardcoded in linux-user/mips/meson.build, so either you remove
> TARGET_SYSCALL_OFFSET here or you update meson.build to use it.

I don't understand what this Meson rule does, as this
doesn't work without this patch...

You can download PS2 64-bit O32 binaries from 2002 (before
the official MIPS TLS ABI) there:
https://sourceforge.net/projects/kernelloader/files/

> 
>> +#include "syscall_o32_nr.h"
>> +#elif defined(TARGET_ABI_MIPSN32)
>>  #define TARGET_SYSCALL_OFFSET 6000
>>  #include "syscall_n32_nr.h"
>>  #else
>>
> 
> Thanks,
> Laurent
> 

