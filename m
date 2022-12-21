Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A541F652D4B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 08:32:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7tZM-0003MQ-20; Wed, 21 Dec 2022 02:31:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1p7tZF-0003K2-Uz; Wed, 21 Dec 2022 02:31:10 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1p7tZB-0002Bg-Ec; Wed, 21 Dec 2022 02:31:09 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.6])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id D59E014DDFCE1;
 Wed, 21 Dec 2022 08:30:51 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Wed, 21 Dec
 2022 08:30:51 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001e166cd06-0651-458d-ad0e-072c57ec8b66,
 78B451B26E434E63100236457A08FF51A4610C03) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <587d650e-fba3-ba44-793e-919dd6f75a90@kaod.org>
Date: Wed, 21 Dec 2022 08:30:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] hw/net: Fix read of uninitialized memory in ftgmac100
Content-Language: en-US
To: Stephen Longfield <slongfield@google.com>, <peter.maydell@linaro.org>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>, <venture@google.com>, <wuhaotsh@google.com>
References: <20221220221437.3303721-1-slongfield@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221220221437.3303721-1-slongfield@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 3a82dd69-581e-40ef-aa0e-ba3c9310e22c
X-Ovh-Tracer-Id: 13126585542082399084
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgeejgdduuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehslhhonhhgfhhivghlugesghhoohhglhgvrdgtohhmpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdprghnughrvgifsegrjhdrihgurdgruhdpjhhovghlsehjmhhsrdhiugdrrghupdhvvghnthhurhgvsehgohhoghhlvgdrtghomhdpfihuhhgrohhtshhhsehgohhoghhlvgdrtghomhdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtph
 houhht
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.161,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 12/20/22 23:14, Stephen Longfield wrote:
> With the `size += 4` before the call to `crc32`, the CRC calculation
> would overrun the buffer. Size is used in the while loop starting on
> line 1009 to determine how much data to write back, with the last
> four bytes coming from `crc_ptr`, so do need to increase it, but should
> do this after the computation.
> 
> I'm unsure why this use of uninitialized memory in the CRC doesn't
> result in CRC errors, but it seems clear to me that it should not be
> included in the calculation.
> 
> Signed-off-by: Stephen Longfield <slongfield@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

I think imx_fec.c is impacted also.

Thanks,

C.


> ---
>   hw/net/ftgmac100.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 83ef0a783e..d3bf14be53 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -980,9 +980,9 @@ static ssize_t ftgmac100_receive(NetClientState *nc, const uint8_t *buf,
>           return size;
>       }
> 
> -    /* 4 bytes for the CRC.  */
> -    size += 4;
>       crc = cpu_to_be32(crc32(~0, buf, size));
> +    /* Increase size by 4, loop below reads the last 4 bytes from crc_ptr. */
> +    size += 4;
>       crc_ptr = (uint8_t *) &crc;
> 
>       /* Huge frames are truncated.  */
> --
> 2.39.0.314.g84b9a713c41-goog
> 


