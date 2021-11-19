Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6EB456D6E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 11:39:17 +0100 (CET)
Received: from localhost ([::1]:54016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo1Ia-0003in-GU
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 05:39:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>) id 1mo1Fa-00026q-0Q
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 05:36:11 -0500
Received: from mail.csgraf.de ([85.25.223.15]:41808 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>) id 1mo1FK-00034X-MG
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 05:36:09 -0500
Received: from [192.168.24.197]
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with ESMTPSA id 1B5F860804E4;
 Fri, 19 Nov 2021 11:35:44 +0100 (CET)
Message-ID: <6f83f61e-138d-b8a2-b21c-0dbd2805437d@csgraf.de>
Date: Fri, 19 Nov 2021 11:35:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PULL 02/22] arm: tcg: Adhere to SMCCC 1.3 section 5.2
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210930151201.9407-1-peter.maydell@linaro.org>
 <20210930151201.9407-3-peter.maydell@linaro.org>
 <CAFEAcA_-V7uJ3hkC88ycXFBEXxV2fiUTBNrh+RDnjDfX2GGNww@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <CAFEAcA_-V7uJ3hkC88ycXFBEXxV2fiUTBNrh+RDnjDfX2GGNww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.727,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrei Warkentin <andrey.warkentin@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jean-Christophe DUBOIS <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 18.11.21 22:57, Peter Maydell wrote:
> On Thu, 30 Sept 2021 at 16:12, Peter Maydell <peter.maydell@linaro.org> wrote:
>> From: Alexander Graf <agraf@csgraf.de>
>>
>> The SMCCC 1.3 spec section 5.2 says
>>
>>    The Unknown SMC Function Identifier is a sign-extended value of (-1)
>>    that is returned in the R0, W0 or X0 registers. An implementation must
>>    return this error code when it receives:
>>
>>      * An SMC or HVC call with an unknown Function Identifier
>>      * An SMC or HVC call for a removed Function Identifier
>>      * An SMC64/HVC64 call from AArch32 state
>>
>> To comply with these statements, let's always return -1 when we encounter
>> an unknown HVC or SMC call.
> TL/DR: I propose to revert this for 6.2.
>
> This change turns out to cause regressions, for instance on the
> imx6ul boards as described here:
> https://lore.kernel.org/qemu-devel/c8b89685-7490-328b-51a3-48711c140a84@tribudubois.net/
>
> The primary cause of that regression is that the guest code running
> at EL3 expects SMCs (not related to PSCI) to do what they would if
> our PSCI emulation was not present at all, but after this change
> they instead set a value in R0/X0 and continue.
>
> I had a look at fixing this, which involves deferring the "do we
> want to enable PSCI emulation?" decision into the hw/arm/boot.c
> code (which is the only place we finally figure out whether we're
> going to be booting the guest into EL3 or not). I have some
> more-or-less working prototype code, but in the course of writing
> it I discovered a much harder to fix issue:
>
> The highbank board both:
>   (1) wants to enable PSCI emulation
>   (2) has a bit of guest code that it wants to run at EL3 and
>       to perform SMC calls that trap to the monitor vector table:
>       this is the boot stub code that is written to memory by
>       arm_write_secure_board_setup_dummy_smc() and which the
>       highbank board enables by setting bootinfo->secure_board_setup
>
> We can't satisfy both of those and also have the PSCI emulation
> handle all SMC instruction executions regardless of function
> identifier value.
>
> There is probably a solution to this, but I'm not sure what it
> is right now (it might involve having QEMU manually do the things
> that we currently have the arm_write_secure_board_setup_dummy_smc
> write guest code to do) and it's going to require digging through
> what the highbank board actually is supposed to do here. Given
> that we're already in the release cycle for 6.2, I think the
> safest and simplest approach is to revert this patch for now,
> which just takes us back to the behaviour we've always had
> in previous releases. We can then take our time to figure out
> how to clean up this mess in 7.0.


Ugh :(. Conceptually, once you tell QEMU to handle PSCI, you're 
basically giving up that EL to it. It sounds almost as if what these 
boards (imx6ul + highbank) want is an EL4 they can call into to deflect 
PSCI calls into from EL3 they own. We would basically have to allocate a 
currently undefinied/reserved instruction as "QEMU SMC" and make the EL3 
code call that when it needs to call QEMU for PSCI operations. Or a PV 
MMIO device. Or a PV sysreg. But at the end of the day, EL3 calling into 
QEMU differently than on real hardware is paravirtualization.

I agree with the conclusion that we revert it for QEMU 6.2 though. The 2 
guest OSs I'm aware of that rely on the behavior in the patch / spec 
(Windows and VMware ESXi) require more QEMU modifications to be fully 
functional: SMC as default conduit for Windows and EL3 PSR exposure for 
ESXi. So neither of them would work out of the box with 6.2 as is.

Just to double check: Is the broken monitor code that expects QEMU to 
partially handle SMCs only ever injected into the guest by us or is 
there existing guest payload code for EL3 that makes the same assumption?


Alex



