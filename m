Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31728196723
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Mar 2020 16:46:35 +0100 (CET)
Received: from localhost ([::1]:54244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIDfN-0001ka-VP
	for lists+qemu-devel@lfdr.de; Sat, 28 Mar 2020 11:46:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41554)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jIDe7-0000N1-Nc
 for qemu-devel@nongnu.org; Sat, 28 Mar 2020 11:45:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jIDe6-0002uC-Ga
 for qemu-devel@nongnu.org; Sat, 28 Mar 2020 11:45:15 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:42133)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jIDe5-0002q3-VU; Sat, 28 Mar 2020 11:45:14 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08573441|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0188822-0.00514472-0.975973;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03294; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=9; SR=0; TI=SMTPD_---.H6j.vqT_1585410299; 
Received: from 192.168.3.18(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H6j.vqT_1585410299)
 by smtp.aliyun-inc.com(10.147.44.118);
 Sat, 28 Mar 2020 23:45:00 +0800
Subject: Re: [PATCH v6 39/61] target/riscv: vector floating-point compare
 instructions
To: Richard Henderson <richard.henderson@linaro.org>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-40-zhiwei_liu@c-sky.com>
 <8d8cc289-db4e-875d-fd60-71d5471b0d38@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <1d4ab6be-88e2-224f-20bb-e4223f25903d@c-sky.com>
Date: Sat, 28 Mar 2020 23:44:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <8d8cc289-db4e-875d-fd60-71d5471b0d38@linaro.org>
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



On 2020/3/28 10:01, Richard Henderson wrote:
> On 3/17/20 8:06 AM, LIU Zhiwei wrote:
>> +static uint8_t vmfne16(uint16_t a, uint16_t b, float_status *s)
>> +{
>> +    int compare = float16_compare_quiet(a, b, s);
>> +    return compare != float_relation_equal &&
>> +           compare != float_relation_unordered;
>> +}
>> +
>> +static uint8_t vmfne32(uint32_t a, uint32_t b, float_status *s)
>> +{
>> +    int compare = float32_compare_quiet(a, b, s);
>> +    return compare != float_relation_equal &&
>> +           compare != float_relation_unordered;
>> +}
>> +
>> +static uint8_t vmfne64(uint64_t a, uint64_t b, float_status *s)
>> +{
>> +    int compare = float64_compare_quiet(a, b, s);
>> +    return compare != float_relation_equal &&
>> +           compare != float_relation_unordered;
>> +}
> This is incorrect -- the result should be true for unordered.  The text for
> 0.7.1 does not specify, but this is the normal interpretation of NE.  The text
> for 0.8 explicitly says that the result is 1 for NaN.
Agree! Thanks for pointing that. IEEE-754 has not defined the NE.
An opposite setting with EQ is reasonable.

Zhiwei
>
>
> r~


