Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9806C69A637
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 08:45:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSvQa-0000ql-KZ; Fri, 17 Feb 2023 02:45:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pSvQW-0000pu-3h
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 02:45:04 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pSvQT-0004Q9-7a
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 02:45:03 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.90])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B199E2133C;
 Fri, 17 Feb 2023 07:44:56 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 17 Feb
 2023 08:44:55 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0060aa277ca-0488-4649-a6b4-d487f012d04d,
 D8AD3BA2C27EEBE7B4560DA8411A9B1E3CFED360) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <08d5f5d0-1538-e35b-df02-c4e3dacfd4cd@kaod.org>
Date: Fri, 17 Feb 2023 08:44:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH qemu v3 0/2] hw/at24c support eeprom size less than equal
 256 byte
Content-Language: en-US
To: ~ssinprem <ssinprem@celestica.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <qemu-stable@nongnu.org>, <ssumet@celestica.com>,
 <srikanth@celestica.com>, <kgengan@celestica.com>,
 <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>, Peter
 Delevoryas <peter@pjd.dev>
References: <167660539263.10409.9736070122710923479-0@git.sr.ht>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <167660539263.10409.9736070122710923479-0@git.sr.ht>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: b490d99c-fa3c-4952-8496-ca5257d1c66f
X-Ovh-Tracer-Id: 3492541512126204917
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeikedguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuedutdetleegjefhieekgeffkefhleevgfefjeevffejieevgeefhefgtdfgiedtnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehsshhinhhprhgvmhestggvlhgvshhtihgtrgdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhsthgrsghlvgesnhhonhhgnhhurdhorhhgpdhsshhumhgvthestggvlhgvshhtihgtrgdrtghomhdpshhrihhkrghnthhhsegtvghlvghsthhitggrrdgtohhmpdhkghgvnhhgrghnsegtvghlvghsthhitggrrdgtohhmpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdprg
 hnughrvgifsegrjhdrihgurdgruhdpjhhovghlsehjmhhsrdhiugdrrghupdhpvghtvghrsehpjhgurdguvghvpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.351,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add Peter D. since he wrote the fuji.

Thanks for the contribution !

C.

On 2/17/23 04:43, ~ssinprem wrote:
> - hw/at24c : modify at24c to support 1 byte address mode
> - aspeed/fuji : correct the eeprom size
> 
> Sittisak Sinprem (2):
>    hw/at24c : modify at24c to support 1 byte address mode
>    aspeed/fuji : correct the eeprom size
> 
>   hw/arm/aspeed.c         | 36 ++++++++++++++++++++----------------
>   hw/nvram/eeprom_at24c.c | 28 +++++++++++++++++++++++++---
>   2 files changed, 45 insertions(+), 19 deletions(-)
> 


