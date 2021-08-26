Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB38A3F7FEF
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 03:33:31 +0200 (CEST)
Received: from localhost ([::1]:53090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJ4Go-0005Kd-BD
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 21:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mJ4Cj-0003rz-Km; Wed, 25 Aug 2021 21:29:17 -0400
Received: from [201.28.113.2] (port=62264 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mJ4Cd-0002CY-GJ; Wed, 25 Aug 2021 21:29:13 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 25 Aug 2021 22:28:13 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id AC7F18012CD;
 Wed, 25 Aug 2021 22:28:13 -0300 (-03)
Subject: Re: [PATCH 0/2] target/ppc: Fix vextu[bhw][lr]x on big endian hosts
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210824201105.2303789-1-matheus.ferst@eldorado.org.br>
 <1f5fe437-4839-c225-0859-91ccfa7532af@ilande.co.uk>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <11218ef5-ddc8-b5b4-96bf-6df30b3ba50f@eldorado.org.br>
Date: Wed, 25 Aug 2021 22:28:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1f5fe437-4839-c225-0859-91ccfa7532af@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 26 Aug 2021 01:28:14.0023 (UTC)
 FILETIME=[A3980D70:01D79A19]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_20=-0.001, NICE_REPLY_A=-2.24,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/08/2021 09:55, Mark Cave-Ayland wrote:
> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você 
> possa confirmar o remetente e saber que o conteúdo é seguro. Em caso de 
> e-mail suspeito entre imediatamente em contato com o DTI.
> 
> On 24/08/2021 21:11, matheus.ferst@eldorado.org.br wrote:
> 
>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>
>> The definition of struct Int128 is currently independent of the host
>> endianness, causing different results when using the member s128 of
>> union ppc_vsr_t in big-endian builds with CONFIG_INT128 or
>> !CONFIG_INT128.
>>
>> The only PPC instructions that seem to be affected by this issue are the
>> "Vector Extract Unsigned Byte/Halfword/Word to GPR using GPR-specified
>> Left/Right-Index." Even on builds with Int128 support, however, their
>> helpers give the wrong result on big-endian hosts.
>>
>> The first patch in this series changes the definition of struct Int128
>> to allow its use in the ppc_vsr_t union. The second patch fixes the
>> helper definition.
>>
>> Matheus Ferst (2):
>>    include/qemu/int128.h: define struct Int128 according to the host
>>      endianness
>>    target/ppc: fix vextu[bhw][lr]x helpers
>>
>>   include/qemu/int128.h   | 19 ++++++++++++-------
>>   target/ppc/int_helper.c | 38 ++++++++++----------------------------
>>   2 files changed, 22 insertions(+), 35 deletions(-)
> 
> Hi Matheus,
> 
> Slightly unrelated to this patchset, however I see you've managed to 
> make some good
> efforts in consolidating the functionality between big-endian and 
> little-endian host
> systems.
> 
> When I first worked on adding host vector support for PPC I noticed 
> there were some
> further places in target/ppc/int_helper.c that could be improved from 
> accessing
> ppc_avr_t fields such as u64 directly and instead using the relevant 
> Vsr*() macros.
> 
> If you feel suitably motivated, it would be amazing to see more patches 
> to help this
> further along: basically look in target/ppc/int_helper.c for individual 
> elements such
> as u64 (and also the VECTOR_FOR_INORDER_I macro) and determine which 
> ones are better
> replaced by the relevant Vsr*() macro.
> 
> 
> ATB,
> 
> Mark.

Hi Mark,

That would be a nice change. Our efforts are currently on PowerISA v3.1 
instructions, but I'll try to change that in helpers of things we move 
to decodetree. After completing the new instructions, I can give a shot 
in a Vsr*() patchset.

-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

