Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE9E449E98
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 23:11:10 +0100 (CET)
Received: from localhost ([::1]:57056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkCr7-0002Lo-Mb
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 17:11:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1mkCpw-0000yL-BY; Mon, 08 Nov 2021 17:09:56 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:40163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1mkCpt-0002OS-AO; Mon, 08 Nov 2021 17:09:55 -0500
Received: (Authenticated sender: jcd@tribudubois.net)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id E74F2E0005;
 Mon,  8 Nov 2021 22:09:49 +0000 (UTC)
Message-ID: <ec74f093-9508-c0fc-3e06-2e8abf8655c6@tribudubois.net>
Date: Mon, 8 Nov 2021 23:09:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: Qemu and ARM secure state.
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <07e63acb-b756-2586-2ba2-b54b837f7fc8@tribudubois.net>
 <CAFEAcA89YQ_vN-JpCeB+L==F5g1hM=CNMBzjaf5c3EHF19NVyQ@mail.gmail.com>
 <c8b89685-7490-328b-51a3-48711c140a84@tribudubois.net>
 <d19f6d2c-7505-b326-3a67-48c336f111e9@tribudubois.net>
 <dd45f94c-6110-7251-4f9f-5b4e1fbb73a4@tribudubois.net>
 <e0a1b786-4b1c-c608-495b-3fb839de2376@tribudubois.net>
 <CAFEAcA-DnbocsRHC3cUM_uX=kGn-KJa3q42TCyaB=isxKTS-Sg@mail.gmail.com>
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
In-Reply-To: <CAFEAcA-DnbocsRHC3cUM_uX=kGn-KJa3q42TCyaB=isxKTS-Sg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.70.183.196; envelope-from=jcd@tribudubois.net;
 helo=relay4-d.mail.gandi.net
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.06,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/11/2021 à 15:50, Peter Maydell a écrit :
> On Sat, 6 Nov 2021 at 18:11, Jean-Christophe DUBOIS <jcd@tribudubois.net> wrote:
>> One small question/remark:
>>
>> According to the the "Arm Power State Coordinate Interface" (DEN0022D.b) document (chapter 5) PSCI calls can only be issued by "normal world" (EL1 or EL2). Therefore, should we be adding a test for the current secure state in the arm_is_psci_call() function? This would prevent calling the built-in Qemu PSCI function if SMC is issued  from secure state.
> This shouldn't matter, because if the machine model is configured
> to execute guest code in EL3 at all then it should not be enabling
> QEMU's internal PSCI support. The internal PSCI stuff is only
> there as a kind of "emulated firmware" for when we're running
> guest code that starts at EL2 (notably, when directly booting
> a Linux kernel).
>
> The problem seems to be that fsl_imx6ul_realize() and
> fsl_imx7_realize() unconditionally enable PSCI-via-SMC.
> The imx7 code also puts all the secondaries into
> PSCI-powered-off mode -- this should be checked to
> work out what the right thing is if we're not doing
> emulated PSCI and instead starting the guest at EL3.

OK, so one problem seems to be that PSCI-via-SMC is enabled on i.MX6UL 
when there is no built in PSCI related function on this processor.

According the Linux DTS, i.MX7 (solo and dual) processors have a 
somewhat PSCI related "entry-method" 
(https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/imx7s.dtsi). 
But it is not clear to me how this is used and this seems a bit strange 
as "entry-method" seems to be mostly used on arm64 and there is no other 
PSCI related information in the i.MX7 DTS files. As a matter of fact 
previous quad or dual i.MX6 were not supporting PSCI. Instead they were 
using a proprietary method through the internal SRC device (and i.MX7 
also has a similar internal SRC device). But let's assume Linux on i.mx7 
is actually using PSCI to handle processors.

Thinking about it, I guess this might be u-boot that sets an EL3 monitor 
software that is able to handle PSCI requests for the Linux kernel. If 
this is the case, it make sense that Qemu emulates the PSCI services 
normally provided by u-boot to be able to boot linux directly (without 
booting a real u-boot prior to linux). All  is well and nice.

But then if I want to boot and test the u-boot binary (or any trusted OS 
for the matter) on a Qemu emulated i.MX7 (to later boot an hypervisor or 
an OS), it would be rather strange that any PSCI related service 
requested by the hypervisor/OS  would be handled by Qemu directly and 
not by the u-boot code (or any other EL3 code) running on the processor. 
How is it supposed to work? How can I tell Qemu (dynamically?) if I want 
it to provide (or not) the PSCI services (and more generally SMC/HVC 
services). How can I tell it that I want to handle all SMC/EL3 services 
by myself even if the "psci-conduit" is already set to SMC in Qemu?

Am I missing something?

thanks.

JC

>
> -- PMM
>


