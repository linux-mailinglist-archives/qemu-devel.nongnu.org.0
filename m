Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D672654557
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 17:44:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8OfA-0008D9-MN; Thu, 22 Dec 2022 11:43:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p8Of8-0008CO-J2
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 11:43:18 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p8Of7-0006Dl-1h
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 11:43:18 -0500
Received: by mail-ot1-x331.google.com with SMTP id
 m6-20020a9d7e86000000b0066ec505ae93so1370944otp.9
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 08:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D7CeV4LQPIdS4asdff7A/4pMHgEB5AUJeW4I1/atzR4=;
 b=hg+v8v9S0qnF4muH69EFjA6a1rGF1rsl8bFSzMLAdndr33ULLYbB6f/G27DU6MpthE
 bBNoxLDffP/VqI6QaGsmDX1CaCDlqhdXIgnCX706UtBvweHDuF1JW0roRqeUGLfS6yQ6
 E9IbSHd3oGP5vXKCNoa98+q530dSshZreJ3pjwNqXjHUE4ZMfqJrLo6SRjAL1QmBKF2Y
 vxN5I45P8JkyCAppOYdqCQXryzsGpPp9ZuCx73t23RcsWRX5k86XLvblScOAz4scCgqS
 j4muJgm6Hu+LpyRZBZNKeWDG8huXFwRri8VD4w+EucXtZBV+0WQ5ynIyIHG7b7MjEYMe
 tXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D7CeV4LQPIdS4asdff7A/4pMHgEB5AUJeW4I1/atzR4=;
 b=Vrdi7ldBCLqun9T5sVI6tC76cm5JQ0aT+FzpbQOYiA1ydN9YC8vZB3cwKONqbku6cY
 qkQjJAR+5LxdtW5xcs73eWz8qTlIkI9f50TqkqjCw+9Q2rEllK6APZLr3Urf44vWuagy
 nssUnlCsm8hJdywuk5r8YvB9nxbgwGHS4vkcF8izpZxShE1libIVPTYY9Xtf69tkTSKl
 IkSEdbjcMOFFKC8twwaHahy9N3xX6n/5aGPhJexrB2tt4Pttk+Z8gqcuAJupLgTeEClG
 hEn3qirH0/rn+tZdHp8Q4xTeMXLpNkHBXbup7o7dlqkV796Tc44tkKnBSRhNhuUp5Ja9
 Anzg==
X-Gm-Message-State: AFqh2kpOsCo9lkyCkYGblTdsioHo4yCLXyFF2h/VRpmMZHNtVDhUE7FO
 a79RA01jq9wcIQfn2vE61/Ohgg==
X-Google-Smtp-Source: AMrXdXs3A/lDeyUngFX8FmN0FRVg8ZcEwhIgU8BE1A6KO850tRLpXfCAyGjHeYQie5+KOG066QB8SQ==
X-Received: by 2002:a9d:5510:0:b0:66e:64c8:2a3 with SMTP id
 l16-20020a9d5510000000b0066e64c802a3mr3021541oth.38.1671727395797; 
 Thu, 22 Dec 2022 08:43:15 -0800 (PST)
Received: from [192.168.68.106] (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 d12-20020a0568301b6c00b006391adb6034sm503189ote.72.2022.12.22.08.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 08:43:15 -0800 (PST)
Message-ID: <0476f44e-f5ca-6262-6574-ae9d39d7ef02@ventanamicro.com>
Date: Thu, 22 Dec 2022 13:43:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 02/15] hw/riscv/spike: use 'fdt' from MachineState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-3-dbarboza@ventanamicro.com>
 <35c460e1-8e4d-eb1a-c25c-71f1a6d7d094@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <35c460e1-8e4d-eb1a-c25c-71f1a6d7d094@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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



On 12/22/22 11:25, Philippe Mathieu-Daudé wrote:
> On 21/12/22 19:22, Daniel Henrique Barboza wrote:
>> The MachineState object provides a 'fdt' pointer that is already being
>> used by other RISC-V machines, and it's also used by the 'dumpdtb' QMP
>> command.
>>
>> Remove the 'fdt' pointer from SpikeState and use MachineState::fdt
>> instead.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   hw/riscv/spike.c         | 12 +++++-------
>>   include/hw/riscv/spike.h |  2 --
>>   2 files changed, 5 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
>> index 13946acf0d..d96f013e2e 100644
>> --- a/hw/riscv/spike.c
>> +++ b/hw/riscv/spike.c
>> @@ -52,6 +52,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>>                          uint64_t mem_size, const char *cmdline, bool is_32_bit)
>>   {
>>       void *fdt;
>> +    int fdt_size;
>>       uint64_t addr, size;
>>       unsigned long clint_addr;
>>       int cpu, socket;
>> @@ -64,7 +65,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>>           "sifive,clint0", "riscv,clint0"
>>       };
>>   -    fdt = s->fdt = create_device_tree(&s->fdt_size);
>> +    fdt = mc->fdt = create_device_tree(&fdt_size);
>
> We use 'ms' for MachineState and 'mc' for MachineClass. I first got
> scared while looking at that patch that a class field was used. The
> variable is simply badly named. Possible future cleanup: s/mc/ms/.

Thanks for the ack Phil!


And yeah, I think I'll drop a patch with your suggestion later on.


Daniel

> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>


