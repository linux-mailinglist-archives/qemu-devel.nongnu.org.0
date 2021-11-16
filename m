Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222C7453493
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 15:46:49 +0100 (CET)
Received: from localhost ([::1]:34880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmzjT-0005Y5-P9
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 09:46:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mmzgQ-0003eM-5t
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 09:43:38 -0500
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25]:54681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mmzgN-0006TI-9U
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 09:43:37 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.148])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id DC5B62052C;
 Tue, 16 Nov 2021 14:43:32 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 16 Nov
 2021 15:43:25 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0013bd5ed31-ae31-4889-9e13-71fb28bc7bf8,
 BFAEB7FE3C4E2C4D96001007C3BA12B7689A693E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 129.41.46.1
Message-ID: <8bd22f7c-b491-55b6-9879-5035dfe5de22@kaod.org>
Date: Tue, 16 Nov 2021 15:43:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/2] target/ppc: Fixed call to deferred exception
Content-Language: en-US
To: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
References: <20211020125724.78028-1-lucas.araujo@eldorado.org.br>
 <20211020125724.78028-2-lucas.araujo@eldorado.org.br>
 <2458d27b-75eb-e4f8-c588-efd8c50df5fc@gmail.com>
 <db132b26-0025-f573-1006-8a8c7aa2a656@kaod.org>
 <1686a574-311f-90e5-1420-bba529be89fe@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <1686a574-311f-90e5-1420-bba529be89fe@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 25b47d9a-e59b-420e-87da-deb1adbbfc51
X-Ovh-Tracer-Id: 14091200286566353769
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfedvgdeiiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuveelvdejteegteefieevfeetffefvddvieekteevleefgeelgfeutedvfedvfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.446,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 richard.henderson@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 18:29, Lucas Mateus Martins Araujo e Castro wrote:
> 
> On 10/11/2021 03:56, Cédric Le Goater wrote:
>> On 11/9/21 17:37, Daniel Henrique Barboza wrote:
>>>
>>>
>>> On 10/20/21 09:57, Lucas Mateus Castro (alqotel) wrote:
>>>> From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>
>>>>
>>>> mtfsf, mtfsfi and mtfsb1 instructions call helper_float_check_status
>>>> after updating the value of FPSCR, but helper_float_check_status
>>>> checks fp_status and fp_status isn't updated based on FPSCR and
>>>> since the value of fp_status is reset earlier in the instruction,
>>>> it's always 0.
>>>>
>>>> Because of this helper_float_check_status would change the FI bit to 0
>>>> as this bit checks if the last operation was inexact and
>>>> float_flag_inexact is always 0.
>>>>
>>>> These instructions also don't throw exceptions correctly since
>>>> helper_float_check_status throw exceptions based on fp_status.
>>>>
>>>> This commit created a new helper, helper_fpscr_check_status that checks
>>>> FPSCR value instead of fp_status and checks for a larger variety of
>>>> exceptions than do_float_check_status.
>>>>
>>>> The hardware used to compare QEMU's behavior to, was a Power9.
>>
>> Do you have a test case for this ? If so, are you collecting them
>> on some repo ?
>>
>> Thanks,
>>
>> C.
> 
> Just created a test, currently on the branch https://github.com/PPC64/qemu/tree/alqotel_bug_mtfsf commit c8a852bcdf7bdc239711679f00af2450c51d57c6
> 
> This test if FI is being set correctly and if the deferred exception is being called correctly (by enabling VE and VXSOFT bits)

Nice ! May be include in the v2 ?

Thanks,

C.

