Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D312B7020
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 21:34:27 +0100 (CET)
Received: from localhost ([::1]:37926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf7gH-0007Qj-UY
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 15:34:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tpecar95@gmail.com>)
 id 1kf7fA-0006p5-Mt; Tue, 17 Nov 2020 15:33:16 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:35307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tpecar95@gmail.com>)
 id 1kf7f8-0002gG-Og; Tue, 17 Nov 2020 15:33:16 -0500
Received: by mail-ej1-x643.google.com with SMTP id f23so31363042ejk.2;
 Tue, 17 Nov 2020 12:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PxbCj4nTQmWxUOEkCck0qamA0ICFchwd2Q2ii85/JVA=;
 b=s21Nnd3K3nb/JrfgEZ81uBuWBCa/+QoxgRj/A06SI7ewUa2TTkw036l6JmrAX8BDpS
 YsBSTxhinAIfZnERxd8DzClJkv5/VvewRTIGfN5zANDq30K8VfpjaGg8JXoRTjSKbabp
 uvEyQgVz3czSOy0cPrlGk8IKeQe9fF4ZO+MYoxZcakRaZm8z1dcaglo21d7871fxItGF
 BemkaUU/Za7S/evGVPC4ABqi9tOdHTMt6+K7AXoDAff58Rty2jM0jqgywim1PxefX7uj
 25GAsJEupKwhyL4lM23f/th6m+PAKZGMtfIN3/28hWCuJNX0d/+VQf9Utgxua5OziDvw
 2CKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PxbCj4nTQmWxUOEkCck0qamA0ICFchwd2Q2ii85/JVA=;
 b=noK1gD7z49YPikie0iWauA9uk37EDoSubsisF+K3/+RyOnpwNITSrnqnaAdw9Zfp1i
 zPLSvJ+n47Ip0hBERhjLd+ep9/LiejK0dr+X0io/sIzNxk6X3fjsDVvGMSLPYj2OHjai
 URqejSNhfSYqIofBTvMCUZ+t8IGhyI/tLMW9To6WPqllhlqgF30wBNXkhOKmV9VYl1um
 Xn0SCS2J8AYNmrC84Cs8N6d4N4wDOM9OwrbhecC0zUWOa2ScvNplqj/3hN8LAb82lwCz
 THHQa1LW2YxHIFZuG5ir5uOmF9vMIuhCkIU+Ki9ld6jIKcI402B+e6eLgx5ffhRwpKqM
 +D3w==
X-Gm-Message-State: AOAM530DzHp4fRlaip3DNdrgke3W38jqNvKQH83SIK7E7N8hkoT5Z+Bd
 hZ1hC601NgdKyGgHVUVRN4g=
X-Google-Smtp-Source: ABdhPJy/RvL88bjbcU/FsnOebRzIKyB4bbTLtlFmT9fVRCcy2LSCbxi/L+uG1rbCr9IDJQEo1qO3+A==
X-Received: by 2002:a17:906:4e56:: with SMTP id
 g22mr21521313ejw.49.1605645192201; 
 Tue, 17 Nov 2020 12:33:12 -0800 (PST)
Received: from [192.168.0.16] ([77.73.106.198])
 by smtp.gmail.com with ESMTPSA id b1sm12079228ejg.60.2020.11.17.12.33.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 12:33:11 -0800 (PST)
Subject: Re: [PATCH v2] hw/char/cmsdk-apb-uart: Fix rx interrupt handling
To: Peter Maydell <peter.maydell@linaro.org>
References: <107912fb-4570-2e61-c6ff-7b8df1ec5cac@gmail.com>
 <CAFEAcA_-+pFri8yQd0S0Uk3BCEDCtAMbR5k=ei-jUmQUS-dPEg@mail.gmail.com>
From: Tadej Pecar <tpecar95@gmail.com>
Message-ID: <28118ccb-9482-2b27-41f5-d66a5f22da21@gmail.com>
Date: Tue, 17 Nov 2020 21:33:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_-+pFri8yQd0S0Uk3BCEDCtAMbR5k=ei-jUmQUS-dPEg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=tpecar95@gmail.com; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17. 11. 20 17:38, Peter Maydell wrote:
> On Mon, 16 Nov 2020 at 19:58, Tadej Pečar <tpecar95@gmail.com> wrote:
>>
>> Previously, the RX interrupt got missed if:
>> - the character backend provided next character before
>>    the RX IRQ Handler managed to clear the currently served interrupt.
>> - the character backend provided next character while the RX interrupt
>>    was disabled. Enabling the interrupt did not trigger the interrupt
>>    even if the RXFULL status bit was set.
>>
>> These bugs become apparent when the terminal emulator buffers the line
>> before sending it to qemu stdin (Eclipse IDE console does this).
>>
>>
>> diff --git a/hw/char/cmsdk-apb-uart.c b/hw/char/cmsdk-apb-uart.c
>> index 626b68f2ec..d76ca76e01 100644
>> --- a/hw/char/cmsdk-apb-uart.c
>> +++ b/hw/char/cmsdk-apb-uart.c
>> @@ -96,19 +96,34 @@ static void uart_update_parameters(CMSDKAPBUART *s)
>>
>>   static void cmsdk_apb_uart_update(CMSDKAPBUART *s)
>>   {
>> -    /* update outbound irqs, including handling the way the rxo and txo
>> -     * interrupt status bits are just logical AND of the overrun bit in
>> -     * STATE and the overrun interrupt enable bit in CTRL.
>> +    /*
>> +     * update outbound irqs
>> +     * (
>> +     *     state     [rxo,  txo,  rxbf, txbf ] at bit [3, 2, 1, 0]
>> +     *   | intstatus [rxo,  txo,  rx,   tx   ] at bit [3, 2, 1, 0]
>> +     * )
>> +     * & ctrl        [rxoe, txoe, rxe,  txe  ] at bit [5, 4, 3, 2]
>> +     * = masked_intstatus
>> +     *
>> +     * state: status register
>> +     * intstatus: pending interrupts and is sticky (has to be cleared by sw)
>> +     * masked_intstatus: masked (by ctrl) pending interrupts
>> +     *
>> +     * intstatus [rxo, txo, rx] bits are set here
>> +     * intstatus [tx] is managed in uart_transmit
>>        */
>> -    uint32_t omask = (R_INTSTATUS_RXO_MASK | R_INTSTATUS_TXO_MASK);
>> -    s->intstatus &= ~omask;
>> -    s->intstatus |= (s->state & (s->ctrl >> 2) & omask);
>> -
>> -    qemu_set_irq(s->txint, !!(s->intstatus & R_INTSTATUS_TX_MASK));
>> -    qemu_set_irq(s->rxint, !!(s->intstatus & R_INTSTATUS_RX_MASK));
>> -    qemu_set_irq(s->txovrint, !!(s->intstatus & R_INTSTATUS_TXO_MASK));
>> -    qemu_set_irq(s->rxovrint, !!(s->intstatus & R_INTSTATUS_RXO_MASK));
>> -    qemu_set_irq(s->uartint, !!(s->intstatus));
>> +    s->intstatus |= s->state &
>> +        (R_INTSTATUS_RXO_MASK | R_INTSTATUS_TXO_MASK | R_INTSTATUS_RX_MASK);
>> +
>> +    uint32_t masked_intstatus = s->intstatus & (s->ctrl >> 2);
> 
> I don't think this logic is correct. It makes the values we
> send out on the output interrupt lines different from the
> values visible in the INTSTATUS register bits, and I don't
> think that's how the hardware behaves.
> 
> thanks
> -- PMM
> 

Yep, it seems that I stand corrected. More so, it seems that I was completely wrong.

I've had a closer look at the cmsdk_apb_uart.v HDL file, available in the 
Cortex-M0/M3 DesignStart, and the interrupt lines are directly assigned to 
INTSTATUS.

Additionally, it seems that the actual hardware suffers from the same issues 
described as "fixed" by this patch:

 - If you happen to be in the interrupt handler for long enough to receive
   the next character, STATE will report RX buffer full / overrun, depending
   on whether you've already read the current character from DATA.
   
   Which is fine and dandy - but if you happen to clear INTSTATUS _after_ you
   have received the next character, you've essentially cleared the next interrupt,
   so the next character won't get handled.

   This is because INTSTATUS register logic is independent from the STATE register.

 - RX / TX interrupt lines are masked by interrupt enable _before_ they are 
   registered, and the rx'd / tx'd status from the state machine
   is present only for one clock cycle.
   
   So the interrupts are ignored when they are disabled by CTRL, and they don't
   get fired at interrupt enable, regardless of the current STATE.
   
   Interestingly enough, RX / TX overrun interrupts are masked _after_ they
   are registered, so enabling the interrupt for those should trigger the 
   interrupt (as correctly modeled by the current cmsdk-apb-uart).
   
Guess I wanted my hardware emulation to be better than the actual hardware ;)

Jokes aside, I guess these issues weren't apparent in hardware because serial 
communication is usually so much slower that
 - the mcu could always clear the interrupt before the next character was 
   received.
 - the time when the rx interrupt was disabled
   was always shorter than the time required to receive the next character.

The uart emulation could be made a little more forgiving by postponing the
next character until the current interrupt is finished, but that's probably for
some other discussion.


In the end, the patch is unnecessary, as the current cmsdk-apb-uart
provides a more faithful emulation of the actual hardware, along with its warts.

It was educational, at least.

Regards, TP

