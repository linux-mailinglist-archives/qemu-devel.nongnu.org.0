Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7161657DC4E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 10:24:55 +0200 (CEST)
Received: from localhost ([::1]:34228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEnxu-0006jJ-Cu
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 04:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oEno0-0002rD-10
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 04:14:40 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:60615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oEnnx-0001VD-Qe
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 04:14:39 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.44])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 77583119ABB31;
 Fri, 22 Jul 2022 10:14:32 +0200 (CEST)
Received: from kaod.org (37.59.142.100) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 22 Jul
 2022 10:14:31 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0033da95bde-eed5-457c-9958-150a655775f0,
 C964DFE1AD449E897551F86C6D919768E4C9FD76) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.2.115.184
Message-ID: <6ba14592-e474-42dc-4cae-1919493ac081@kaod.org>
Date: Fri, 22 Jul 2022 10:14:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 0/8] m25p80: Add SFDP support
Content-Language: en-US
To: Ben Dooks <ben@fluff.org>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <qemu-block@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>, Iris Chen
 <irischenlj@fb.com>, Michael Walle <michael@walle.cc>,
 <sudip.mhukerjee@codethink.co.uk>, <ben.dooks@codethink.co.uk>
References: <20220722063602.128144-1-clg@kaod.org>
 <ae6d8345-5a14-3f1e-d544-5f07b0b76a9c@kaod.org>
 <20220722080627.jx2jylfhte3zv6ab@hetzy.fluff.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220722080627.jx2jylfhte3zv6ab@hetzy.fluff.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 878c8540-6e3c-4183-a019-3ac6c8fc16e4
X-Ovh-Tracer-Id: 6658572049112796091
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtvddgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhfeevveegueejhfettdeuvdejtefgkeffkeejgeeuteejgfduieelhedttefhtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsvghnrdguohhokhhssegtohguvghthhhinhhkrdgtohdruhhkpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/22/22 10:06, Ben Dooks wrote:
> On Fri, Jul 22, 2022 at 09:05:39AM +0200, Cédric Le Goater wrote:
>> On 7/22/22 08:35, Cédric Le Goater wrote:
>>> Hello,
>>>
>>> This is a refresh of a patchset sent long ago [1] adding support for
>>
>> [1] was lost while writing the cover :
>>
>>    https://lore.kernel.org/qemu-devel/20200902093107.608000-1-clg@kaod.org/
> 
> Is there a git branch this could be pulled from to have a look at and
> test on our setup?

Yes,

   https://github.com/legoater/qemu/commits/aspeed-7.1

Thanks,

C.

