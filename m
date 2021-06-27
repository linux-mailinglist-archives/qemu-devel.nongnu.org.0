Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB973B5531
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Jun 2021 23:09:03 +0200 (CEST)
Received: from localhost ([::1]:58630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxc1W-0002sh-CY
	for lists+qemu-devel@lfdr.de; Sun, 27 Jun 2021 17:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1lxc0X-00020b-4f; Sun, 27 Jun 2021 17:08:01 -0400
Received: from mail.csgraf.de ([85.25.223.15]:32998 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1lxc0U-0002Jz-JE; Sun, 27 Jun 2021 17:08:00 -0400
Received: from MacBook-Air.alex.local
 (dynamic-077-002-101-004.77.2.pool.telefonica.de [77.2.101.4])
 by csgraf.de (Postfix) with ESMTPSA id AF34960801CD;
 Sun, 27 Jun 2021 23:07:55 +0200 (CEST)
Subject: Re: [PATCH v8 19/19] hvf: arm: Handle Windows 10 SMC call
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-20-agraf@csgraf.de>
 <CAFEAcA880Kgb5GtKEQQpnD=fAwfm1Cs1Sjfc4L5S0ETkjm-CWA@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <ee7df565-7b43-f1b3-aee7-de67167acf4c@csgraf.de>
Date: Sun, 27 Jun 2021 23:07:55 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA880Kgb5GtKEQQpnD=fAwfm1Cs1Sjfc4L5S0ETkjm-CWA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.765,
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


On 15.06.21 11:31, Peter Maydell wrote:
> On Wed, 19 May 2021 at 21:23, Alexander Graf <agraf@csgraf.de> wrote:
>> Windows 10 calls an SMCCC call via SMC unconditionally on boot. It lives
>> in the trusted application call number space, but its purpose is unknown.
>>
>> In our current SMC implementation, we inject a UDEF for unknown SMC calls,
>> including this one. However, Windows breaks on boot when we do this. Instead,
>> let's return an error code.
>>
>> With this patch applied I can successfully boot the current Windows 10
>> Insider Preview in HVF.
>>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>>
>> ---
>>
>> v7 -> v8:
>>
>>   - fix checkpatch
>> ---
>>  target/arm/hvf/hvf.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
>> index 65c33e2a14..be670af578 100644
>> --- a/target/arm/hvf/hvf.c
>> +++ b/target/arm/hvf/hvf.c
>> @@ -931,6 +931,10 @@ int hvf_vcpu_exec(CPUState *cpu)
>>          cpu_synchronize_state(cpu);
>>          if (!hvf_handle_psci_call(cpu)) {
>>              advance_pc = true;
>> +        } else if (env->xregs[0] == QEMU_SMCCC_TC_WINDOWS10_BOOT) {
>> +            /* This special SMC is called by Windows 10 on boot. Return error */
>> +            env->xregs[0] = -1;
>> +            advance_pc = true;
>>          } else {
>>              trace_hvf_unknown_smc(env->xregs[0]);
>>              hvf_raise_exception(env, EXCP_UDEF, syn_uncategorized());
> Where can I find documentation on what this SMC call is and what
> it's supposed to do ?


It's 0xc3000001 which according to the SMCCC spec [1] means OR'ed values
of the following:

0x80000000 = Fast Call
0x40000000 = SMC64
0x03000000 = OEM Service Calls
0x00000001 = Function number 1

So, uh. I'm not sure how to answer the question above. I don't have
source level access to Windows to read what the call is supposed to do
:). But it's definitely calling something OEM specific that it really
shouldn't be callling.

Reading the SMCCC spec section 5.2, unknown SMCCC calls should return
-1. It advises against probing by just calling them, but does not
specify any other fault behavior than the -1 return (such as the #UDEF
we inject in TCG).


Alex

[1] https://developer.arm.com/documentation/den0028/latest


