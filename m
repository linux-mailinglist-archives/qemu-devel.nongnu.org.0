Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94246518BFD
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 20:14:05 +0200 (CEST)
Received: from localhost ([::1]:54698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlx2B-0001wt-W8
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 14:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nlwyj-0000yH-Cb; Tue, 03 May 2022 14:10:29 -0400
Received: from [187.72.171.209] (port=58606 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nlwyh-00017A-LB; Tue, 03 May 2022 14:10:29 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 3 May 2022 15:09:22 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id D85F4800491;
 Tue,  3 May 2022 15:09:21 -0300 (-03)
Message-ID: <860fb352-d542-0e38-4d1f-78cfe4c45285@eldorado.org.br>
Date: Tue, 3 May 2022 15:09:21 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] target/ppc: Fix tlbie
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: danielhb413@gmail.com, david@gibson.dropbear.id.au, groug@kaod.org
References: <20220503163904.22575-1-leandro.lupori@eldorado.org.br>
 <cd1ae42e-6824-c160-4c41-75eef16dbae0@kaod.org>
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
In-Reply-To: <cd1ae42e-6824-c160-4c41-75eef16dbae0@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 May 2022 18:09:22.0280 (UTC)
 FILETIME=[EA562E80:01D85F18]
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

On 5/3/22 13:54, Cédric Le Goater wrote:

> On 5/3/22 18:39, Leandro Lupori wrote:
>> Commit 74c4912f097bab98 changed check_tlb_flush() to use
>> tlb_flush_all_cpus_synced() instead of calling tlb_flush() on each
>> CPU. However, as side effect of this, a CPU executing a ptesync
>> after a tlbie will have its TLB flushed only after exiting its
>> current Translation Block (TB).
>>
>> This causes memory accesses to invalid pages to succeed, if they
>> happen to be on the same TB as the ptesync.
> 
> How did you track the issue ? Do you have a test case ?
> 

I've initially found it with a hacked Linux kernel module that I was 
using to test tlbie behavior, before trying to improve its 
implementation to only invalidate the needed entries.

Now I've added a new test to those MMU tests from pnv-test, to be able 
to reproduce and test it more easily. I've not included it because it 
depends on other code from MMU tests and semihosting or attn. But you 
can check it here:

https://github.com/PPC64/qemu/commit/ccb60e4b950d1376b7f5d72843f6ce082a1a9edb 
(mmu_test_18)

Thanks,
Leandro

> Thanks,
> 
> C.
> 

