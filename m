Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2D755FAD3
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 10:41:37 +0200 (CEST)
Received: from localhost ([::1]:56098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6TGS-0002Ho-2d
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 04:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o6TC4-0007rd-V8
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 04:37:05 -0400
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:46793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o6TC1-0007aA-5j
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 04:37:03 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.10])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 483F027132;
 Wed, 29 Jun 2022 08:36:58 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 29 Jun
 2022 10:36:56 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006b88761a7-3ad0-45f5-b9f7-70fcbcc403c3,
 74A1F81DE4F8936248B5873BB0AED4007818FEC6) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <16eb386e-a1c7-071b-12b0-b47e9081c4a3@kaod.org>
Date: Wed, 29 Jun 2022 10:36:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 08/13] hw/i2c/pmbus: Reset out buf after switching pages
Content-Language: en-US
To: Peter Delevoryas <peterdelevoryas@gmail.com>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <cminyard@mvista.com>, <titusr@google.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <zhdaniel@fb.com>, <pdel@fb.com>
References: <20220629033634.3850922-1-pdel@fb.com>
 <20220629033634.3850922-9-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220629033634.3850922-9-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7b48de1e-5d51-4211-ab1d-4c28d0582fa5
X-Ovh-Tracer-Id: 1092685862009670578
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpuggvlhesfhgsrdgtohhmpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/22 05:36, Peter Delevoryas wrote:
> When a pmbus device switches pages, it should clears its output buffer so
> that the next transaction doesn't emit data from the previous page.
> 
> Fixes: 3746d5c15e70570b ("hw/i2c: add support for PMBus”)
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

>   hw/i2c/pmbus_device.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
> index 62885fa6a1..efddc36fd9 100644
> --- a/hw/i2c/pmbus_device.c
> +++ b/hw/i2c/pmbus_device.c
> @@ -1088,6 +1088,7 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
>   
>       if (pmdev->code == PMBUS_PAGE) {
>           pmdev->page = pmbus_receive8(pmdev);
> +        pmdev->out_buf_len = 0;
>           return 0;
>       }
>   


