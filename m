Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF17557D6F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 16:00:44 +0200 (CEST)
Received: from localhost ([::1]:34262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4NNx-0007sX-IK
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 10:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o4NM9-0006xb-0p; Thu, 23 Jun 2022 09:58:49 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:3351)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o4NM6-0002ar-Dr; Thu, 23 Jun 2022 09:58:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655992726; x=1687528726;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=EAcnT1Jkv4o84j97GqR0oNejsbmeYAJj9nPHhPo15Ds=;
 b=hDL3oGAFiIc9rgbFvC5kPcKwGSyFRCd8oU12nhRfYZ+tW9Xz5871LZ9b
 F+aDuCEikgHqRoV/G6d0kKo5wjYYoXPLeLtAsLCLobQEZ3QaUh2amN3sc
 sOU4E7jp67p2miEKPri91aFjFZ15HcD+cYK0pvmbZDndSWhjY72Vtpzh2 w=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 23 Jun 2022 06:58:44 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 06:58:43 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 23 Jun 2022 06:58:43 -0700
Received: from [10.110.81.137] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 23 Jun
 2022 06:58:42 -0700
Message-ID: <ff3320a3-8e9b-411b-519b-db2a3b9fb6fe@quicinc.com>
Date: Thu, 23 Jun 2022 06:58:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 9/9] hw/arm/aspeed: firework: add I2C MUXes for VR channels
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
CC: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>, Titus Rwantare <titusr@google.com>, "Andrew
 Jeffery" <andrew@aj.id.au>, Graeme Gregory <quic_ggregory@quicinc.com>,
 Maheswara Kurapati <quic_mkurapat@quicinc.com>, qemu-arm
 <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
 <20220622172830.101210-10-quic_jaehyoo@quicinc.com>
 <CACPK8XdtsfsV8_L9C_XZ+AHZ0wAwdxgXmSxW5bZ3YHOr72Qvkg@mail.gmail.com>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <CACPK8XdtsfsV8_L9C_XZ+AHZ0wAwdxgXmSxW5bZ3YHOr72Qvkg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=quic_jaehyoo@quicinc.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hello Joel,

On 6/22/2022 10:27 PM, Joel Stanley wrote:
> On Wed, 22 Jun 2022 at 17:29, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>>
>> Add 2-level cascaded I2C MUXes for SOC VR channels into the Firework
>> machine.
>>
>> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
>> ---
>>   hw/arm/aspeed.c | 30 +++++++++++++++++++-----------
>>   1 file changed, 19 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index 526f3b651a9f..866a60cf7b4e 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -1038,7 +1038,7 @@ static void qcom_firework_fru_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
>>   static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
>>   {
>>       AspeedSoCState *soc = &bmc->soc;
>> -    I2CSlave *mux;
>> +    I2CSlave *therm_mux, *cpuvr_mux;
>>
>>       /* Create the generic DC-SCM hardware */
>>       qcom_dc_scm_bmc_i2c_init(bmc);
>> @@ -1048,16 +1048,24 @@ static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
>>       /* I2C4 */
>>       qcom_firework_fru_init(aspeed_i2c_get_bus(&soc->i2c, 4), 0x50, 128 * 1024);
>>
>> -    /* I2C - 8 Thermal Diodes*/
>> -    mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9548",
>> -                                  0x70);
>> -    i2c_slave_create_simple(pca954x_i2c_get_bus(mux, 0), TYPE_LM75, 0x4C);
>> -    i2c_slave_create_simple(pca954x_i2c_get_bus(mux, 1), TYPE_LM75, 0x4C);
>> -    i2c_slave_create_simple(pca954x_i2c_get_bus(mux, 2), TYPE_TMP75, 0x48);
>> -    i2c_slave_create_simple(pca954x_i2c_get_bus(mux, 3), TYPE_TMP75, 0x48);
>> -    i2c_slave_create_simple(pca954x_i2c_get_bus(mux, 4), TYPE_TMP75, 0x48);
>> -
> 
> You only just added this. If you modify the previous patch to call the
> "mux" variable "therm_mux" then you don't need to modify it in this
> patch.
> 
> or just squash them both together. I don't think there's much value in
> having two separate patches.

Okay. I'll fix the 8/9 patch to call the variable "therm_mux" instead.

Thanks,
Jae

>> -    /* I2C-9 Fan Controller (MAX31785) */
>> +    /* I2C7 CPUVR MUX */
>> +    cpuvr_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7),
>> +                                        "pca9546", 0x70);
>> +    i2c_slave_create_simple(pca954x_i2c_get_bus(cpuvr_mux, 0), "pca9548", 0x72);
>> +    i2c_slave_create_simple(pca954x_i2c_get_bus(cpuvr_mux, 1), "pca9548", 0x72);
>> +    i2c_slave_create_simple(pca954x_i2c_get_bus(cpuvr_mux, 2), "pca9548", 0x72);
>> +    i2c_slave_create_simple(pca954x_i2c_get_bus(cpuvr_mux, 3), "pca9548", 0x72);
>> +
>> +    /* I2C8 Thermal Diodes*/
>> +    therm_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8),
>> +                                        "pca9548", 0x70);
>> +    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 0), TYPE_LM75, 0x4C);
>> +    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 1), TYPE_LM75, 0x4C);
>> +    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 2), TYPE_LM75, 0x48);
>> +    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 3), TYPE_LM75, 0x48);
>> +    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 4), TYPE_LM75, 0x48);
>> +
>> +    /* I2C9 Fan Controller (MAX31785) */
>>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "max31785", 0x52);
>>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "max31785", 0x54);
>>   }
>> --
>> 2.25.1
>>

