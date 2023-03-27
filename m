Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE92B6CA430
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 14:34:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgm3I-0005bA-Mf; Mon, 27 Mar 2023 08:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pgm3B-0005aA-8x
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:34:13 -0400
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pgm39-0004io-8E
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:34:12 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.21])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id DAFC62AA4C;
 Mon, 27 Mar 2023 12:34:04 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 27 Mar
 2023 14:34:04 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002dd298c66-e207-47ac-8a7d-e6da7941e07f,
 A6C3435B678E6C193C864925704A598F32E2E8B9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <29f7e479-2e2c-a9d6-d5f1-440cdfce0cb7@kaod.org>
Date: Mon, 27 Mar 2023 14:34:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 4/7] hw/ipmi: Refactor IPMI interface
Content-Language: en-US
To: Hao Wu <wuhaotsh@google.com>, <minyard@acm.org>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <venture@google.com>,
 <Avi.Fishman@nuvoton.com>, <kfting@nuvoton.com>, <hskinnemoen@google.com>,
 <titusr@google.com>, <peter.maydell@linaro.org>, Joel Stanley
 <joel@jms.id.au>, Frederic Barrat <frederic.barrat@fr.ibm.com>
References: <20230324230904.3710289-1-wuhaotsh@google.com>
 <20230324230904.3710289-5-wuhaotsh@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230324230904.3710289-5-wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 31aa0fe1-2e2a-4df7-bc54-53cc38afce23
X-Ovh-Tracer-Id: 10177009262024100856
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehvddgheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuuddtteelgeejhfeikeegffekhfelvefgfeejveffjeeiveegfeehgfdtgfeitdenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopeifuhhhrghothhshhesghhoohhglhgvrdgtohhmpdhmihhnhigrrhgusegrtghmrdhorhhgpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhvvghnthhurhgvsehgohhoghhlvgdrtghomhdptehvihdrhfhishhhmhgrnhesnhhuvhhothhonhdrtghomhdpkhhfthhinhhgsehnuhhvohhtohhnrdgtohhmpdhhshhkihhnnhgvmhhovghnsehgohhoghhlvgdrtghomhdpthhithhushhrsehgohhoghhlvgdrtghomhdpph
 gvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhjohgvlhesjhhmshdrihgurdgruhdpfhhrvgguvghrihgtrdgsrghrrhgrthesfhhrrdhisghmrdgtohhmpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello Hao,

On 3/25/23 00:09, Hao Wu wrote:
> This patch refactors the IPMI interface so that it can be used by both
> the BMC side and core-side simulation.
> 
> Detail changes:
> (1) Split IPMIInterface into IPMIInterfaceHost (for host side
>      simulation) and IPMIInterfaceClient (for BMC side simulation).
> (2) rename handle_rsp -> handle_msg so the name fits both BMC side and
>      Core side.
> (3) Add a new class IPMICore. This class represents a simulator/external
>      connection for both BMC and Core side emulation.
> (4) Change the original IPMIBmc to IPMIBmcHost, representing host side
>      simulation.
> (5) Add a new type IPMIBmcClient representing BMC side simulation.
> (6) Appy the changes to  the entire IPMI library.

'IPMIBmcHost' is a BMC object model (internal or external) and
'IPMIBmcClient' is a host object model ?

[ ... ]

> @@ -267,15 +267,15 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor)
>    * Instantiate the machine BMC. PowerNV uses the QEMU internal
>    * simulator but it could also be external.
>    */
> -IPMIBmc *pnv_bmc_create(PnvPnor *pnor)
> +IPMIBmcHost *pnv_bmc_create(PnvPnor *pnor)
>   {
>       Object *obj;
>   
>       obj = object_new(TYPE_IPMI_BMC_SIMULATOR);
>       qdev_realize(DEVICE(obj), NULL, &error_fatal);
> -    pnv_bmc_set_pnor(IPMI_BMC(obj), pnor);
> +    pnv_bmc_set_pnor(IPMI_BMC_HOST(obj), pnor);
>   
> -    return IPMI_BMC(obj);
> +    return IPMI_BMC_HOST(obj);

QEMU PowerNV machines model the host side of OpenPOWER systems which
have an Aspeed SoC based BMC for management. The routine above creates
an Aspeed *BMC* object model for the PowerNV *host* machine. I find
'IPMIBmcHost' confusing. It shouldn't have a 'Host' suffix I think.

'IPMIBmcClient' sounds ok, or 'IPMIBmcPeer' maybe.

Thanks,

C.


