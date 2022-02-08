Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEF44AD073
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 05:58:20 +0100 (CET)
Received: from localhost ([::1]:43146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHIa2-0005Bc-Mz
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 23:58:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nHIYd-0004I2-R9; Mon, 07 Feb 2022 23:56:51 -0500
Received: from mail.ispras.ru ([83.149.199.84]:51382)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nHIYZ-0006Gk-Pq; Mon, 07 Feb 2022 23:56:50 -0500
Received: from [192.168.0.219] (unknown [62.118.138.151])
 by mail.ispras.ru (Postfix) with ESMTPSA id B6B6340D403D;
 Tue,  8 Feb 2022 04:56:37 +0000 (UTC)
Subject: Re: target/arm: cp15.dacr migration
To: Peter Maydell <peter.maydell@linaro.org>
References: <662aca02-da99-524f-d9df-cd61427ca520@ispras.ru>
 <CAFEAcA_U1hgz55mGX7DZp36aOHGriU0wjr9Dvt4Y=f2EGNgF+A@mail.gmail.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <6bf3ba6a-0694-21c6-dbcc-d77f69fda4cb@ispras.ru>
Date: Tue, 8 Feb 2022 07:56:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_U1hgz55mGX7DZp36aOHGriU0wjr9Dvt4Y=f2EGNgF+A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.02.2022 16:44, Peter Maydell wrote:
> On Mon, 7 Feb 2022 at 12:13, Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> wrote:
>>
>> I recently encountered a problem with cp15.dacr register.
>> It has _s and _ns versions. During the migration only dacr_ns is
>> saved/loaded.
>> But both of the values are used in get_phys_addr_v5 and get_phys_addr_v6
>> functions. Therefore VM behavior becomes incorrect after loading the
>> vmstate.
> 
> Yes, we don't correctly save and restore the Secure banked
> registers. This is a long standing bug (eg it is the
> cause of https://gitlab.com/qemu-project/qemu/-/issues/467).
> Almost nobody notices this, because almost nobody both runs
> Secure-world AArch32 code and also tries migration or save/restore.

We actually did it for reverse debugging of custom firmware.

>> I found that kvm_to_cpreg_id is responsible for disabling dacr_s
>> migration, because it always selects ns variant.
> 
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index c6a4d50e82..d3ffef3640 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -2510,11 +2510,6 @@ static inline uint32_t kvm_to_cpreg_id(uint64_t
>> kvmid)
>>            if ((kvmid & CP_REG_SIZE_MASK) == CP_REG_SIZE_U64) {
>>                cpregid |= (1 << 15);
>>            }
>> -
>> -        /* KVM is always non-secure so add the NS flag on AArch32 register
>> -         * entries.
>> -         */
>> -         cpregid |= 1 << CP_REG_NS_SHIFT;
>>        }
>>        return cpregid;
>>    }
> 
> This change is wrong, or at least incomplete -- as the comment notes,
> a guest running under KVM is always NonSecure, so when KVM says "this is
> DACR" (or whatever) it always means "this is the NS banked DACR".
> (Though now AArch32 KVM support has been dropped we have some flexibility
> to not necessarily use KVM register ID values that exactly match what
> the kernel uses, if we need to do that.)

Unfortunately, I can't test anything with AArch32 KVM.

> Also, kvm_to_cpreg_id() and cpreg_to_kvm_id() are supposed to be
> inverses of each other -- at the moment they are not, hence
> this bug, but I think your change has probably resulted in both
> the S and the NS banked versions of each register being treated
> as the S banked version, which will have a different set of problems.

I checked the flags coming through write_cpustate_to_list. There were 
both dacr_s and dacr_ns flags. Therefore both values were saved.

> 
> There is also the question of migration compatibility to consider
> in any change in this area.


Pavel Dovgalyuk

