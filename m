Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 687B0185541
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Mar 2020 10:12:56 +0100 (CET)
Received: from localhost ([::1]:43066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jD2ql-0001AC-HG
	for lists+qemu-devel@lfdr.de; Sat, 14 Mar 2020 05:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39503)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jD2p8-0008VU-Th
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 05:11:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jD2p7-00053X-MU
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 05:11:14 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:49649)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jD2p6-0004iz-MH; Sat, 14 Mar 2020 05:11:13 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1320453|-1; CH=green; DM=||false|;
 DS=CONTINUE|ham_regular_dialog|0.0927559-0.00214358-0.9051;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01a16367; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=9; SR=0; TI=SMTPD_---.H.HudLo_1584177063; 
Received: from 192.168.3.18(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H.HudLo_1584177063)
 by smtp.aliyun-inc.com(10.147.43.230);
 Sat, 14 Mar 2020 17:11:04 +0800
Subject: Re: [PATCH v5 38/60] target/riscv: vector floating-point compare
 instructions
To: Richard Henderson <richard.henderson@linaro.org>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-39-zhiwei_liu@c-sky.com>
 <cf8688d1-560c-73f1-8e62-559df34e3eeb@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <6a34cfe0-714b-2487-1c7e-be3b806b5e05@c-sky.com>
Date: Sat, 14 Mar 2020 17:11:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <cf8688d1-560c-73f1-8e62-559df34e3eeb@linaro.org>
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



On 2020/3/14 17:08, Richard Henderson wrote:
> On 3/12/20 7:58 AM, LIU Zhiwei wrote:
>> +static uint8_t float16_eq_quiet(uint16_t a, uint16_t b, float_status *s)
>> +{
>> +    int compare = float16_compare_quiet(a, b, s);
>> +    if (compare == float_relation_equal) {
>> +        return 1;
>> +    } else {
>> +        return 0;
>> +    }
>> +}
> You really need remember that boolean results in C are 1 and 0.
> You do not need to keep translating true to 1 and false to 0.
Got it. I was not very sure it is 1 or non 0 for true before.

Zhiwei
>> +static uint8_t vmfne16(uint16_t a, uint16_t b, float_status *s)
>> +{
>> +    int compare = float16_compare_quiet(a, b, s);
>> +    if (compare != float_relation_equal &&
>> +            compare != float_relation_unordered) {
> Indentation.
>
>> +static uint8_t float16_le(uint16_t a, uint16_t b, float_status *s)
>> +{
>> +    int compare = float16_compare(a, b, s);
>> +    if (compare == float_relation_less ||
>> +            compare == float_relation_equal) {
>> +        return 1;
> Indentation.
>
>
> r~


