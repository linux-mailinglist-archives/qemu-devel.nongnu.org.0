Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF14C40816A
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 22:25:08 +0200 (CEST)
Received: from localhost ([::1]:33744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPW2F-00040N-8t
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 16:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mPW1I-0003A9-Rf; Sun, 12 Sep 2021 16:24:08 -0400
Received: from mail.csgraf.de ([85.25.223.15]:43392 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mPW1G-0003Xl-M5; Sun, 12 Sep 2021 16:24:08 -0400
Received: from MacBook-Air.alex.local
 (dynamic-095-117-028-179.95.117.pool.telefonica.de [95.117.28.179])
 by csgraf.de (Postfix) with ESMTPSA id 6F362608037D;
 Sun, 12 Sep 2021 22:23:56 +0200 (CEST)
Subject: Re: [PATCH v8 15/19] hvf: arm: Implement -cpu host
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-16-agraf@csgraf.de>
 <CAFEAcA9S619pfhfEXUxGQkjBBKahOYm14jpxEam2CQTtC1dRTQ@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <45519c63-06b1-1e06-032d-87d2e1338fd8@csgraf.de>
Date: Sun, 12 Sep 2021 22:23:55 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9S619pfhfEXUxGQkjBBKahOYm14jpxEam2CQTtC1dRTQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.584,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 15.06.21 12:56, Peter Maydell wrote:
> On Wed, 19 May 2021 at 21:23, Alexander Graf <agraf@csgraf.de> wrote:
>> Now that we have working system register sync, we push more target CPU
>> properties into the virtual machine. That might be useful in some
>> situations, but is not the typical case that users want.
>>
>> So let's add a -cpu host option that allows them to explicitly pass all
>> CPU capabilities of their host CPU into the guest.
>>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
>>
>> ---
>>
>> v6 -> v7:
>>
>>   - Move function define to own header
>>   - Do not propagate SVE features for HVF
>>   - Remove stray whitespace change
>>   - Verify that EL0 and EL1 do not allow AArch32 mode
>>   - Only probe host CPU features once
>> +static void hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>> +{
>> +    ARMISARegisters host_isar;
> Can you zero-initialize this (with "= { }"), please? That way we
> know we have zeroes in the aarch32 ID fields rather than random junk later...
>
>> +    const struct isar_regs {
>> +        int reg;
>> +        uint64_t *val;
>> +    } regs[] = {
>> +        { HV_SYS_REG_ID_AA64PFR0_EL1, &host_isar.id_aa64pfr0 },
>> +        { HV_SYS_REG_ID_AA64PFR1_EL1, &host_isar.id_aa64pfr1 },
>> +        { HV_SYS_REG_ID_AA64DFR0_EL1, &host_isar.id_aa64dfr0 },
>> +        { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
>> +        { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.id_aa64isar0 },
>> +        { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.id_aa64isar1 },
>> +        { HV_SYS_REG_ID_AA64MMFR0_EL1, &host_isar.id_aa64mmfr0 },
>> +        { HV_SYS_REG_ID_AA64MMFR1_EL1, &host_isar.id_aa64mmfr1 },
>> +        { HV_SYS_REG_ID_AA64MMFR2_EL1, &host_isar.id_aa64mmfr2 },
>> +    };
>> +    hv_vcpu_t fd;
>> +    hv_vcpu_exit_t *exit;
>> +    int i;
>> +
>> +    ahcf->dtb_compatible = "arm,arm-v8";
>> +    ahcf->features = (1ULL << ARM_FEATURE_V8) |
>> +                     (1ULL << ARM_FEATURE_NEON) |
>> +                     (1ULL << ARM_FEATURE_AARCH64) |
>> +                     (1ULL << ARM_FEATURE_PMU) |
>> +                     (1ULL << ARM_FEATURE_GENERIC_TIMER);
>> +
>> +    /* We set up a small vcpu to extract host registers */
>> +
>> +    assert_hvf_ok(hv_vcpu_create(&fd, &exit, NULL));
>> +    for (i = 0; i < ARRAY_SIZE(regs); i++) {
>> +        assert_hvf_ok(hv_vcpu_get_sys_reg(fd, regs[i].reg, regs[i].val));
>> +    }
>> +    assert_hvf_ok(hv_vcpu_get_sys_reg(fd, HV_SYS_REG_MIDR_EL1, &ahcf->midr));
>> +    assert_hvf_ok(hv_vcpu_destroy(fd));
>> +
>> +    ahcf->isar = host_isar;
>> +    ahcf->reset_sctlr = 0x00c50078;
> Why this value in particular? Could we just ask the scratch HVF CPU
> for the value of SCTLR_EL1 rather than hardcoding something?


The fresh scratch hvf CPU has 0 as SCTLR. But I'm happy to put an actual
M1 copy of it here.


>
>> +
>> +    /* Make sure we don't advertise AArch32 support for EL0/EL1 */
>> +    g_assert((host_isar.id_aa64pfr0 & 0xff) == 0x11);
> This shouldn't really be an assert, I think. error_report() something
> and return false, and then arm_cpu_realizefn() will fail, which should
> cause us to exit.


I don't follow. We're filling in the -cpu host CPU template here. There
is no error path anywhere we could take. Or are you suggesting we only
error on realize? I don't see any obvious way how we could tell the
realize function that we don't want to expose AArch32 support for -cpu host.

This is a case that on today's systems can't happen - M1 does not
support AArch32 anywhere. So that assert could only ever hit if you run
macOS on non-Apple hardware (in which case I doubt hvf works as
intended) or if a new Apple CPU starts supporting AArch32 (again, very
unlikely).

So overall, I think the assert here is not too bad :)


Alex



