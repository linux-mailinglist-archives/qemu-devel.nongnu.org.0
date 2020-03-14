Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F481854F5
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Mar 2020 07:09:54 +0100 (CET)
Received: from localhost ([::1]:41192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCzzd-0007Cw-JF
	for lists+qemu-devel@lfdr.de; Sat, 14 Mar 2020 02:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37977)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jCzyf-0006es-N8
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 02:08:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jCzye-0003bM-Fd
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 02:08:53 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:35451)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jCzye-0003WA-1j; Sat, 14 Mar 2020 02:08:52 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1391121|-1; CH=green; DM=||false|;
 DS=CONTINUE|ham_regular_dialog|0.0128873-0.000655853-0.986457;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03294; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=9; SR=0; TI=SMTPD_---.H.EP9Tl_1584166121; 
Received: from 192.168.3.18(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H.EP9Tl_1584166121)
 by smtp.aliyun-inc.com(10.147.42.253);
 Sat, 14 Mar 2020 14:08:42 +0800
Subject: Re: [PATCH v5 11/60] target/riscv: vector integer add-with-carry /
 subtract-with-borrow instructions
To: Richard Henderson <richard.henderson@linaro.org>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-12-zhiwei_liu@c-sky.com>
 <77fcc875-ba5e-ea18-1228-6a1e7989491b@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <50916105-3aca-9e3c-6402-9b4001e4fc09@c-sky.com>
Date: Sat, 14 Mar 2020 14:08:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <77fcc875-ba5e-ea18-1228-6a1e7989491b@linaro.org>
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



On 2020/3/14 13:58, Richard Henderson wrote:
> On 3/12/20 7:58 AM, LIU Zhiwei wrote:
>> +#define DO_MADC(N, M, C) ((__typeof(N))(N + M + C) < N ? 1 : 0)
> Incorrect.  E.g N = 1, M = UINT_MAX, C = 1, adds to 1, which is not less than
> N, despite the carry-out.
Yes, it really the corner case. I should test C first.

Thanks for pointing that.

Zhiwei
>
> You want
>
>      C ? N + M <= N : N + M < N
>
>> +#define DO_MSBC(N, M, C) ((__typeof(N))(N - M - C) > N ? 1 : 0)
> Similarly
>
>      C ? N <= M : N < M
>
>
> r~


