Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D989C372BC6
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 16:14:43 +0200 (CEST)
Received: from localhost ([::1]:56000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldvow-0005Zi-VP
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 10:14:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldvnV-0004aY-Ui
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:13:13 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldvnU-0000Mp-7G
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:13:13 -0400
Received: by mail-wr1-x435.google.com with SMTP id m9so9620564wrx.3
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 07:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JnI5qpxmEMX3/yzxHH53hrl9QO9FfC6XaLLflvAdUzI=;
 b=DbyEm6zQ6OuDjvSeW+KmcovBpWlFSYgo1nKPqKuxClIThfvMaWlprpZaTOzFSpODj0
 XCV8FxNJGesEGLeXr8DVRoT03Jz7eAC/hwcgdaad9XDUEpQ5eRsf8Nv5M+JsqEiJnDXq
 RNY76/PLZxEu8VIfLvNaHqd+AHvwRzBFVzXkEySoE3E7+ZStBSn8BUNucT+Kd2Eh2PgS
 wtstVxGXygWEkGnnQODHrq8Sfcv1i1a5WS7BIB3ZDS6D6UMqUnoRmQA/afiw0pp6Zhwo
 jSrq/UmeMApXaKHJpJPUPH9FzS77xiXvzkHuP7tFWnMV1hR6E4o/eMyD2wJzR5K06QLx
 SC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JnI5qpxmEMX3/yzxHH53hrl9QO9FfC6XaLLflvAdUzI=;
 b=Nw0Px3k/nh68eiW4ptLAxfI1Guu/c/dVSQAh/HB7Byq2EXUHNJnUvWo/UymEdeC/GB
 UDV8fg1c202G0oReV+FlN6oubknwwPVp1dyzYLNdb8+XN/qpOIU61tW4JjL3E7b9SZJv
 1XsK6S2EbJT7viO6zPA/t2Nqi8qkMCKjIv2IlTUGWT4RicEA3msMhqnZZlN1/jfG/5Sk
 0r8yUXiEaTICjnUTeLCDJGNpniDchoyZR+mWfJJUtQn7JOHyPjzJIQjTkk6M8tuUKZhF
 Vur9dRlRafznZ0EaVxT8TU5Pp3eq6wGkGp6ri87RPR7z+rO1TejOKr8HcoaseCpjDbeH
 w6ZQ==
X-Gm-Message-State: AOAM531IZSv++ALUtSBSiT9MNzy42t2YT905x8JoU2SqXH8O3oMkOLVw
 Ae5hiaVPWJCF4XmGWehgIFwl+BMZeOvqng==
X-Google-Smtp-Source: ABdhPJzHjKmRY64Ol5OQecRqEPObn3p3OpwKdtnNZveUAC7THhcezYEY3QWU6jrKznym5i6GJhL/gg==
X-Received: by 2002:adf:f7d2:: with SMTP id a18mr33761613wrq.198.1620137589529; 
 Tue, 04 May 2021 07:13:09 -0700 (PDT)
Received: from [192.168.1.19]
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id f18sm2365594wmg.26.2021.05.04.07.13.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 07:13:08 -0700 (PDT)
Subject: Re: [PATCH] m68k: virt: correctly set the initial PC
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210504131816.73272-1-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f85a2d4d-b31e-7752-c9dc-1bb0263fe739@amsat.org>
Date: Tue, 4 May 2021 16:13:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210504131816.73272-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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

On 5/4/21 3:18 PM, Laurent Vivier wrote:
> Set initial PC to the entry of the loaded kernel.
> 
> This fixes kernel reboot with "-kernel" parameter.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  hw/m68k/virt.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
> index e9a5d4c69b97..4fb3a7ebf0f2 100644
> --- a/hw/m68k/virt.c
> +++ b/hw/m68k/virt.c
> @@ -88,14 +88,21 @@
>  #define VIRT_VIRTIO_MMIO_BASE 0xff010000     /* MMIO: 0xff010000 - 0xff01ffff */
>  #define VIRT_VIRTIO_IRQ_BASE  PIC_IRQ(2, 1)  /* PIC: 2, 3, 4, 5, IRQ: ALL */
>  
> +typedef struct {
> +    M68kCPU *cpu;
> +    hwaddr initial_pc;
> +    hwaddr initial_stack;
> +} ResetInfo;
> +
>  static void main_cpu_reset(void *opaque)
>  {
> -    M68kCPU *cpu = opaque;
> +    ResetInfo *reset_info = opaque;
> +    M68kCPU *cpu = reset_info->cpu;
>      CPUState *cs = CPU(cpu);
>  
>      cpu_reset(cs);
> -    cpu->env.aregs[7] = ldl_phys(cs->as, 0);
> -    cpu->env.pc = ldl_phys(cs->as, 4);
> +    cpu->env.aregs[7] = reset_info->initial_stack;
> +    cpu->env.pc = reset_info->initial_pc;
>  }
>  
>  static void virt_init(MachineState *machine)
> @@ -116,6 +123,7 @@ static void virt_init(MachineState *machine)
>      SysBusDevice *sysbus;
>      hwaddr io_base;
>      int i;
> +    ResetInfo *reset_info;
>  
>      if (ram_size > 3399672 * KiB) {
>          /*
> @@ -127,9 +135,13 @@ static void virt_init(MachineState *machine)
>          exit(1);
>      }
>  
> +    reset_info = g_malloc0(sizeof(ResetInfo));
> +
>      /* init CPUs */
>      cpu = M68K_CPU(cpu_create(machine->cpu_type));
> -    qemu_register_reset(main_cpu_reset, cpu);
> +
> +    reset_info->cpu = cpu;
> +    qemu_register_reset(main_cpu_reset, reset_info);
>  
>      /* RAM */
>      memory_region_add_subregion(get_system_memory(), 0, machine->ram);
> @@ -209,7 +221,7 @@ static void virt_init(MachineState *machine)
>              error_report("could not load kernel '%s'", kernel_filename);
>              exit(1);
>          }
> -        stl_phys(cs->as, 4, elf_entry); /* reset initial PC */
> +        reset_info->initial_pc = elf_entry;

Missing the stack?

           reset_info->initial_stack = ldl_phys(cs->as, 0);

>          parameters_base = (high + 1) & ~1;
>  
>          BOOTINFO1(cs->as, parameters_base, BI_MACHTYPE, MACH_VIRT);
> 


