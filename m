Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B79A2C7905
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Nov 2020 13:03:30 +0100 (CET)
Received: from localhost ([::1]:40986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjLQP-0001jN-4Q
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 07:03:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1kjLOL-00019e-TP
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 07:01:21 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:43355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1kjLOJ-0000Rn-45
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 07:01:21 -0500
Received: by mail-pl1-x644.google.com with SMTP id u2so4910347pls.10
 for <qemu-devel@nongnu.org>; Sun, 29 Nov 2020 04:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZHhFICyBHqbcTConxF/uKEsK0pZeKwkuoibKi97EmYs=;
 b=ZDecGCzmoihNRiKUZ2A8iWALJeSHkLVHudhHhrl9dESy3df2brwpNZsE5sWjL9Huox
 6zV1d5WmehQDQqGr2ZDNKM5PxeicWd9028Y2W/8lzUtV/QK8MMH+SM2ebc7V38YuHL+0
 eLhPmMjofye1d5AH8qzpMRDrziv3gh88ivs4SVyKgjjkOytfxzrDaBp+cYQTY6CSFblS
 9CXvlof+zLw3uD3v6t2+GVGCaDC819fvt92w8WNrwnk0PZk+0H3YJGIwD2M8+uhWmGRu
 SoCa/OtknOH3oDMHy2Ws0i7YhaUJue+ridRHLuLf3PEmpAe4JV9uTng652WwnGmzjR63
 b2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZHhFICyBHqbcTConxF/uKEsK0pZeKwkuoibKi97EmYs=;
 b=SMsbs+iy2skOIOkb+SePxjLzgtiRXOAYe8PzgYhzy5iQb6Y3IoIbwEB9jQWfBgdlkD
 xPQexCMip9HwFqErnpHacFTFWmTN7Lm31OPB09kT2c35374zx7VMCtNSkgjFqOKhLG2J
 b+9pKQ30irYTJFVCXM7hczuA9PLf+4G4ag8QlSqXScB1PSIldvOdQe1oqhsdvEvqFHAU
 N9NEEJtbSDNUU2zs85RagvxMI5UDcLopvXpflxA3Yi5UOFWk5hHRiC/Z6zh7Fu91gUA+
 2sMoCgGa8xGNbsrhAzisNyjBH1FjX0zcl/00i03Rfiv+8Az3eRefS8T1oumEc3Y3UqcL
 TfOQ==
X-Gm-Message-State: AOAM5300O1HulF3Wa0t+szCIp98gpDgdZn21skTT+iBVYSX9CppAJZWP
 XAP8V2bGlTZPNKm2dd6/tHnxHiWYyas=
X-Google-Smtp-Source: ABdhPJwJ0bPoOz4eRMuGL58giL3b+TJifRv2Q/pm5YmURLQS0t46h9CkB7Zvp5JkFbpgopmCttPFxg==
X-Received: by 2002:a17:902:a503:b029:d8:e685:3e58 with SMTP id
 s3-20020a170902a503b02900d8e6853e58mr14257942plq.68.1606651277294; 
 Sun, 29 Nov 2020 04:01:17 -0800 (PST)
Received: from localhost (g115.222-224-149.ppp.wakwak.ne.jp. [222.224.149.115])
 by smtp.gmail.com with ESMTPSA id p6sm18531418pjt.13.2020.11.29.04.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 04:01:16 -0800 (PST)
Date: Sun, 29 Nov 2020 21:01:13 +0900
From: Stafford Horne <shorne@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 2/3] hw/openrisc/openrisc_sim: Abstract out "get IRQ x of
 CPU y"
Message-ID: <20201129120113.GE3168563@lianli.shorne-pla.net>
References: <20201127225127.14770-1-peter.maydell@linaro.org>
 <20201127225127.14770-3-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201127225127.14770-3-peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=shorne@gmail.com; helo=mail-pl1-x644.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-devel@nongnu.org, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 27, 2020 at 10:51:26PM +0000, Peter Maydell wrote:
> We're about to refactor the OpenRISC pic_cpu code in a way that means
> that just grabbing the whole qemu_irq[] array of inbound IRQs for a
> CPU won't be possible any more.  Abstract out a function for "return
> the qemu_irq for IRQ x input of CPU y" so we can more easily replace
> the implementation.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/openrisc/openrisc_sim.c | 38 +++++++++++++++++++++-----------------
>  1 file changed, 21 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> index a8adf6b70d7..75ba0f47444 100644
> --- a/hw/openrisc/openrisc_sim.c
> +++ b/hw/openrisc/openrisc_sim.c
> @@ -52,8 +52,13 @@ static void main_cpu_reset(void *opaque)
>      cpu_set_pc(cs, boot_info.bootstrap_pc);
>  }
>  
> +static qemu_irq get_cpu_irq(OpenRISCCPU *cpus[], int cpunum, int irq_pin)
> +{
> +    return cpus[cpunum]->env.irq[irq_pin];
> +}
> +
>  static void openrisc_sim_net_init(hwaddr base, hwaddr descriptors,
> -                                  int num_cpus, qemu_irq **cpu_irqs,
> +                                  int num_cpus, OpenRISCCPU *cpus[],
>                                    int irq_pin, NICInfo *nd)
>  {
>      DeviceState *dev;
> @@ -70,18 +75,18 @@ static void openrisc_sim_net_init(hwaddr base, hwaddr descriptors,
>          qdev_prop_set_uint32(splitter, "num-lines", num_cpus);
>          qdev_realize_and_unref(splitter, NULL, &error_fatal);
>          for (i = 0; i < num_cpus; i++) {
> -            qdev_connect_gpio_out(splitter, i, cpu_irqs[i][irq_pin]);
> +            qdev_connect_gpio_out(splitter, i, get_cpu_irq(cpus, i, irq_pin));
>          }
>          sysbus_connect_irq(s, 0, qdev_get_gpio_in(splitter, 0));
>      } else {
> -        sysbus_connect_irq(s, 0, cpu_irqs[0][irq_pin]);
> +        sysbus_connect_irq(s, 0, get_cpu_irq(cpus, 0, irq_pin));
>      }
>      sysbus_mmio_map(s, 0, base);
>      sysbus_mmio_map(s, 1, descriptors);
>  }
>  
>  static void openrisc_sim_ompic_init(hwaddr base, int num_cpus,
> -                                    qemu_irq **cpu_irqs, int irq_pin)
> +                                    OpenRISCCPU *cpus[], int irq_pin)
>  {
>      DeviceState *dev;
>      SysBusDevice *s;
> @@ -93,7 +98,7 @@ static void openrisc_sim_ompic_init(hwaddr base, int num_cpus,
>      s = SYS_BUS_DEVICE(dev);
>      sysbus_realize_and_unref(s, &error_fatal);
>      for (i = 0; i < num_cpus; i++) {
> -        sysbus_connect_irq(s, i, cpu_irqs[i][irq_pin]);
> +        sysbus_connect_irq(s, i, get_cpu_irq(cpus, i, irq_pin));
>      }
>      sysbus_mmio_map(s, 0, base);
>  }
> @@ -136,26 +141,24 @@ static void openrisc_sim_init(MachineState *machine)
>  {
>      ram_addr_t ram_size = machine->ram_size;
>      const char *kernel_filename = machine->kernel_filename;
> -    OpenRISCCPU *cpu = NULL;
> +    OpenRISCCPU *cpus[2] = {};
>      MemoryRegion *ram;
> -    qemu_irq *cpu_irqs[2];
>      qemu_irq serial_irq;
>      int n;
>      unsigned int smp_cpus = machine->smp.cpus;
>  
>      assert(smp_cpus >= 1 && smp_cpus <= 2);
>      for (n = 0; n < smp_cpus; n++) {
> -        cpu = OPENRISC_CPU(cpu_create(machine->cpu_type));
> -        if (cpu == NULL) {
> +        cpus[n] = OPENRISC_CPU(cpu_create(machine->cpu_type));
> +        if (cpus[n] == NULL) {
>              fprintf(stderr, "Unable to find CPU definition!\n");
>              exit(1);
>          }
> -        cpu_openrisc_pic_init(cpu);
> -        cpu_irqs[n] = (qemu_irq *) cpu->env.irq;
> +        cpu_openrisc_pic_init(cpus[n]);
>  
> -        cpu_openrisc_clock_init(cpu);
> +        cpu_openrisc_clock_init(cpus[n]);
>  
> -        qemu_register_reset(main_cpu_reset, cpu);
> +        qemu_register_reset(main_cpu_reset, cpus[n]);
>      }
>  
>      ram = g_malloc(sizeof(*ram));
> @@ -164,15 +167,16 @@ static void openrisc_sim_init(MachineState *machine)
>  
>      if (nd_table[0].used) {
>          openrisc_sim_net_init(0x92000000, 0x92000400, smp_cpus,
> -                              cpu_irqs, 4, nd_table);
> +                              cpus, 4, nd_table);
>      }
>  
>      if (smp_cpus > 1) {
> -        openrisc_sim_ompic_init(0x98000000, smp_cpus, cpu_irqs, 1);
> +        openrisc_sim_ompic_init(0x98000000, smp_cpus, cpus, 1);
>  
> -        serial_irq = qemu_irq_split(cpu_irqs[0][2], cpu_irqs[1][2]);
> +        serial_irq = qemu_irq_split(get_cpu_irq(cpus, 0, 2),
> +                                    get_cpu_irq(cpus, 1, 2));
>      } else {
> -        serial_irq = cpu_irqs[0][2];
> +        serial_irq = get_cpu_irq(cpus, 0, 2);
>      }
>  
>      serial_mm_init(get_system_memory(), 0x90000000, 0, serial_irq,
> -- 
> 2.20.1

This looks good to me.

Reviewed-by: Stafford Horne <shorne@gmail.com>

Again, if there is no problem please feel free to merge.

