Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CE16ECC40
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 14:49:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqvc9-0003RB-Am; Mon, 24 Apr 2023 08:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pqvbl-0003Oi-B8
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 08:48:06 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pqvbj-0008Kw-GV
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 08:47:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DcDteXGeQ9zPTuLkmgoPswClvrFwYQ+thfxmzfqvDDY=; b=YMr3D7cwzmFlHRoCRYnSeQwLCi
 Q2Em4h/iMmm0GREk3h7CrZYhRcHXvkO/2FEksICvNqt0PRp0YaDnAJqpArAkTyd7Xv1sCgh2dMsKm
 KYPGjQB9GuSUBAzNeS7ZG1Jme1DYHHf/QTToTHtC7uYgjW2yTckgJt29fCXgfKvky2qU=;
Message-ID: <0907fcb4-2446-5a0a-75d3-c4d7065344f2@rev.ng>
Date: Mon, 24 Apr 2023 14:47:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/8] accel: Replace `target_ulong` with `vaddr` in TB/TLB
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net, philmd@linaro.org,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com
References: <20230420212850.20400-1-anjo@rev.ng>
 <20230420212850.20400-2-anjo@rev.ng>
 <b8dd9e8a-c9c8-12a1-fcc8-026437a07fb4@linaro.org>
Content-Language: en-US
Organization: rev.ng
In-Reply-To: <b8dd9e8a-c9c8-12a1-fcc8-026437a07fb4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 4/23/23 11:09, Richard Henderson wrote:
> On 4/20/23 22:28, Anton Johansson wrote:
>> Changes pc and cs_base in TranslationBlock from target_ulong to vaddr.
>> Auxilliary structs and tb_*()/tlb_*() functions that depend on this
>> change are also updated to take a vaddr for guest virtual addresses.
>>
>> Signed-off-by: Anton Johansson <anjo@rev.ng>
>> ---
>>   accel/stubs/tcg-stub.c       |   2 +-
>>   accel/tcg/cpu-exec.c         |  49 +++++-----
>>   accel/tcg/cputlb.c           | 179 +++++++++++++++++------------------
>>   accel/tcg/internal.h         |   6 +-
>>   accel/tcg/tb-hash.h          |  12 +--
>>   accel/tcg/tb-jmp-cache.h     |   2 +-
>>   accel/tcg/tb-maint.c         |   2 +-
>>   accel/tcg/translate-all.c    |  15 +--
>>   include/exec/cpu-defs.h      |   4 +-
>>   include/exec/cpu_ldst.h      |   6 +-
>>   include/exec/exec-all.h      |  82 ++++++++--------
>>   include/qemu/plugin-memory.h |   2 +-
>>   12 files changed, 181 insertions(+), 180 deletions(-)
>
> This is too large and must be split.  In addition, there are places 
> where you must take more care with the replacement.

Agreed this patch is very large. I struggled a bit in chopping it up 
without breaking bisection, but I'll give it another go!


>
>> @@ -412,10 +412,11 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState 
>> *env)
>>   {
>>       CPUState *cpu = env_cpu(env);
>>       TranslationBlock *tb;
>> -    target_ulong cs_base, pc;
>> +    vaddr cs_base = 0, pc = 0;
>>       uint32_t flags, cflags;
>>   -    cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
>> +    cpu_get_tb_cpu_state(env, (target_ulong *) &pc,
>> +                         (target_ulong *) &cs_base, &flags);
>
> This simply will not work on big-endian hosts.
Ah of course! I'll pull in the changes updating the arguments of 
cpu_get_tb_cpu_state() to
avoid the pointer casts.


>
>
>> @@ -560,15 +557,15 @@ static void 
>> tlb_flush_page_by_mmuidx_async_0(CPUState *cpu,
>>   static void tlb_flush_page_by_mmuidx_async_1(CPUState *cpu,
>>                                                run_on_cpu_data data)
>>   {
>> -    target_ulong addr_and_idxmap = (target_ulong) data.target_ptr;
>> -    target_ulong addr = addr_and_idxmap & TARGET_PAGE_MASK;
>> +    vaddr addr_and_idxmap = (vaddr) data.target_ptr;
>
> run_on_cpu_data.target_ptr is already vaddr, no need for cast.

Right, will fix! Thanks


-- 
Anton Johansson,
rev.ng Labs Srl.


