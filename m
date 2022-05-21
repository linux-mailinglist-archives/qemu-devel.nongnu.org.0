Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E341252F8EA
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 07:31:21 +0200 (CEST)
Received: from localhost ([::1]:40376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsHhx-00037y-1C
	for lists+qemu-devel@lfdr.de; Sat, 21 May 2022 01:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nsHfV-0001ch-CD
 for qemu-devel@nongnu.org; Sat, 21 May 2022 01:28:49 -0400
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:51527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nsHfT-00049B-B8
 for qemu-devel@nongnu.org; Sat, 21 May 2022 01:28:48 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.240])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 9649D23EE5;
 Sat, 21 May 2022 05:28:42 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Sat, 21 May
 2022 07:28:42 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006c7b3ec6d-c49e-4853-8a1b-5d9202cba6e8,
 16F2342D0FBC755F7D0F76E80D3941A00D825290) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <03ddc64e-7ab4-7463-bb00-6fe1090b1cb2@kaod.org>
Date: Sat, 21 May 2022 07:28:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/3] ppc: Implement ISA 3.00 tlbie[l]
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, <qemu-devel@nongnu.org>, 
 <qemu-ppc@nongnu.org>
CC: <danielhb413@gmail.com>, <david@gibson.dropbear.id.au>, <groug@kaod.org>, 
 Nicholas Piggin <npiggin@gmail.com>
References: <20220520173346.20807-1-leandro.lupori@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220520173346.20807-1-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7ed53695-e72f-48d9-b6e8-1fc3ac63cb8a
X-Ovh-Tracer-Id: 8685754833134586729
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrieehgdelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleelieeigfekfeeitddvieegteeuteekffekleehuefgteetgedvkefghefggfeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/22 19:33, Leandro Lupori wrote:
> Add support for ISA 3.00 tlbie/tlbiel instructions, with
> RIC, PRS and R operands.
> 
> Also, for Radix MMU, add support for the TLB invalidation of a
> single page. Flush by PID/LPID, or based in process/partition
> scope is not supported, because it would make using the
> generic QEMU TLB implementation hard. In these cases, all
> entries are flushed.

Adding Nick.

Thanks,

C.

> 
> Leandro Lupori (3):
>    target/ppc: Move tlbie to decode tree
>    target/ppc: Move tlbiel to decode tree
>    target/ppc: Implement ISA 3.00 tlbie[l]
> 
>   target/ppc/cpu_init.c                        |   4 +-
>   target/ppc/helper.h                          |  18 +++
>   target/ppc/insn32.decode                     |   8 +
>   target/ppc/mmu_helper.c                      | 154 +++++++++++++++++++
>   target/ppc/translate.c                       |  64 +-------
>   target/ppc/translate/storage-ctrl-impl.c.inc | 102 ++++++++++++
>   6 files changed, 286 insertions(+), 64 deletions(-)
>   create mode 100644 target/ppc/translate/storage-ctrl-impl.c.inc
> 


