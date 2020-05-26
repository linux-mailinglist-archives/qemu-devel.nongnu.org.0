Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5CD1B057C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 11:21:35 +0200 (CEST)
Received: from localhost ([::1]:60266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQScQ-0000J8-An
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 05:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38244 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1jQSaO-0006bb-C7
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 05:19:29 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1jQSaI-00064n-Jm
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 05:19:28 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:45050 helo=huawei.com)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1jQSaH-0005vU-LT
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 05:19:22 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id AF04EDB3A2F3C8D8A9E3
 for <qemu-devel@nongnu.org>; Mon, 20 Apr 2020 17:19:15 +0800 (CST)
Received: from [10.184.39.213] (10.184.39.213) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 20 Apr
 2020 17:18:45 +0800
Subject: Re: [PATCH] op_helper: fix some compile warnings
To: Yoshinori Sato <ysato@users.sourceforge.jp>
References: <20200420054959.8082-1-pannengyuan@huawei.com>
 <87o8rmv8vb.wl-ysato@users.sourceforge.jp>
From: Pan Nengyuan <pannengyuan@huawei.com>
Message-ID: <b55a0120-55bb-eb9b-208c-13a01fb8af06@huawei.com>
Date: Mon, 20 Apr 2020 17:18:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <87o8rmv8vb.wl-ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="iso-8859-7"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=pannengyuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 03:55:47
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 euler.robot@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/20/2020 4:50 PM, Yoshinori Sato wrote:
> On Mon, 20 Apr 2020 14:49:59 +0900,
> Pan Nengyuan wrote:
>>
>> We got the following compile-time warnings(gcc7.3):
>> /mnt/sdb//qemu/target/rx/op_helper.c: In function �helper_scmpu�:
>> /mnt/sdb/qemu/target/rx/op_helper.c:213:24: error: �tmp1� may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>      env->psw_c = (tmp0 >= tmp1);
>>                   ~~~~~~^~~~~~~~
>> /mnt/sdb/qemu/target/rx/op_helper.c:213:24: error: �tmp0� may be used uninitialized in this function [-Werror=maybe-uninitialized]
>> /mnt/sdb/qemu/target/rx/op_helper.c: In function �helper_suntil�:
>> /mnt/sdb/qemu/target/rx/op_helper.c:299:23: error: �tmp� may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>      env->psw_c = (tmp <= env->regs[2]);
>>                   ~~~~~^~~~~~~~~~~~~~~~
>> /mnt/sdb/qemu/target/rx/op_helper.c: In function �helper_swhile�:
>> /mnt/sdb/qemu/target/rx/op_helper.c:318:23: error: �tmp� may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>      env->psw_c = (tmp <= env->regs[2]);
>>
>> Actually, it looks like a false-positive because it will enter the body of while loop and init it for the first time.
>> Let's change 'while' to 'do .. while' to avoid it.
> 
> OK.
> 
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
>> ---
>>  target/rx/op_helper.c | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
>> index f89d294f2b..b612ab1da8 100644
>> --- a/target/rx/op_helper.c
>> +++ b/target/rx/op_helper.c
>> @@ -201,14 +201,14 @@ void helper_scmpu(CPURXState *env)
>>      if (env->regs[3] == 0) {
>>          return;
>>      }
>> -    while (env->regs[3] != 0) {
>> +    do {
>>          tmp0 = cpu_ldub_data_ra(env, env->regs[1]++, GETPC());
>>          tmp1 = cpu_ldub_data_ra(env, env->regs[2]++, GETPC());
>>          env->regs[3]--;
>>          if (tmp0 != tmp1 || tmp0 == '\0') {
>>              break;
>>          }
>> -    }
>> +    } while (env->regs[3] != 0);
>>      env->psw_z = tmp0 - tmp1;
>>      env->psw_c = (tmp0 >= tmp1);
>>  }
>> @@ -287,14 +287,14 @@ void helper_suntil(CPURXState *env, uint32_t sz)
>>      if (env->regs[3] == 0) {
>>          return ;
>>      }
>> -    while (env->regs[3] != 0) {
>> +    do {
>>          tmp = cpu_ldufn[sz](env, env->regs[1], GETPC());
>>          env->regs[1] += 1 << sz;
>>          env->regs[3]--;
>>          if (tmp == env->regs[2]) {
>>              break;
>>          }
>> -    }
>> +    } while (env->regs[3] != 0);
>>      env->psw_z = tmp - env->regs[2];
>>      env->psw_c = (tmp <= env->regs[2]);
>>  }
>> @@ -306,14 +306,14 @@ void helper_swhile(CPURXState *env, uint32_t sz)
>>      if (env->regs[3] == 0) {
>>          return ;
>>      }
>> -    while (env->regs[3] != 0) {
>> +    do {
>>          tmp = cpu_ldufn[sz](env, env->regs[1], GETPC());
>>          env->regs[1] += 1 << sz;
>>          env->regs[3]--;
>>          if (tmp != env->regs[2]) {
>>              break;
>>          }
>> -    }
>> +    } while (env->regs[3] != 0);
>>      env->psw_z = env->regs[3];
>>      env->psw_c = (tmp <= env->regs[2]);
>>  }
>> -- 
>> 2.18.2
>>
>>
> 
> It looks different result in env->regs[3] is zero.

If env->regs[3] is zero, it will return at the begin of these functions:

  if (env->regs[3] == 0) {
      return;
  }

Thus, the while loop will not be reached.
In this case, I think 'while' and 'do .. while' will get the same result and it will disappear the warnings.

> In such a case, nothing changes.
> 
> I think that the warning of the uninitialized variable
> will disappear by fixing as follows.
> 

Yes, it also can fix these warnings.

Thanks.

>>From 5de0c54a970e01e96b41870252d0ea54ec61c540 Mon Sep 17 00:00:00 2001
> From: Yoshinori Sato <ysato@users.sourceforge.jp>
> Date: Mon, 20 Apr 2020 17:41:04 +0900
> Subject: [PATCH] target/rx/op_helper: Fix uninitialized warning.
> 
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  target/rx/op_helper.c | 101 ++++++++++++++++++++----------------------
>  1 file changed, 49 insertions(+), 52 deletions(-)
> 
> diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
> index f89d294f2b..f84f6c706c 100644
> --- a/target/rx/op_helper.c
> +++ b/target/rx/op_helper.c
> @@ -284,38 +284,36 @@ void helper_suntil(CPURXState *env, uint32_t sz)
>  {
>      uint32_t tmp;
>      tcg_debug_assert(sz < 3);
> -    if (env->regs[3] == 0) {
> -        return ;
> -    }
> -    while (env->regs[3] != 0) {
> -        tmp = cpu_ldufn[sz](env, env->regs[1], GETPC());
> -        env->regs[1] += 1 << sz;
> -        env->regs[3]--;
> -        if (tmp == env->regs[2]) {
> -            break;
> +    if (env->regs[3] > 0) {
> +        while (env->regs[3] != 0) {
> +            tmp = cpu_ldufn[sz](env, env->regs[1], GETPC());
> +            env->regs[1] += 1 << sz;
> +            env->regs[3]--;
> +            if (tmp == env->regs[2]) {
> +                break;
> +            }
>          }
> +        env->psw_z = tmp - env->regs[2];
> +        env->psw_c = (tmp <= env->regs[2]);
>      }
> -    env->psw_z = tmp - env->regs[2];
> -    env->psw_c = (tmp <= env->regs[2]);
>  }
>  
>  void helper_swhile(CPURXState *env, uint32_t sz)
>  {
>      uint32_t tmp;
>      tcg_debug_assert(sz < 3);
> -    if (env->regs[3] == 0) {
> -        return ;
> -    }
> -    while (env->regs[3] != 0) {
> -        tmp = cpu_ldufn[sz](env, env->regs[1], GETPC());
> -        env->regs[1] += 1 << sz;
> -        env->regs[3]--;
> -        if (tmp != env->regs[2]) {
> -            break;
> +    if (env->regs[3] > 0) {
> +        while (env->regs[3] != 0) {
> +            tmp = cpu_ldufn[sz](env, env->regs[1], GETPC());
> +            env->regs[1] += 1 << sz;
> +            env->regs[3]--;
> +            if (tmp != env->regs[2]) {
> +                break;
> +            }
>          }
> +        env->psw_z = env->regs[3];
> +        env->psw_c = (tmp <= env->regs[2]);
>      }
> -    env->psw_z = env->regs[3];
> -    env->psw_c = (tmp <= env->regs[2]);
>  }
>  
>  /* accumlator operations */
> @@ -325,40 +323,39 @@ void helper_rmpa(CPURXState *env, uint32_t sz)
>      int32_t result_h;
>      int64_t tmp0, tmp1;
>  
> -    if (env->regs[3] == 0) {
> -        return;
> -    }
> -    result_l = env->regs[5];
> -    result_l <<= 32;
> -    result_l |= env->regs[4];
> -    result_h = env->regs[6];
> -    env->psw_o = 0;
> +    if (env->regs[3] > 0) {
> +        result_l = env->regs[5];
> +        result_l <<= 32;
> +        result_l |= env->regs[4];
> +        result_h = env->regs[6];
> +        env->psw_o = 0;
>  
> -    while (env->regs[3] != 0) {
> -        tmp0 = cpu_ldfn[sz](env, env->regs[1], GETPC());
> -        tmp1 = cpu_ldfn[sz](env, env->regs[2], GETPC());
> -        tmp0 *= tmp1;
> -        prev = result_l;
> -        result_l += tmp0;
> -        /* carry / bollow */
> -        if (tmp0 < 0) {
> -            if (prev > result_l) {
> -                result_h--;
> -            }
> -        } else {
> -            if (prev < result_l) {
> -                result_h++;
> +        while (env->regs[3] != 0) {
> +            tmp0 = cpu_ldfn[sz](env, env->regs[1], GETPC());
> +            tmp1 = cpu_ldfn[sz](env, env->regs[2], GETPC());
> +            tmp0 *= tmp1;
> +            prev = result_l;
> +            result_l += tmp0;
> +            /* carry / bollow */
> +            if (tmp0 < 0) {
> +                if (prev > result_l) {
> +                    result_h--;
> +                }
> +            } else {
> +                if (prev < result_l) {
> +                    result_h++;
> +                }
>              }
> -        }
>  
> -        env->regs[1] += 1 << sz;
> -        env->regs[2] += 1 << sz;
> +            env->regs[1] += 1 << sz;
> +            env->regs[2] += 1 << sz;
> +        }
> +        env->psw_s = result_h;
> +        env->psw_o = (result_h != 0 && result_h != -1) << 31;
> +        env->regs[6] = result_h;
> +        env->regs[5] = result_l >> 32;
> +        env->regs[4] = result_l & 0xffffffff;
>      }
> -    env->psw_s = result_h;
> -    env->psw_o = (result_h != 0 && result_h != -1) << 31;
> -    env->regs[6] = result_h;
> -    env->regs[5] = result_l >> 32;
> -    env->regs[4] = result_l & 0xffffffff;
>  }
>  
>  void helper_racw(CPURXState *env, uint32_t imm)
> 

