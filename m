Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0396896C5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 11:33:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNtN2-0001yZ-DG; Fri, 03 Feb 2023 05:32:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNtMF-0001vZ-5D
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 05:32:19 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNtMC-00073x-U7
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 05:31:50 -0500
Received: by mail-ot1-x341.google.com with SMTP id
 v24-20020a05683011d800b0068bdd29b160so1204593otq.13
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 02:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y6Iq5a+yHYaDhi9X5EehEa6afXh2z2XqtUWTE+mr2DU=;
 b=VFfjA9wpcuzxNeq0YkBx0m/4A3Xal5d7upYon/OtBQR6eDoZfNX+rBtsUFchVflxC3
 tKdhBO7bUBS4b2efRjFqBGukKfyqUB3f3R5OCocYciS8dk9JX1HafG0dbmQ/7rl9cEPX
 wCRXoDhZgJ4UxKKr0ElhydiJf7UE5NfquXfoBr2B3OwjpWFT7QIGm2a8DnJLAApIDjq1
 utV5bM1MZRo3enL0Jk+d8KcXNu0SsIOiVcDUF1AGzC9zJYgZaLwyc/sitgF51ICbrpDS
 0JRWEd0MhDXbGXQ6lJqANEBxlcYXoCdL8ocwP3pzRT1ucKWzmXRSo5kA3i+h+U+H6ghI
 9wmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y6Iq5a+yHYaDhi9X5EehEa6afXh2z2XqtUWTE+mr2DU=;
 b=xHm8GEyMdfa6+SQHGEzEZhbWVa7hIAul7b5p3s8KlrK4RllotSvu0K8mxisJV07V+Y
 3crpEA5AqP3pUqrh0N/1UHZXxMMLzudQjdXcjo82QS4kZmxCZy9ustMfqFrZDy225nFO
 gvp2zIGl5CM6udMSpLiTqnEcvz5/9RXjPrdnTfkTsRBZXxjwKEfNeF/CTDhooCfVHFBo
 X+mwN7U75No9pBWoezzBAjJCzUh0pTHLyPxd6AFGHqLf8eHXpWpoODStxcjNnao+7mF1
 999ZePcDWfrVuSxKtlCne9+1B7lY5qSu6u2E/zKxD+/jCeA8a6SafY7kuhaxj7YwV+GK
 Vf/A==
X-Gm-Message-State: AO0yUKXPoNY2B2aOZI9b+6pVrA9g53fh27wrYR8Lu3HNocfNkh4t7BkQ
 fC+HycC6rXtpzmgsxtwDI1tSYw==
X-Google-Smtp-Source: AK7set8ZVPtZb8EQ94kqFXtSjCGgmxUGjDxWP4YMwxM7ZNcw0p2nP7vWPvZERBqgNvlGyXMgUA2bTQ==
X-Received: by 2002:a9d:5612:0:b0:68b:d62a:a64a with SMTP id
 e18-20020a9d5612000000b0068bd62aa64amr4535324oti.29.1675420307569; 
 Fri, 03 Feb 2023 02:31:47 -0800 (PST)
Received: from [192.168.68.107] ([177.102.69.207])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a056830034c00b0068bce6239a3sm913894ote.38.2023.02.03.02.31.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 02:31:47 -0800 (PST)
Message-ID: <51896f68-d902-ee07-295d-5809c9c66e60@ventanamicro.com>
Date: Fri, 3 Feb 2023 07:31:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 1/3] hw/riscv: handle 32 bit CPUs kernel_addr in
 riscv_load_kernel()
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20230202135810.1657792-1-dbarboza@ventanamicro.com>
 <20230202135810.1657792-2-dbarboza@ventanamicro.com>
 <CAEUhbmW01vUZNdAcXQ0b-7GUgH70q9eyWJH7kG+Mph4uJJeWnA@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAEUhbmW01vUZNdAcXQ0b-7GUgH70q9eyWJH7kG+Mph4uJJeWnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x341.google.com
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



On 2/3/23 02:39, Bin Meng wrote:
> On Thu, Feb 2, 2023 at 9:58 PM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>> load_elf_ram_sym() will sign-extend 32 bit addresses. If a 32 bit QEMU
>> guest happens to be running in a hypervisor that are using 64 bits to
>> encode its address, kernel_entry can be padded with '1's and create
>> problems [1].
> 
> Still this commit message is inaccurate. It's not
> 
> "a 32-bit QEMU guest happens to running in a hypervisor that are using
> 64 bits to encode tis address"
> 
> as a 32-bit ELF can only hold a 32-bit address, but it's the QEMU ELF
> loader that does the sign extension and returns the address as
> uint64_t. It has nothing to do with hypervisor too.


Yeah I'm still focusing too much on the use case instead of the root of the
problem (sign-extension from QEMU elf).

> 
>>
>> Using a translate_fn() callback in load_elf_ram_sym() to filter the
>> padding from the address doesn't work. A more detailed explanation can
>> be found in [2]. The short version is that glue(load_elf, SZ), from
>> include/hw/elf_ops.h, will calculate 'pentry' (mapped into the
>> 'kernel_load_base' var in riscv_load_Kernel()) before using
>> translate_fn(), and will not recalculate it after executing it. This
>> means that the callback does not prevent the padding from
>> kernel_load_base to appear.
>>
>> Let's instead use a kernel_low var to capture the 'lowaddr' value from
>> load_elf_ram_sim(), and return it when we're dealing with 32 bit CPUs.
> 
> Looking at the prototype of load_elf_ram_sym() it has
> 
> ssize_t load_elf_ram_sym(const char *filename,
>                           uint64_t (*elf_note_fn)(void *, void *, bool),
>                           uint64_t (*translate_fn)(void *, uint64_t),
>                           void *translate_opaque, uint64_t *pentry,
>                           uint64_t *lowaddr, uint64_t *highaddr,
>                           uint32_t *pflags, int big_endian, int elf_machine,
>                           int clear_lsb, int data_swab,
>                           AddressSpace *as, bool load_rom, symbol_fn_t sym_cb)
> 
> So kernel_low is the "highaddr" parameter, not the 'lowaddr' value.

And for some reason I thought kernel_base_addr was being used as 'pentry'. kernel_base_addr
is already 'lowaddr'. Guess I'll have to rewrite the commit message. And revisit why my
test case worked for riscv32 (I probably didn't use an ELF image ...)

And the only way out seems to be filtering the bits from lowaddr. I'll do that.

Daniel


> 
>>
>> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02281.html
>> [2] https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg00099.html
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   hw/riscv/boot.c            | 15 +++++++++++----
>>   hw/riscv/microchip_pfsoc.c |  3 ++-
>>   hw/riscv/opentitan.c       |  3 ++-
>>   hw/riscv/sifive_e.c        |  3 ++-
>>   hw/riscv/sifive_u.c        |  3 ++-
>>   hw/riscv/spike.c           |  3 ++-
>>   hw/riscv/virt.c            |  3 ++-
>>   include/hw/riscv/boot.h    |  1 +
>>   8 files changed, 24 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
>> index c7e0e50bd8..5ec6d32165 100644
>> --- a/hw/riscv/boot.c
>> +++ b/hw/riscv/boot.c
>> @@ -174,11 +174,12 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
>>   }
>>
>>   target_ulong riscv_load_kernel(MachineState *machine,
>> +                               RISCVHartArrayState *harts,
>>                                  target_ulong kernel_start_addr,
>>                                  symbol_fn_t sym_cb)
>>   {
>>       const char *kernel_filename = machine->kernel_filename;
>> -    uint64_t kernel_load_base, kernel_entry;
>> +    uint64_t kernel_load_base, kernel_entry, kernel_low;
>>
>>       g_assert(kernel_filename != NULL);
>>
>> @@ -189,10 +190,16 @@ target_ulong riscv_load_kernel(MachineState *machine,
>>        * the (expected) load address load address. This allows kernels to have
>>        * separate SBI and ELF entry points (used by FreeBSD, for example).
>>        */
>> -    if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
>> -                         NULL, &kernel_load_base, NULL, NULL, 0,
>> +    if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL, NULL,
>> +                         &kernel_load_base, &kernel_low, NULL, 0,
>>                            EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
>> -        return kernel_load_base;
>> +        kernel_entry = kernel_load_base;
>> +
>> +        if (riscv_is_32bit(harts)) {
>> +            kernel_entry = kernel_low;
>> +        }
>> +
>> +        return kernel_entry;
>>       }
>>
>>       if (load_uimage_as(kernel_filename, &kernel_entry, NULL, NULL,
>> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
>> index 2b91e49561..712625d2a4 100644
>> --- a/hw/riscv/microchip_pfsoc.c
>> +++ b/hw/riscv/microchip_pfsoc.c
>> @@ -629,7 +629,8 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>>           kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
>>                                                            firmware_end_addr);
>>
>> -        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
>> +        kernel_entry = riscv_load_kernel(machine, &s->soc.u_cpus,
>> +                                         kernel_start_addr, NULL);
>>
>>           if (machine->initrd_filename) {
>>               riscv_load_initrd(machine, kernel_entry);
>> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
>> index 353f030d80..7fe4fb5628 100644
>> --- a/hw/riscv/opentitan.c
>> +++ b/hw/riscv/opentitan.c
>> @@ -101,7 +101,8 @@ static void opentitan_board_init(MachineState *machine)
>>       }
>>
>>       if (machine->kernel_filename) {
>> -        riscv_load_kernel(machine, memmap[IBEX_DEV_RAM].base, NULL);
>> +        riscv_load_kernel(machine, &s->soc.cpus,
>> +                          memmap[IBEX_DEV_RAM].base, NULL);
>>       }
>>   }
>>
>> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
>> index 3e3f4b0088..1a7d381514 100644
>> --- a/hw/riscv/sifive_e.c
>> +++ b/hw/riscv/sifive_e.c
>> @@ -114,7 +114,8 @@ static void sifive_e_machine_init(MachineState *machine)
>>                             memmap[SIFIVE_E_DEV_MROM].base, &address_space_memory);
>>
>>       if (machine->kernel_filename) {
>> -        riscv_load_kernel(machine, memmap[SIFIVE_E_DEV_DTIM].base, NULL);
>> +        riscv_load_kernel(machine, &s->soc.cpus,
>> +                          memmap[SIFIVE_E_DEV_DTIM].base, NULL);
>>       }
>>   }
>>
>> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
>> index d3ab7a9cda..71be442a50 100644
>> --- a/hw/riscv/sifive_u.c
>> +++ b/hw/riscv/sifive_u.c
>> @@ -598,7 +598,8 @@ static void sifive_u_machine_init(MachineState *machine)
>>           kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
>>                                                            firmware_end_addr);
>>
>> -        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
>> +        kernel_entry = riscv_load_kernel(machine, &s->soc.u_cpus,
>> +                                         kernel_start_addr, NULL);
>>
>>           if (machine->initrd_filename) {
>>               riscv_load_initrd(machine, kernel_entry);
>> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
>> index cc3f6dac17..1fa91167ab 100644
>> --- a/hw/riscv/spike.c
>> +++ b/hw/riscv/spike.c
>> @@ -305,7 +305,8 @@ static void spike_board_init(MachineState *machine)
>>           kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
>>                                                            firmware_end_addr);
>>
>> -        kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
>> +        kernel_entry = riscv_load_kernel(machine, &s->soc[0],
>> +                                         kernel_start_addr,
>>                                            htif_symbol_callback);
>>
>>           if (machine->initrd_filename) {
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index a061151a6f..d0531cc641 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -1277,7 +1277,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
>>           kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
>>                                                            firmware_end_addr);
>>
>> -        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
>> +        kernel_entry = riscv_load_kernel(machine, &s->soc[0],
>> +                                         kernel_start_addr, NULL);
>>
>>           if (machine->initrd_filename) {
>>               riscv_load_initrd(machine, kernel_entry);
>> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
>> index 511390f60e..6295316afb 100644
>> --- a/include/hw/riscv/boot.h
>> +++ b/include/hw/riscv/boot.h
>> @@ -44,6 +44,7 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
>>                                    hwaddr firmware_load_addr,
>>                                    symbol_fn_t sym_cb);
>>   target_ulong riscv_load_kernel(MachineState *machine,
>> +                               RISCVHartArrayState *harts,
>>                                  target_ulong firmware_end_addr,
>>                                  symbol_fn_t sym_cb);
>>   void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
>> --
> 
> Regards,
> Bin

