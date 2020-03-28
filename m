Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5C019672D
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Mar 2020 16:49:13 +0100 (CET)
Received: from localhost ([::1]:54290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIDhw-0004gD-AZ
	for lists+qemu-devel@lfdr.de; Sat, 28 Mar 2020 11:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42040)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jIDgw-0003oR-Jm
 for qemu-devel@nongnu.org; Sat, 28 Mar 2020 11:48:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jIDgu-0006US-J7
 for qemu-devel@nongnu.org; Sat, 28 Mar 2020 11:48:10 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:37105)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jIDgu-0006Ep-28; Sat, 28 Mar 2020 11:48:08 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.4277855|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0154129-9.47399e-05-0.984492;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01a16370; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=9; SR=0; TI=SMTPD_---.H6jJXbl_1585410477; 
Received: from 192.168.3.18(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H6jJXbl_1585410477)
 by smtp.aliyun-inc.com(10.147.41.199);
 Sat, 28 Mar 2020 23:47:58 +0800
Subject: Re: [PATCH v6 41/61] target/riscv: vector floating-point merge
 instructions
To: Richard Henderson <richard.henderson@linaro.org>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-42-zhiwei_liu@c-sky.com>
 <e0d4678b-1a24-3e90-768a-efd0f0311b68@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <623a1ba2-04f0-7e63-dfbd-ff02ed0acc9d@c-sky.com>
Date: Sat, 28 Mar 2020 23:47:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <e0d4678b-1a24-3e90-768a-efd0f0311b68@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: guoren@linux.alibaba.com, wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, wxy194768@alibaba-inc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/3/28 11:23, Richard Henderson wrote:
> On 3/17/20 8:06 AM, LIU Zhiwei wrote:
>> +    for (i = 0; i < vl; i++) {                            \
>> +        if (!vm && !vext_elem_mask(v0, mlen, i)) {        \
>> +            ETYPE s2 = *((ETYPE *)vs2 + H(i));            \
>> +            *((ETYPE *)vd + H1(i)) = s2;                  \
> H1 should be H.
Yes.
>
>> +        } else {                                          \
>> +            *((ETYPE *)vd + H(i)) = (ETYPE)s1;            \
>> +        }                                                 \
> You can also hoist the s2 dereference out of the IF, and let the assignment be
> unconditional.
>
>    *((ETYPE *)vd + H(i))
>      = (!vm && !vext_elem_mask(v0, mlen, i) ? s2 : s1);
Yes, it's much better.

Zhiwei
>
>
> r~


