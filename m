Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1253602BF
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 08:53:06 +0200 (CEST)
Received: from localhost ([::1]:34614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWvs9-0005Gn-Fc
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 02:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lWvqG-0004Uw-OC; Thu, 15 Apr 2021 02:51:10 -0400
Received: from 9.mo52.mail-out.ovh.net ([87.98.180.222]:41195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lWvqB-0005ei-Cd; Thu, 15 Apr 2021 02:51:08 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.158])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 586B4259C87;
 Thu, 15 Apr 2021 08:50:59 +0200 (CEST)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 15 Apr
 2021 08:50:58 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006c26a4f40-31b8-4f5e-82bd-22f0769acdad,
 223986A87AF8D074E4FEF7B99352A100DDD0E9F0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [EXTERNAL] [RFC PATCH 2/2] target/ppc: Add POWER10 exception model
To: Nicholas Piggin <npiggin@gmail.com>, <qemu-ppc@nongnu.org>
References: <20210414032343.1720010-1-npiggin@gmail.com>
 <20210414032343.1720010-3-npiggin@gmail.com>
 <07285365-1c95-27b3-6922-260709d22624@kaod.org>
 <1618464352.9ndmtpt9ct.astroid@bobo.none>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <4e741f86-d502-57d7-fbb3-5c298fcc1cb9@kaod.org>
Date: Thu, 15 Apr 2021 08:50:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1618464352.9ndmtpt9ct.astroid@bobo.none>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ff5fd46c-652d-42a5-a142-051b023fc702
X-Ovh-Tracer-Id: 16308378678031715110
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudelvddguddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepnhhpihhgghhinhesghhmrghilhdrtghomh
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@fr.ibm.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 7:28 AM, Nicholas Piggin wrote:
> Excerpts from Cédric Le Goater's message of April 15, 2021 1:54 am:
>> On 4/14/21 5:23 AM, Nicholas Piggin wrote:
>>> POWER10 adds a new bit that modifies interrupt behaviour, LPCR[HAIL],
>>> and it removes support for the LPCR[AIL]=0b10 mode.
>>
>> This looks good but it's missing the MSR_LE setting. A part from that : 
> 
> Oh, and lpes as well. Looks like a mis-merged from my original patch.
> Thanks for catching it, great.
> 
>>
>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>>
>> and 
>>
>> Tested-by: Cédric Le Goater <clg@kaod.org>
> 
> Thanks, this was tested after you added the MSR_LE bit?

yes.

Thanks,

C.

>> distros using scv on P10 now need your patch to boot :
>>
>> "powerpc/powernv: Enable HAIL (HV AIL) for ISA v3.1 processors"
>>
>> I guess it will get merged in time. 
> 
> Yes, unfortunately. Real hardware crashes the same way though, so
> nothing to be done about it.



