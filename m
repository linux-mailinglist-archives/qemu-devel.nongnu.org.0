Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD17504E12
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 10:59:44 +0200 (CEST)
Received: from localhost ([::1]:54650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngNEV-0008Ev-8r
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 04:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ngNCP-0007Id-RB
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 04:57:33 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:55812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ngNCO-0001o6-Ab
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 04:57:33 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ngNBW-000A4c-84; Mon, 18 Apr 2022 09:56:38 +0100
Message-ID: <9f27b53d-d2bf-1fb5-3a46-c910a34d5e3d@ilande.co.uk>
Date: Mon, 18 Apr 2022 09:57:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-36-yangxiaojuan@loongson.cn>
 <6d62ce6d-acc2-b07e-71ac-dee03bbfd22f@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <6d62ce6d-acc2-b07e-71ac-dee03bbfd22f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v1 35/43] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
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

On 18/04/2022 04:48, Richard Henderson wrote:

> On 4/15/22 02:40, Xiaojuan Yang wrote:
>> +        memory_region_init(&s->mmio[cpu], OBJECT(s),
>> +                           "loongarch_extioi", EXTIOI_SIZE);
>> +
>> +        memory_region_init_io(&s->mmio_nodetype[cpu], OBJECT(s),
>> +                              &extioi_nodetype_ops, s,
>> +                              EXTIOI_LINKNAME(.nodetype),
>> +                              IPMAP_OFFSET - APIC_BASE);
>> +        memory_region_add_subregion(&s->mmio[cpu], 0, &s->mmio_nodetype[cpu]);
>> +
>> +        memory_region_init_io(&s->mmio_ipmap_enable[cpu], OBJECT(s),
>> +                              &extioi_ipmap_enable_ops, s,
>> +                              EXTIOI_LINKNAME(.ipmap_enable),
>> +                              BOUNCE_OFFSET - IPMAP_OFFSET);
>> +        memory_region_add_subregion(&s->mmio[cpu], IPMAP_OFFSET - APIC_BASE,
>> +                                    &s->mmio_ipmap_enable[cpu]);
>> +
>> +        memory_region_init_io(&s->mmio_bounce_coreisr[cpu], OBJECT(s),
>> +                              &extioi_bounce_coreisr_ops, s,
>> +                              EXTIOI_LINKNAME(.bounce_coreisr),
>> +                              COREMAP_OFFSET - BOUNCE_OFFSET);
>> +        memory_region_add_subregion(&s->mmio[cpu], BOUNCE_OFFSET - APIC_BASE,
>> +                                    &s->mmio_bounce_coreisr[cpu]);
>> +
>> +        memory_region_init_io(&s->mmio_coremap[cpu], OBJECT(s),
>> +                              &extioi_coremap_ops, s,
>> +                              EXTIOI_LINKNAME(.coremap),
>> +                              EXTIOI_COREMAP_END);
>> +        memory_region_add_subregion(&s->mmio[cpu], COREMAP_OFFSET - APIC_BASE,
>> +                                    &s->mmio_coremap[cpu]);
> 
> Why are these separate memory regions, instead of one region?  They're certainly 
> described in a single table in section 11.2 of the 3A5000 manual...

The reason it was done like this is because there were different access sizes in the 
relevant _ops definitions. Certainly when I looked at the patches previously I wasn't 
able to easily see how these could be consolidated without digging deeper into the 
documentation.


ATB,

Mark.

