Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 852FC131D48
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 02:37:26 +0100 (CET)
Received: from localhost ([::1]:36588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iodoC-00027b-Gc
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 20:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41395)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1iodlQ-0008HL-MQ
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 20:34:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1iodlO-0000rJ-6H
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 20:34:32 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:46219)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1iodlN-0000bZ-RE; Mon, 06 Jan 2020 20:34:30 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07439336|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.481031-0.0189103-0.500059; DS=||;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03307; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=9; SR=0; TI=SMTPD_---.GXaZdv6_1578360860; 
Received: from 172.16.31.150(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.GXaZdv6_1578360860)
 by smtp.aliyun-inc.com(10.147.41.143);
 Tue, 07 Jan 2020 09:34:21 +0800
Subject: Re: [PATCH v3 3/4] RISC-V: support vector extension csr
To: Jim Wilson <jimw@sifive.com>, alistair23@gmail.com,
 richard.henderson@linaro.org, chihmin.chao@sifive.com, palmer@dabbelt.com
References: <20200103033347.20909-1-zhiwei_liu@c-sky.com>
 <20200103033347.20909-4-zhiwei_liu@c-sky.com>
 <ec0fe07a-ae3d-6502-18fa-d89547d918aa@sifive.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <be35d76a-0452-5243-d282-1c60aaa06bfc@c-sky.com>
Date: Tue, 7 Jan 2020 09:34:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <ec0fe07a-ae3d-6502-18fa-d89547d918aa@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
Cc: wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wxy194768@alibaba-inc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/1/7 6:00, Jim Wilson wrote:
> On 1/2/20 7:33 PM, LIU Zhiwei wrote:
>> Until v0.7.1 specification, vector status is still not defined for
>> mstatus.
>
> The v0.8 spec does define a VS bit in mstatus.
>
Yes, I will also support v0.8 spec after the v0.7.1 spec.
>> @@ -107,11 +112,6 @@ static int pmp(CPURISCVState *env, int csrno)
>>   /* User Floating-Point CSRs */
>>   static int read_fflags(CPURISCVState *env, int csrno, target_ulong 
>> *val)
>>   {
>> -#if !defined(CONFIG_USER_ONLY)
>> -    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
>> -        return -1;
>> -    }
>> -#endif
>>       *val = riscv_cpu_get_fflags(env);
>>       return 0;
>>   }
>
> This allows reads of fflags when it doesn't exist, and hence does not 
> make much sense.  Instead of removing the code, you should add a check 
> for the vector extension, since the vector extension requires that 
> fcsr exist even if the base architecture doesn't include FP support.  
> Ideally this should use the VS bit, but if you don't have it then you 
> can just check to see if the vector extension was enabled as a command 
> line option.
>
I' sorry that there is some ambiguous here. The reason to remove these 
code is that they are redundant, and has nothing to do with the vector 
extension.  I just delete them by hand.

As you can see, all float csr has a predicate function.

static int fs(CPURISCVState *env, int csrno)
{
#if !defined(CONFIG_USER_ONLY)
     if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
         return -1;
     }
#endif
     return 0;
}

The read or write function must be called after the predicate return 0. 
So no need to check (!env->debugger && !(env->mstatus & MSTATUS_FS)  again.
> While the vector spec says that fcsr must exist, it doesn't specify 
> that the FP fields in fcsr are necessarily readable or writable when 
> there is no FP.  It also doesn't specify whether the other FP related 
> shadows of fcsr exist, like fflags.  This appears to have been left 
> unspecified.  I don't think that you should be making fflags reads and 
> writes work for a target with vector but without float.  I think it 
> would make more sense to have fcsr behave 3 different ways depending 
> on whether we have only F, only V, or both F and V.  And then we can 
> support reads and writes of only the valid fields.
>
Thanks. Maybe I should just only loose the check condition for fcsr.

Best Regards,
Zhiwei
> Jim


