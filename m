Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 133BF1853ED
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Mar 2020 02:51:00 +0100 (CET)
Received: from localhost ([::1]:39934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCvx5-0008QB-58
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 21:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55165)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jCvvv-0007Rv-99
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 21:49:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jCvvt-0003da-KI
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 21:49:46 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:42895)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jCvvt-0003C2-5V; Fri, 13 Mar 2020 21:49:45 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08528517|-1; CH=green; DM=||false|;
 DS=CONTINUE|ham_system_inform|0.0909353-0.000417432-0.908647;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03268; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=9; SR=0; TI=SMTPD_---.H.8j2kg_1584150574; 
Received: from 192.168.3.18(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H.8j2kg_1584150574)
 by smtp.aliyun-inc.com(10.147.44.145);
 Sat, 14 Mar 2020 09:49:35 +0800
Subject: Re: [PATCH v5 05/60] target/riscv: add vector stride load and store
 instructions
To: Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair23@gmail.com>
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-6-zhiwei_liu@c-sky.com>
 <CAKmqyKOiKUqzGSDd1+TvqhCT6pjeEXEX-QVzYhcaiRa-y4D98w@mail.gmail.com>
 <445d93e8-1d2c-9877-84a3-ed62a5920d89@c-sky.com>
 <392b9e62-0ff7-de49-f5dc-793bc38ba484@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <57edb267-4ef7-b8da-7c38-5ecb3596179b@c-sky.com>
Date: Sat, 14 Mar 2020 09:49:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <392b9e62-0ff7-de49-f5dc-793bc38ba484@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: guoren@linux.alibaba.com, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wxy194768@alibaba-inc.com, Chih-Min Chao <chihmin.chao@sifive.com>,
 wenmeng_zhang@c-sky.com, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/3/14 9:26, Richard Henderson wrote:
> On 3/13/20 2:32 PM, LIU Zhiwei wrote:
>>>> +/* check functions */
>>>> +static bool vext_check_isa_ill(DisasContext *s, target_ulong isa)
>>>> +{
>>>> +    return !s->vill && ((s->misa & isa) == isa);
>>>> +}
>>> I don't think we need a new function to check ISA.
>> I don't think so.
>>
>> Although there is a riscv_has_ext(env, isa) in cpu.h, it is not proper in this
>> file,
>> as it is in translation time and  usually DisasContext   is used here instead
>> of CPURISCVState.
> In translate.c we have has_ext() for this purpose.
Yes, I will use it.
> I think you don't need to test has_ext(s, RVV) at all,
> because in cpu_get_tb_cpu_state(), you already tested
> RVV, and set VILL if RVV was not present.
>
> Thus testing vill here is sufficient.  A comment here
> to remind us of that fact would be appropriate.
Yes, I forgot it. I will keep the function and add a comment.
> For those few cases where you have an extension beyond
> RVV, e.g. amo_check() I think you should simply use
> has_ext() like so:
>
> static bool amo_check(DisasContext *s, arg_rwdvm *a)
> {
>      return (!s->vill &&
>              has_ext(s, RVA) &&
>              ...);
> }
Yes, I will fix it in that patch.
>
> r~


