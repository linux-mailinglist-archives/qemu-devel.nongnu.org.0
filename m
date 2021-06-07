Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7000A39D8A5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 11:24:05 +0200 (CEST)
Received: from localhost ([::1]:55512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqBUK-0003M0-Hv
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 05:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lqBTD-0002gX-3O; Mon, 07 Jun 2021 05:22:55 -0400
Received: from out28-4.mail.aliyun.com ([115.124.28.4]:52598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lqBT9-0007ZR-E9; Mon, 07 Jun 2021 05:22:54 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0888319|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.712603-0.0019428-0.285454;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047203; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KOqbo0Y_1623057764; 
Received: from 172.27.117.59(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KOqbo0Y_1623057764)
 by smtp.aliyun-inc.com(10.147.42.22); Mon, 07 Jun 2021 17:22:44 +0800
Subject: Re: TCG op for 32 bit only cpu on qemu-riscv64
To: Alistair Francis <alistair23@gmail.com>
References: <97935519-42c8-71c8-3d87-30aa4cafc909@c-sky.com>
 <CAKmqyKNHX0p5OxE1Y+1bwUeQ1uXu_DTwTnYgK3xxB9tu9Ax_nA@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <e82c9f94-4367-2ed6-7c7c-846e8a270876@c-sky.com>
Date: Mon, 7 Jun 2021 17:22:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNHX0p5OxE1Y+1bwUeQ1uXu_DTwTnYgK3xxB9tu9Ax_nA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.4; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-4.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/7/21 2:22 PM, Alistair Francis wrote:
> On Mon, Jun 7, 2021 at 1:09 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>> Hi Alistair,
>>
>> As I see,  we are moving  on to remove TARGET_RISCV64 macro.
>>
>> I have some questions:
>>
>> 1) Which tcg op should use when translate an instruction for 32bit cpu.
>> The tcg_*_i64, tcg_*_i32 or tcg_*_tl?
>> I see some API such as gen_get_gpr that are using the tcg_*_tl. But I am
>> not sure if it is
>> right for 32bit cpu.
> Do you mean for an instruction that only runs on a 32-bit CPU (and not RV64)?
>
> If the instruction only supports a 32-bit value then tcg_*_i32
> otherwise tcg_*_tl is probably the best bet.

Thanks. I think you are right.

>
>> 2) Do we should have a sign-extend 64 bit register(bit 31 as the sign
>> bit)  for 32 bit cpu?
> I'm not clear what you mean. Can you point to a spec that you are
> trying to implement?

I am implementing RVP to get rid of TARGET_RISCV64. After we have 
recognized an instruction only used by a 32-bit CPU,

1) Should we only use the lowest 32bits of the 64bits register in RV64?

TCGv s;
TCGv_i32 s32;
s = tcg_new_temp();
s32 = tcg_new_temp_i32();
gen_get_gpr(src1, a->rs1);
tcg_gen_trunc_tl_i32(s32, s);

Then we can use TCGv_i32 s32  to stand for rs1 register.

2) After some tcg ops(tcg_*_i32), when we write back to destination 
register, should we sign-extend
the 32 bit register before call get_set_gpr()?

Best Regards,
Zhiwei

>
> Alistair
>
>> Best Regards,
>> Zhiwei
>>
>>

