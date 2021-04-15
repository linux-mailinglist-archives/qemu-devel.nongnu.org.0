Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F75236072F
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 12:33:34 +0200 (CEST)
Received: from localhost ([::1]:40830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWzJV-0006NW-6k
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 06:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWzGm-0005DM-AU; Thu, 15 Apr 2021 06:30:44 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWzGj-00047p-3D; Thu, 15 Apr 2021 06:30:44 -0400
Received: by mail-wr1-x431.google.com with SMTP id h4so13758940wrt.12;
 Thu, 15 Apr 2021 03:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XjBvcS/+8COOx6VwEKJsRVt+nVhORVzz3EtXvF3T0GU=;
 b=cIWeq6Gt2UnhYVUFmh2vfnyjIPZfDoKfDS3M0MfvvD0csJ63Z/PBh8UatQNtQFOZtn
 PIs2RabJdrYn1upeGVnCJp655Jk8jLK287ZP9av1T2HOemL867iIVLddE/Khyn0dx3Ux
 j8DeaSzmNxdkqIKRsN7caEOE04LjrQIviKvozQ5ItpXWVWip677HaeJN4iTaclqL9LBY
 CT1c2GcEQ0mz15+XFfABhyAsLAqsMMiJnslzDWSuYlB4T2Q3ZDGCIHQY048FaPjjKnqR
 0RbZzPXxeYxNe7XeP6+fvMHBzN0PAkc4lJuvdqyErVRsNSkOpmdSMH/k8iGQmLqXITIN
 hluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XjBvcS/+8COOx6VwEKJsRVt+nVhORVzz3EtXvF3T0GU=;
 b=d/RqL8WMh2qRrMa/GOEPyS7o4NgAAu+VCN6RHWlZsyTB98uGDakE0mGZUhABydnilw
 2uuMrpqA9H2vH49qjsY608lbVgZ0K3ceBow5YAgecvxY2p70NTTvYyX8fR3YGpMqitco
 tyBbtzLK8Isw9vGpRitZZ+mupeZK7b9bQOZRcB3Sb8s9I8LaMt8tOQuwycnaST/D28QQ
 Ut+gmLeTGSaKfV0g5Q7NX5hmBCJVmXENzRElv+pb0fQt4VtVo/76b1s0xinVwznabecR
 URBVZOymH2haG0wtboOUZQt4OEXBBoRur35D6GuNgSb/6rEx3C79OuXPkbNvmMhtELMD
 m/mQ==
X-Gm-Message-State: AOAM533zI53bqqKJT2BA2TH57XHeQ8cs4CXOTHJm1V9X0/Q8F+9XXSBm
 +uvexad9yxNCqgpg3ElgqXA=
X-Google-Smtp-Source: ABdhPJwhNU8U5tgRwwB8XxBycko3nl6zdIDTH2uCz8Jftvnuo99wd2mXS5mDQpT57GPrWvLI87t9gA==
X-Received: by 2002:a05:6000:118c:: with SMTP id
 g12mr2711975wrx.241.1618482638463; 
 Thu, 15 Apr 2021 03:30:38 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id m128sm2332087wmm.14.2021.04.15.03.30.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 03:30:37 -0700 (PDT)
Subject: Re: [PATCH 6/6] hw/isa/piix4: Fix leak removing unuseful
 qemu_allocate_irqs() call
To: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20210323231358.396520-1-f4bug@amsat.org>
 <20210323231358.396520-7-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1083a368-1582-3539-27e4-c05205c305cf@amsat.org>
Date: Thu, 15 Apr 2021 12:30:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323231358.396520-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping for review?

On 3/24/21 12:13 AM, Philippe Mathieu-Daudé wrote:
> We locally create an input IRQ with qemu_allocate_irqs() to
> pass it as output IRQ of the PIC, but its handler simply dispatch
> into another of our output IRQ ("intr" output).
> 
> Simplify by directly connecting the PIC output to our "intr"
> output.
> 
> This fixes when using QEMU built with --enable-sanitizers:
> 
>   ==338425==ERROR: LeakSanitizer: detected memory leaks
> 
>   Direct leak of 8 byte(s) in 1 object(s) allocated from:
>     #0 0x5641b361e1df in malloc (qemu-system-mips+0x1b201df)
>     #1 0x7f995e683958 in g_malloc (/lib64/libglib-2.0.so.0+0x58958)
>     #2 0x5641b5558e36 in qemu_allocate_irqs hw/core/irq.c:66:12
>     #3 0x5641b4161817 in piix4_realize hw/isa/piix4.c:171:21
>     #4 0x5641b42f077a in pci_qdev_realize hw/pci/pci.c:2114:9
>     #5 0x5641b554c802 in device_set_realized hw/core/qdev.c:761:13
>     #6 0x5641b5578458 in property_set_bool qom/object.c:2257:5
>     #7 0x5641b55709e2 in object_property_set qom/object.c:1402:5
>     #8 0x5641b55861c9 in object_property_set_qobject qom/qom-qobject.c:28:10
>     #9 0x5641b5571831 in object_property_set_bool qom/object.c:1472:15
>    #10 0x5641b55410fd in qdev_realize hw/core/qdev.c:389:12
> 
> Fixes: 078778c5a55 ("piix4: Add an i8259 Interrupt Controller as specified in datasheet")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/isa/piix4.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index a50d97834c7..79ed20e2a1a 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -103,12 +103,6 @@ static const VMStateDescription vmstate_piix4 = {
>      }
>  };
>  
> -static void piix4_request_i8259_irq(void *opaque, int irq, int level)
> -{
> -    PIIX4State *s = opaque;
> -    qemu_set_irq(s->cpu_intr, level);
> -}
> -
>  static void piix4_set_i8259_irq(void *opaque, int irq, int level)
>  {
>      PIIX4State *s = opaque;
> @@ -149,7 +143,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
>  {
>      PIIX4State *s = PIIX4_PCI_DEVICE(dev);
>      ISABus *isa_bus;
> -    qemu_irq *i8259_out_irq;
>  
>      isa_bus = isa_bus_new(DEVICE(dev), pci_address_space(dev),
>                            pci_address_space_io(dev), errp);
> @@ -168,8 +161,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
>                                          PIIX_RCR_IOPORT, &s->rcr_mem, 1);
>  
>      /* initialize i8259 pic */
> -    i8259_out_irq = qemu_allocate_irqs(piix4_request_i8259_irq, s, 1);
> -    s->isa = i8259_init(isa_bus, *i8259_out_irq);
> +    s->isa = i8259_init(isa_bus, s->cpu_intr);
>  
>      /* initialize ISA irqs */
>      isa_bus_irqs(isa_bus, s->isa);
> 

