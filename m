Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4BF408957
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 12:48:34 +0200 (CEST)
Received: from localhost ([::1]:43966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPjVp-0004UX-6F
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 06:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mPjTm-0003SA-I4; Mon, 13 Sep 2021 06:46:27 -0400
Received: from mail.csgraf.de ([85.25.223.15]:43878 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mPjTi-00036K-4Q; Mon, 13 Sep 2021 06:46:26 -0400
Received: from MacBook-Air.alex.local
 (dynamic-095-118-088-150.95.118.pool.telefonica.de [95.118.88.150])
 by csgraf.de (Postfix) with ESMTPSA id 6A0B4608037D;
 Mon, 13 Sep 2021 12:46:18 +0200 (CEST)
Subject: Re: [PATCH v8 15/19] hvf: arm: Implement -cpu host
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-16-agraf@csgraf.de>
 <CAFEAcA9S619pfhfEXUxGQkjBBKahOYm14jpxEam2CQTtC1dRTQ@mail.gmail.com>
 <45519c63-06b1-1e06-032d-87d2e1338fd8@csgraf.de>
 <CAFEAcA_vC0beH4NMRP4hHK0drc6PZt073ZVZM=Majnfngkn_xQ@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <1c992028-633d-5f5e-f433-59492876eb73@csgraf.de>
Date: Mon, 13 Sep 2021 12:46:17 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_vC0beH4NMRP4hHK0drc6PZt073ZVZM=Majnfngkn_xQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 13.09.21 10:28, Peter Maydell wrote:
> On Sun, 12 Sept 2021 at 21:23, Alexander Graf <agraf@csgraf.de> wrote:
>>
>> On 15.06.21 12:56, Peter Maydell wrote:
>>> On Wed, 19 May 2021 at 21:23, Alexander Graf <agraf@csgraf.de> wrote:
>>>> Now that we have working system register sync, we push more target CPU
>>>> properties into the virtual machine. That might be useful in some
>>>> situations, but is not the typical case that users want.
>>>>
>>>> So let's add a -cpu host option that allows them to explicitly pass all
>>>> CPU capabilities of their host CPU into the guest.
>>>>
>>>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>>>> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
>>>>
>>>> ---
>>>>
>>>> v6 -> v7:
>>>>
>>>>   - Move function define to own header
>>>>   - Do not propagate SVE features for HVF
>>>>   - Remove stray whitespace change
>>>>   - Verify that EL0 and EL1 do not allow AArch32 mode
>>>>   - Only probe host CPU features once
>>>> +static void hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>>>> +{
>>>> +    ARMISARegisters host_isar;
>>> Can you zero-initialize this (with "= { }"), please? That way we
>>> know we have zeroes in the aarch32 ID fields rather than random junk later...
>>>
>>>> +    const struct isar_regs {
>>>> +        int reg;
>>>> +        uint64_t *val;
>>>> +    } regs[] = {
>>>> +        { HV_SYS_REG_ID_AA64PFR0_EL1, &host_isar.id_aa64pfr0 },
>>>> +        { HV_SYS_REG_ID_AA64PFR1_EL1, &host_isar.id_aa64pfr1 },
>>>> +        { HV_SYS_REG_ID_AA64DFR0_EL1, &host_isar.id_aa64dfr0 },
>>>> +        { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
>>>> +        { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.id_aa64isar0 },
>>>> +        { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.id_aa64isar1 },
>>>> +        { HV_SYS_REG_ID_AA64MMFR0_EL1, &host_isar.id_aa64mmfr0 },
>>>> +        { HV_SYS_REG_ID_AA64MMFR1_EL1, &host_isar.id_aa64mmfr1 },
>>>> +        { HV_SYS_REG_ID_AA64MMFR2_EL1, &host_isar.id_aa64mmfr2 },
>>>> +    };
>>>> +    hv_vcpu_t fd;
>>>> +    hv_vcpu_exit_t *exit;
>>>> +    int i;
>>>> +
>>>> +    ahcf->dtb_compatible = "arm,arm-v8";
>>>> +    ahcf->features = (1ULL << ARM_FEATURE_V8) |
>>>> +                     (1ULL << ARM_FEATURE_NEON) |
>>>> +                     (1ULL << ARM_FEATURE_AARCH64) |
>>>> +                     (1ULL << ARM_FEATURE_PMU) |
>>>> +                     (1ULL << ARM_FEATURE_GENERIC_TIMER);
>>>> +
>>>> +    /* We set up a small vcpu to extract host registers */
>>>> +
>>>> +    assert_hvf_ok(hv_vcpu_create(&fd, &exit, NULL));
>>>> +    for (i = 0; i < ARRAY_SIZE(regs); i++) {
>>>> +        assert_hvf_ok(hv_vcpu_get_sys_reg(fd, regs[i].reg, regs[i].val));
>>>> +    }
>>>> +    assert_hvf_ok(hv_vcpu_get_sys_reg(fd, HV_SYS_REG_MIDR_EL1, &ahcf->midr));
>>>> +    assert_hvf_ok(hv_vcpu_destroy(fd));
>>>> +
>>>> +    ahcf->isar = host_isar;
>>>> +    ahcf->reset_sctlr = 0x00c50078;
>>> Why this value in particular? Could we just ask the scratch HVF CPU
>>> for the value of SCTLR_EL1 rather than hardcoding something?
>>
>> The fresh scratch hvf CPU has 0 as SCTLR.
> Yuck. That's pretty unhelpful of hvf, since it's not an
> architecturally valid thing for a freshly reset EL1-only
> CPU to have as its SCTLR (some bits are supposed to be RES1
> or reset-to-1). In that case we do need to set this to a known
> value here, I guess -- but we should have a comment explaining
> why we do it and what bits we're setting.


Ok :)


>
>>>> +    /* Make sure we don't advertise AArch32 support for EL0/EL1 */
>>>> +    g_assert((host_isar.id_aa64pfr0 & 0xff) == 0x11);
>>> This shouldn't really be an assert, I think. error_report() something
>>> and return false, and then arm_cpu_realizefn() will fail, which should
>>> cause us to exit.
>>
>> I don't follow. We're filling in the -cpu host CPU template here. There
>> is no error path anywhere we could take.
> Look at how the kvm_arm_get_host_cpu_features() error handling works:
> it returns a bool. The caller (kvm_arm_set_cpu_features_from_host())
> checks the return value, and if the function failed it sets
> the cpu->host_cpu_probe_failed flag, which then results in realize
> failing. (You'll want to update the arm_cpu_realizefn to allow hvf
> as well as kvm for that error message.)


Sure, happy to adjust accordingly :)


>
>> This is a case that on today's systems can't happen - M1 does not
>> support AArch32 anywhere. So that assert could only ever hit if you run
>> macOS on non-Apple hardware (in which case I doubt hvf works as
>> intended) or if a new Apple CPU starts supporting AArch32 (again, very
>> unlikely).
>>
>> So overall, I think the assert here is not too bad :)
> Well, probably not, but you need the error handling path
> anyway for the boring case of "oops, this syscall failed".


Why? You only get to this code path if you already selected -accel hvf.
If even a simple "create scratch vcpu" syscall failed then, pretty
failure when you define -cpu host is the last thing you care about. Any
CPU creation would fail.

Alex



