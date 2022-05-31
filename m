Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF0B538B1C
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 07:56:12 +0200 (CEST)
Received: from localhost ([::1]:43666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvurU-000332-0Z
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 01:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nvulh-0001Ds-Az
 for qemu-devel@nongnu.org; Tue, 31 May 2022 01:50:20 -0400
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220]:45517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nvulM-00006F-MB
 for qemu-devel@nongnu.org; Tue, 31 May 2022 01:49:54 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.214])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 3F038257C8;
 Tue, 31 May 2022 05:49:48 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 31 May
 2022 07:49:47 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004efd9a04e-3a45-4d2d-a72d-ba1f77210aa6,
 3316B4EBA022AA703420095FA15BAC10F99B744A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3afcc642-686a-c477-7dfa-ae5376f34715@kaod.org>
Date: Tue, 31 May 2022 07:49:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH 11/17] hw/sd: Add eMMC support
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
CC: Vincent Palatin <vpalatin@chromium.org>, <qemu-block@nongnu.org>, Bin Meng
 <bin.meng@windriver.com>, <qemu-devel@nongnu.org>, Joel Stanley
 <joel@jms.id.au>
References: <20220318132824.1134400-1-clg@kaod.org>
 <20220318132824.1134400-12-clg@kaod.org>
 <12033fbf-e511-f0ac-4078-e8e532b698a1@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <12033fbf-e511-f0ac-4078-e8e532b698a1@amsat.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6cbf7513-7f05-40e2-863a-4dc7d165a28e
X-Ovh-Tracer-Id: 12428809072401419046
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrkeejgddutdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedtheekleeitedvtdelgfevueehudehteelvddtgfefffelvdejkeejgeelvdekueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghu
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/30/22 19:02, Philippe Mathieu-Daudé wrote:
> Hi Cédric,
> 
> On 18/3/22 14:28, Cédric Le Goater wrote:
>> The initial eMMC support from Vincent Palatin was largely reworked to
>> match the current SD framework. The parameters mimick a real 4GB eMMC,
>> but it can be set to various sizes.
>>
>> This adds a new QOM object class for EMMC devices.
>>
>> Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
>> Link: https://lore.kernel.org/r/1311635951-11047-5-git-send-email-vpalatin@chromium.org
>> [ jms: - Forward ported to QEMU 5.2 ]
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> [ clg: - ported on aspeed-7.0 patchset
>>         - HPI activation ]
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/sd/sdmmc-internal.h |  97 +++++++++++++++++++
>>   include/hw/sd/sd.h     |   9 ++
>>   hw/sd/sd.c             | 205 ++++++++++++++++++++++++++++++++++++++++-
>>   hw/sd/sdmmc-internal.c |   2 +-
>>   4 files changed, 311 insertions(+), 2 deletions(-)
> 
>> +static const SDProto sd_proto_emmc = {
> 
> What about renaming as:
> 
>                      ... emmc_proto = {

yes. These are internal functions. Fine with me.

Thanks,

C.

> 
>> +    .name = "eMMC",
>> +    .cmd = {
>> +        [0]         = sd_cmd_GO_IDLE_STATE,
>> +        [1]         = sd_emmc_cmd_SEND_OP_CMD,
> 
>                         = emmc_cmd_SEND_OP_CMD,
> 
>> +        [2]         = sd_emmc_cmd_ALL_SEND_CID,
> 
>                           ...
> 
> ?
> 
>> +        [3]         = sd_emmc_cmd_SEND_RELATIVE_ADDR,
>> +        [5]         = sd_cmd_illegal,
>> +        [8]         = sd_emmc_cmd_SEND_EXT_CSD,
>> +        [19]        = sd_cmd_SEND_TUNING_BLOCK,
>> +        [21]        = sd_emmc_cmd_SEND_TUNING_BLOCK,
>> +        [41]        = sd_cmd_illegal,
>> +        [52 ... 54] = sd_cmd_illegal,
>> +        [55]        = sd_emmc_cmd_APP_CMD,
>> +        [58]        = sd_cmd_illegal,
>> +        [59]        = sd_cmd_illegal,
>> +    },
>> +};


