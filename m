Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C670B658639
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 20:06:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAbjL-0004EH-LV; Wed, 28 Dec 2022 14:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAbjI-0004D1-1d
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 14:04:44 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAbjG-0001gL-BI
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 14:04:43 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 e17-20020a9d7311000000b00678202573f1so10331193otk.8
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 11:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mOB6xdPEkLJ+sB6O/5tjEI08/d+cuf3ZqNQ6lT3AhZ4=;
 b=Dv04/NXJxMy3eW44Q82bp+PUdheUrQ+cgXG8x2gAYbNu0Pb6ULS9DmxodxI4Kr9rkC
 rruzOCat4trT8gyipP2ELqsRNGQ0HtqPI7k6nFpGquYpciCCguA1bRUNxI8/ARKaaF2X
 rdjsTzdkz/CM46VpyWj7JgB5rm7L3F7eCrCxTPEVjvlYuuye0IgKRStxHLo69dpWodQA
 Z/YoCtDMZ0lp0AWK9amm/gAkXLPbJR/fv/aOG/j9HBo8PMVpwhdlfV48v9MhVI63f7mJ
 oWxgPa1kLzHrYD0Yd8gcvlve0zUe887aRmZcOu3t37EM3Ds/KssL5e1PA/cq2Dw1Fo7W
 idxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mOB6xdPEkLJ+sB6O/5tjEI08/d+cuf3ZqNQ6lT3AhZ4=;
 b=uRFbnOHREGhSeOHY+NpA5/quwX7KPHeSvdbe//Laj1faWtFCCg3E894jWe5o65BAf8
 MEyctnneWiYt8VtNV5GIuYdhOX2oq1eN+OgM4XEcIRfgcYOY4Um2L1hX2o950u3DCGXS
 /wLuZKgtAS19nM5/0aSrwfHKRWGq+IKo30EB+2CvVQTGbpjFvF/3LuuZm8yirdoxwzK8
 OwWAqHOlSrZ61UhXNgg8Hcu1943u7VHEBvow07BpupfACWPF7XB1vMshFZ8s/1Y7/WrJ
 z+zAm4qxqJuw1Ez3RjhMnyaNbupcdV9FYkLAp9riGhQDlPWrJT4oviarkeY7jh2QYE+2
 ks9A==
X-Gm-Message-State: AFqh2kri7P5wsadyvE+37/U/i4NzLlyQLk5q155VumppF6hAWEV0xwv5
 mhvROElh1BhfvHKhCt3xB0Gv2w==
X-Google-Smtp-Source: AMrXdXuB2wRJyH26QSznwvn6RRUdd1i6ugiJgv6rWbpHGL2K8vNqwwfcmsuJePHEygf/5YbD7dOSTQ==
X-Received: by 2002:a9d:745a:0:b0:670:5bc0:fd66 with SMTP id
 p26-20020a9d745a000000b006705bc0fd66mr14962875otk.30.1672254280751; 
 Wed, 28 Dec 2022 11:04:40 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.139])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a9d4c90000000b0066e868dbc2esm8282137otf.46.2022.12.28.11.04.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 11:04:40 -0800 (PST)
Message-ID: <70a0cd63-48e0-a79b-995b-fd34104c64a6@ventanamicro.com>
Date: Wed, 28 Dec 2022 16:04:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 07/10] hw/riscv/boot.c: use MachineState in
 riscv_load_initrd()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bmeng@tinylab.org>
References: <20221228133336.197467-1-dbarboza@ventanamicro.com>
 <20221228133336.197467-8-dbarboza@ventanamicro.com>
 <bebabfa6-483c-a604-fe8d-9d0585f505db@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <bebabfa6-483c-a604-fe8d-9d0585f505db@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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



On 12/28/22 12:51, Philippe Mathieu-Daudé wrote:
> On 28/12/22 14:33, Daniel Henrique Barboza wrote:
>> 'filename', 'mem_size' and 'fdt' from riscv_load_initrd() can all be
>> retrieved by the MachineState object for all callers.
>>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Bin Meng <bmeng@tinylab.org>
>> ---
>>   hw/riscv/boot.c            | 6 ++++--
>>   hw/riscv/microchip_pfsoc.c | 3 +--
>>   hw/riscv/sifive_u.c        | 3 +--
>>   hw/riscv/spike.c           | 3 +--
>>   hw/riscv/virt.c            | 3 +--
>>   include/hw/riscv/boot.h    | 3 +--
>>   6 files changed, 9 insertions(+), 12 deletions(-)
>>
>> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
>> index d3c71b3f0b..f7e806143a 100644
>> --- a/hw/riscv/boot.c
>> +++ b/hw/riscv/boot.c
>> @@ -204,9 +204,11 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
>>       exit(1);
>>   }
>>   -void riscv_load_initrd(const char *filename, uint64_t mem_size,
>> -                       uint64_t kernel_entry, void *fdt)
>> +void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
>>   {
>> +    const char *filename = machine->initrd_filename;
>
> Do we want to check for missing -initrd here? Or simply return quietly
> if not provided?

This function is always called after a "if (!machine->initrd_filename)", so we can
be certain that -initrd will always be present if the function is called.

Perhaps one thing that we could do is to remove this check and fold it inside the
function, right at the start, to make the function behavior independent of what
the caller is doing. We could do that at patch 9/10 where we'll end up with a single
caller instead of 4-5.


Daniel

>
>> +    uint64_t mem_size = machine->ram_size;
>> +    void *fdt = machine->fdt;
>>       hwaddr start, end;
>>       ssize_t size;


