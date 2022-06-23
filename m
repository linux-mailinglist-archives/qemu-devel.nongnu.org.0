Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBAA557D95
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 16:13:08 +0200 (CEST)
Received: from localhost ([::1]:48368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4NZz-0001Xn-LT
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 10:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o4NYY-0008Nr-Ur; Thu, 23 Jun 2022 10:11:38 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:3422)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o4NYW-00057A-NC; Thu, 23 Jun 2022 10:11:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655993496; x=1687529496;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LYzqduB4VLse9uTQk7Jt0NgeEX49Oe1BQJ+PgjJoVuo=;
 b=GzcnjHsf49phFpdpNuggX+ILZEPMqAVmSe+Tsr5ZuKdFKZpYCJo1yIQb
 4NNOc1Xcm1/Ih0kv8MIOrDhKLwCR47n5EqpYOauLqYwcQ79kZbPZ5jIBx
 COS3RQOMaYQqHw/CIYI5dqzkePUsUSHzBqhGqAUMgGlNoNiCmEoReWT3Z w=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 23 Jun 2022 07:11:34 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 07:11:33 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 23 Jun 2022 07:11:33 -0700
Received: from [10.110.34.96] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 23 Jun
 2022 07:11:32 -0700
Message-ID: <d978e798-eace-01a5-67fb-0a1d132322a3@quicinc.com>
Date: Thu, 23 Jun 2022 07:11:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/9] hw/arm/aspeed: add Qualcomm Firework machine and FRU
 device
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Titus Rwantare <titusr@google.com>, "Andrew
 Jeffery" <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
 <20220622172830.101210-5-quic_jaehyoo@quicinc.com>
 <1f050a11-b1ab-12ef-c83a-c0061d36aae9@kaod.org>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <1f050a11-b1ab-12ef-c83a-c0061d36aae9@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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

On 6/22/2022 11:43 PM, Cédric Le Goater wrote:
> On 6/22/22 19:28, Jae Hyun Yoo wrote:
>> From: Graeme Gregory <quic_ggregory@quicinc.com>
>>
>> Add base for Qualcomm Firework machine and add its FRU device which is
>> defined by DC-SCM to be fixed address 0x50.
>>
>> Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
>> ---
>>   hw/arm/aspeed.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 53 insertions(+)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index 36d6b2c33e48..0e6edd2be4fa 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -1017,6 +1017,35 @@ static void 
>> qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)
>>       qcom_dc_scm_fru_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x53, 
>> 128 * 1024);
>>   }
>> +static void qcom_firework_fru_init(I2CBus *bus, uint8_t addr, 
>> uint32_t rsize)
>> +{
>> +    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
>> +    DeviceState *dev = DEVICE(i2c_dev);
>> +    /* Use First Index for DC-SCM FRU */
>> +    DriveInfo *dinfo = drive_get(IF_NONE, 0, 1);
>> +
>> +    qdev_prop_set_uint32(dev, "rom-size", rsize);
>> +
>> +    if (dinfo) {
>> +        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
>> +    }
>> +
>> +    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
>> +}
>> +
>> +static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
>> +{
>> +    AspeedSoCState *soc = &bmc->soc;
>> +
>> +    /* Create the generic DC-SCM hardware */
>> +    qcom_dc_scm_bmc_i2c_init(bmc);
>> +
>> +    /* Now create the Firework specific hardware */
>> +
>> +    /* I2C4 */
>> +    qcom_firework_fru_init(aspeed_i2c_get_bus(&soc->i2c, 4), 0x50, 
>> 128 * 1024);
>> +}
>> +
>>   static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
>>   {
>>       return ASPEED_MACHINE(obj)->mmio_exec;
>> @@ -1489,6 +1518,26 @@ static void 
>> aspeed_machine_qcom_dc_scm_v1_class_init(ObjectClass *oc,
>>           aspeed_soc_num_cpus(amc->soc_name);
>>   };
>> +static void aspeed_machine_qcom_firework_class_init(ObjectClass *oc,
>> +                                                    void *data)
>> +{
>> +    MachineClass *mc = MACHINE_CLASS(oc);
>> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
>> +
>> +    mc->desc       = "Qualcomm DC-SCM V1/Firework BMC (Cortex A7)";
>> +    amc->soc_name  = "ast2600-a3";
>> +    amc->hw_strap1 = QCOM_DC_SCM_V1_BMC_HW_STRAP1;
>> +    amc->hw_strap2 = QCOM_DC_SCM_V1_BMC_HW_STRAP2;
>> +    amc->fmc_model = "n25q512a";
>> +    amc->spi_model = "n25q512a";
>> +    amc->num_cs    = 2;
>> +    amc->macs_mask = ASPEED_MAC2_ON | ASPEED_MAC3_ON;
>> +    amc->i2c_init  = qcom_dc_scm_firework_i2c_init;
>> +    mc->default_ram_size = 1 * GiB;
>> +    mc->default_cpus = mc->min_cpus = mc->max_cpus =
>> +        aspeed_soc_num_cpus(amc->soc_name);
>> +};
>> +
>>   static const TypeInfo aspeed_machine_types[] = {
>>       {
>>           .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
>> @@ -1534,6 +1583,10 @@ static const TypeInfo aspeed_machine_types[] = {
>>           .name          = MACHINE_TYPE_NAME("qcom-dc-scm-v1-bmc"),
>>           .parent        = TYPE_ASPEED_MACHINE,
>>           .class_init    = aspeed_machine_qcom_dc_scm_v1_class_init,
>> +    }, {
>> +        .name          = MACHINE_TYPE_NAME("qcom-firework"),
> 
> We should add the "-bmc" prefix to this machine name to be consistent
> with the other BMCs. A "qcom-firework" machine would model the whole
> system, host side included.

Right, so I added the "-bmc" tag to "qcom-dc-scm-v1-bmc" as it's an
add-in card type board, and it can be attached to the "qcom-firework"
baseboard. The "qcom-firework" doesn't have the "-bmc" tag intentionally
since it doesn't have a bmc soc on it.

Thanks,
Jae

> Thanks,
> 
> C.
> 
>> +        .parent        = TYPE_ASPEED_MACHINE,
>> +        .class_init    = aspeed_machine_qcom_firework_class_init,
>>       }, {
>>           .name          = MACHINE_TYPE_NAME("fp5280g2-bmc"),
>>           .parent        = TYPE_ASPEED_MACHINE,
> 

