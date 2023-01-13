Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1BF668EF1
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 08:17:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGEJM-0004BX-4l; Fri, 13 Jan 2023 02:17:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGEJF-00049V-9p
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 02:17:05 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGEJC-000194-3I
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 02:17:03 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so13303424wma.1
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 23:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s/irv9ll2IKYeUtIjEEI80H3YZm/A6FxHeQ3tnhoaVI=;
 b=R4npKgp8DBYDU8u3waDpTSRvnk6lL1Uqx7oEMe4cNyvpOq2kPSmVHpOca6Z0uQtjgF
 MsC7T74BLNnKDl47V9V6/8kTr7QxJG+C3XMtGqPA5eNBBV2pIbJXP7K36lGrRxzG0cZm
 hS3IjmjcGuYkYo2AyBYeY4ccwcpF9VekdmSybveNiEcCzWSIWbpEuLi7dKBzEx67MCop
 p4eNOcj/KWBcPo96OpNjUzt6sV6eFEYMrylK5dCQL7ryijZS+p9/zbHAzFKWSGecxDCf
 jZlo0UYTipZw4lygtx4YpZyCQY+flvbuiJQpJAlO3KAGj6zBqlam1XfRB+pwYbD1Kg7D
 ylUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s/irv9ll2IKYeUtIjEEI80H3YZm/A6FxHeQ3tnhoaVI=;
 b=YKpTWZvQSBz5k1Q4MGWHU4TN0fIj85icFhsztv+DAlNo5afs0Bszu1snVXUNiM9B5+
 3pS3sWoeNh2oKTPEBAHmihma5n4lyTi7leYom05Q19Pi8nL8Khr92+5eg1CgmbIOc30D
 zsnTQJrFELpuR5L6vPsh7fGtJx+yqEnCUDRrrZKpFbx9f98QWNmoGY2sQ6CuFiY+iLPn
 kLR6rn36U6HF6HZ/vb87iZsj0W6fuN7vD/mfZH610zlcEoOlyuWPVCtNBopFPfLYX2Fh
 6adqKsDRk4R4Ae7kKYrU0RILnAOyv2DgJ3g3Rdq+EEDa/t1SaQn8k+95aEDBhDcliHaE
 dqbg==
X-Gm-Message-State: AFqh2kp/LAY2cqSj1Qcv93Pec00AW1PwA+8uri1DNi4xquYTm+coNZy+
 wCmAZ3LggQP6PF5N4MxzNzoLKA==
X-Google-Smtp-Source: AMrXdXvBQNlaz72mFcWuR2BNZbw53FwLqTdwLT054CgCp62lcZf1ksZI8crdKZDbvtQCiU6MPVZFUw==
X-Received: by 2002:a05:600c:1c97:b0:3d1:c8e3:2452 with SMTP id
 k23-20020a05600c1c9700b003d1c8e32452mr59750948wms.30.1673594220001; 
 Thu, 12 Jan 2023 23:17:00 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d6-20020a05600c3ac600b003da0dc39872sm6626785wms.6.2023.01.12.23.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 23:16:59 -0800 (PST)
Message-ID: <b5cab84f-4bb9-694b-80e9-0b5aeac9de6c@linaro.org>
Date: Fri, 13 Jan 2023 08:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v5 10/11] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
 <20230102115241.25733-11-dbarboza@ventanamicro.com>
 <CAKmqyKPri7asvqZ8wN4Bd-wjH+gwwMJJhiUd+=QZFV4RhWnyUQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAKmqyKPri7asvqZ8wN4Bd-wjH+gwwMJJhiUd+=QZFV4RhWnyUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 12/1/23 01:34, Alistair Francis wrote:
> On Mon, Jan 2, 2023 at 9:55 PM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>> The microchip_icicle_kit, sifive_u, spike and virt boards are now doing
>> the same steps when '-kernel' is used:
>>
>> - execute load_kernel()
>> - load init_rd()
>> - write kernel_cmdline
>>
>> Let's fold everything inside riscv_load_kernel() to avoid code
>> repetition. To not change the behavior of boards that aren't calling
>> riscv_load_init(), add an 'load_initrd' flag to riscv_load_kernel() and
>> allow these boards to opt out from initrd loading.
>>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   hw/riscv/boot.c            | 22 +++++++++++++++++++---
>>   hw/riscv/microchip_pfsoc.c | 12 ++----------
>>   hw/riscv/opentitan.c       |  2 +-
>>   hw/riscv/sifive_e.c        |  3 ++-
>>   hw/riscv/sifive_u.c        | 12 ++----------
>>   hw/riscv/spike.c           | 11 +----------
>>   hw/riscv/virt.c            | 12 ++----------
>>   include/hw/riscv/boot.h    |  1 +
>>   8 files changed, 30 insertions(+), 45 deletions(-)

>> @@ -192,21 +194,35 @@ target_ulong riscv_load_kernel(MachineState *machine,
>>       if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
>>                            NULL, &kernel_load_base, NULL, NULL, 0,
>>                            EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
>> -        return kernel_load_base;
>> +        kernel_entry = kernel_load_base;
> 
> This breaks 32-bit Xvisor loading. It seems that for the 32-bit guest
> we get a value of 0xffffffff80000000.
> 
> Previously the top bits would be lost as we return a target_ulong from
> this function, but with this change we pass the value
> 0xffffffff80000000 to riscv_load_initrd() which causes failures.
> 
> This diff fixes the failure for me
> 
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 4888d5c1e0..f08ed44b97 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -194,7 +194,7 @@ target_ulong riscv_load_kernel(MachineState *machine,
>      if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
>                           NULL, &kernel_load_base, NULL, NULL, 0,
>                           EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
> -        kernel_entry = kernel_load_base;
> +        kernel_entry = (target_ulong) kernel_load_base;
>          goto out;
>      }
> 
> 
> but I don't think that's the right fix. We should instead look at the
> CPU XLEN and drop the high bits if required.

Ah, that is what should be done in load_elf_ram_sym()'s missing
translate_fn() handler.

