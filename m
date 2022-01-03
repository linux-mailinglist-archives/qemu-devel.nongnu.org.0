Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C0E482EB6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 08:25:04 +0100 (CET)
Received: from localhost ([::1]:33702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4HiJ-00020s-1p
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 02:25:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4H8e-0006ju-S6
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 01:48:16 -0500
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:51451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4H8c-0002gJ-Ol
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 01:48:12 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.188])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id BC954206BA;
 Mon,  3 Jan 2022 06:48:07 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 3 Jan
 2022 07:48:07 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006aff3ceef-43b9-4857-8fb5-1e31bcd51eb0,
 71ABFCEAB0EE88409933ED7B68EF8EFCD2601B88) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <238d16f2-988d-2efe-b68a-b7581f54dda8@kaod.org>
Date: Mon, 3 Jan 2022 07:48:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/3] Reorg ppc64 pmu insn counting
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, Richard Henderson
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
References: <20211223030149.1947418-1-richard.henderson@linaro.org>
 <1b988844-075d-beb3-7fd1-a26f30e9f5dc@gmail.com>
 <1928bc96-ace5-3e5b-2da2-723ef3071173@linaro.org>
 <c2d241d4-d466-c599-e00e-3fdb62722bbb@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <c2d241d4-d466-c599-e00e-3fdb62722bbb@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f083ee99-6877-45be-b28d-5bd7423278bc
X-Ovh-Tracer-Id: 11251962196016204707
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudeftddgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/30/21 23:12, Daniel Henrique Barboza wrote:
> 
> 
> On 12/23/21 18:19, Richard Henderson wrote:
>> On 12/23/21 12:36 PM, Daniel Henrique Barboza wrote:
>>> This reorg is breaking PMU-EBB tests, unfortunately. These tests are run from the kernel
>>> tree [1] and I test them inside a pSeries TCG guest. You'll need to apply patches 9 and
>>> 10 of [2] beforehand (they apply cleanly in current master) because they aren't upstream
>>> yet and EBB needs it.
>>>
>>> The tests that are breaking consistently with this reorg are:
>>>
>>> back_to_back_ebbs_test.c
>>> cpu_event_pinned_vs_ebb_test.c
>>> cycles_test.c
>>> task_event_pinned_vs_ebb_test.c
>>
>> In which case perhaps drop my first patch for now, and instead simply replicate your tcg algorithm in c exactly -- using none of the helpers that currently exist.
>>
>> We can improve the code, and the use of pmc_get_event from hreg_compute_hregs_value second.
> 
> 
> While attempting to do that I figured what was off with this series and ended up
> fixing it.
> 
> It's now working with the event-based branch interrupt tests and Avocado seems happy
> as well. It took some small adjustments/fixes in patches 1/2 and an extra patch of mine
> tuning the existing logic after the reorg.
> 
> 
> I'll clean it up and re-send it next week/year.

Shouldn't we merge this series first ? It is really improving emulation
and keeps the check-avocado tests under the timeout limit (which I find
important).

Thanks,

C.

