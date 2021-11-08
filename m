Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7443D449E94
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 23:09:42 +0100 (CET)
Received: from localhost ([::1]:52644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkCph-0007nc-0K
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 17:09:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1mkCmi-0005V8-A4; Mon, 08 Nov 2021 17:06:36 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:57435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1mkCmf-00020k-Ob; Mon, 08 Nov 2021 17:06:36 -0500
Received: (Authenticated sender: jcd@tribudubois.net)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 6859E1C0004;
 Mon,  8 Nov 2021 22:06:28 +0000 (UTC)
Message-ID: <7e8cc67c-2380-e401-ddc7-7dc24df31ede@tribudubois.net>
Date: Mon, 8 Nov 2021 23:06:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: Qemu and ARM secure state.
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <07e63acb-b756-2586-2ba2-b54b837f7fc8@tribudubois.net>
 <CAFEAcA89YQ_vN-JpCeB+L==F5g1hM=CNMBzjaf5c3EHF19NVyQ@mail.gmail.com>
 <c8b89685-7490-328b-51a3-48711c140a84@tribudubois.net>
 <d19f6d2c-7505-b326-3a67-48c336f111e9@tribudubois.net>
 <dd45f94c-6110-7251-4f9f-5b4e1fbb73a4@tribudubois.net>
 <e0a1b786-4b1c-c608-495b-3fb839de2376@tribudubois.net>
 <87k0hik9yc.fsf@linaro.org>
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
In-Reply-To: <87k0hik9yc.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.70.183.197; envelope-from=jcd@tribudubois.net;
 helo=relay5-d.mail.gandi.net
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.06,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/11/2021 à 15:14, Alex Bennée a écrit :
> Jean-Christophe DUBOIS <jcd@tribudubois.net> writes:
>
>> One small question/remark:
>>
>> According to the the "Arm Power State Coordinate Interface" (DEN0022D.b) document (chapter 5) PSCI calls can only be issued by
>> "normal world" (EL1 or EL2). Therefore, should we be adding a test for the current secure state in the arm_is_psci_call() function? This
>> would prevent calling the built-in Qemu PSCI function if SMC is issued
>> from secure state.
> All that should be handled in:
>
>    void HELPER(pre_smc)(CPUARMState *env, uint32_t syndrome)
>
> which should cause things to be trapped if the CPU is in an invalid
> state to execute the SMC instruction. If the exception is a valid SMC we
> end up in arm_cpu_do_interrupt where we may divert to
> arm_handle_psci_call.

The problem I have is that is seems that once the "psci-conduit" is set 
to SMC, all SMC exception would be handled only by the diverted  
arm_handle_psci_call().

It seems there is no way to handle SMC exception in my software once 
"psci-conduit" is set to SMC on a platform.

It used to be that only some PSCI services were diverted and other SMC 
services were handled by the EL3 software if any (and this split was 
actually also a bit awkward).

>


