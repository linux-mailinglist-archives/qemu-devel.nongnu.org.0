Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA10E4762D7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:12:23 +0100 (CET)
Received: from localhost ([::1]:41720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxadS-0002So-Gd
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:12:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxaTI-0005GO-S7
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:01:52 -0500
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:38753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxaTG-0004Sw-Tf
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:01:52 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.235])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id D03CD20FA0;
 Wed, 15 Dec 2021 20:01:47 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 15 Dec
 2021 21:01:46 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0048de464ad-f1bd-4020-9357-a7fa76c8fbf5,
 DB2000250E14A505ED1736C7348301D5E40ED0AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.76.172.47
Message-ID: <504c1865-2ea4-c614-e2dc-431373c2fa12@kaod.org>
Date: Wed, 15 Dec 2021 21:01:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-7.0 v2] target/ppc: do not silence SNaN in xscvspdpn
Content-Language: en-US
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>,
 <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>
References: <20211214144459.1086343-1-matheus.ferst@eldorado.org.br>
 <1d56a137-e20f-aabc-89b8-4d6c8a37c34a@kaod.org>
 <c5be5a2b-e2ff-c5b1-33a3-3eee43c3d839@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <c5be5a2b-e2ff-c5b1-33a3-3eee43c3d839@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 615dedb7-9a5b-46a6-af89-8de85c722aec
X-Ovh-Tracer-Id: 5308336586431105839
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgddufeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.64,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, f4bug@amsat.org,
 groug@kaod.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/21 18:11, Matheus K. Ferst wrote:
> On 15/12/2021 13:53, Cédric Le Goater wrote:
>> On 12/14/21 15:44, matheus.ferst@eldorado.org.br wrote:
>>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>>
>>> The non-signalling versions of VSX scalar convert to shorter/longer
>>> precision insns doesn't silence SNaNs in the hardware. To better match
>>> this behavior, use the non-arithmatic conversion of helper_todouble
>>> instead of float32_to_float64. A test is added to prevent future
>>> regressions.
>>>
>>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>
>>
>> Applied to ppc-next.
>>
>> Thanks,
>>
>> C.
> 
> Hi Cédric,
> 
> Alex requested some changes in the test part, 

I missed that :/

> could you drop this patch for now?

Can we address that as a followup in v7.0 ? We have time for it and I would
also prefer not to resend such a large PR.

Thanks,

C.

