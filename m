Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F361058EE4C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 16:26:21 +0200 (CEST)
Received: from localhost ([::1]:43924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLmf7-0003Lx-7F
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 10:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oLmD3-0007am-6r; Wed, 10 Aug 2022 09:57:21 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oLmD0-0002q1-LV; Wed, 10 Aug 2022 09:57:20 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27AD6m2N020952;
 Wed, 10 Aug 2022 13:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Wno38apHfxRT267uMHyCulTON6VF15fJmAvTeRl9k+E=;
 b=ZD61WviBS/HeTxijtsxrSYpUz4Q2OrNBudw7WXH6QtKdDYB4emZZIwcqGsOcaCzM5AGk
 L3a8yDDj5EGHU8/fyfcbcDoipedm5mbPb6kot+RSsrdfeYmbxx88kjetkgRj7tQwlhwG
 8L/cbqHP8W3BqY1PhjNatYuKahxlhsO5CptF4VTChsdjrhYQ5x4meIfY3f7i1mtI8iD3
 YmddNtVfuSxMUN0azxuk3Xp3sF9do8KAZw6csRMDRk+wTntqx0mt7/iaU3cyvHLMKUuL
 ZKJZZ/YWSWsxenu1Fa0J9VxNGLdj1UcgPK5BBnNtuphvGffBHY6JlyyabpC+RFRWreAS og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hv3fg3y7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 13:57:08 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27ADZhUW034343;
 Wed, 10 Aug 2022 13:57:07 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hv3fg3y6g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 13:57:07 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27ADpIYp016942;
 Wed, 10 Aug 2022 13:57:06 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 3huwvke0nm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 13:57:06 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27ADv5Yg18547508
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Aug 2022 13:57:05 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5C9B112067;
 Wed, 10 Aug 2022 13:57:05 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 693EC112062;
 Wed, 10 Aug 2022 13:57:05 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 10 Aug 2022 13:57:05 +0000 (GMT)
Message-ID: <89c560e2-b23e-6ae2-7703-be97a6e09f50@linux.ibm.com>
Date: Wed, 10 Aug 2022 09:57:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC 1/1] hw: tpmtisspi: add SPI support to QEMU TPM
 implementation
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Iris Chen <irischenlj@gmail.com>
Cc: irischenlj@fb.com, peter@pjd.dev, pdel@fb.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, patrick@stwcx.xyz, alistair@alistair23.me,
 kwolf@redhat.com, hreitz@redhat.com, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, thuth@redhat.com, lvivier@redhat.com,
 pbonzini@redhat.com, qemu-block@nongnu.org, dz4list@gmail.com
References: <20220803023241.63739-1-irischenlj@gmail.com>
 <20220803023241.63739-2-irischenlj@gmail.com>
 <36a20515-461d-0f27-3be8-a4edd099165a@kaod.org>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <36a20515-461d-0f27-3be8-a4edd099165a@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: boAFOwiAmwP8zBXjD1qzaD9mkJJ7Eams
X-Proofpoint-GUID: S7jj2AMyMa1PTtIa1rJCndG5sqYMHuEX
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_08,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 impostorscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208100042
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/3/22 04:52, Cédric Le Goater wrote:
> On 8/3/22 04:32, Iris Chen wrote:
>> From: Iris Chen <irischenlj@fb.com>
> 
> A commit log telling us about this new device would be good to have.
> 
> 
>> Signed-off-by: Iris Chen <irischenlj@fb.com>
>> ---
>>   configs/devices/arm-softmmu/default.mak |   1 +
>>   hw/arm/Kconfig                          |   5 +
>>   hw/tpm/Kconfig                          |   5 +
>>   hw/tpm/meson.build                      |   1 +
>>   hw/tpm/tpm_tis_spi.c                    | 311 ++++++++++++++++++++++++
>>   include/sysemu/tpm.h                    |   3 +
>>   6 files changed, 326 insertions(+)
>>   create mode 100644 hw/tpm/tpm_tis_spi.c
>>
>> diff --git a/configs/devices/arm-softmmu/default.mak 
>> b/configs/devices/arm-softmmu/default.mak
>> index 6985a25377..80d2841568 100644
>> --- a/configs/devices/arm-softmmu/default.mak
>> +++ b/configs/devices/arm-softmmu/default.mak
>> @@ -42,3 +42,4 @@ CONFIG_FSL_IMX6UL=y
>>   CONFIG_SEMIHOSTING=y
>>   CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
>>   CONFIG_ALLWINNER_H3=y
>> +CONFIG_FBOBMC_AST=y
> 
> I don't think this extra config is useful for now
> 
>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>> index 15fa79afd3..193decaec1 100644
>> --- a/hw/arm/Kconfig
>> +++ b/hw/arm/Kconfig
>> @@ -458,6 +458,11 @@ config ASPEED_SOC
>>       select PMBUS
>>       select MAX31785
>> +config FBOBMC_AST
>> +    bool
>> +    select ASPEED_SOC
>> +    select TPM_TIS_SPI
>> +
>>   config MPS2
>>       bool
>>       imply I2C_DEVICES
>> diff --git a/hw/tpm/Kconfig b/hw/tpm/Kconfig
>> index 29e82f3c92..370a43f045 100644
>> --- a/hw/tpm/Kconfig
>> +++ b/hw/tpm/Kconfig
>> @@ -8,6 +8,11 @@ config TPM_TIS_SYSBUS
>>       depends on TPM
>>       select TPM_TIS
>> +config TPM_TIS_SPI
>> +    bool
>> +    depends on TPM
>> +    select TPM_TIS
>> +
>>   config TPM_TIS
>>       bool
>>       depends on TPM
>> diff --git a/hw/tpm/meson.build b/hw/tpm/meson.build
>> index 1c68d81d6a..1a057f4e36 100644
>> --- a/hw/tpm/meson.build
>> +++ b/hw/tpm/meson.build
>> @@ -2,6 +2,7 @@ softmmu_ss.add(when: 'CONFIG_TPM_TIS', if_true: 
>> files('tpm_tis_common.c'))
>>   softmmu_ss.add(when: 'CONFIG_TPM_TIS_ISA', if_true: 
>> files('tpm_tis_isa.c'))
>>   softmmu_ss.add(when: 'CONFIG_TPM_TIS_SYSBUS', if_true: 
>> files('tpm_tis_sysbus.c'))
>>   softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
>> +softmmu_ss.add(when: 'CONFIG_TPM_TIS_SPI', if_true: 
>> files('tpm_tis_spi.c'))
>>   specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_TIS'], if_true: 
>> files('tpm_ppi.c'))
>>   specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_CRB'], if_true: 
>> files('tpm_ppi.c'))
>> diff --git a/hw/tpm/tpm_tis_spi.c b/hw/tpm/tpm_tis_spi.c
>> new file mode 100644
>> index 0000000000..c98ddcfddb
>> --- /dev/null
>> +++ b/hw/tpm/tpm_tis_spi.c
>> @@ -0,0 +1,311 @@
>> +#include "qemu/osdep.h"
>> +#include "hw/qdev-properties.h"
>> +#include "migration/vmstate.h"
>> +#include "hw/acpi/tpm.h"
>> +#include "tpm_prop.h"
>> +#include "tpm_tis.h"
>> +#include "qom/object.h"
>> +#include "hw/ssi/ssi.h"
>> +#include "hw/ssi/spi_gpio.h"
>> +
>> +#define TPM_TIS_SPI_ADDR_BYTES 3
>> +#define SPI_WRITE 0
>> +
>> +typedef enum {
>> +    TIS_SPI_PKT_STATE_DEACTIVATED = 0,
>> +    TIS_SPI_PKT_STATE_START,
>> +    TIS_SPI_PKT_STATE_ADDRESS,
>> +    TIS_SPI_PKT_STATE_DATA_WR,
>> +    TIS_SPI_PKT_STATE_DATA_RD,
>> +    TIS_SPI_PKT_STATE_DONE,
>> +} TpmTisSpiPktState;
>> +
>> +union TpmTisRWSizeByte {
>> +    uint8_t byte;
>> +    struct {
>> +        uint8_t data_expected_size:6;
>> +        uint8_t resv:1;
>> +        uint8_t rwflag:1;
>> +    };
>> +};
>> +
>> +union TpmTisSpiHwAddr {
>> +    hwaddr addr;
>> +    uint8_t bytes[sizeof(hwaddr)];
>> +};
>> +
>> +union TpmTisSpiData {
>> +    uint32_t data;
>> +    uint8_t bytes[64];
>> +};
>> +
>> +struct TpmTisSpiState {
>> +    /*< private >*/
>> +    SSIPeripheral parent_obj;
>> +
>> +    /*< public >*/
>> +    TPMState tpm_state; /* not a QOM object */
>> +    TpmTisSpiPktState tpm_tis_spi_state;
>> +
>> +    union TpmTisRWSizeByte first_byte;
>> +    union TpmTisSpiHwAddr addr;
>> +    union TpmTisSpiData data;
> 
> Are these device registers ? I am not sure the unions are very useful.


> 
>> +    uint32_t data_size;
>> +    uint8_t data_idx;
>> +    uint8_t addr_idx; >> +};

I suppose that these registers will also have to be stored as part of 
the device state (for suspend/resume).

>> +/*
>> + * Pre-reading logic for transfer:
>> + * This is to fix the transaction between reading and writing.
>> + * The first byte is arbitrarily inserted so we need to
>> + * shift the all the output bytes (timeline) one byte right.

-> shift all the output bytes (timeline) one byte to the right

>> +
>> +static void tpm_tis_spi_realizefn(SSIPeripheral *ss, Error **errp)
>> +{
>> +    TpmTisSpiState *sbdev = TPM_TIS_SPI(ss);
>> +
>> +    if (!tpm_find()) {
>> +        error_setg(errp, "at most one TPM device is permitted");
>> +        return;
>> +    }
>> +
>> +    if (!sbdev->tpm_state.be_driver) {
>> +        error_setg(errp, "'tpmdev' property is required");
>> +        return;
>> +    }
>> +
>> +    DeviceState *spi_gpio = qdev_find_recursive(sysbus_get_default(),
>> +                                                TYPE_SPI_GPIO);
>> +    qdev_connect_gpio_out_named(spi_gpio,
>> +                                "SPI_CS_out", 0,
>> +                                qdev_get_gpio_in_named(DEVICE(ss),
>> +                                SSI_GPIO_CS, 0));
> Typically, this part is done at the machine/board level because it
> has knowledge of all devices but it is possible with the TPM devices?
> 
> How do you invoke QEMU ?

I you could extend the documentation for how to start QEMU with this 
device I think that would be very helpful: docs/specs/tpm.rst.

Did you get Linux to work with it? Poeple are particularly interested in 
getting Windows 11 on ARM to use a TPM 2: 
https://github.com/stefanberger/swtpm/issues/493

Thanks,

    Stefan

> 
> Thanks,
> 
> C.
> 
>> +}
>> +
>> +static void tpm_tis_spi_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +    SSIPeripheralClass *k = SSI_PERIPHERAL_CLASS(klass);
>> +    TPMIfClass *tc = TPM_IF_CLASS(klass);
>> +
>> +    device_class_set_props(dc, tpm_tis_spi_properties);
>> +    k->realize = tpm_tis_spi_realizefn;
>> +    k->transfer = tpm_tis_spi_transfer8_ex;
>> +    k->set_cs = tpm_tis_spi_cs;
>> +    k->cs_polarity = SSI_CS_LOW;
>> +
>> +    dc->vmsd  = &vmstate_tpm_tis_spi;
>> +    tc->model = TPM_MODEL_TPM_TIS;
>> +    dc->user_creatable = true;
>> +    dc->reset = tpm_tis_spi_reset;
>> +    tc->request_completed = tpm_tis_spi_request_completed;
>> +    tc->get_version = tpm_tis_spi_get_tpm_version;
>> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>> +}
>> +
>> +static const TypeInfo tpm_tis_spi_info = {
>> +    .name = TYPE_TPM_TIS_SPI,
>> +    .parent = TYPE_SSI_PERIPHERAL,
>> +    .instance_size = sizeof(TpmTisSpiState),
>> +    .class_size = sizeof(TpmTisSpiClass),
>> +    .class_init  = tpm_tis_spi_class_init,
>> +    .interfaces = (InterfaceInfo[]) {
>> +        { TYPE_TPM_IF },
>> +        { }
>> +    }
>> +};
>> +
>> +static void tpm_tis_spi_register(void)
>> +{
>> +    type_register_static(&tpm_tis_spi_info);
>> +}
>> +
>> +type_init(tpm_tis_spi_register)
>> diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
>> index fb40e30ff6..6a6b311e47 100644
>> --- a/include/sysemu/tpm.h
>> +++ b/include/sysemu/tpm.h
>> @@ -46,6 +46,7 @@ struct TPMIfClass {
>>   #define TYPE_TPM_TIS_ISA            "tpm-tis"
>>   #define TYPE_TPM_TIS_SYSBUS         "tpm-tis-device"
>> +#define TYPE_TPM_TIS_SPI            "tpm-tis-spi-device"
>>   #define TYPE_TPM_CRB                "tpm-crb"
>>   #define TYPE_TPM_SPAPR              "tpm-spapr"
>> @@ -53,6 +54,8 @@ struct TPMIfClass {
>>       object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_ISA)
>>   #define TPM_IS_TIS_SYSBUS(chr)                      \
>>       object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_SYSBUS)
>> +#define TPM_IS_TIS_SPI(chr)                      \
>> +    object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_SPI)
>>   #define TPM_IS_CRB(chr)                             \
>>       object_dynamic_cast(OBJECT(chr), TYPE_TPM_CRB)
>>   #define TPM_IS_SPAPR(chr)                           \
> 

