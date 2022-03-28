Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EEB4EA236
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 23:03:45 +0200 (CEST)
Received: from localhost ([::1]:39376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYwWe-0007fN-5d
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 17:03:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nYwV8-0006bT-FZ
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:02:12 -0400
Received: from [2001:41c9:1:41f::167] (port=58976
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nYwV6-0001cT-Pe
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:02:10 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nYwUN-0009Ld-A4; Mon, 28 Mar 2022 22:01:23 +0100
Message-ID: <b7b3a240-da5e-9ae6-a1e7-f887c286cdf9@ilande.co.uk>
Date: Mon, 28 Mar 2022 22:02:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-15-yangxiaojuan@loongson.cn>
 <dbb17042-55e6-b9ba-8037-0b2f9013c194@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <dbb17042-55e6-b9ba-8037-0b2f9013c194@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v7 14/29] hw/loongarch: Add support loongson3 virt
 machine type.
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/03/2022 21:49, Richard Henderson wrote:

> On 3/28/22 06:57, Xiaojuan Yang wrote:
>> +static uint64_t loongarch_qemu_read(void *opaque, hwaddr addr, unsigned size)
>> +{
>> +    uint64_t feature = 0UL;
>> +
>> +    switch (addr) {
>> +    case FEATURE_REG:
>> +        feature |= 1UL << IOCSRF_MSI | 1UL << IOCSRF_EXTIOI |
>> +                   1UL << IOCSRF_CSRIPI;
>> +        return feature ;
> 
> What's the point of the feature variable?
> 
>> +    case VENDOR_REG:
>> +        return *(uint64_t *)"Loongson";
>> +    case CPUNAME_REG:
>> +        return *(uint64_t *)"3A5000";
> 
> This is definitely wrong, as (1) it depends on host endianness, and (2) you're 
> reading 8 bytes from a 7 byte string.
> 
>> +static const MemoryRegionOps loongarch_qemu_ops = {
>> +    .read = loongarch_qemu_read,
>> +    .write = loongarch_qemu_write,
>> +    .endianness = DEVICE_LITTLE_ENDIAN,
>> +    .valid = {
>> +        .min_access_size = 4,
>> +        .max_access_size = 8,
>> +    },
>> +    .impl = {
>> +        .min_access_size = 4,
>> +        .max_access_size = 8,
>> +    },
> 
> The implementation above doesn't actually support access size 4; it only supports 8.
> It doesn't seem like this should be a io region at all, but a ROM.

Strangely enough I had a similar requirement for my q800 patches, and when I tried to 
implement a ROM memory region then the accesses didn't work as expected. I can't 
remember the exact problem however...

>> +static void loongarch_cpu_init(LoongArchCPU *la_cpu, int cpu_num)
>> +{
>> +    CPULoongArchState *env;
>> +    env = &la_cpu->env;
>> +
>> +    memory_region_init_io(&env->system_iocsr, OBJECT(la_cpu), NULL,
>> +                      env, "iocsr", UINT64_MAX);
>> +    address_space_init(&env->address_space_iocsr, &env->system_iocsr, "IOCSR");
>> +
>> +    timer_init_ns(&la_cpu->timer, QEMU_CLOCK_VIRTUAL,
>> +                  &loongarch_constant_timer_cb, la_cpu);
> 
> This timer belongs to the cpu, not the board model.
> This init belongs over in target/loongarch/.

That's probably my fault; the example of splitting the non-user parts of the CPU into 
a separate function was based upon SPARC64 and that code currently lives in 
hw/sparc64. I do recall there were some recent discussions about moving such code 
into target/* though.


ATB,

Mark.

