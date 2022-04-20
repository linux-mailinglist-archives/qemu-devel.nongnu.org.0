Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF61508FDF
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:57:24 +0200 (CEST)
Received: from localhost ([::1]:42922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFVy-0007NV-WD
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nhElp-00048p-8E; Wed, 20 Apr 2022 14:09:42 -0400
Received: from [187.72.171.209] (port=62142 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nhEln-0001de-FS; Wed, 20 Apr 2022 14:09:40 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 20 Apr 2022 15:09:35 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id CD84A800059;
 Wed, 20 Apr 2022 15:09:34 -0300 (-03)
Message-ID: <33285ea7-8dba-3e24-d241-0ff541a83b12@eldorado.org.br>
Date: Wed, 20 Apr 2022 15:09:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v3 1/5] ppc64: Add semihosting support
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
 <20220418191100.270334-2-leandro.lupori@eldorado.org.br>
 <1d3aaac9-5aa1-9ff9-6b3c-5109ad7f4361@kaod.org>
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
In-Reply-To: <1d3aaac9-5aa1-9ff9-6b3c-5109ad7f4361@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 20 Apr 2022 18:09:35.0230 (UTC)
 FILETIME=[CAAF71E0:01D854E1]
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 Nicholas Piggin <npiggin@gmail.com>, pbonzini@redhat.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/22 17:22, Cédric Le Goater wrote:
> On 4/18/22 21:10, Leandro Lupori wrote:
>> Add semihosting support for PPC64. This implementation is
>> based on the standard for ARM semihosting version 2.0, as
>> implemented by QEMU and documented in
>>
>>      https://github.com/ARM-software/abi-aa/releases
>>
>> The PPC64 specific differences are the following:
>>
>> Semihosting Trap Instruction: sc 7
>> Operation Number Register: r3
>> Parameter Register: r4
>> Return Register: r3
>> Data block field size: 64 bits
> 
> 'sc' is a good way to implement semi hosting but we should make sure
> that it is not colliding with future extensions, at least with the
> next POWERPC processor. Is that the case ? if not, then the lev could
> be reserved.
> 

Power ISA 3.1B says that LEV values greater that 2 are reserved.
Level 2 is the ultravisor, so I assumed that level 7 was far enough from 
current max level. I don't know if POWER11 will introduce new privilege 
levels. Is this info publicly available somewhere? Or do you have a 
better level in mind to use instead?

> I think the part adding POWERPC_EXCP_SEMIHOST should be proposed in a
> separate patch.
> 

Ok, I can move it to a separate patch. That would be all changes in 
target/ppc/cpu.h and target/ppc/excp_helper.c, right?

