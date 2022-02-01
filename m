Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C0D4A5827
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 08:58:49 +0100 (CET)
Received: from localhost ([::1]:34530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEo3s-0002dq-80
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 02:58:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nEmxV-0007TO-Uz
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 01:48:11 -0500
Received: from out28-3.mail.aliyun.com ([115.124.28.3]:33631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nEmxT-0000Yl-Bp
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 01:48:09 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07818407|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0266559-0.000563497-0.972781;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047193; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.MkdRH7G_1643698071; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.MkdRH7G_1643698071)
 by smtp.aliyun-inc.com(10.147.41.178);
 Tue, 01 Feb 2022 14:47:51 +0800
Message-ID: <7880c265-2f0e-b932-66e3-fffb232ac2a9@c-sky.com>
Date: Tue, 1 Feb 2022 14:47:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL 53/61] target/riscv: Split out the vill from vtype
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
 <20220121055830.3164408-54-alistair.francis@opensource.wdc.com>
 <CAFEAcA_V_L7_bD=_U9eKf_we2Q79tb_sJ2XAcGSzWgL-ooqg+Q@mail.gmail.com>
 <CAKmqyKO9wVmvNJDc1T1pnVcyf7XEYsrLUxxqAOQ15=TbcLkdhw@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
In-Reply-To: <CAKmqyKO9wVmvNJDc1T1pnVcyf7XEYsrLUxxqAOQ15=TbcLkdhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=115.124.28.3; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-3.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair.francis@opensource.wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2022/2/1 10:12, Alistair Francis wrote:
> On Sat, Jan 29, 2022 at 2:10 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>> On Fri, 21 Jan 2022 at 09:42, Alistair Francis
>> <alistair.francis@opensource.wdc.com> wrote:
>>> From: LIU Zhiwei <zhiwei_liu@c-sky.com>
>>>
>>> We need not specially process vtype when XLEN changes.
>>>
>>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>> Message-id: 20220120122050.41546-16-zhiwei_liu@c-sky.com
>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> Odd thing I noticed looking at this code: as far as I can see we
>> may set env->vill to 1 in the vsetvl helper, but there is nowhere
>> that we set it to 0, so once it transitions to 1 it's stuck there
>> until the system is reset. Is this really right?
> This is really confusing. It implies that you can't set vill from
> software, but that just seems to be confusing wording.
>
> Reading https://lists.riscv.org/g/tech-vector-ext/topic/reliably_set_vtype_vill/86745728
> it seems that this is a QEMU bug and the guest should be able to set
> the bit as part of vsetvl
>
> @LIU Zhiwei are you able to fix this up?

Thanks for pointing it out. I have sent a patch to fix this up.

Thanks,
Zhiwei

>
>
> Alistair

