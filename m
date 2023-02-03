Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E38689B95
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:27:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx16-0004tC-GT; Fri, 03 Feb 2023 09:26:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1pNx13-0004sC-Vv; Fri, 03 Feb 2023 09:26:14 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1pNx10-0004g5-H6; Fri, 03 Feb 2023 09:26:13 -0500
Received: from [0.0.0.0] (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com
 [3.122.114.9]) by csgraf.de (Postfix) with ESMTPSA id 422976080930;
 Fri,  3 Feb 2023 15:26:03 +0100 (CET)
Message-ID: <eaefd5ff-4591-27b4-f853-c05b3bdefdf4@csgraf.de>
Date: Fri, 3 Feb 2023 15:26:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2] hvf: arm: Add support for GICv3
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, osy <osy@turing.llc>
References: <20230128224459.70676-1-agraf@csgraf.de>
 <CAFEAcA_u2=QJiuCWfZ5ZQZ_mevqCR0iZO51ktnqzTaY7xWfUQw@mail.gmail.com>
 <CAFEAcA-TdE1YHo6hJ0xvN2qZ8NSafqqUSFQwovJcTmWm=k2NvA@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <CAFEAcA-TdE1YHo6hJ0xvN2qZ8NSafqqUSFQwovJcTmWm=k2NvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hey Peter,

On 03.02.23 11:57, Peter Maydell wrote:
> On Thu, 2 Feb 2023 at 17:56, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On Sat, 28 Jan 2023 at 22:45, Alexander Graf <agraf@csgraf.de> wrote:
>>> We currently only support GICv2 emulation. To also support GICv3, we will
>>> need to pass a few system registers into their respective handler functions.
>>>
>>> This patch adds support for HVF to call into the TCG callbacks for GICv3
>>> system register handlers. This is safe because the GICv3 TCG code is generic
>>> as long as we limit ourselves to EL0 and EL1 - which are the only modes
>>> supported by HVF.
>>>
>>> To make sure nobody trips over that, we also annotate callbacks that don't
>>> work in HVF mode, such as EL state change hooks.
>>>
>>> With GICv3 support in place, we can run with more than 8 vCPUs.
>>>
>>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>>>
>>> ---
>>
>>
>> Applied to target-arm.next, thanks.
> This one *also* fails 'make check'. Please can you test your
> patches before sending them?
>
> The fix is not difficult (another missing qtest_enabled() check),
> so I've squashed it in.


Sorry for the mess :(. I usually do test TCG and HVF when submitting 
these patches with various VMs, but keep forgetting about "make check". 
I'll try hard to remember next time.


Thanks,

Alex



