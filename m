Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE472688718
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 19:51:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNefG-0000bd-A6; Thu, 02 Feb 2023 13:50:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNef4-0000Zh-FJ
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 13:50:21 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNef2-0008IK-Ku
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 13:50:18 -0500
Received: by mail-oi1-x244.google.com with SMTP id p185so2239767oif.2
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 10:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E0su3+P4VawbLD+Id/GNmZ4GrUE9sUJzhzvTVEcvcAg=;
 b=dvt57mLN3wTYXykPaBvJTP59NZ6C02/wZ2qajte8pHQU34ESrZbaMJKVJEw62Vnpur
 jiUHE3wgtGT+4UCF1uptj/u9nCY+IFdN/sUEosiY9LUwhrJxC/Vb8SP94VyxkPMfV8Pp
 dtGKb+N4FtVZfcfVMeVa2WS57xw+XmXn7wA7LctpyM16+1L5oT9SL0oe9IcRPKNtUPyd
 Cy/7IITkPKEiXIRG1/8P2V1qai6TAH2Lwwf8AjY+NPkrpsqqldZXSrWl+8geLEfrdSfQ
 RbQjKlZODSxBcjceIYXQyAKvysc6HqPlYoTMkrKGlMTufX/WCDXAwP7xCsfj913XGI94
 I2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E0su3+P4VawbLD+Id/GNmZ4GrUE9sUJzhzvTVEcvcAg=;
 b=GX17PQoy3UdqPA+9WjFU0dn8CLWjphMmMdtnrzCIGM8OqUvnlr0f21TW3n++vtSRiQ
 YpZ+CJcRztErwyU0hUrZpJth19l4sA5Q7h4AcyR0k1tZIjOW1jxdt8KI3jaY01SghyM1
 gQWQmDJcbfoXOqw2VgQQRA5vsOhQ021omqIVZUqtT4GFL+pTBsTJNw4KbjIjC/PVo6ZR
 AuGltv0GezqEAM1xHNqrCuMxuEcBh+rD1Y/7xqIZs+70BdoHc+IwlT4E1RA4UBKM+/Y0
 SIDTcYSI/ZxW4hUc8Z8fe3DFbiuHlDMgIBjWmS2ertLQ+JRUCu4HKhnEShb83VpAL7uV
 U0dA==
X-Gm-Message-State: AO0yUKUnyXFF3GEunc2NpdlHLa+YLP+gxYyDCkvcNHXCWPB7qgUMnAvw
 UWZxTc/oxEIjlhQb/A4ajSA7tw==
X-Google-Smtp-Source: AK7set8yrAcINPQoSfrge+/mfoTnXc3TtoI0w4gkK5xqnHr1Yq6hejuEuzRUWJb02jqi5mXy8fUf6w==
X-Received: by 2002:a05:6808:1403:b0:369:16df:a457 with SMTP id
 w3-20020a056808140300b0036916dfa457mr4312517oiv.54.1675363814367; 
 Thu, 02 Feb 2023 10:50:14 -0800 (PST)
Received: from [192.168.68.107] ([177.102.69.207])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a9d6284000000b006865f605ce3sm132319otk.54.2023.02.02.10.50.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 10:50:13 -0800 (PST)
Message-ID: <221e938a-6deb-3b94-12ca-e5e91bab69df@ventanamicro.com>
Date: Thu, 2 Feb 2023 15:50:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 0/3] hw/riscv: handle kernel_entry high bits with
 32bit CPUs
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20230202135810.1657792-1-dbarboza@ventanamicro.com>
 <Y9vyEp8ghrbqssJO@spud>
 <0568610c-e227-b088-c375-5ee769c7cfc6@ventanamicro.com>
 <Y9wFHMir5HXPa1Zu@spud>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <Y9wFHMir5HXPa1Zu@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x244.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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



On 2/2/23 15:46, Conor Dooley wrote:
> On Thu, Feb 02, 2023 at 03:37:17PM -0300, Daniel Henrique Barboza wrote:
>> On 2/2/23 14:25, Conor Dooley wrote:
>>> On Thu, Feb 02, 2023 at 10:58:07AM -0300, Daniel Henrique Barboza wrote:
>>>> This new version removed the translate_fn() from patch 1 because it
>>>> wasn't removing the sign-extension for pentry as we thought it would.
>>>> A more detailed explanation is given in the commit msg of patch 1.
>>>>
>>>> We're now retrieving the 'lowaddr' value from load_elf_ram_sym() and
>>>> using it when we're running a 32-bit CPU. This worked with 32 bit
>>>> 'virt' machine booting with the -kernel option.
>>>>
>>>> If this approach doesn't work for the Xvisor use case, IMO  we should
>>>> just filter kernel_load_addr bits directly as we were doing a handful of
>>>> versions ago.
>>>>
>>>> Patches are based on current riscv-to-apply.next.
>>>>
>>>> Changes from v9:
>>>> - patch 1:
>>>>     - removed the translate_fn() callback
>>>>     - return 'kernel_low' when running a 32-bit CPU
>>>> - v9 link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg04509.html
>>>
>>> I think my T-b got lost last time around, but I gave this version a
>>> whirl too & things are working for me as they were before on Icicle.
>>
>> That was my bad. I forgot to add the test-by after doing the changes for
>> the next version.
> 
> Oh, I'm sorry. I saw a new version of the series a few days ago and
> noticed the missing tags, and then saw this one today, touching MPFS,
> and conflated the two.
> 
>> But I don't think this is the series you're talking about. The tested-by tag
>> you gave was on these patches:
>>
>> "[PATCH v5 0/3] riscv_load_fdt() semantics change"
>>
>> I believe you can add a Tested-by there. And feel free to give it a go - the
>> patches are on riscv-to-apply.next already.
> 
> Tested-by stands here though, I replied to the same message-id that I
> shazamed and tried ;)

Alright then. Tested-by on both series :D


Thanks!

> And I did so on top of the HEAD of riscv-to-apply.next, so I am happy
> with the version that got applied too.
> 
> Sorry!
> 

