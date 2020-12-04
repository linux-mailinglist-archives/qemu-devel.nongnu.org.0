Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEA02CEA22
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 09:47:47 +0100 (CET)
Received: from localhost ([::1]:57438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl6kk-0008OW-8r
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 03:47:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kl6jf-0007os-Q7; Fri, 04 Dec 2020 03:46:39 -0500
Received: from 6.mo52.mail-out.ovh.net ([188.165.49.222]:45456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kl6jd-0001ze-N2; Fri, 04 Dec 2020 03:46:39 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.220])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id AA13821F7C8;
 Fri,  4 Dec 2020 09:46:32 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 4 Dec 2020
 09:46:31 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006e3080d3c-1119-4d23-8aaa-25c15238edcb,
 30586E654D0A9B51F3156888DD4E4784B7453561) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH for-6.0 v2 2/3] spapr/xive: Fix size of END table and
 number of claimed IPIs
To: Greg Kurz <groug@kaod.org>
References: <20201130165258.744611-1-groug@kaod.org>
 <20201130165258.744611-3-groug@kaod.org>
 <ffc2ef57-e90f-7f07-650e-d85be0746c49@kaod.org>
 <b3292b6e-f1a4-40d1-ff8b-f43be8748dd6@kaod.org>
 <20201203115030.532d89d7@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <94ebf767-0a60-7faf-ddf5-b141b6722807@kaod.org>
Date: Fri, 4 Dec 2020 09:46:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201203115030.532d89d7@bahia.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 63df549f-3456-4e46-ae90-47fa9731ca20
X-Ovh-Tracer-Id: 17827499125748567008
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudeijedguddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegvdeijeefvdfhudfhffeuveehledufffhvdekheelgedttddthfeigeevgefhffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> I don't think we need much more than patch 1 which clarifies the 
>> nature of the values being manipulated, quantities vs. numbering.
>>
>> The last 2 patches are adding complexity to try to optimize the 
>> XIVE VP space in a case scenario which is not very common (vSMT). 
>> May be it's not worth it. 
>>
> 
> Well, the motivation isn't about optimization really since
> a non-default vSMT setting already wastes VP space because
> of the vCPU spacing. 

I don't see any VPs being wasted when not using vSMT. What's
your command line ?

> This is more about not using values
> with wrong semantics in the code to avoid confusion in
> future changes.

yes.

> I agree though that the extra complexity, especially the
> compat crust, might be excessive. 

It's nice and correct but it seems a bit like extra noise 
if the default case is not wasting VPs. Let's check that 
first. 

> So maybe I should just
> add comments in the code to clarify when we're using the
> wrong semantics ?

yes. I think this is enough.

Thanks,

C.

