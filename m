Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8A543C9A1
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 14:28:14 +0200 (CEST)
Received: from localhost ([::1]:47520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfi2P-0006EG-62
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 08:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mfhQu-0005Qs-RC; Wed, 27 Oct 2021 07:49:28 -0400
Received: from [201.28.113.2] (port=30515 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mfhQt-0000H8-1R; Wed, 27 Oct 2021 07:49:28 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 27 Oct 2021 08:49:20 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 1992680045D;
 Wed, 27 Oct 2021 08:49:20 -0300 (-03)
Subject: Re: [PATCH 16/33] target/ppc: Implement Vector Insert Word from GPR
 using Immediate insns
To: "Paul A. Clarke" <pc@us.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-17-matheus.ferst@eldorado.org.br>
 <4a9f95b2-3f9e-f835-0315-7632a5e6996a@linaro.org>
 <2f6cca6e-6a3e-7341-7d92-4b1b4708ee1e@eldorado.org.br>
 <f41b24cd-9ce5-4836-9c77-ea4edaacb021@linaro.org>
 <20211026184526.GB645383@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <9d93e9d3-0bfb-3a80-fbf2-1113324b8139@eldorado.org.br>
Date: Wed, 27 Oct 2021 08:49:19 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026184526.GB645383@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 27 Oct 2021 11:49:20.0663 (UTC)
 FILETIME=[ADDA8A70:01D7CB28]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.847,
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
Cc: lucas.castro@eldorado.org.br, qemu-devel@nongnu.org, groug@kaod.org,
 luis.pires@eldorado.org.br, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/10/2021 15:45, Paul A. Clarke wrote:
> On Tue, Oct 26, 2021 at 09:58:15AM -0700, Richard Henderson wrote:
>> On 10/26/21 7:33 AM, Matheus K. Ferst wrote:
>>> It says that "if UIM is greater than N, the result is undefined." My
>>> first read was also that the outcome is "boundedly undefined," but I
>>> guess it can be understood as "the resulting value in VRT will be
>>> undefined" (like when the pseudo-code uses "VRT <- 0xUUUU_..._UUUU"), in
>>> which case this patch and Mambo are correct.
>>
>> If the reference simulator is fine with it, I am too.
> 
> FYI, it appears that the hardware does a partial insert, per an experiment:
> ```
> 1: x/i $pc
> => 0x100006d4 <foo+4>:  vinsw   v2,r3,14
> (gdb) p $v2.v4_int32
> $1 = {0x1, 0x1, 0x1, 0x1}
> (gdb) p $r3
> $2 = 0x12345678
> (gdb) nexti
> (gdb) p $v2.v4_int32
> $3 = {0x1234, 0x1, 0x1, 0x1}
> ````

Thanks for this test Paul. I'll add a comment about the hardware behavior.

-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

