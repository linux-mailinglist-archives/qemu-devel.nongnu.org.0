Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE20520E43
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 09:07:39 +0200 (CEST)
Received: from localhost ([::1]:51544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noJy6-0007mf-Pj
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 03:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1noJoi-00032E-Ow
 for qemu-devel@nongnu.org; Tue, 10 May 2022 02:57:56 -0400
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:37735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1noJoh-0002LA-0f
 for qemu-devel@nongnu.org; Tue, 10 May 2022 02:57:56 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.194])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id A025424235;
 Tue, 10 May 2022 06:57:51 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Tue, 10 May
 2022 08:57:49 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S0031a1c4e0c-8fdf-4789-9f63-35a92ada5a88,
 1EE4DC631931028654B42CA219073376F40F54F0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <283c1d01-f986-b20a-5ee7-984e18f9101d@kaod.org>
Date: Tue, 10 May 2022 08:57:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 07/17] hw/sd: Add sd_cmd_SEND_OP_CMD() handler
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
CC: Bin Meng <bin.meng@windriver.com>, Joel Stanley <joel@jms.id.au>,
 <qemu-devel@nongnu.org>, <qemu-block@nongnu.org>
References: <20220318132824.1134400-1-clg@kaod.org>
 <20220318132824.1134400-8-clg@kaod.org>
 <c3a65543-e50c-c927-842a-9634f4d562fa@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <c3a65543-e50c-c927-842a-9634f4d562fa@amsat.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 55219f88-8b16-4701-9477-3555676391e3
X-Ovh-Tracer-Id: 931963650261224355
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtgdduudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
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

On 5/9/22 23:12, Philippe Mathieu-Daudé wrote:
> On 18/3/22 14:28, Cédric Le Goater wrote:
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Message-Id: <20210624142209.1193073-9-f4bug@amsat.org>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/sd/sd.c | 18 +++++++++---------
>>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
>> @@ -2111,6 +2109,7 @@ static const SDProto sd_proto_spi = {
>>       .name = "SPI",
>>       .cmd = {
>>           [0]         = sd_cmd_GO_IDLE_STATE,
>> +        [1]         = sd_cmd_SEND_OP_CMD,
>>           [2 ... 4]   = sd_cmd_illegal,
>>           [5]         = sd_cmd_illegal,
>>           [7]         = sd_cmd_illegal,
>> @@ -2120,6 +2119,7 @@ static const SDProto sd_proto_spi = {
>>       },
>>       .cmd = {
>>           [6]         = sd_cmd_unimplemented,
>> +        [41]        = sd_cmd_SEND_OP_CMD,
>>       },
>>   };
> 
> I missed adding the cmd_abbrev[1] entry.

Will you resend ?

Thanks,

C.


