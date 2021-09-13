Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA4B4089DC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 13:09:51 +0200 (CEST)
Received: from localhost ([::1]:60780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPjqQ-0000lr-7n
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 07:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mPjoG-0007EY-BJ; Mon, 13 Sep 2021 07:07:36 -0400
Received: from mail.csgraf.de ([85.25.223.15]:43904 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mPjoB-0004Wk-U7; Mon, 13 Sep 2021 07:07:35 -0400
Received: from MacBook-Air.alex.local
 (dynamic-095-118-088-150.95.118.pool.telefonica.de [95.118.88.150])
 by csgraf.de (Postfix) with ESMTPSA id 5E8ED608037D;
 Mon, 13 Sep 2021 13:07:28 +0200 (CEST)
Subject: Re: [PATCH v9 07/11] hvf: arm: Implement PSCI handling
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210912230757.41096-1-agraf@csgraf.de>
 <20210912230757.41096-8-agraf@csgraf.de>
 <CAFEAcA8BybrfxNxkWbEjxji4DvDumr6Otb_RK_f84Dt_TWXfpA@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <ad707e0d-8d4a-0248-80f4-a02a7226ce0a@csgraf.de>
Date: Mon, 13 Sep 2021 13:07:17 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8BybrfxNxkWbEjxji4DvDumr6Otb_RK_f84Dt_TWXfpA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.969,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 13.09.21 10:54, Peter Maydell wrote:
> On Mon, 13 Sept 2021 at 00:08, Alexander Graf <agraf@csgraf.de> wrote:
>> We need to handle PSCI calls. Most of the TCG code works for us,
>> but we can simplify it to only handle aa64 mode and we need to
>> handle SUSPEND differently.
>>
>> This patch takes the TCG code as template and duplicates it in HVF.
>>
>> To tell the guest that we support PSCI 0.2 now, update the check in
>> arm_cpu_initfn() as well.
>>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>> Reviewed-by: Sergio Lopez <slp@redhat.com>
>>
>> ---
>>
>> v6 -> v7:
>>
>>   - This patch integrates "arm: Set PSCI to 0.2 for HVF"
>>
>> v7 -> v8:
>>
>>   - Do not advance for HVC, PC is already updated by hvf
>>   - Fix checkpatch error
>>
>> v8 -> v9:
>>
>>   - Use new hvf_raise_exception() prototype
>>   - Make cpu_off function void
>>   - Add comment about return value, use -1 for "not found"
>>   - Remove cpu_synchronize_state() when halted
>> ---
>>  target/arm/cpu.c            |   4 +-
>>  target/arm/hvf/hvf.c        | 127 ++++++++++++++++++++++++++++++++++--
>>  target/arm/hvf/trace-events |   1 +
>>  3 files changed, 126 insertions(+), 6 deletions(-)
> Something in here should be checking whether the insn the guest
> used matches the PSCI conduit configured for the VM, ie
> what arm_is_psci_call() does after your patch 10.


It's yet another case where I believe we are both reading the spec
differently :)

  https://documentation-service.arm.com/static/6013e5faeee5236980d08619

Section 2.5.3 speaks about the conduits. It says

    Service calls are expected to be invoked through SMC instructions,
except
    for Standard Hypervisor Calls and Vendor Specific Hypervisor Calls. On
    some platforms, however, SMC instructions are not available, and the
    services can be accessed through HVC instructions. The method that
    is used to invoke the service is referred to as the conduit.

To me, that reads like "Use SMC whenever you can. If your hardware does
not give you a way to handle SMC calls, falling back to HVC is ok. In
that case, indicate that mandate to the OS".

In hvf, we can very easily trap for SMC calls and handle them. Why are
we making OSs implement HVC call paths when SMC would work just as well
for everyone?

To keep your train of thought though, what would you do if we encounter
a conduit that is different from the chosen one? Today, I am aware of 2
different implementations: TCG injects #UD [1] while KVM sets x0 to -1 [2].

IMHO the best way to resolve all of this mess is to consolidate to SMC
as default PSCI handler and for now treat HVC as if it was an SMC call
as well for virtual environments. Once we get nested virtualization, we
will need to move to SMC as default anyway.


Alex

[1]
https://git.qemu.org/?p=qemu.git;a=blob;f=target/arm/op_helper.c;hb=HEAD#l813
[2]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/kvm/handle_exit.c#n52


