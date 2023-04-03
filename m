Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7596D4270
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 12:46:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjHfu-0004sz-Ct; Mon, 03 Apr 2023 06:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pjHfq-0004sq-Jd
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 06:44:30 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pjHfo-0000Ez-OK
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 06:44:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f85ushSwkz6S3T8VZkAni4Ko6BKOBj4KUdqm9hg9wlc=; b=MlL3OlAXF9MmOiIr0QuLEyG4Xm
 vLDdAIWNbuGZgLQGbtWG5VeyxP51nvHgACIcUayvatnhxWQ0u2kmn4TFyUlmbtlnhusH5i/dmX1G/
 +bs+UD18XhnD8InOSsen3gy6onz9ZDGotwK7HIal/Y0uqQAvgkfpNbLk7kHKsUs+3tgs=;
Message-ID: <648ee10f-727d-63a5-f6de-8bca3de236fe@rev.ng>
Date: Mon, 3 Apr 2023 12:44:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/3] accel/tcg: Fix overwrite problems of tcg_cflags
To: liweiwei <liweiwei@iscas.ac.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Junqiang Wang <wangjunqiang@iscas.ac.cn>
References: <20230401045106.3885562-1-richard.henderson@linaro.org>
 <20230401045106.3885562-3-richard.henderson@linaro.org>
 <c91e5f52-32db-c381-3286-1d22e15a2141@linaro.org>
 <3212ace5-a35d-ac74-c786-29c3e124065e@iscas.ac.cn>
Content-Language: en-US
Organization: rev.ng
In-Reply-To: <3212ace5-a35d-ac74-c786-29c3e124065e@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.37,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


On 4/3/23 11:09, liweiwei wrote:
>
> On 2023/4/3 16:09, Philippe Mathieu-Daudé wrote:
>>      cflags |= parallel ? CF_PARALLEL : 0;
>>      cflags |= icount_enabled() ? CF_USE_ICOUNT : 0;
>> +    tcg_debug_assert(!cpu->tcg_cflags);
>>      cpu->tcg_cflags = cflags;
>>  }
>> ---
>>
>> Li and Junqiang, what is your use case?
>
> Only few CPUs support CF_PCREL currently. I found this problem when I 
> tried to introduce PC-relative translation into RISC-V.
>
> Maybe It also can be reproduced in system mode for ARM and X86.

Yes, this can be reproduced on arm-softmmu with --enable-debug-tcg and 
the above assertion.


On 4/3/23 10:09, Philippe Mathieu-Daudé wrote:
>>
>> diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
>> index af35e0d092..58c8e64096 100644
>> --- a/accel/tcg/tcg-accel-ops.c
>> +++ b/accel/tcg/tcg-accel-ops.c
>> @@ -59,7 +59,7 @@ void tcg_cpu_init_cflags(CPUState *cpu, bool parallel)
>>         cflags |= parallel ? CF_PARALLEL : 0;
>>       cflags |= icount_enabled() ? CF_USE_ICOUNT : 0;
>> -    cpu->tcg_cflags = cflags;
>> +    cpu->tcg_cflags |= cflags;
>
> This could be acceptable as a release kludge, but semantically
> tcg_cpu_init_cflags() is meant to *initialize* all flags, not
> set few of them. Either we aren't calling it from the proper place,
> or we need to rename it.
Agree, this sounds reasonable.  Also, maybe setting
cpu->tcg_cflags from *_cpu_realizefn was not the right call and
we should have some other way of providing target specific cflags.

-- 
Anton Johansson,
rev.ng Labs Srl.


