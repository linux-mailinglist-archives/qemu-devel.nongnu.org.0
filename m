Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E454411DBD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 19:21:48 +0200 (CEST)
Received: from localhost ([::1]:46906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMzC-0007Up-WE
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 13:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mSMta-0002ts-5b
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:16:04 -0400
Received: from [115.28.160.31] (port=40746 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mSMtW-00050h-Cp
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:15:57 -0400
Received: from [192.168.9.172] (unknown [101.88.25.142])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id C6CBA600FF;
 Tue, 21 Sep 2021 01:15:45 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632158145; bh=tvZaDMYi4B5JS3X5c1B+b0lyHOclM2A0WkGkCgjnCDI=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=XSzuHPblzq9RoAWQIla2k4avXYid2IWQxwevwc2oOxkD0KCTeCoAPBCdo9NdbJu1D
 MVcUXo5TRIgRQ29nzqIa/S/J4lrMoe1TmD2p6LwgYwnOYlXdnZ/BOz6YpJWrKuD1HV
 8kbbUShEF69axlLOLNXtd1cnq686F3irF6HXIpJU=
Message-ID: <0dca41a7-7293-a7b2-0153-d181b659b785@xen0n.name>
Date: Tue, 21 Sep 2021 01:15:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH 07/30] tcg/loongarch: Implement necessary relocation
 operations
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-8-git@xen0n.name>
 <00e99b7d-7769-bba3-355c-34cef320da1e@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <00e99b7d-7769-bba3-355c-34cef320da1e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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

Hi Richard,

On 9/20/21 22:36, Richard Henderson wrote:
> On 9/20/21 1:04 AM, WANG Xuerui wrote:
>> +static bool reloc_call(tcg_insn_unit *src_rw, const tcg_insn_unit 
>> *target)
>> +{
>> +    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
>> +    intptr_t offset = (intptr_t)target - (intptr_t)src_rx;
>> +    int32_t lo = sextreg(offset, 0, 12);
>> +    int32_t hi = offset - lo;
>> +
>> +    tcg_debug_assert((offset & 2) == 0);
>> +    if (offset == hi + lo) {
>> +        hi >>= 12;
>> +        src_rw[0] |= (hi << 5) & 0x1ffffe0; /* pcaddu12i's Sj20 imm */
>> +        lo >>= 2;
>> +        src_rw[1] |= (lo << 10) & 0x3fffc00; /* jirl's Sk16 imm */
>> +        return true;
>> +    }
>> +
>> +    return false;
>> +}
>
> This doesn't seem to belong as a "reloc".
> Certainly it doesn't seem like something that can simply be allowed to 
> fail.
>
Yes, you're right on this; on closer look at the riscv port they 
actually reused this logic once (the riscv port drops large constants to 
pool, hence need some PC-relative hackery). For LoongArch the only usage 
of this code is for generating calls, so I'll just merge this into the 
commit doing tcg_out_call, and inline if the resulting code is still 
readable.

And it's 1 a.m. here in China, so I'll be processing the other review 
comments after getting some sleep. (Today's in the middle of the 3-day 
Mid-Autumn Festival holiday here, and that's why I can work on this 
hobby project like it's $DAY_JOB!) I'll send the v2 hopefully at 
afternoon local time (tomorrow in your timezone).

>
> r~

