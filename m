Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B433F50907B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:29:42 +0200 (CEST)
Received: from localhost ([::1]:32942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhG1F-0002Fa-QH
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nhFHl-0002tj-RB; Wed, 20 Apr 2022 14:42:41 -0400
Received: from [187.72.171.209] (port=15966 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nhFHk-0006cy-BX; Wed, 20 Apr 2022 14:42:41 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 20 Apr 2022 15:42:37 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 2D4CB800059;
 Wed, 20 Apr 2022 15:42:37 -0300 (-03)
Message-ID: <298119a5-c25d-27b6-904a-152398b27fe8@eldorado.org.br>
Date: Wed, 20 Apr 2022 15:42:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v3 2/5] ppc64: Fix semihosting on ppc64le
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
 <20220418191100.270334-3-leandro.lupori@eldorado.org.br>
 <bbf99e06-9faf-b1c9-0b1e-7e1fbf992f4a@linaro.org>
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
In-Reply-To: <bbf99e06-9faf-b1c9-0b1e-7e1fbf992f4a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 20 Apr 2022 18:42:37.0556 (UTC)
 FILETIME=[683E6340:01D854E6]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, groug@kaod.org, clg@kaod.org, pbonzini@redhat.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/22 20:36, Richard Henderson wrote:
> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você 
> possa confirmar o remetente e saber que o conteúdo é seguro. Em caso de 
> e-mail suspeito entre imediatamente em contato com o DTI.
> 
> On 4/18/22 12:10, Leandro Lupori wrote:
>> +static inline uint64_t sh_swap64(CPUArchState *env, uint64_t val)
>> +{
>> +    return msr_le ? val : tswap64(val);
>> +}
>> +
>> +static inline uint32_t sh_swap32(CPUArchState *env, uint32_t val)
>> +{
>> +    return msr_le ? val : tswap32(val);
>> +}
> 
> That doesn't work -- tswap itself is conditional.
> 
> You want
> 
>    return msr_le ? le32_to_cpu(x) : be32_to_cpu(x);
> 
> etc.  One of them will be a nop, and the other will bswap.
> 

Right, I'll make this change.

Thanks,
Leandro

> 
> r~


