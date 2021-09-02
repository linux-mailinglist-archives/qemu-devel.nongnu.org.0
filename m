Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2974D3FE7C7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 04:46:39 +0200 (CEST)
Received: from localhost ([::1]:56318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLckP-0004oL-Lx
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 22:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mLcil-0003v0-KC; Wed, 01 Sep 2021 22:44:55 -0400
Received: from out28-149.mail.aliyun.com ([115.124.28.149]:54672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mLcii-0000xe-Fm; Wed, 01 Sep 2021 22:44:55 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08105341|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.00221651-0.000382852-0.997401;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047205; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.LEK.SRY_1630550683; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LEK.SRY_1630550683)
 by smtp.aliyun-inc.com(10.147.44.118);
 Thu, 02 Sep 2021 10:44:43 +0800
Subject: Re: [PATCH] target/riscv: Fix satp write
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210901124539.222868-1-zhiwei_liu@c-sky.com>
 <CAEUhbmUvb4_tmevGEcK_YgyA9_g5LumRVpMc7+rwuD4D7FSBBA@mail.gmail.com>
 <a61c6fef-4bce-0c5b-7aff-b9e2fa75aa5b@c-sky.com>
 <CAEUhbmXULr_mcdfh6x=BGLNcNM5Q7YrFhnHOuLatbrokqP0Taw@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <e5f5e2b1-8fc5-31de-c927-1ae7545957f8@c-sky.com>
Date: Thu, 2 Sep 2021 10:44:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmXULr_mcdfh6x=BGLNcNM5Q7YrFhnHOuLatbrokqP0Taw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.149; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-149.mail.aliyun.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.029,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/9/2 上午9:59, Bin Meng wrote:
> On Thu, Sep 2, 2021 at 9:02 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>>
>> On 2021/9/1 下午9:05, Bin Meng wrote:
>>> On Wed, Sep 1, 2021 at 8:51 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>>>> These variables should be target_ulong. If truncated to int,
>>>> the bool conditions they indicate will be wrong.
>>>>
>>>> As satp is very important for Linux, this bug almost fails every boot.
>>> Could you please describe which Linux configuration is broken?
>> I use the image from:
>>
>> https://gitlab.com/c-sky/buildroot/-/jobs/1251564514/artifacts/browse/output/images/
>>
>>>    I have
>>> a 64-bit 5.10 kernel and it boots fine.
>> The login is mostly OK for me. But the busybox can't run properly.
> Which kernel version is this?
5.10.4
> Could you please investigate and
> indicate in the commit message?
>
> I just tested current qemu-system-riscv64 can boot to Ubuntu 20.04
> distro user space.

Very strange.  This will cause tlb_flush can't be called in this function.

Thanks,
Zhiwei

>
> Regards,
> Bin

