Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E486CA62B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 15:41:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgn5d-0007qn-Bv; Mon, 27 Mar 2023 09:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgn5S-0007qW-W6
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 09:40:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgn5Q-0007q2-UD
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 09:40:38 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RDZHoK015807; Mon, 27 Mar 2023 13:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=0LqmTqrhwklrmW5BPdZJ0lYhQbSVcz6tHpFwdwYfZs4=;
 b=KkTE/+zVARZM2s60NUoxj0iY/gbl3nozYlIRSrd9pYjWpYMPQ5+eOGDd21IrrCcdQ0GF
 davgtLjs2kZcFWTG1d2ddJ/fTounHwRE9F2dVtesDDYqAsRacIcMGD1kesXrQ/9UYlce
 QXGrV1UAzJ9TDTj73+DRuN76MqjtMw3S1wAGuK56oA6DW0SOFGgMwLXrqQ/PoAhWUBya
 5SlAAa67vmqz66yhH6Hoqx8VwpcgoS3WANJ0x41bPd/rV/8GO+npFqFYMtMuSsW5RwUZ
 j91N6VyHAFQA5E9faW5bQ4wUMOyCdyfWcchcFrqeBGSl62rpvMj+IKdikeiSbSh3bKOb pQ== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjatrhtsm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 13:40:27 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32RDQfBj005815;
 Mon, 27 Mar 2023 13:40:26 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3phrk6uesb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 13:40:26 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RDePM26685398
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 13:40:25 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92FA35806B;
 Mon, 27 Mar 2023 13:40:25 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 167B25805B;
 Mon, 27 Mar 2023 13:40:25 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Mar 2023 13:40:24 +0000 (GMT)
Message-ID: <eb04f93a-6e1d-4770-7265-5717ef4415e6@linux.ibm.com>
Date: Mon, 27 Mar 2023 09:40:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 3/3] tpm: Add support for TPM device over I2C bus
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au, clg@kaod.org
References: <20230326224426.3918167-1-ninad@linux.ibm.com>
 <20230326224426.3918167-4-ninad@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230326224426.3918167-4-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -RQ1lnj_A8r-NF5Zwm153Sw5c2GAwzvJ
X-Proofpoint-GUID: -RQ1lnj_A8r-NF5Zwm153Sw5c2GAwzvJ
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303270107
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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



On 3/26/23 18:44, Ninad Palsule wrote:
> Qemu already supports devices attached to ISA and sysbus. This drop adds
> support for the I2C bus attached TPM devices. I2C model only supports
> TPM2 protocol.
> 

> --- /dev/null
> +++ b/hw/tpm/tpm_tis_i2c.c
> @@ -0,0 +1,540 @@
> +/*
> + * tpm_tis_i2c.c - QEMU's TPM TIS I2C Device
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + * Implementation of the TIS interface according to specs found at
> + * http://www.trustedcomputinggroup.org. This implementation currently
> + * supports version 1.3, 21 March 2013
> + * In the developers menu choose the PC Client section then find the TIS
> + * specification.
> + *
> + * TPM TIS for TPM 2 implementation following TCG PC Client Platform
> + * TPM Profile (PTP) Specification, Familiy 2.0, Revision 00.43
> + *
> + * TPM I2C implementation follows TCG TPM I2c Interface specification,
> + * Family 2.0, Level 00, Revision 1.00
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/i2c/i2c.h"
> +#include "hw/sysbus.h"
> +#include "hw/acpi/tpm.h"
> +#include "migration/vmstate.h"
> +#include "tpm_prop.h"
> +#include "qemu/log.h"
> +#include "trace.h"
> +#include "tpm_tis.h"
> +
> +/* TPM_STS mask for read bits 31:26 must be zero */
> +#define TPM_I2C_STS_READ_MASK          0x03ffffff
> +
> +/* TPM_I2C_INT_ENABLE mask */
> +#define TPM_I2C_INT_ENABLE_MASK   (TPM_TIS_INT_ENABLED          | \
> +                                   TPM_TIS_INT_DATA_AVAILABLE   | \
> +                                   TPM_TIS_INT_STS_VALID        | \
> +                                   TPM_TIS_INT_LOCALITY_CHANGED | \
> +                                   TPM_TIS_INT_COMMAND_READY)

Since we cannot test interrupts with Linux since the driver doesn't support it,
can you set this mask to 0 and move it into the public header file. Please also
apply the mask to vthe alue returned from reading to the TPM_INT_CAPABILITY register.


> +
> +/* Operations */
> +#define OP_SEND   1
> +#define OP_RECV   2
> +
> +typedef struct TPMStateI2C {
> +    /*< private >*/
> +    I2CSlave    parent_obj;
> +
> +    uint8_t     offset;       /* offset into data[] */
> +    uint8_t     operation;    /* OP_SEND & OP_RECV */
> +    uint8_t     data[5];      /* Data */
> +
> +    /* i2c registers */
> +    uint8_t     loc_sel;      /* Current locality */
> +    uint8_t     csum_enable;  /* Is checksum enabled */
> +
> +    /* Derived from the above */
> +    const char *reg_name;     /* Register name */
> +    uint32_t    tis_addr;     /* Converted tis address including locty */
> +
> +    /*< public >*/
> +    TPMState    state; /* not a QOM object */
> +
> +} TPMStateI2C;
> +
> +DECLARE_INSTANCE_CHECKER(TPMStateI2C, TPM_TIS_I2C,
> +                         TYPE_TPM_TIS_I2C)
> +
> +/* Prototype */
> +static inline void tpm_tis_i2c_to_tis_reg(TPMStateI2C *i2cst, uint8_t i2c_reg);
> +
> +/* Register map */
> +typedef struct regMap {
> +    uint8_t   i2c_reg;    /* I2C register */
> +    uint16_t  tis_reg;    /* TIS register */
> +    const char *reg_name; /* Register name */
> +} I2CRegMap;
> +
> +/*
> + * The register values in the common code is different than the latest
> + * register numbers as per the spec hence add the conversion map
> + */
> +static const I2CRegMap tpm_tis_reg_map[] = {
> +    /*
> +     * These registers are sent to TIS layer. The register with UNKNOWN
> +     * mapping are not sent to TIS layer and handled in I2c layer.
> +     * NOTE: Adding frequently used registers at the start
> +     */
> +    { TPM_I2C_REG_DATA_FIFO,        TPM_TIS_REG_DATA_FIFO,       "FIFO",      },
> +    { TPM_I2C_REG_STS,              TPM_TIS_REG_STS,             "STS",       },
> +    { TPM_I2C_REG_DATA_CSUM_GET,    TPM_I2C_REG_UNKNOWN,         "CSUM_GET",  },
> +    { TPM_I2C_REG_LOC_SEL,          TPM_I2C_REG_UNKNOWN,         "LOC_SEL",   },
> +    { TPM_I2C_REG_ACCESS,           TPM_TIS_REG_ACCESS,          "ACCESS",    },
> +    { TPM_I2C_REG_INT_ENABLE,       TPM_TIS_REG_INT_ENABLE,     "INTR_ENABLE",},
> +    { TPM_I2C_REG_INT_CAPABILITY,   TPM_TIS_REG_INT_ENABLE,      "INTR_CAP",  },


This mapping here is wrong. It should map to TPM_TIS_REG_INT_CAPABILITY.

> +    { TPM_I2C_REG_INTF_CAPABILITY,  TPM_TIS_REG_INTF_CAPABILITY, "INTF_CAP",  },
> +    { TPM_I2C_REG_DID_VID,          TPM_TIS_REG_DID_VID,         "DID_VID",   },
> +    { TPM_I2C_REG_RID,              TPM_TIS_REG_RID,             "RID",       },
> +    { TPM_I2C_REG_I2C_DEV_ADDRESS,  TPM_I2C_REG_UNKNOWN,        "DEV_ADDRESS",},
> +    { TPM_I2C_REG_DATA_CSUM_ENABLE, TPM_I2C_REG_UNKNOWN,        "CSUM_ENABLE",},
> +};
> +


> +/*
> + * Send function only remembers data in the buffer and then calls
> + * TPM TIS common code during FINISH event.
> + */
> +static int tpm_tis_i2c_send(I2CSlave *i2c, uint8_t data)
> +{
> +    TPMStateI2C *i2cst = TPM_TIS_I2C(i2c);
> +
> +    /* Reject non-supported registers. */
> +    if (i2cst->offset == 0) {
> +        /* Convert I2C register to TIS register */
> +        tpm_tis_i2c_to_tis_reg(i2cst, data);
> +        if (i2cst->tis_addr == 0xffffffff) {
> +            return 0xffffffff;
> +        }
> +
> +        trace_tpm_tis_i2c_send_reg(i2cst->reg_name, data);
> +
> +        /* We do not support device address change */
> +        if (data == TPM_I2C_REG_I2C_DEV_ADDRESS) {
> +            qemu_log_mask(LOG_UNIMP, "%s: Device address change "
> +                          "is not supported.\n", __func__);
> +            return 0xffffffff;
> +        }
> +    } else {
> +        trace_tpm_tis_i2c_send(data);
> +    }
> +
> +    if (i2cst->offset < sizeof(i2cst->data)) {
> +        i2cst->operation = OP_SEND;
> +
> +        /* Remember data locally for non-FIFO registers */
> +        if ((i2cst->offset == 0) ||
> +            (i2cst->data[0] != TPM_I2C_REG_DATA_FIFO)) {
> +            i2cst->data[i2cst->offset++] = data;
> +        } else {
> +            tpm_tis_write_data(&i2cst->state, i2cst->tis_addr, data, 1);
> +        }
> +
> +        return 0;
> +
> +    }
> +
> +    /* Return non-zero to indicate NAK */
> +    return 1;
> +}
> +
> +static Property tpm_tis_i2c_properties[] = {
> +    DEFINE_PROP_UINT32("irq", TPMStateI2C, state.irq_num, TPM_TIS_IRQ),

You should remove this here. Maybe one day we will add it back when we can test it.

> +    DEFINE_PROP_TPMBE("tpmdev", TPMStateI2C, state.be_driver),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void tpm_tis_i2c_realizefn(DeviceState *dev, Error **errp)
> +{
> +    TPMStateI2C *i2cst = TPM_TIS_I2C(dev);
> +    TPMState *s = &i2cst->state;
> +
> +    if (!tpm_find()) {
> +        error_setg(errp, "at most one TPM device is permitted");
> +        return;
> +    }
> +
> +    /*
> +     * Get the backend pointer. It is not initialized propery during
> +     * device_class_set_props
> +     */
> +    s->be_driver = qemu_find_tpm_be("tpm0");
> +
> +    if (!s->be_driver) {
> +        error_setg(errp, "'tpmdev' property is required");
> +        return;
> +    }
> +    if (s->irq_num > 15) {
> +        error_setg(errp, "IRQ %d is outside valid range of 0 to 15",
> +                   s->irq_num);
> +        return;
> +    }

This block can go.

> +}
> +
> +static void tpm_tis_i2c_reset(DeviceState *dev)
> +{
> +    TPMStateI2C *i2cst = TPM_TIS_I2C(dev);
> +    TPMState *s = &i2cst->state;
> +
> +    tpm_tis_i2c_clear_data(i2cst);
> +
> +    i2cst->csum_enable = 0;
> +    i2cst->loc_sel = 0x00;
> +
> +    return tpm_tis_reset(s);
> +}
> +
> +static void tpm_tis_i2c_initfn(Object *obj)
> +{
> +    TPMStateI2C *i2cst = TPM_TIS_I2C(obj);
> +    TPMState *s = &i2cst->state;
> +
> +    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
> +}
  
This function also has to go.

Thanks,
    Stefan

