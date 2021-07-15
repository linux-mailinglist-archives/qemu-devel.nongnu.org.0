Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6B83CA0C4
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 16:33:41 +0200 (CEST)
Received: from localhost ([::1]:56388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m42Qm-0001NG-Ft
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 10:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1m42Mo-0000C4-W9; Thu, 15 Jul 2021 10:29:35 -0400
Received: from [201.28.113.2] (port=29944 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1m42Mn-0005Yk-4e; Thu, 15 Jul 2021 10:29:34 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 15 Jul 2021 11:29:29 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 0736280141F;
 Thu, 15 Jul 2021 11:29:28 -0300 (-03)
Subject: Re: [PATCH] target/ppc: Ease L=0 requirement on cmp/cmpi/cmpl/cmpli
 for ppc32
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210715122950.2366428-1-matheus.ferst@eldorado.org.br>
 <1ff77be7-2ecb-1f6d-974c-60e6f54fb163@eik.bme.hu>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <b067d850-e677-e64e-dfad-476b1ecc4038@eldorado.org.br>
Date: Thu, 15 Jul 2021 11:29:28 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1ff77be7-2ecb-1f6d-974c-60e6f54fb163@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Jul 2021 14:29:29.0312 (UTC)
 FILETIME=[D2180600:01D77985]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_20=-0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: richard.henderson@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/07/2021 10:14, BALATON Zoltan wrote:
> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você 
> possa confirmar o remetente e saber que o conteúdo é seguro. Em caso de 
> e-mail suspeito entre imediatamente em contato com o DTI.
> 
> On Thu, 15 Jul 2021, matheus.ferst@eldorado.org.br wrote:
>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>
>> In commit 8f0a4b6a9, we started to require L=0 for ppc32 to match what
>> The Programming Environments Manual say:
>>
>> "For 32-bit implementations, the L field must be cleared, otherwise
>> the instruction form is invalid."
>>
>> Further digging, however, shown that older CPUs have different behavior
>> concerning invalid forms. E.g.: 440 and 405 manuals say that:
>>
>> "Unless otherwise noted, the PPC440 will execute all invalid instruction
>> forms without causing an Illegal Instruction exception".
>>
>> While the PowerISA has an arguably more restrictive:
>>
>> "In general, any attempt to execute an invalid form of an instruction
>> will either cause the system illegal instruction error handler to be
>> invoked or yield boundedly undefined results."
>>
>> Finally, BALATON Zoltan (CC'ed) reported that the stricter behavior
> 
> By the way, instead of putting this in the commit message usually a
> Reported-by tag is used instead to note who reported the problem but I
> don't mind either way, just seems unusual to have it in commit message.
> 

Ah, I forgot the tag... again. I swear I'll get used to email workflow 
someday. I can send it again if someone thinks it's better.

-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

