Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E1360D5D1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 22:42:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onQiB-0002f9-F7; Tue, 25 Oct 2022 16:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1onQi8-0002Qw-HF; Tue, 25 Oct 2022 16:39:44 -0400
Received: from [200.168.210.66] (helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1onQi3-0007Af-TU; Tue, 25 Oct 2022 16:39:41 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 25 Oct 2022 17:39:35 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id C2703800048;
 Tue, 25 Oct 2022 17:39:34 -0300 (-03)
Message-ID: <61a06445-aa93-deff-2b17-eeab80d92b81@eldorado.org.br>
Date: Tue, 25 Oct 2022 17:39:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 3/3] target/ppc: Increment PMC5 with inline insns
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org
References: <20221021170112.151393-1-leandro.lupori@eldorado.org.br>
 <20221021170112.151393-4-leandro.lupori@eldorado.org.br>
 <67032796-2e9d-5fee-3e5f-0e85e0bb0a21@gmail.com>
Content-Language: en-US
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
In-Reply-To: <67032796-2e9d-5fee-3e5f-0e85e0bb0a21@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 25 Oct 2022 20:39:35.0461 (UTC)
 FILETIME=[E4E6B550:01D8E8B1]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/25/22 16:29, Daniel Henrique Barboza wrote:

> On 10/21/22 14:01, Leandro Lupori wrote:
>> Profiling QEMU during Fedora 35 for PPC64 boot revealed that
>> 6.39% of total time was being spent in helper_insns_inc(), on a
>> POWER9 machine. To avoid calling this helper every time PMCs had
>> to be incremented, an inline implementation of PMC5 increment and
>> check for overflow was developed. This led to a reduction of
>> about 12% in Fedora's boot time.
>>
>> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
>> ---
> 
> Given that PMC5 is the counter that is most likely to be active, yeah,
> isolating the case where PMC5 is incremented standalone makes sense.
> 
> Still, 12% performance gain is not too shaby. Not too shaby at all.
> 

I've tried to move more of helper_insns_inc() to the inline 
implementation, but then performance started to decrease.

Initially I found this strange, but perf revealed a considerable 
increase of time spent in functions such as tcg_gen_code and 
liveness_pass_1.

So as this code has to be generated and optimized for most TBs, it seems 
it makes code generation slower if it's too big.

> 
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> 


