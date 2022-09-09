Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEC15B36EA
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 14:07:49 +0200 (CEST)
Received: from localhost ([::1]:60246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWcnT-0002bG-W6
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 08:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1oWcha-00083Q-So; Fri, 09 Sep 2022 08:01:49 -0400
Received: from [200.168.210.66] (port=21634 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1oWchW-000083-LQ; Fri, 09 Sep 2022 08:01:40 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 9 Sep 2022 09:01:27 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 8C1BF8001F1;
 Fri,  9 Sep 2022 09:01:27 -0300 (-03)
Message-ID: <97dee0c0-e835-b797-588a-e8ed87f0c603@eldorado.org.br>
Date: Fri, 9 Sep 2022 09:01:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] tcg/ppc: Optimize 26-bit jumps
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: npiggin@gmail.com
References: <20220908211829.181447-1-leandro.lupori@eldorado.org.br>
 <70efa596-eeaf-7470-0b02-ccdbec7c2a24@linaro.org>
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
In-Reply-To: <70efa596-eeaf-7470-0b02-ccdbec7c2a24@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 09 Sep 2022 12:01:27.0801 (UTC)
 FILETIME=[E435BE90:01D8C443]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.079,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/8/22 18:44, Richard Henderson wrote:
> On 9/8/22 22:18, Leandro Lupori wrote:
>> PowerPC64 processors handle direct branches better than indirect
>> ones, resulting in less stalled cycles and branch misses.
>>
>> However, PPC's tb_target_set_jmp_target() was only using direct
>> branches for 16-bit jumps, while PowerPC64's unconditional branch
>> instructions are able to handle displacements of up to 26 bits.
>> To take advantage of this, now jumps whose displacements fit in
>> between 17 and 26 bits are also converted to direct branches.
> 
> This doesn't work because you have to be able to unset the jump as well, 
> and your two step
> sequence doesn't handle that.  (You wind up with the two insn address 
> load reset, but the
> jump continuing to the previous target -- boom.)
> 
Hello Richard, thanks for your review!
Right, I hadn't noticed this issue.

> For v2.07+, you could use stq to update 4 insns atomically.
> 
I'll try this alternative in v2, so that more CPUs can benefit from this 
change.

> For v3.1+, you can eliminate TCG_REG_TB, using prefixed pc-relative 
> addressing instead.
> Which brings you back to only needing to update 8 bytes atomically 
> (select either paddi to
> compute address to feed to following mtctr+bcctr, or direct branch + nop 
> leaving the
> mtctr+bcctr alone and unreachable).
> 
> (Actually, there are lots of updates one could make to tcg/ppc for v3.1...)
> 
> 
> r~


