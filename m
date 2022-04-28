Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A891F512D87
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 09:57:49 +0200 (CEST)
Received: from localhost ([::1]:53826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njz24-00047S-Ps
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 03:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1njyl7-0003aX-QC
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 03:40:17 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1njyl6-0003LY-8Z
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 03:40:17 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1njykC-0002UY-CS; Thu, 28 Apr 2022 08:39:20 +0100
Message-ID: <662ce719-93f3-95a2-b6a9-4767fca386e3@ilande.co.uk>
Date: Thu, 28 Apr 2022 08:40:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
 <20220425091027.2877892-34-yangxiaojuan@loongson.cn>
 <1d26cacb-f31d-7627-e207-56b05629e714@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <1d26cacb-f31d-7627-e207-56b05629e714@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 33/43] hw/intc: Add LoongArch ls7a msi interrupt
 controller support(PCH-MSI)
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/04/2022 03:01, Richard Henderson wrote:

> On 4/25/22 02:10, Xiaojuan Yang wrote:
>> +static void loongarch_msi_mem_write(void *opaque, hwaddr addr,
>> +                                    uint64_t val, unsigned size)
>> +{
>> +    LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(opaque);
>> +    int irq_num = val & 0xff;
>> +
>> +    trace_loongarch_msi_set_irq(irq_num);
>> +    qemu_set_irq(s->pch_msi_irq[irq_num - PCH_PIC_IRQ_NUM], 1);
>> +}
> 
> This needs to be bounded properly -- irq_num >= PCH_PIC_IRQ_NUM -- since 'val' is 
> under the control of the guest.
> 
> 
>> +static void pch_msi_irq_handler(void *opaque, int irq, int level)
>> +{
>> +    LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(opaque);
>> +
>> +    qemu_set_irq(s->pch_msi_irq[irq], level);
>> +}
> 
> You should be able to connect the gpio lines directly, rather than having a 
> pass-through function like this.  I think this is sysbus_pass_irq.

The *_pass() functions don't work for this case because they directly alias the gpios 
onto another device i.e. an input still remains an input on the target device, rather 
than becoming an output. So I think this is still required here.

However your comment above about PCH_PIC_IRQ_NUM has made me realise that it is 
possible to improve the wiring of the IRQs here, so I'll follow up with replies on a 
few more patches separately.


ATB,

Mark.

