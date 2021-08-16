Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B804C3EDE7C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 22:16:33 +0200 (CEST)
Received: from localhost ([::1]:36698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFj28-00070H-K9
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 16:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFj0r-0006FQ-Nm
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:15:13 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFj0p-00037o-OT
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:15:13 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso274848wmb.2
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 13:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x5kc6Zvf8y3mNz7kGKpWmoOF0L/t38Kg+55/+lrJxXE=;
 b=hPtYq43BklwoFQRcZaXZ/JsEx7GpY7eUoI+prnoxDpqwhA678qWhGJzMlB6Pvhs3ee
 NBwVX7IumWF15ifDugklWEUKSOKApA0K0v/KPMkpsGEHt+EZiHdujtkA9gWmwz965+sK
 q0oPmSl7hzAUi2Vrpr9m3bXhFsN0Qn+Srx5ZBDEpd7ZBWH8O/Lmdd9dp5NDHdskSrWq6
 SBNkI7xZ7/F5BNc5gGP6Yfqfnu3loyhEoS/LniHsHffgfxZalobFbCqMGrNIujSDSoqk
 14QWxzrbDJsmHluT+Yzo/AyjelYoYP+Q4wYErekP8H/wApAbvY0LxP10T3WwGN/BU4vh
 KH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x5kc6Zvf8y3mNz7kGKpWmoOF0L/t38Kg+55/+lrJxXE=;
 b=UkkeUNa6NTcM4jrPu2V+Azy6vCWDAb5PfPq/FXINnyHIMeRHpu+VyVE32yh3Dy9hXF
 6MT+Br/CQojVxb2G2OCbEIWNzC24J4k67Sf4IRhvL9gvMiRvlbAWOMXGJw7Cig2ouBK/
 VBPM/NIPgF7DsQwlrsD16nF4Z0ZIFiwXJvgV+/5mFaJUIwhknXs97hkkJzyJhRrt6h1E
 V5nNGnh5IfPWAnL6TG2BWjTIJwixqoBl+H7f++PGB0lph4xnbpJDEdM09sgMf1JdXkQN
 EE3NgxHLTTAYstkO/A5FuUP1/GC9MWdAyeUItlqwqEgOSouD5btQZ56kHe+j+8RWEI6K
 bM8Q==
X-Gm-Message-State: AOAM532ua2eTGN6GRbWE796NHvH3ILaFKkUXKpzJvlZ0+bgpFBlDMtci
 S7lbrZy3Rd3yF67sFD42jXY=
X-Google-Smtp-Source: ABdhPJx8vrGq2LHYw5goKytTY4Jc3yWEByAnITY7yjF3C1Vov9tq7PXQElUYGANcX/bkFI12WfTAkA==
X-Received: by 2002:a7b:cf0c:: with SMTP id l12mr20903wmg.62.1629144910208;
 Mon, 16 Aug 2021 13:15:10 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id d4sm230594wrz.35.2021.08.16.13.15.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 13:15:09 -0700 (PDT)
Subject: Re: [PATCH 2/3] hw/mips/boston: Allow loading elf kernel and dtb
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210729033959.6454-1-jiaxun.yang@flygoat.com>
 <20210729033959.6454-3-jiaxun.yang@flygoat.com>
 <e1b334a3-522b-fc5b-0093-1fb7a5d677d1@amsat.org>
Message-ID: <33af5147-33f1-605d-61a2-483c19c921bc@amsat.org>
Date: Mon, 16 Aug 2021 22:15:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e1b334a3-522b-fc5b-0093-1fb7a5d677d1@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-3.71,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: aleksandar.rikalo@syrmia.com, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 10:02 AM, Philippe Mathieu-Daudé wrote:
> On 7/29/21 5:39 AM, Jiaxun Yang wrote:
>> ELF kernel allows us debugging much easier with DWARF symbols.
> 
> You can load the symbols using the 'loader' device:
> docs/system/generic-loader.rst.
> 
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>  hw/mips/boston.c | 38 ++++++++++++++++++++++++++++++++++----
>>  1 file changed, 34 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
>> index a5746ede65..42b31a1ce4 100644
>> --- a/hw/mips/boston.c
>> +++ b/hw/mips/boston.c
>> @@ -20,6 +20,7 @@
>>  #include "qemu/osdep.h"
>>  #include "qemu/units.h"
>>  
>> +#include "elf.h"
>>  #include "hw/boards.h"
>>  #include "hw/char/serial.h"
>>  #include "hw/ide/pci.h"
>> @@ -546,10 +547,39 @@ static void boston_mach_init(MachineState *machine)
>>              exit(1);
>>          }
>>      } else if (machine->kernel_filename) {
>> -        fit_err = load_fit(&boston_fit_loader, machine->kernel_filename, s);
>> -        if (fit_err) {
>> -            error_report("unable to load FIT image");
>> -            exit(1);
>> +        uint64_t kernel_entry, kernel_low, kernel_high, kernel_size;
>> +
>> +        kernel_size = load_elf(machine->kernel_filename, NULL,
>> +                           cpu_mips_kseg0_to_phys, NULL,
>> +                           (uint64_t *)&kernel_entry,
>> +                           (uint64_t *)&kernel_low, (uint64_t *)&kernel_high,
>> +                           NULL, 0, EM_MIPS, 1, 0);
>> +
>> +        if (kernel_size) {
>> +            hwaddr dtb_paddr = QEMU_ALIGN_UP(kernel_high, 64 * KiB);
>> +            hwaddr dtb_vaddr = cpu_mips_phys_to_kseg0(NULL, dtb_paddr);
>> +
>> +            s->kernel_entry = kernel_entry;
>> +            if (machine->dtb) {
>> +                int dt_size;
>> +                const void *dtb_file_data, *dtb_load_data;
> 
> g_autofree is preferred.
> 
> Otherwise:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
>> +
>> +                dtb_file_data = load_device_tree(machine->dtb, &dt_size);
>> +                dtb_load_data = boston_fdt_filter(s, dtb_file_data, NULL, &dtb_vaddr);
>> +
>> +                /* Calculate real fdt size after filter */
>> +                dt_size = fdt_totalsize(dtb_load_data);
>> +                rom_add_blob_fixed("dtb", dtb_load_data, dt_size, dtb_paddr);
>> +                g_free((void *) dtb_file_data);
>> +                g_free((void *) dtb_load_data);

Also, no need to cast.

>> +            }
>> +        } else {
>> +            /* Try to load file as FIT */
>> +            fit_err = load_fit(&boston_fit_loader, machine->kernel_filename, s);
>> +            if (fit_err) {
>> +                error_report("unable to load kernel image");
>> +                exit(1);
>> +            }
>>          }
>>  
>>          gen_firmware(memory_region_get_ram_ptr(flash) + 0x7c00000,
>>
> 

