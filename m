Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6976F654EED
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 11:03:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8es8-0002Yj-OP; Fri, 23 Dec 2022 05:01:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8erx-0002Te-O3
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 05:01:39 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8erv-0002na-Ka
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 05:01:37 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 o5-20020a05600c510500b003d21f02fbaaso5807239wms.4
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 02:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BKFBfPaCeeWfAocEVMdKGtVdW45F52vbPg01rtr5GTo=;
 b=RrqHR8naqUKINq7Z9GV8lJnnASM8ugdzSf4pUC7Zf1/qyj4rid/Ttw0fQciFjZlpy2
 XDWcBEi05hWKT1U4T4JPafr5Tyk4a6QyAYq8NDoBnOWlbDRVUV+pf38jXOvye2bZkimH
 1AbxpEmNtXp3JtXLisrEwjro2pbAytfsK4Hu9F1m8f3XqF4miaKyXbRbJDyv5IMvEiGi
 LyR3TMm4cQr5Mng5+Q5a6UenWXIacVFBdRFWm3OsWdW50vxq9/CAKyBZDHlFfgTq4FFs
 N0Y5+RfOCHWjhmke2I3pagPPRBGkA4KU3v59T08bc/K0O/3CaLn+KB3+3DcjQDB1Ofwe
 1rCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BKFBfPaCeeWfAocEVMdKGtVdW45F52vbPg01rtr5GTo=;
 b=tZJV65mGmksqQk8n4z05GF3rkhpH61b+kUmGjM4OvEBW+RHYB0b8MjMjGeRTxMz8m8
 6U4xSKO2RCS2cmM+XWVnF+AfHVW/ZY4mXpJ2vPVU/Rp2bMHknmh3ZGW1MZ/f0h4Tkwvt
 32CsNcmCfEWjN0QULto2YL0rTDxzSzTKL/FRc8m7pMFO1WrTNRmbw3QhcOfbliRmcgUz
 5Q26NRq+ak+HRkRvg/HWnErW/kNAxVtmxmwEe/5+WSn2uVLml0+yTK6tfiUIRQfMeQsH
 OyG7NicSKgDhs47iWG7lNSCZpHEyflOHfHj9ERmD7u7nHEjXl+I7Rfz8hZu3i+HaCFDk
 RP8w==
X-Gm-Message-State: AFqh2kpJgeMyDDT+NXUzhWd/kgfc9z66zY0mGLh0nPOn+XRY7Ac2JVtH
 Aaxls/bpedRFGFDQ0PLZVj9OEQ==
X-Google-Smtp-Source: AMrXdXsqEDwOnC6JSUE0h4aU1IHbITFBD6S0fQMWGEUFRK3PqMAF1cLMM8MR5fq+X0PgiTKsOkv0jA==
X-Received: by 2002:a05:600c:228b:b0:3d2:37a4:222a with SMTP id
 11-20020a05600c228b00b003d237a4222amr9517233wmf.38.1671789692795; 
 Fri, 23 Dec 2022 02:01:32 -0800 (PST)
Received: from [192.168.27.175] (160.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.160]) by smtp.gmail.com with ESMTPSA id
 ay39-20020a05600c1e2700b003cfa80443a0sm3860543wmb.35.2022.12.23.02.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Dec 2022 02:01:32 -0800 (PST)
Message-ID: <53afcdf7-8bb6-0544-7a98-3dd6dabf7e8d@linaro.org>
Date: Fri, 23 Dec 2022 11:01:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH 5/6] hw/arm/xilinx_zynq: Remove tswap32() calls and
 constify smpboot[]
Content-Language: en-US
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, Tyrone Ting <kfting@nuvoton.com>
References: <20221222215549.86872-1-philmd@linaro.org>
 <20221222215549.86872-6-philmd@linaro.org> <Y6UmfCkKwD463kqQ@toto>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y6UmfCkKwD463kqQ@toto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 23/12/22 04:54, Edgar E. Iglesias wrote:
> On Thu, Dec 22, 2022 at 10:55:48PM +0100, Philippe Mathieu-Daudé wrote:
>> ARM CPUs fetch instructions in little-endian.
>>
>> smpboot[] encoded instructions are written in little-endian.
>>
>> We call tswap32() on the array. tswap32 function swap a 32-bit
>> value if the target endianness doesn't match the host one.
>> Otherwise it is a NOP.
>>
>> * On a little-endian host, the array is stored as it. tswap32()
>>    is a NOP, and the vCPU fetches the instructions as it, in
>>    little-endian.
>>
>> * On a big-endian host, the array is stored as it. tswap32()
>>    swap the instructions to little-endian, and the vCPU fetches
>>    the instructions as it, in little-endian.
>>
>> Using tswap() on system emulation is a bit odd: while the target
>> particularities might change the system emulation, the host ones
>> (such its endianness) shouldn't interfere.
>>
>> We can simplify by using const_le32() to always store the
>> instructions in the array in little-endian, removing the need
>> for the dubious tswap().
> 
> 
> Hi Philippe,
> 
> 
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/arm/xilinx_zynq.c | 27 ++++++++++++---------------
>>   1 file changed, 12 insertions(+), 15 deletions(-)
>>
>> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
>> index 3190cc0b8d..4316143b71 100644
>> --- a/hw/arm/xilinx_zynq.c
>> +++ b/hw/arm/xilinx_zynq.c
>> @@ -71,6 +71,11 @@ static const int dma_irqs[8] = {
>>   
>>   #define ZYNQ_SDHCI_CAPABILITIES 0x69ec0080  /* Datasheet: UG585 (v1.12.1) */
>>   
>> +struct ZynqMachineState {
>> +    MachineState parent;
>> +    Clock *ps_clk;
>> +};
>> +
>>   #define ARMV7_IMM16(x) (extract32((x),  0, 12) | \
>>                           extract32((x), 12,  4) << 16)
>>   
>> @@ -79,29 +84,21 @@ static const int dma_irqs[8] = {
>>    */
>>   
>>   #define SLCR_WRITE(addr, val) \
>> -    0xe3001000 + ARMV7_IMM16(extract32((val),  0, 16)), /* movw r1 ... */ \
>> -    0xe3401000 + ARMV7_IMM16(extract32((val), 16, 16)), /* movt r1 ... */ \
>> -    0xe5801000 + (addr)
>> -
>> -struct ZynqMachineState {
>> -    MachineState parent;
>> -    Clock *ps_clk;
>> -};
>> +    cpu_to_le32(0xe3001000 + ARMV7_IMM16(extract32((val),  0, 16))), /* movw r1 ... */ \
>> +    cpu_to_le32(0xe3401000 + ARMV7_IMM16(extract32((val), 16, 16))), /* movt r1 ... */ \
> 
> Looks like the callers all pass in constants, perhaps const_le32 should be used everywhere or am I missing something?

extract32() is a function. I agree we can rewrite this macro to remove
it, I was simply lazy ;) I'll do for v2 so the array will be const.

> 
> 
>> +    const_le32(0xe5801000 + (addr))


