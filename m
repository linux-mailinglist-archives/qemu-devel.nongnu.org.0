Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 004D950909C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:42:33 +0200 (CEST)
Received: from localhost ([::1]:35042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGDg-00068c-VM
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nhFDN-0004SE-Qa; Wed, 20 Apr 2022 14:38:11 -0400
Received: from [187.72.171.209] (port=19466 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nhFDL-0005yk-Eh; Wed, 20 Apr 2022 14:38:08 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 20 Apr 2022 15:38:02 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id EDAB7800059;
 Wed, 20 Apr 2022 15:38:01 -0300 (-03)
Message-ID: <5c40bd27-3dc6-0545-aa8e-246998bcbfe4@eldorado.org.br>
Date: Wed, 20 Apr 2022 15:38:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v3 1/5] ppc64: Add semihosting support
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
 <20220418191100.270334-2-leandro.lupori@eldorado.org.br>
 <1d3aaac9-5aa1-9ff9-6b3c-5109ad7f4361@kaod.org>
 <92025187-7b4a-f8da-2204-d45160f9d711@eldorado.org.br>
 <9c037b8d-04d3-4c5b-cd61-f5a96dd40e28@linaro.org>
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
In-Reply-To: <9c037b8d-04d3-4c5b-cd61-f5a96dd40e28@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 20 Apr 2022 18:38:02.0340 (UTC)
 FILETIME=[C433C240:01D854E5]
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
Cc: danielhb413@gmail.com, groug@kaod.org, Nicholas Piggin <npiggin@gmail.com>,
 pbonzini@redhat.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/22 15:18, Richard Henderson wrote:
> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você 
> possa confirmar o remetente e saber que o conteúdo é seguro. Em caso de 
> e-mail suspeito entre imediatamente em contato com o DTI.
> 
> On 4/20/22 10:54, Leandro Lupori wrote:
>> On 4/18/22 17:22, Cédric Le Goater wrote:
>>
>>>> diff --git a/semihosting/arm-compat-semi.c 
>>>> b/semihosting/arm-compat-semi.c
>>>> index 7a51fd0737..e1279c316c 100644
>>>> --- a/semihosting/arm-compat-semi.c
>>>> +++ b/semihosting/arm-compat-semi.c
>>>> @@ -268,6 +268,31 @@ common_semi_sys_exit_extended(CPUState *cs, int 
>>>> nr)
>>>>
>>>>   #endif
>>>>
>>>> +#ifdef TARGET_PPC64
>>>
>>> This PPC ifdef in an ARM file seems wrong.
>>>
>>> The rest looks OK.
>>
>> IIUC, arm-compat-semi.c is not an ARM specific file, but it's used by 
>> targets that
>> implement ARM-compatible semihosting. It's currently used by ARM and 
>> RISC-V and both use
>> target ifdefs in small parts of this file.
> 
> It would be nice to split these out to target/arch/arm-compat-semi.h or 
> something akin.
> 

Ah, ok, I'll try to move the target specific parts to their own header 
files then.

Thanks,
Leandro

> 
> r~


