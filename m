Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF3238CC23
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 19:28:53 +0200 (CEST)
Received: from localhost ([::1]:52564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk8x9-0003qS-SY
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 13:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lk8ts-0002ml-F2; Fri, 21 May 2021 13:25:28 -0400
Received: from [201.28.113.2] (port=55199 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lk8tq-0002Pm-S8; Fri, 21 May 2021 13:25:28 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 21 May 2021 14:25:21 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 6524F8013E3;
 Fri, 21 May 2021 14:25:21 -0300 (-03)
Subject: Re: [PATCH v5 23/23] target/ppc: Move cmp/cmpi/cmpl/cmpli to
 decodetree
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-24-matheus.ferst@eldorado.org.br>
 <ef3bb078-8afe-2159-f23d-0d8324c4e3f7@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <bf00a04b-33b6-e067-ead9-e8707f186c02@eldorado.org.br>
Date: Fri, 21 May 2021 14:25:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <ef3bb078-8afe-2159-f23d-0d8324c4e3f7@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 May 2021 17:25:21.0753 (UTC)
 FILETIME=[471E7C90:01D74E66]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: lagarcia@br.ibm.com, luis.pires@eldorado.org.br, f4bug@amsat.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/05/2021 07:12, Richard Henderson wrote:
> On 5/17/21 3:50 PM, matheus.ferst@eldorado.org.br wrote:
>> +    if(a->l && (ctx->insns_flags & PPC_64B)) {
> 
> Space after IF.
> > If I look back to the 6xx manual, I see
> 
>    NOTE: If L = 1, the instruction form is invalid.
> 
> The fact that we're allowing L=1 for ppc32 is an existing bug, afaics.  
> We should fix that.
> 
> 
> r~

The previous commit on this line in translate.c says that "on most 32bit 
CPUs we should always treat the compare as 32bit compare, as the CPU 
will ignore the L bit", so maybe it was intentional. Should we change it 
anyway?

-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

