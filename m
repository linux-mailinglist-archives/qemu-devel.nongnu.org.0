Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B2C509040
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:19:13 +0200 (CEST)
Received: from localhost ([::1]:39308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFr6-0002Sc-If
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nhEws-0005sk-VG; Wed, 20 Apr 2022 14:21:07 -0400
Received: from [187.72.171.209] (port=11215 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nhEwl-0003R8-Lw; Wed, 20 Apr 2022 14:21:01 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 20 Apr 2022 15:20:56 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id A626C800059;
 Wed, 20 Apr 2022 15:20:55 -0300 (-03)
Message-ID: <5a99283a-8d7c-e6d5-30fd-b148a2b59ead@eldorado.org.br>
Date: Wed, 20 Apr 2022 15:20:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v3 1/5] ppc64: Add semihosting support
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
 <20220418191100.270334-2-leandro.lupori@eldorado.org.br>
 <CAFEAcA8YzC-gFCv73S-5uxPvcUP=9TFP50xsi44L8Gm-B4ZScg@mail.gmail.com>
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
In-Reply-To: <CAFEAcA8YzC-gFCv73S-5uxPvcUP=9TFP50xsi44L8Gm-B4ZScg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 20 Apr 2022 18:20:56.0017 (UTC)
 FILETIME=[60774C10:01D854E3]
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, pbonzini@redhat.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 06:26, Peter Maydell wrote:
> On Mon, 18 Apr 2022 at 20:15, Leandro Lupori
> <leandro.lupori@eldorado.org.br> wrote:
>>
>> Add semihosting support for PPC64. This implementation is
>> based on the standard for ARM semihosting version 2.0, as
>> implemented by QEMU and documented in
>>
>>      https://github.com/ARM-software/abi-aa/releases
>>
>> The PPC64 specific differences are the following:
>>
>> Semihosting Trap Instruction: sc 7
>> Operation Number Register: r3
>> Parameter Register: r4
>> Return Register: r3
>> Data block field size: 64 bits
> 
> Where is the independent specification which defines that
> this is the ABI for PPC semihosting? You should provide the
> URL for that in a comment somewhere.
> 

AFAIK, there is no official PPC semihosting specification. Would it be 
ok to just document it somewhere else, e.g. GitHub, as an unofficial 
specification?

Thanks,
Leandro

> thanks
> -- PMM


