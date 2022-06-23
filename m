Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77950558059
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 18:52:41 +0200 (CEST)
Received: from localhost ([::1]:40976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Q4O-000316-5Z
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 12:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4Q2j-00023t-KY
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:50:57 -0400
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220]:33427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4Q2g-0005d6-Hg
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:50:57 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.35])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 294BD274B2;
 Thu, 23 Jun 2022 16:50:50 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 23 Jun
 2022 18:50:49 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0016f84782f-1b68-4f79-8d78-ce05bda84370,
 1905447EDF4A6B95D61F03ED56167C5A36471571) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <870f3dae-2dfd-f760-4ad6-a92a20eb9871@kaod.org>
Date: Thu, 23 Jun 2022 18:50:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 3/9] hw/arm/aspeed: qcom-dc-scm-v1: add block backed FRU
 device
Content-Language: en-US
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Patrick Venture
 <venture@google.com>, Hao Wu <wuhaotsh@google.com>
CC: Peter Maydell <peter.maydell@linaro.org>, Titus Rwantare
 <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara
 Kurapati <quic_mkurapat@quicinc.com>, qemu-arm <qemu-arm@nongnu.org>, QEMU
 Developers <qemu-devel@nongnu.org>
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
 <20220622172830.101210-4-quic_jaehyoo@quicinc.com>
 <CAO=notzsLW=F6QDu5mAhBCXNMocV1_qF3EazHYLoP_mu8e8QFg@mail.gmail.com>
 <852d9c04-1ece-3b88-c8f2-d96d333f7bde@quicinc.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <852d9c04-1ece-3b88-c8f2-d96d333f7bde@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: abcfa01d-3e4d-4f7a-a3d9-56bc67573a32
X-Ovh-Tracer-Id: 11090677034554592245
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedguddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheehvd
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

On 6/23/22 18:34, Jae Hyun Yoo wrote:
> Hello Patrick,
> 
> On 6/23/2022 8:28 AM, Patrick Venture wrote:
>>
>>
>> On Wed, Jun 22, 2022 at 10:48 AM Jae Hyun Yoo <quic_jaehyoo@quicinc.com <mailto:quic_jaehyoo@quicinc.com>> wrote:
>>
>>     From: Graeme Gregory <quic_ggregory@quicinc.com
>>     <mailto:quic_ggregory@quicinc.com>>
>>
>>     The FRU device uses the index 0 device on bus IF_NONE.
>>
>>     -drive file=$FRU,format=raw,if=none
>>
>>     file must match FRU size of 128k
>>
>>     Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com
>>     <mailto:quic_ggregory@quicinc.com>>
>>     ---
>>       hw/arm/aspeed.c | 22 +++++++++++++++++-----
>>       1 file changed, 17 insertions(+), 5 deletions(-)
>>
>>     diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>>     index 785cc543d046..36d6b2c33e48 100644
>>     --- a/hw/arm/aspeed.c
>>     +++ b/hw/arm/aspeed.c
>>     @@ -992,17 +992,29 @@ static void fby35_i2c_init(AspeedMachineState
>>     *bmc)
>>            */
>>       }
>>
>>     +static void qcom_dc_scm_fru_init(I2CBus *bus, uint8_t addr,
>>     uint32_t rsize)
>>     +{
>>     +    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
>>     +    DeviceState *dev = DEVICE(i2c_dev);
>>     +    /* Use First Index for DC-SCM FRU */
>>     +    DriveInfo *dinfo = drive_get(IF_NONE, 0, 0);
>>     +
>>     +    qdev_prop_set_uint32(dev, "rom-size", rsize);
>>     +
>>     +    if (dinfo) {
>>     +        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
>>     +    }
>>     +
>>     +    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
>>     +}
>>
>>
>> We've sent a similar patch up for the at24c but in its own file -- but looking at this, we could likely expand it to suite our cases as well - is there a reason it's named qcom_dc_scm_fru_init?  Presumably that's to handle the drive_get parameters.  If you make it use `drive_get(IF_NONE, bus, unit);` You'll be able to associate a drive via parameters like you aim to.
> 
> Okay. I agree with you that it can be more generic to be used for other
> machines too. I'll rewrite this function in v2 to make it have below
> shape.
> 
> static void
> at24c_eeprom_init_from_drive(I2CBus *bus, uint8_t addr, uint32_t rsize,
>                               int bus, int unit)

Yes and if other non-Aspeed machines need it one day, we could export it.
There is no need for now to multiply the interface now.

Thanks,

C.

> 
> Thanks,
> Jae
> 
>>     +
>>       static void qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)
>>       {
>>           AspeedSoCState *soc = &bmc->soc;
>>
>>           i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 15),
>>     "tmp105", 0x4d);
>>
>>     -    uint8_t *eeprom_buf = g_malloc0(128 * 1024);
>>     -    if (eeprom_buf) {
>>     -        smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 15), 0x53,
>>     -                              eeprom_buf);
>>     -    }
>>     +    qcom_dc_scm_fru_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x53,
>>     128 * 1024);
>>       }
>>
>>       static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
>>     --     2.25.1
>>
>>


