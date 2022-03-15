Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F974D94A5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 07:33:25 +0100 (CET)
Received: from localhost ([::1]:51522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU0kG-00052v-FB
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 02:33:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nU0gX-0002ES-W5
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 02:29:34 -0400
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:55271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nU0gU-0006Xk-OQ
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 02:29:33 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.216])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5C6BA1FE40;
 Tue, 15 Mar 2022 06:29:27 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 15 Mar
 2022 07:29:26 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003010998b5-56ce-4d74-b8c2-927eba34aa74,
 5DBA5639B77BD7FE35D3F16CFE7686729AB21D01) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0e9a658b-883f-37e6-5572-6303037b2116@kaod.org>
Date: Tue, 15 Mar 2022 07:29:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 1/1] hw: aspeed_scu: Add AST2600 hpll calculation
 function
Content-Language: en-US
To: Steven Lee <steven_lee@aspeedtech.com>
References: <20220314095449.22089-1-steven_lee@aspeedtech.com>
 <20220314095449.22089-2-steven_lee@aspeedtech.com>
 <bd116f19-2110-b4be-8c17-845051d0e2d0@kaod.org>
 <20220315024257.GA6162@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220315024257.GA6162@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: dad34a3f-1013-4fc6-b0dd-fde0c0154e1d
X-Ovh-Tracer-Id: 3622864428434688876
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddvledgleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhm
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Troy Lee <troy_lee@aspeedtech.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Steven,

[ ... ]
> I was wondering if the following implementation is good to you.
> 
> 1 Modify aspeed_scu_get_apb_freq() as below
>   	uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s)
>   	{
>   	    return ASPEED_SCU_GET_CLASS(s)->get_apb(s);
>   	}
> 
> 2. Introduce 2 APB class handlers: aspeed_2400_scu_get_apb_freq() and aspeed_2600_scu_get_apb_freq()
> 
> 3. Add new attribute get_apb in AspeedSCUClass.
> 
> 4. In aspeed_2400_scu_class_init() and aspeed_2500_scu_class_init()
> 	asc->get_apb = aspeed_2400_scu_get_apb_freq;
> 
>     In aspeed_2600_scu_class_init()
> 	asc->get_apb = aspeed_2600_scu_get_apb_freq;

yes. that's the idea.

[ ... ]

>>>    static uint32_t aspeed_scu_get_clkin(AspeedSCUState *s)
>>>    {
>>> -    if (s->hw_strap1 & SCU_HW_STRAP_CLK_25M_IN) {
>>> +    AspeedSCUClass *asc = ASPEED_SCU_GET_CLASS(s);
>>> +
>>> +    if (s->hw_strap1 & SCU_HW_STRAP_CLK_25M_IN ||
>>> +        asc->calc_hpll == aspeed_2600_scu_calc_hpll) {
>>
>> Indeed, the AST2600 CLKIN is always 25Mhz. Instead of testing ->calc_hpll,
>> I would introduce a class attribute, something like 'bool is_25Mhz'.
>>
>> This change should be in a second patch though.
>>
> 
> will add a new attribute for clkin in the second patch.

yes. 'clkin_25Mhz' may be.

Thanks,

C.

