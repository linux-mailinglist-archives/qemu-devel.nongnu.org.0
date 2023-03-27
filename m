Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E6B6CA9B1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 17:56:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgpBt-0000tO-9J; Mon, 27 Mar 2023 11:55:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pgpBq-0000sl-1I
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 11:55:22 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pgpBg-0005aG-Hp
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 11:55:16 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RFN32H007509; Mon, 27 Mar 2023 15:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=aD8O1bLtoBGJhjhIcCkCQIZOxavu5XtfYOFxDrkfb0U=;
 b=QeuFB98euuRp0+ATBQXMZ2qFbkoB+EelCyduHXl5K6rvsjBxDsyZIdUDs4WbI9WqRQSQ
 JH4NnCJrevjTpooJKciVzjJOuFcTxHMeOxbUeB2KsQ5JcNstT+rqDQ5J9pJ8jpto41dh
 jPRE1xq+j3XozTrI8ZcNpz88WWf9GVuhCdQId7PTWKjxZoTY6Rka0PGa7jEL6yo7I0Yg
 snJxy2lBoHY2QJtUVL982lsK/DS5qiW87Zh4h1AyaodJADzGK1oVj0+wmgBEeI5yilIi
 a1V0+ndRIspu2CLH+IievEhUBQQkV2r8D7N97C5BR4wN6QUU0+p+lAzawpi693GQgB9P Zg== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pkdr0gt6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 15:55:01 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32RDCdXs029011;
 Mon, 27 Mar 2023 15:55:00 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3phrk7ewkc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 15:55:00 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RFswvc7930580
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 15:54:58 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62EC65805D;
 Mon, 27 Mar 2023 15:54:58 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4FCB58043;
 Mon, 27 Mar 2023 15:54:57 +0000 (GMT)
Received: from [9.211.158.228] (unknown [9.211.158.228])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Mar 2023 15:54:57 +0000 (GMT)
Message-ID: <091c2f5e-6dd1-871c-6832-7f505b2ad7d8@linux.vnet.ibm.com>
Date: Mon, 27 Mar 2023 10:54:57 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v7 3/3] tpm: Add support for TPM device over I2C bus
Content-Language: en-US
To: Stefan Berger <stefanb@linux.ibm.com>, Ninad Palsule
 <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au, clg@kaod.org
References: <20230326224426.3918167-1-ninad@linux.ibm.com>
 <20230326224426.3918167-4-ninad@linux.ibm.com>
 <eb04f93a-6e1d-4770-7265-5717ef4415e6@linux.ibm.com>
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <eb04f93a-6e1d-4770-7265-5717ef4415e6@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: omDcIxXATEbnKIhr8YPXXfeBu3M6OEc8
X-Proofpoint-ORIG-GUID: omDcIxXATEbnKIhr8YPXXfeBu3M6OEc8
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270124
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=ninad@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Hi Stefan,


On 3/27/23 8:40 AM, Stefan Berger wrote:
>
>
> On 3/26/23 18:44, Ninad Palsule wrote:
>> Qemu already supports devices attached to ISA and sysbus. This drop adds
>> support for the I2C bus attached TPM devices. I2C model only supports
>> TPM2 protocol.
>>
>
>> --- /dev/null
>> +++ b/hw/tpm/tpm_tis_i2c.c
>> @@ -0,0 +1,540 @@
>> +/*
>> + * tpm_tis_i2c.c - QEMU's TPM TIS I2C Device
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 
>> or later.
>> + * See the COPYING file in the top-level directory.
>> + *
>> + * Implementation of the TIS interface according to specs found at
>> + * http://www.trustedcomputinggroup.org. This implementation currently
>> + * supports version 1.3, 21 March 2013
>> + * In the developers menu choose the PC Client section then find the 
>> TIS
>> + * specification.
>> + *
>> + * TPM TIS for TPM 2 implementation following TCG PC Client Platform
>> + * TPM Profile (PTP) Specification, Familiy 2.0, Revision 00.43
>> + *
>> + * TPM I2C implementation follows TCG TPM I2c Interface specification,
>> + * Family 2.0, Level 00, Revision 1.00
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/i2c/i2c.h"
>> +#include "hw/sysbus.h"
>> +#include "hw/acpi/tpm.h"
>> +#include "migration/vmstate.h"
>> +#include "tpm_prop.h"
>> +#include "qemu/log.h"
>> +#include "trace.h"
>> +#include "tpm_tis.h"
>> +
>> +/* TPM_STS mask for read bits 31:26 must be zero */
>> +#define TPM_I2C_STS_READ_MASK          0x03ffffff
>> +
>> +/* TPM_I2C_INT_ENABLE mask */
>> +#define TPM_I2C_INT_ENABLE_MASK   (TPM_TIS_INT_ENABLED | \
>> +                                   TPM_TIS_INT_DATA_AVAILABLE | \
>> +                                   TPM_TIS_INT_STS_VALID | \
>> +                                   TPM_TIS_INT_LOCALITY_CHANGED | \
>> +                                   TPM_TIS_INT_COMMAND_READY)
>
> Since we cannot test interrupts with Linux since the driver doesn't 
> support it,
> can you set this mask to 0 and move it into the public header file. 
> Please also
> apply the mask to vthe alue returned from reading to the 
> TPM_INT_CAPABILITY register.
>
OK, done.
>
>> +
>> +/* Operations */
>> +#define OP_SEND   1
>> +#define OP_RECV   2
>> +
>> +typedef struct TPMStateI2C {
>> +    /*< private >*/
>> +    I2CSlave    parent_obj;
>> +
>> +    uint8_t     offset;       /* offset into data[] */
>> +    uint8_t     operation;    /* OP_SEND & OP_RECV */
>> +    uint8_t     data[5];      /* Data */
>> +
>> +    /* i2c registers */
>> +    uint8_t     loc_sel;      /* Current locality */
>> +    uint8_t     csum_enable;  /* Is checksum enabled */
>> +
>> +    /* Derived from the above */
>> +    const char *reg_name;     /* Register name */
>> +    uint32_t    tis_addr;     /* Converted tis address including 
>> locty */
>> +
>> +    /*< public >*/
>> +    TPMState    state; /* not a QOM object */
>> +
>> +} TPMStateI2C;
>> +
>> +DECLARE_INSTANCE_CHECKER(TPMStateI2C, TPM_TIS_I2C,
>> +                         TYPE_TPM_TIS_I2C)
>> +
>> +/* Prototype */
>> +static inline void tpm_tis_i2c_to_tis_reg(TPMStateI2C *i2cst, 
>> uint8_t i2c_reg);
>> +
>> +/* Register map */
>> +typedef struct regMap {
>> +    uint8_t   i2c_reg;    /* I2C register */
>> +    uint16_t  tis_reg;    /* TIS register */
>> +    const char *reg_name; /* Register name */
>> +} I2CRegMap;
>> +
>> +/*
>> + * The register values in the common code is different than the latest
>> + * register numbers as per the spec hence add the conversion map
>> + */
>> +static const I2CRegMap tpm_tis_reg_map[] = {
>> +    /*
>> +     * These registers are sent to TIS layer. The register with UNKNOWN
>> +     * mapping are not sent to TIS layer and handled in I2c layer.
>> +     * NOTE: Adding frequently used registers at the start
>> +     */
>> +    { TPM_I2C_REG_DATA_FIFO, TPM_TIS_REG_DATA_FIFO,       
>> "FIFO",      },
>> +    { TPM_I2C_REG_STS, TPM_TIS_REG_STS,             "STS",       },
>> +    { TPM_I2C_REG_DATA_CSUM_GET, TPM_I2C_REG_UNKNOWN,         
>> "CSUM_GET",  },
>> +    { TPM_I2C_REG_LOC_SEL, TPM_I2C_REG_UNKNOWN,         "LOC_SEL",   },
>> +    { TPM_I2C_REG_ACCESS, TPM_TIS_REG_ACCESS,          "ACCESS",    },
>> +    { TPM_I2C_REG_INT_ENABLE,       TPM_TIS_REG_INT_ENABLE, 
>> "INTR_ENABLE",},
>> +    { TPM_I2C_REG_INT_CAPABILITY, TPM_TIS_REG_INT_ENABLE,      
>> "INTR_CAP",  },
>
>
> This mapping here is wrong. It should map to TPM_TIS_REG_INT_CAPABILITY.
OK, Now I handle this register in the I2C so changed to mapping to UNKNOWN
>
>> +    { TPM_I2C_REG_INTF_CAPABILITY, TPM_TIS_REG_INTF_CAPABILITY, 
>> "INTF_CAP",  },
>> +    { TPM_I2C_REG_DID_VID, TPM_TIS_REG_DID_VID,         "DID_VID",   },
>> +    { TPM_I2C_REG_RID, TPM_TIS_REG_RID,             "RID",       },
>> +    { TPM_I2C_REG_I2C_DEV_ADDRESS,  TPM_I2C_REG_UNKNOWN, 
>> "DEV_ADDRESS",},
>> +    { TPM_I2C_REG_DATA_CSUM_ENABLE, TPM_I2C_REG_UNKNOWN, 
>> "CSUM_ENABLE",},
>> +};
>> +
>
>
>> +/*
>> + * Send function only remembers data in the buffer and then calls
>> + * TPM TIS common code during FINISH event.
>> + */
>> +static int tpm_tis_i2c_send(I2CSlave *i2c, uint8_t data)
>> +{
>> +    TPMStateI2C *i2cst = TPM_TIS_I2C(i2c);
>> +
>> +    /* Reject non-supported registers. */
>> +    if (i2cst->offset == 0) {
>> +        /* Convert I2C register to TIS register */
>> +        tpm_tis_i2c_to_tis_reg(i2cst, data);
>> +        if (i2cst->tis_addr == 0xffffffff) {
>> +            return 0xffffffff;
>> +        }
>> +
>> +        trace_tpm_tis_i2c_send_reg(i2cst->reg_name, data);
>> +
>> +        /* We do not support device address change */
>> +        if (data == TPM_I2C_REG_I2C_DEV_ADDRESS) {
>> +            qemu_log_mask(LOG_UNIMP, "%s: Device address change "
>> +                          "is not supported.\n", __func__);
>> +            return 0xffffffff;
>> +        }
>> +    } else {
>> +        trace_tpm_tis_i2c_send(data);
>> +    }
>> +
>> +    if (i2cst->offset < sizeof(i2cst->data)) {
>> +        i2cst->operation = OP_SEND;
>> +
>> +        /* Remember data locally for non-FIFO registers */
>> +        if ((i2cst->offset == 0) ||
>> +            (i2cst->data[0] != TPM_I2C_REG_DATA_FIFO)) {
>> +            i2cst->data[i2cst->offset++] = data;
>> +        } else {
>> +            tpm_tis_write_data(&i2cst->state, i2cst->tis_addr, data, 
>> 1);
>> +        }
>> +
>> +        return 0;
>> +
>> +    }
>> +
>> +    /* Return non-zero to indicate NAK */
>> +    return 1;
>> +}
>> +
>> +static Property tpm_tis_i2c_properties[] = {
>> +    DEFINE_PROP_UINT32("irq", TPMStateI2C, state.irq_num, TPM_TIS_IRQ),
>
> You should remove this here. Maybe one day we will add it back when we 
> can test it.
Done
>
>> +    DEFINE_PROP_TPMBE("tpmdev", TPMStateI2C, state.be_driver),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void tpm_tis_i2c_realizefn(DeviceState *dev, Error **errp)
>> +{
>> +    TPMStateI2C *i2cst = TPM_TIS_I2C(dev);
>> +    TPMState *s = &i2cst->state;
>> +
>> +    if (!tpm_find()) {
>> +        error_setg(errp, "at most one TPM device is permitted");
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * Get the backend pointer. It is not initialized propery during
>> +     * device_class_set_props
>> +     */
>> +    s->be_driver = qemu_find_tpm_be("tpm0");
>> +
>> +    if (!s->be_driver) {
>> +        error_setg(errp, "'tpmdev' property is required");
>> +        return;
>> +    }
>> +    if (s->irq_num > 15) {
>> +        error_setg(errp, "IRQ %d is outside valid range of 0 to 15",
>> +                   s->irq_num);
>> +        return;
>> +    }
>
> This block can go.
Done
>
>> +}
>> +
>> +static void tpm_tis_i2c_reset(DeviceState *dev)
>> +{
>> +    TPMStateI2C *i2cst = TPM_TIS_I2C(dev);
>> +    TPMState *s = &i2cst->state;
>> +
>> +    tpm_tis_i2c_clear_data(i2cst);
>> +
>> +    i2cst->csum_enable = 0;
>> +    i2cst->loc_sel = 0x00;
>> +
>> +    return tpm_tis_reset(s);
>> +}
>> +
>> +static void tpm_tis_i2c_initfn(Object *obj)
>> +{
>> +    TPMStateI2C *i2cst = TPM_TIS_I2C(obj);
>> +    TPMState *s = &i2cst->state;
>> +
>> +    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
>> +}
>
> This function also has to go.

Done


Thanks for the review.

Ninad



