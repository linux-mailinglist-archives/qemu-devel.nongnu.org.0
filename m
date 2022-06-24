Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA33559A4F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 15:25:44 +0200 (CEST)
Received: from localhost ([::1]:57054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4jJd-0004rF-IM
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 09:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o4jGS-0003ur-Vr; Fri, 24 Jun 2022 09:22:25 -0400
Received: from [187.72.171.209] (port=9380 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o4jGP-0001cj-Vy; Fri, 24 Jun 2022 09:22:23 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 24 Jun 2022 10:22:10 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 8372780031F;
 Fri, 24 Jun 2022 10:22:10 -0300 (-03)
Message-ID: <dde4feea-c16d-3c0d-b41e-28bec7e2de95@eldorado.org.br>
Date: Fri, 24 Jun 2022 10:22:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/3] target/ppc: Improve Radix xlate level validation
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220620202704.78978-1-leandro.lupori@eldorado.org.br>
 <20220620202704.78978-3-leandro.lupori@eldorado.org.br>
 <87h74daf28.fsf@linux.ibm.com>
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
In-Reply-To: <87h74daf28.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 24 Jun 2022 13:22:10.0875 (UTC)
 FILETIME=[691970B0:01D887CD]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/22 18:21, Fabiano Rosas wrote:
> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você possa confirmar o remetente e saber que o conteúdo é seguro. Em caso de e-mail suspeito entre imediatamente em contato com o DTI.
> 
> Leandro Lupori <leandro.lupori@eldorado.org.br> writes:
> 
>> Check if the number and size of Radix levels are valid on
>> POWER9/POWER10 CPUs, according to the supported Radix Tree
>> Configurations described in their User Manuals.
>>
>> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
>> ---
>>   target/ppc/mmu-radix64.c | 36 +++++++++++++++++++++++++++++-------
>>   1 file changed, 29 insertions(+), 7 deletions(-)
>>
>> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
>> index 9a8a2e2875..2f0bcbfe2e 100644
>> --- a/target/ppc/mmu-radix64.c
>> +++ b/target/ppc/mmu-radix64.c
>> @@ -236,13 +236,31 @@ static void ppc_radix64_set_rc(PowerPCCPU *cpu, MMUAccessType access_type,
>>       }
>>   }
>>
>> +static bool ppc_radix64_is_valid_level(int level, int psize, uint64_t nls)
> 
> I wonder if we should take the time to make this per-CPU now to prepare
> for any future CPU that supports a different layout.
> 

The downside would be that we would already take a performance hit by 
calling this function through a CPU class pointer. It would also prevent 
compiler optimizations that are possible with local static functions.

I can leave a comment in ppc_radix64_is_valid_level, suggesting the 
addition of a new CPU class method, if a new CPU that supports other 
Radix configurations is added (e.g., Microwatt).

Thanks,
Leandro

