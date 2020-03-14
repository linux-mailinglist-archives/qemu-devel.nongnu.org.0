Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69723185505
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Mar 2020 08:03:45 +0100 (CET)
Received: from localhost ([::1]:41658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jD0pk-00017X-Fd
	for lists+qemu-devel@lfdr.de; Sat, 14 Mar 2020 03:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39513)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jD0p2-0000gv-CI
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 03:03:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jD0p0-0002sm-Q1
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 03:02:59 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:43040)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jD0p0-0002b1-Az; Sat, 14 Mar 2020 03:02:58 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1588975|-1; CH=green; DM=||false|;
 DS=CONTINUE|ham_news_journal|0.0119923-0.000280658-0.987727;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01a16367; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=9; SR=0; TI=SMTPD_---.H.Fagok_1584169365; 
Received: from 192.168.3.18(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H.Fagok_1584169365)
 by smtp.aliyun-inc.com(10.147.42.241);
 Sat, 14 Mar 2020 15:02:45 +0800
Subject: Re: [PATCH v5 17/60] target/riscv: vector single-width integer
 multiply instructions
To: Richard Henderson <richard.henderson@linaro.org>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-18-zhiwei_liu@c-sky.com>
 <e35d894d-30a4-dfbd-72ff-f33d70d4f9a0@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <5fb66fc4-8acc-d9b2-a09d-3187d5019c50@c-sky.com>
Date: Sat, 14 Mar 2020 15:02:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e35d894d-30a4-dfbd-72ff-f33d70d4f9a0@linaro.org>
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



On 2020/3/14 14:52, Richard Henderson wrote:
> On 3/12/20 7:58 AM, LIU Zhiwei wrote:
>> +static int64_t do_mulhsu_d(int64_t s2, uint64_t s1)
>> +{
>> +    uint64_t hi_64, lo_64, abs_s2 = s2;
>> +
>> +    if (s2 < 0) {
>> +        abs_s2 = -s2;
>> +    }
>> +    mulu64(&lo_64, &hi_64, abs_s2, s1);
>> +    if ((int64_t)(s2 ^ s1) < 0) {
> Why would the sign of s1 be relevant?
> It's always unsigned.
Yes, it is a bug. Thanks for pointing that.

Zhiwei
> We have code for this in e.g. tcg_gen_mulsu2_i64
>
>      mulu4(&lo, &hi, s1, s2);
>      if ((int64_t)s2 < 0) {
>          hi -= s2;
>      }
>
>
> r~


