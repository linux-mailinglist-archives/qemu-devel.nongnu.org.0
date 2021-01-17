Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDB12F9608
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 23:59:13 +0100 (CET)
Received: from localhost ([::1]:59608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1H0q-0004As-0B
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 17:59:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1H06-0003kO-Ey
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 17:58:26 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1H04-0002bL-T9
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 17:58:26 -0500
Received: by mail-wm1-x335.google.com with SMTP id h17so11825262wmq.1
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 14:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7cBHdC/+R0T2KGN8AXrxsjveBbbd3MdwpG0d7QlpvBY=;
 b=Ltp/eVINxWZEdEpePLFM7MGljXK35L0bUIBMb+6GhPjwBiziSvCLp4jD6upEvM8w21
 2q26BT8IM2yfv5xIC4dAZr7Nhp546oZRcdg41PyP+o1wEf6VcCy5YEGklfwtZfjZ99qS
 6JK/NIoSQUp4ze9jlMWu37VcbKvj5I3/mz1Nxk2uidrsbDj4hhNnjcX9Km847Qk0/Mmd
 KcG5UQF0vPws0bW5GR7GC1Ay9LLqk0kR06FeEQIRK+MLkVjBWBFY5eSmnLyWge2C3tb2
 rR5d8CY6oq+yl56KlwwpntecTin9dF031UqrZgG1MgYOBa+nBvhksR1v/APiRrZKIvMJ
 vkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7cBHdC/+R0T2KGN8AXrxsjveBbbd3MdwpG0d7QlpvBY=;
 b=l57cEW1O4eup0+Y4XChnyvpP9PQSSwJNwmtZ/0RU1KuSx+2r2dxx/K9rwR/3nDSbuK
 h2uxlo5vPsJl5LNL8jTld1V8AUoxiCKeagwxuhyHztxT9W+On1yjh1XNGRJIO3npGue9
 Z0BnXvQoJ6MeBevfK+SxUoB6tW5L3W77t4LAuVk3DFOzy5JketZHpcLGTJsDWJwyhit9
 FD51p9opTiwabPkKV+PMirSm3/R+xf/t1HCVlwE8mgOMBUVuJsj1vwX9ZUQzYQtTWlrO
 Y+LIZGTm/GPrEedOzcdkIr6AHBm9ElpRoyrnoZLRR+ehO5gFN8jMpLRjSXfC/pN39mIR
 NHdw==
X-Gm-Message-State: AOAM5318vmxWee5g25eigrXYwnDV9O91zcGo6ROzIGVBDrxN2Ijob/mt
 +nYEiPbVWA1/ogwlYmIXvlM=
X-Google-Smtp-Source: ABdhPJxXwyFxPqGjwz0BEuYQ4CdBsW5+BcIvxu9KC61NwJhKv63BIcNItTgCPR0FXSAKG6GOn+g1NA==
X-Received: by 2002:a05:600c:4e92:: with SMTP id
 f18mr3381357wmq.126.1610924303439; 
 Sun, 17 Jan 2021 14:58:23 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id m17sm27583758wrn.0.2021.01.17.14.58.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jan 2021 14:58:22 -0800 (PST)
Subject: Re: [PATCH v2 2/2] hw/mips/loongson3_virt: Add TCG SMP support
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210114013147.92962-1-jiaxun.yang@flygoat.com>
 <20210114013147.92962-3-jiaxun.yang@flygoat.com>
 <8f1d33ac-159f-f4af-47b9-6563a3809c91@amsat.org>
Message-ID: <a2b9a67a-33b2-961e-c8ca-4eb2b1a97226@amsat.org>
Date: Sun, 17 Jan 2021 23:58:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <8f1d33ac-159f-f4af-47b9-6563a3809c91@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.252,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/21 11:46 PM, Philippe Mathieu-Daudé wrote:
> Hi Jiaxun,
> 
> On 1/14/21 2:31 AM, Jiaxun Yang wrote:
>> loongson3_virt has KVM SMP support in kenrel.
>> This patch adds TCG SMP support by enable IPI controller
>> for machine.
>>
>> Note that TCG SMP can only support up to 4 CPUs as we
>> didn't implement multi-node support.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>  hw/mips/loongson3_bootp.h |  1 +
>>  hw/mips/loongson3_virt.c  | 20 +++++++++++++++++++-
>>  hw/mips/Kconfig           |  1 +
>>  3 files changed, 21 insertions(+), 1 deletion(-)
...
>> +        if (!kvm_enabled()) {
>> +            /* IPI is handled by kernel for KVM */
>> +            DeviceState *ipi;
>> +            ipi = qdev_new(TYPE_LOONGSON_IPI);
>> +            sysbus_realize_and_unref(SYS_BUS_DEVICE(ipi), &error_fatal);
>> +            sysbus_mmio_map(SYS_BUS_DEVICE(ipi), 0,
>> +                            virt_memmap[VIRT_IPIS].base + IPI_REG_SPACE * i);
>> +            sysbus_connect_irq(SYS_BUS_DEVICE(ipi), 0, cpu->env.irq[6]);
> 
> While this works, it is very fragile. If multiple IRQs share the same
> CPU pin, the better way is to use an OR gate (modeled as TYPE_OR_IRQ
> device).

Doh I misread, I thought it was a signal from a core to the IPI, but
this is a signal from each IPI to its CPU core, so this is good.

> 
>>          }
>>  
>>          for (ip = 0; ip < 4 ; ip++) {
>>              int pin = i * 4 + ip;
>>              sysbus_connect_irq(SYS_BUS_DEVICE(liointc),
>>                                 pin, cpu->env.irq[ip + 2]);
> 
> Oops, we already use it without OR gate :/

Ditto, I misread, code is correct (4 outputs from LIOINTC to
4 input of CPU core).

> 
> Regards,
> 
> Phil.
> 

