Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D360557D76
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 16:03:55 +0200 (CEST)
Received: from localhost ([::1]:36906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4NR3-0001YD-K2
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 10:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o4NNX-0008NT-Mb; Thu, 23 Jun 2022 10:00:18 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:11851)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o4NNV-0002wC-Qn; Thu, 23 Jun 2022 10:00:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655992814; x=1687528814;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=02+8IP2kyiG/CDi7NR208b+/HovV3qX0a50JCllrnU4=;
 b=hmrEoz7lwFV6doKKzTpj/nPWuri9Iu6smv6Ug+UoZu+IS4f1Z4lpH1Fm
 bQEugPVHiYJpHGyUdmdKdTwqNkCOVkJqk5jT6wwl1J5XNrWwbGcrxgp7k
 LBmTlUBVyVZW52vO1kWU7FQa0Ci03PyVbU84JHVLxKpLw5GIHzSdqxmok w=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 23 Jun 2022 07:00:12 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 07:00:11 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 23 Jun 2022 07:00:11 -0700
Received: from [10.110.81.137] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 23 Jun
 2022 07:00:09 -0700
Message-ID: <c2126523-94e7-130e-3202-7344ded288f7@quicinc.com>
Date: Thu, 23 Jun 2022 07:00:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/9] hw/arm/aspeed: qcom-dc-scm-v1: add block backed FRU
 device
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
CC: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>, Titus Rwantare <titusr@google.com>, "Andrew
 Jeffery" <andrew@aj.id.au>, Graeme Gregory <quic_ggregory@quicinc.com>,
 Maheswara Kurapati <quic_mkurapat@quicinc.com>, qemu-arm
 <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
 <20220622172830.101210-4-quic_jaehyoo@quicinc.com>
 <CACPK8XdBVanZ8D8sR77KnfOw=KD8LPGrNY2KeEx7HWcMwxP-Wg@mail.gmail.com>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <CACPK8XdBVanZ8D8sR77KnfOw=KD8LPGrNY2KeEx7HWcMwxP-Wg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=129.46.98.28;
 envelope-from=quic_jaehyoo@quicinc.com; helo=alexa-out.qualcomm.com
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

On 6/22/2022 10:28 PM, Joel Stanley wrote:
> On Wed, 22 Jun 2022 at 17:29, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>>
>> From: Graeme Gregory <quic_ggregory@quicinc.com>
>>
>> The FRU device uses the index 0 device on bus IF_NONE.
>>
>> -drive file=$FRU,format=raw,if=none
>>
>> file must match FRU size of 128k
>>
>> Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
>> ---
>>   hw/arm/aspeed.c | 22 +++++++++++++++++-----
>>   1 file changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index 785cc543d046..36d6b2c33e48 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -992,17 +992,29 @@ static void fby35_i2c_init(AspeedMachineState *bmc)
>>        */
>>   }
>>
>> +static void qcom_dc_scm_fru_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
>> +{
>> +    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
>> +    DeviceState *dev = DEVICE(i2c_dev);
>> +    /* Use First Index for DC-SCM FRU */
>> +    DriveInfo *dinfo = drive_get(IF_NONE, 0, 0);
>> +
>> +    qdev_prop_set_uint32(dev, "rom-size", rsize);
>> +
>> +    if (dinfo) {
>> +        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
>> +    }
>> +
>> +    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
>> +}
>> +
>>   static void qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)
>>   {
>>       AspeedSoCState *soc = &bmc->soc;
>>
>>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 15), "tmp105", 0x4d);
>>
>> -    uint8_t *eeprom_buf = g_malloc0(128 * 1024);
>> -    if (eeprom_buf) {
>> -        smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 15), 0x53,
>> -                              eeprom_buf);
>> -    }
> 
> Again, it's strange to see code that was just added being removed. If
> you want the FRU to be in its own patch then remove the eeprom from
> the previous patch.

I see. I'll remove it from the 2/9 patch.

Thanks,
Jae

>> +    qcom_dc_scm_fru_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x53, 128 * 1024);
>>   }
>>
>>   static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
>> --
>> 2.25.1
>>

