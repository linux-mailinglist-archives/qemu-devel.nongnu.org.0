Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7044F6D1E40
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 12:41:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piCAt-0006kY-EJ; Fri, 31 Mar 2023 06:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1piCAr-0006kH-Oh
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 06:40:01 -0400
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1piCAq-0004T2-8P
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 06:40:01 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.243])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id F403B204C5;
 Fri, 31 Mar 2023 10:39:49 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 31 Mar
 2023 12:39:49 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00132593c95-3e64-4a70-975a-47a542834b2c,
 888EB69131AACBF8F71B134F454D75158024DA69) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3492b914-4b11-0fe2-2e9e-a67820dac9c5@kaod.org>
Date: Fri, 31 Mar 2023 12:39:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/5] Cleanup [h_enter|spapr_exit]_nested routines
Content-Language: en-US
To: Harsh Prateek Bora <harshpb@linux.ibm.com>, <qemu-ppc@nongnu.org>
CC: <qemu-devel@nongnu.org>, <danielhb413@gmail.com>, Nicholas Piggin
 <npiggin@gmail.com>
References: <20230331065344.112341-1-harshpb@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230331065344.112341-1-harshpb@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: b551848b-4e75-4b72-878f-e23e0b531aab
X-Ovh-Tracer-Id: 13291529879138241443
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiuddgvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuuddtteelgeejhfeikeegffekhfelvefgfeejveffjeeiveegfeehgfdtgfeitdenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleehpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehhrghrshhhphgssehlihhnuhigrdhisghmrdgtohhmpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdhnphhighhgihhnsehgmhgrihhlrdgtohhmpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/31/23 08:53, Harsh Prateek Bora wrote:
> This patchset introduces helper routines to enable (and does) cleaning
> up of h_enter_nested() and spapr_exit_nested() routines in existing api
> for nested virtualization on Power/SPAPR for better code readability /
> maintenance. No functional changes intended with this patchset.

Adding Nick since he did most of this work.

C.


> 
> Harsh Prateek Bora (5):
>    ppc: spapr: cleanup cr get/store with helper routines.
>    ppc: spapr: cleanup h_enter_nested() with helper routines.
>    ppc: spapr: assert early rather late in h_enter_nested()
>    ppc: spapr: cleanup spapr_exit_nested() with helper routines.
>    MAINTAINERS: Adding myself in the list for ppc/spapr
> 
>   MAINTAINERS          |   1 +
>   hw/ppc/spapr_hcall.c | 251 ++++++++++++++++++++++++-------------------
>   target/ppc/cpu.c     |  17 +++
>   target/ppc/cpu.h     |   2 +
>   4 files changed, 161 insertions(+), 110 deletions(-)
> 


