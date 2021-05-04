Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47588372C11
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 16:32:59 +0200 (CEST)
Received: from localhost ([::1]:51018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldw6c-0007fA-AG
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 10:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldw42-0006IV-N0
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:30:19 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldw41-0001iS-08
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:30:18 -0400
Received: by mail-wr1-x429.google.com with SMTP id l14so9672492wrx.5
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 07:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hZPmLIUzigwIFiO++StOIeGQUaRQA4WbpAbzRgFuKD4=;
 b=rH/CuSgLPBLZCvNAgPUP1FpZEtVjUqeweeD+bluPLD67qwGBEYGzlnO/SWLej9xYxi
 NbPWXgSvKlFnfARzHFpE89/PeYO+jYO4pv1PcXdKx3Hh1dlHCGwn4aIs/K5rvsleoXXb
 +SDltndjn1XUvhi4/qzTEhB+teZ/TJm3/S3xwSFtsjxI4WHVcwRMWXXyv0lZ7ZD/ZcMs
 RSZsQRoGGRkv4XQ24SoMndta8u05hYJdrPIR5r6LhZ8oA2b8+mDexkgHPvO0qcYDN/aU
 9tOvUl3aZ5NmhaZGeK/wJNFbctwfCzyOCOUEkXfTFKobpQFzK0ldvpPqH9Y2XuKckNlL
 saOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hZPmLIUzigwIFiO++StOIeGQUaRQA4WbpAbzRgFuKD4=;
 b=lX4/wFasCw3vgO+hcEnrjHDBlWij94H08S+yTKBhu3UpTBJfPjDm7js05SOFMZDIyA
 Zieb9GEVfLnUBGBM/yCfksIg5HsRlYfzo3d4wL7LpETm8sSvIUXsNIqvHUs/eGw9HRpA
 UIGqjy0zNxAc85XNC4UsuzP8nOng5h2laORglZAY8cWtJwIBwsuuai2Xtu2gMy7+AVOr
 vsqwss7qQINAA1zpLWdFkbBtFLiDzg0GHJ1NbRLcEPglB5aesHEPNGmA0REzoZmW1Ieu
 8IxlcDsXle//Mty0griTGp8CfuDN4zhnQCMFvDq+qZFCrJ7+vgxqh93LawVjkQkEFfT+
 A8BA==
X-Gm-Message-State: AOAM530hhMRG/jyofyHiGxkDsrJ4xmmQ3W3KPMiior1ZPCjRReDLeBi6
 Yxd5DMIkQqdLZtSjqXBp/j7RkQEfzejgTQ==
X-Google-Smtp-Source: ABdhPJy3++v+nR1f07+f7JaZ7b44UvTGJe4ZWM/Aimz3TW8pNoxQ2O6juGWudWp9GbcZQ3TYoNNxIA==
X-Received: by 2002:adf:f74e:: with SMTP id z14mr31605242wrp.320.1620138615071; 
 Tue, 04 May 2021 07:30:15 -0700 (PDT)
Received: from [192.168.1.19]
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id p3sm2307403wmq.31.2021.05.04.07.30.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 07:30:14 -0700 (PDT)
Subject: Re: [PATCH] m68k: virt: correctly set the initial PC
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210504131816.73272-1-laurent@vivier.eu>
 <f85a2d4d-b31e-7752-c9dc-1bb0263fe739@amsat.org>
 <87eb232c-18dc-eaef-d78b-7150c78fa0bc@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b8bd7c5a-dc07-ba10-d016-f3370dfa8c00@amsat.org>
Date: Tue, 4 May 2021 16:30:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87eb232c-18dc-eaef-d78b-7150c78fa0bc@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/21 4:20 PM, Laurent Vivier wrote:
> Le 04/05/2021 à 16:13, Philippe Mathieu-Daudé a écrit :
>> On 5/4/21 3:18 PM, Laurent Vivier wrote:
>>> Set initial PC to the entry of the loaded kernel.
>>>
>>> This fixes kernel reboot with "-kernel" parameter.
>>>
>>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>>> ---
>>>  hw/m68k/virt.c | 22 +++++++++++++++++-----
>>>  1 file changed, 17 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
>>> index e9a5d4c69b97..4fb3a7ebf0f2 100644
>>> --- a/hw/m68k/virt.c
>>> +++ b/hw/m68k/virt.c
>>> @@ -88,14 +88,21 @@
>>>  #define VIRT_VIRTIO_MMIO_BASE 0xff010000     /* MMIO: 0xff010000 - 0xff01ffff */
>>>  #define VIRT_VIRTIO_IRQ_BASE  PIC_IRQ(2, 1)  /* PIC: 2, 3, 4, 5, IRQ: ALL */
>>>  
>>> +typedef struct {
>>> +    M68kCPU *cpu;
>>> +    hwaddr initial_pc;
>>> +    hwaddr initial_stack;
>>> +} ResetInfo;
>>> +
>>>  static void main_cpu_reset(void *opaque)
>>>  {
>>> -    M68kCPU *cpu = opaque;
>>> +    ResetInfo *reset_info = opaque;
>>> +    M68kCPU *cpu = reset_info->cpu;
>>>      CPUState *cs = CPU(cpu);
>>>  
>>>      cpu_reset(cs);
>>> -    cpu->env.aregs[7] = ldl_phys(cs->as, 0);
>>> -    cpu->env.pc = ldl_phys(cs->as, 4);
>>> +    cpu->env.aregs[7] = reset_info->initial_stack;
>>> +    cpu->env.pc = reset_info->initial_pc;
>>>  }
>>>  
>>>  static void virt_init(MachineState *machine)
>>> @@ -116,6 +123,7 @@ static void virt_init(MachineState *machine)
>>>      SysBusDevice *sysbus;
>>>      hwaddr io_base;
>>>      int i;
>>> +    ResetInfo *reset_info;
>>>  
>>>      if (ram_size > 3399672 * KiB) {
>>>          /*
>>> @@ -127,9 +135,13 @@ static void virt_init(MachineState *machine)
>>>          exit(1);
>>>      }
>>>  
>>> +    reset_info = g_malloc0(sizeof(ResetInfo));
>>> +
>>>      /* init CPUs */
>>>      cpu = M68K_CPU(cpu_create(machine->cpu_type));
>>> -    qemu_register_reset(main_cpu_reset, cpu);
>>> +
>>> +    reset_info->cpu = cpu;
>>> +    qemu_register_reset(main_cpu_reset, reset_info);
>>>  
>>>      /* RAM */
>>>      memory_region_add_subregion(get_system_memory(), 0, machine->ram);
>>> @@ -209,7 +221,7 @@ static void virt_init(MachineState *machine)
>>>              error_report("could not load kernel '%s'", kernel_filename);
>>>              exit(1);
>>>          }
>>> -        stl_phys(cs->as, 4, elf_entry); /* reset initial PC */
>>> +        reset_info->initial_pc = elf_entry;
>> Missing the stack?
>>
>>            reset_info->initial_stack = ldl_phys(cs->as, 0);
> 
> No, as it's a g_malloc0(), initial_stack is set to 0, so aregs[7] (SP) will be reset to 0 on reboot.
> We could also set it to  ram_size if we want something usable, but it's not needed for the kernel
> entry point.

Indeed I missed g_malloc*0*.

It would be clearer to use g_malloc() and explicitly set the initial
stack IMHO.

> 
> Thanks,
> 
> Laurent
> 
> 

