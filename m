Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799E740FE68
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 19:14:17 +0200 (CEST)
Received: from localhost ([::1]:40070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRHRI-0004yb-CO
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 13:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mRHPl-0003Q4-J1; Fri, 17 Sep 2021 13:12:41 -0400
Received: from smtpout1.mo3005.mail-out.ovh.net ([79.137.123.220]:43373
 helo=smtpout1.3005.mail-out.ovh.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mRHPj-00036N-Aa; Fri, 17 Sep 2021 13:12:41 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.210])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id B4CFE13B0D4;
 Fri, 17 Sep 2021 17:12:34 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 17 Sep
 2021 19:12:33 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004c568c9b9-5104-4279-98df-5c5362b044ce,
 4CB242D324285DC6A6012FA7036A1BCD1D408584) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <4981cec7-5988-af2e-883b-de304e918c32@kaod.org>
Date: Fri, 17 Sep 2021 19:12:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3] target/ppc: Fix 64-bit decrementer
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, Luis Fernando Fujita
 Pires <luis.pires@eldorado.org.br>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20210916143710.236489-1-clg@kaod.org>
 <CP2PR80MB36680A1BE91AFABE9DD3295BDADC9@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <a0661690-bdb4-f002-3862-306458b36d3d@kaod.org>
 <CP2PR80MB3668712B5A367E87089D724BDADD9@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <b8545741-185f-c74c-f572-ad4b5372e825@kaod.org>
 <62ad0cb4-0e41-4994-a52b-533b24b46401@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <62ad0cb4-0e41-4994-a52b-533b24b46401@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 923dd77f-3130-4697-9c8e-1c8edf810514
X-Ovh-Tracer-Id: 14736340933097720681
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudehiedguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.3005.mail-out.ovh.net
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.488,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> So use PRIx64, as you're supposed to do.
> Or, in fact, change this to a tracepoint.

yes. I will change all of them. It should be useful for everyone.

C.

