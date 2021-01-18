Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB492F9C45
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 11:22:42 +0100 (CET)
Received: from localhost ([::1]:46270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1RgH-0000U2-OH
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 05:22:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l1RNT-0002EZ-U2
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 05:03:17 -0500
Received: from mx2.suse.de ([195.135.220.15]:36272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l1RNP-0008BJ-1I
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 05:03:15 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5B2E3AB7F;
 Mon, 18 Jan 2021 10:03:09 +0000 (UTC)
Subject: Re: [PATCH 4/6] accel/tcg: Declare missing cpu_loop_exit*() stubs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210117164813.4101761-1-f4bug@amsat.org>
 <20210117164813.4101761-5-f4bug@amsat.org>
 <fd7e64cd-d2cd-104f-ac1b-f5476e08b5a9@suse.de>
 <47f62c85-243c-ba70-56d6-0157afa5ae86@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <35adfe42-6f89-1f48-7ed2-da1d2f4d7eb7@suse.de>
Date: Mon, 18 Jan 2021 11:03:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <47f62c85-243c-ba70-56d6-0157afa5ae86@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.252,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/21 10:39 AM, Philippe Mathieu-Daudé wrote:
> On 1/18/21 10:29 AM, Claudio Fontana wrote:
>> On 1/17/21 5:48 PM, Philippe Mathieu-Daudé wrote:
>>> cpu_loop_exit*() functions are declared in accel/tcg/cpu-exec-common.c,
>>> and are not available when TCG accelerator is not built. Add stubs so
>>> linking without TCG succeed.
>>
>> The reason why stubs are needed here at all seems to be that that the code
>> calling cpu_loop_exit is not refactored properly yet;
> 
> I agree ...
> 
>> if we look at the example of i386, after the refactoring moving tcg related code into target/i386/tcg/,
>> (and really even before that I think),
>> the code calling cpu_loop_exit is not built for non-TCG at all, and so we don't need stubs.
>>
>> I am ok with this anyway, just wanted to convey that I think we should look at stubs as a necessary evil until all code stops mixing tcg, kvm and other accels...
>>
>> Thanks,
>>
>> Claudio
>>
>>>
>>> Problematic files:
>>>
>>> - hw/semihosting/console.c in qemu_semihosting_console_inc()
>>> - hw/ppc/spapr_hcall.c in h_confer()
>>> - hw/s390x/ipl.c in s390_ipl_reset_request()
>>> - hw/misc/mips_itu.c
> 
> ... but I have no clue how to refactore these, as they
> are used in both KVM and TCG.
> 
> How would you do? I'm stuck with the semihosting code
> dependency on ARM since 2 years...
> 
> Phil.
> 

Just naively looking at this, qemu_semihosting_console_inc seems called only by
do_arm_semihosting in target/arm/arm-semi.c,

which in turn is called by linux-user (TCG),

target/arm/m_helper.c in arm_v7m_cpu_do_interrupt(),
which I would assume is TCG only too, just waiting for the TCG/KVM refactoring in ARM, which I would assume would make cpu_tcg.c TCG-only,

target/arm/helper.c in handle_semihosting, which is already wrapped in #ifdef CONFIG_TCG and is commented with:

"
* We only see semihosting exceptions in TCG only as they are not                                                                           
* trapped to the hypervisor in KVM.                                                                                                        
*/
"

So am I wrong in my assumption that as soon as we are able to separate TCG vs KVM in target/arm/ , the issue of hw/semihosting/console.c would be solved?

Did not look at the other cases.

Ciao!

Claudio














