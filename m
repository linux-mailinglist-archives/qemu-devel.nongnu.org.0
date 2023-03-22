Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F436C3F72
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 02:12:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pen0G-0005dZ-HG; Tue, 21 Mar 2023 21:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pen0D-0005dR-V5
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 21:10:57 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pen09-0003hN-CZ
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 21:10:57 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32LNvgp9020061; Wed, 22 Mar 2023 01:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=3pxP9HrPZ9aTsoSLikseai88+NKazWRnPtDeai9W6jA=;
 b=G0AJHlwaEjGnhDMHyNHzJz3DYniN9EzgU65eg9WxumqmKNIoS8+/Io3YzGO2rG6u0UxA
 xKMyFy0YL5SiBoAiHainFJ1ndn2+csIb+t43rg+7gkj9Zz1EGjX3CQaJNV0FwUAdEvGy
 ADGJNzj3K5RGHQwDM9hGyV9L0lbeOatJiCNy7Cn9XeA0U1y4diddVpvqOOhHztPRDgbH
 aJIG3LOacI2Q6GQl6V9c4ahwL4SA+rwlyB6GdhW8oFVspvI9ji4nEKkNsF+J6ZTOfVSJ
 IsrQR0PLiPLjbah1ePbhb30+CKi8FpoAQcTKnQAOXa6rhzQdrTUQYSrHGQrtdbcSl0uF yw== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pfpqcs8hc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 01:10:34 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32M0G5Bl025936;
 Wed, 22 Mar 2023 01:10:33 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3pd4x7k26q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 01:10:33 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32M1AWcF23069376
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Mar 2023 01:10:32 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E1265805B;
 Wed, 22 Mar 2023 01:10:32 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B81B25805C;
 Wed, 22 Mar 2023 01:10:31 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 22 Mar 2023 01:10:31 +0000 (GMT)
Message-ID: <fb13103e-2d83-48c0-2fc3-7c4a8a9c060a@linux.ibm.com>
Date: Tue, 21 Mar 2023 21:10:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] Add support for TPM devices over I2C bus
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au, clg@kaod.org
References: <20230321053001.3886666-1-ninad@linux.ibm.com>
 <20230321053001.3886666-4-ninad@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230321053001.3886666-4-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tyK_nQ-NH1_-PdU7DwGv4C9VJ_HVaEpb
X-Proofpoint-ORIG-GUID: tyK_nQ-NH1_-PdU7DwGv4C9VJ_HVaEpb
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220005
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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



On 3/21/23 01:30, Ninad Palsule wrote:
> Qemu already supports devices attached to ISA and sysbus. This drop adds
> support for the I2C bus attached TPM devices. I2C model only supports
> TPM2 protocol.
> 
> This commit includes changes for the common code.
> - Added I2C emulation model. Logic was added in the model to temporarily
>    cache the data as I2C interface works per byte basis.
> - New tpm type "tpm-tis-i2c" added for I2C support. User specify this
>    string on command line.
> 
> Testing:
>    TPM I2C device modulte is tested using SWTPM (software based TPM
>    package). The qemu used the rainier machine and it was connected to
>    swtpm over the socket interface.
> 
>    The command to start swtpm is as follows:
>    $ swtpm socket --tpmstate dir=/tmp/mytpm1    \
>                   --ctrl type=unixio,path=/tmp/mytpm1/swtpm-sock  \
>                   --tpm2 --log level=100
> 
>    The command to start qemu is as follows:
>    $ qemu-system-arm -M rainier-bmc -nographic \
>              -kernel ${IMAGEPATH}/fitImage-linux.bin \
>              -dtb ${IMAGEPATH}/aspeed-bmc-ibm-rainier.dtb \
>              -initrd ${IMAGEPATH}/obmc-phosphor-initramfs.rootfs.cpio.xz \
>              -drive file=${IMAGEPATH}/obmc-phosphor-image.rootfs.wic.qcow2,if=sd,index=2 \
>              -net nic -net user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443-:443 \
>              -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
>              -tpmdev emulator,id=tpm0,chardev=chrtpm \
>              -device tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e


Please add this command line example also to the documentation.

When you run scripts/checkpatch.pl over this patch it reports the following relevant complaints:

WARNING: Block comments use a leading /* on a separate line
#255: FILE: hw/tpm/tpm_tis_i2c.c:190:
+/* If data is for FIFO then it is received from tpm_tis_common buffer

WARNING: Block comments use a leading /* on a separate line
#345: FILE: hw/tpm/tpm_tis_i2c.c:280:
+    /* Get the backend pointer. It is not initialized propery during



> 
>    Note: Currently you need to specify the I2C bus and device address on
>          command line. In future we can add a device at board level.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>   hw/tpm/meson.build   |   1 +
>   hw/tpm/tpm_tis_i2c.c | 342 +++++++++++++++++++++++++++++++++++++++++++
>   include/sysemu/tpm.h |   3 +
>   3 files changed, 346 insertions(+)
>   create mode 100644 hw/tpm/tpm_tis_i2c.c
> 
> diff --git a/hw/tpm/meson.build b/hw/tpm/meson.build
> index 7abc2d794a..76fe3cb098 100644
> --- a/hw/tpm/meson.build
> +++ b/hw/tpm/meson.build
> @@ -1,6 +1,7 @@
>   softmmu_ss.add(when: 'CONFIG_TPM_TIS', if_true: files('tpm_tis_common.c'))
>   softmmu_ss.add(when: 'CONFIG_TPM_TIS_ISA', if_true: files('tpm_tis_isa.c'))
>   softmmu_ss.add(when: 'CONFIG_TPM_TIS_SYSBUS', if_true: files('tpm_tis_sysbus.c'))
> +softmmu_ss.add(when: 'CONFIG_TPM_TIS_I2C', if_true: files('tpm_tis_i2c.c'))
>   softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
>   softmmu_ss.add(when: 'CONFIG_TPM_TIS', if_true: files('tpm_ppi.c'))
>   softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_ppi.c'))
> diff --git a/hw/tpm/tpm_tis_i2c.c b/hw/tpm/tpm_tis_i2c.c
> new file mode 100644
> index 0000000000..3c45af4140
> --- /dev/null
> +++ b/hw/tpm/tpm_tis_i2c.c
> @@ -0,0 +1,342 @@
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
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/i2c/i2c.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/acpi/tpm.h"
> +#include "migration/vmstate.h"
> +#include "tpm_prop.h"
> +#include "tpm_tis.h"
> +#include "qom/object.h"
> +#include "block/aio.h"
> +#include "qemu/main-loop.h"
> +
> +/* TPM TIS I2C registers */
> +#define TPM_TIS_I2C_REG_LOC_SEL          0x00
> +#define TPM_TIS_I2C_REG_ACCESS           0x04
> +#define TPM_TIS_I2C_REG_INT_ENABLE       0x08
> +#define TPM_TIS_I2C_REG_INT_CAPABILITY   0x14
> +#define TPM_TIS_I2C_REG_STS              0x18
> +#define TPM_TIS_I2C_REG_DATA_FIFO        0x24
> +#define TPM_TIS_I2C_REG_INTF_CAPABILITY  0x30
> +#define TPM_TIS_I2C_REG_DATA_CSUM_ENABLE 0x40
> +#define TPM_TIS_I2C_REG_DATA_CSUM_GET    0x44
> +#define TPM_TIS_I2C_REG_DID_VID          0x48
> +#define TPM_TIS_I2C_REG_RID              0x4c
> +#define TPM_TIS_I2C_REG_UNKNOWN          0xff
> +
> +/* Operations */
> +#define OP_SEND   1
> +#define OP_RECV   2
> +
> +typedef struct TPMStateI2C {
> +    /*< private >*/
> +    I2CSlave parent_obj;
> +
> +    int      offset;     /* offset in to data[] */
> +    int      size;       /* Size of the current reg data */
> +    uint8_t  operation;  /* OP_SEND & OP_RECV */
> +    uint8_t  data[4096]; /* Data */
> +
> +    /*< public >*/
> +    TPMState state; /* not a QOM object */
> +
> +} TPMStateI2C;
> +
> +DECLARE_INSTANCE_CHECKER(TPMStateI2C, TPM_TIS_I2C,
> +                         TYPE_TPM_TIS_I2C)
> +
> +static const VMStateDescription vmstate_tpm_tis_i2c = {
> +    .name = "tpm",
> +    .unmigratable = 1,

Is this just temporary? You offset + size + operation and data would have to be written out plus probably all the regular tis fields.

> +};
> +
> +/* Register map */
> +typedef struct reg_map {
> +    uint16_t  i2c_reg;    /* I2C register */
> +    uint16_t  tis_reg;    /* TIS register */
> +    uint32_t  data_size;  /* data size expected */
> +} i2c_reg_map;
> +
> +#define TPM_I2C_MAP_COUNT 11
> +
> +/*
> + * The register values in the common code is different than the latest
> + * register numbers as per the spec hence add the conversion map
> + */
> +i2c_reg_map tpm_tis_reg_map[] = {

static const i2c_reg_map tpm_tis_reg

> +    { TPM_TIS_I2C_REG_LOC_SEL,          TPM_TIS_REG_ACCESS,           1, },
> +    { TPM_TIS_I2C_REG_ACCESS,           TPM_TIS_REG_ACCESS,           1, },
> +    { TPM_TIS_I2C_REG_INT_ENABLE,       TPM_TIS_REG_INT_ENABLE,       4, },
> +    { TPM_TIS_I2C_REG_INT_CAPABILITY,   TPM_TIS_REG_INT_VECTOR,       4, },
> +    { TPM_TIS_I2C_REG_STS,              TPM_TIS_REG_STS,              4, },
> +    { TPM_TIS_I2C_REG_DATA_FIFO,        TPM_TIS_REG_DATA_FIFO,        0, },
> +    { TPM_TIS_I2C_REG_INTF_CAPABILITY,  TPM_TIS_REG_INTF_CAPABILITY,  4, },
> +    { TPM_TIS_I2C_REG_DATA_CSUM_ENABLE, TPM_TIS_REG_DATA_CSUM_ENABLE, 1, },
> +    { TPM_TIS_I2C_REG_DATA_CSUM_GET,    TPM_TIS_REG_DATA_CSUM_GET,    2, },
> +    { TPM_TIS_I2C_REG_DID_VID,          TPM_TIS_REG_DID_VID,          4, },
> +    { TPM_TIS_I2C_REG_RID,              TPM_TIS_REG_RID,              1, },
> +};
> +
> +static inline uint16_t tpm_tis_i2c_to_tis_reg(uint64_t i2c_reg, int *size)
> +{
> +    uint16_t tis_reg = TPM_TIS_I2C_REG_UNKNOWN;
> +    i2c_reg_map *reg_map;
> +    int i;
> +
> +    for (i = 0; i < TPM_I2C_MAP_COUNT; i++) {

..; i < ARRAY_SIZE(tpm_tis_reg_map); ...

Then you can drop TPM_I2c_MAP_COUNT.

> +        reg_map = &tpm_tis_reg_map[i];
> +        if (reg_map->i2c_reg == i2c_reg) {
> +            tis_reg = reg_map->tis_reg;
> +            *size = reg_map->data_size;
> +            break;
> +        }
> +    }
> +
> +    assert(tis_reg != TPM_TIS_I2C_REG_UNKNOWN);
> +    return tis_reg;
> +}
> +
> +/* Initialize the cached data */
> +static inline void tpm_tis_i2c_init_cache(TPMStateI2C *i2cst)
> +{
> +    /* Clear operation and offset */
> +    i2cst->operation = 0;
> +    i2cst->offset = 0;
> +    i2cst->size = 0;
> +
> +    return;
> +}
> +
> +/* Send data to TPM */
> +static inline void tpm_tis_i2c_tpm_send(TPMStateI2C *i2cst)
> +{
> +    if ((i2cst->operation == OP_SEND) && (i2cst->offset > 1)) {
> +        uint16_t tis_reg;
> +        uint32_t data;
> +        int      i;
You can move those 3 variable decls outside the if statement.

> +
> +        tis_reg = tpm_tis_i2c_to_tis_reg(i2cst->data[0], &i2cst->size);
> +
> +        /* Index 0 is always a register */
> +        for (i = 1; i < i2cst->offset; i++) {
> +            data = (i2cst->data[i] & 0xff);


' & 0xff' shouldn't be necessary since data is unsigned byte.

> +            tpm_tis_write_data(&i2cst->state, tis_reg, data, 1);
> +        }
> +
> +        tpm_tis_i2c_init_cache(i2cst);
> +> +    }> +    return;
> +}
> +
> +/* Callback from TPM to indicate that response is copied */
> +static void tpm_tis_i2c_request_completed(TPMIf *ti, int ret)
> +{
> +    TPMStateI2C *i2cst = TPM_TIS_I2C(ti);
> +    TPMState *s = &i2cst->state;
> +
> +    /* Inform the common code. */
> +    tpm_tis_request_completed(s, ret);
> +}
> +
> +static enum TPMVersion tpm_tis_i2c_get_tpm_version(TPMIf *ti)
> +{
> +    TPMStateI2C *i2cst = TPM_TIS_I2C(ti);
> +    TPMState *s = &i2cst->state;
> +
> +    return tpm_tis_get_tpm_version(s);
> +}
> +
> +static int tpm_tis_i2c_event(I2CSlave *i2c, enum i2c_event event)
> +{
> +    TPMStateI2C *i2cst = TPM_TIS_I2C(i2c);
> +    int ret = 0;
> +
> +    switch (event) {
> +    case I2C_START_RECV:
> +        break;
> +    case I2C_START_SEND:
> +        tpm_tis_i2c_init_cache(i2cst);
> +        break;
> +    case I2C_FINISH:
> +        if (i2cst->operation == OP_SEND) {
> +            tpm_tis_i2c_tpm_send(i2cst);
> +        } else {
> +            tpm_tis_i2c_init_cache(i2cst);
> +        }
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    return ret;
> +}
> +
> +/* If data is for FIFO then it is received from tpm_tis_common buffer
> + * otherwise it will be handled using single call to common code and
> + * cached in the local buffer.
> + */
> +static uint8_t tpm_tis_i2c_recv(I2CSlave *i2c)
> +{
> +    int ret = 0;
> +    int i, j;
> +    uint32_t addr;
> +    uint32_t data_read;
> +    uint16_t i2c_reg;
> +    TPMStateI2C *i2cst = TPM_TIS_I2C(i2c);
> +    TPMState *s = &i2cst->state;
> +
> +    if (i2cst->operation == OP_RECV) {
> +
> +        /* Special handling for FIFO */
> +        if (i2cst->data[0] == TPM_TIS_I2C_REG_DATA_FIFO) {
> +            i2c_reg = i2cst->data[0];
> +            addr = tpm_tis_i2c_to_tis_reg(i2c_reg, &i2cst->size);

why not just use TPM_TIS_I2C_REG_DATA_FIFO ? no need for i2c_reg here...


> +            data_read = tpm_tis_read_data(s, addr, 1);
> +            ret = (data_read & 0xff);
> +        } else
> +            ret = i2cst->data[i2cst->offset++];

Do you need to check for access beyond the buffer here?

> +
> +    } else if ((i2cst->operation == OP_SEND) && (i2cst->offset < 2)) {
> +        i2c_reg = i2cst->data[0];
> +
> +        i2cst->operation = OP_RECV;
> +        i2cst->offset = 0;
> +
> +        addr = tpm_tis_i2c_to_tis_reg(i2c_reg, &i2cst->size);
> +
> +        /* Special handling for FIFO register */
> +        if (i2c_reg == TPM_TIS_I2C_REG_DATA_FIFO) {
> +            data_read = tpm_tis_read_data(s, addr, 1);
> +            ret = (data_read & 0xff);
> +        } else {
> +            /*
> +             * Save the data in the data field. Save it in the little
> +             * endian format.
> +             */
> +            for (i = 0; i < i2cst->size;) {
> +                data_read = tpm_tis_read_data(s, addr, 4);
> +                for (j = 0; j < 4; j++) {
> +                    i2cst->data[i++] = (data_read & 0xff);


Where do you ensure that you never write beyond the size of the data buffer?

> +                    data_read >>= 8;
> +                }
> +            }
> +
> +            /* Return first byte with this call */
> +            ret = i2cst->data[i2cst->offset++];

Same comment as above regarding access beyond boundaries.

> +        }
> +    } else
> +        i2cst->operation = OP_RECV;

I am surprised that the checkpatch tool didn't complain about it but afaik this else branch should alsoe have { } -- one more case above like this.

> +
> +    return ret;
> +}
> +
> +/*
> + * Send function only remembers data in the buffer and then calls
> + * TPM TIS common code during FINISH event.
> + */
> +static int tpm_tis_i2c_send(I2CSlave *i2c, uint8_t data)
> +{
> +    TPMStateI2C *i2cst = TPM_TIS_I2C(i2c);
> +
> +    /* Remember data locally */
> +    i2cst->operation = OP_SEND;
> +    i2cst->data[i2cst->offset++] = data;

Boundary check ?

> +
> +    return 0;
> +}
> +
> +static Property tpm_tis_i2c_properties[] = {
> +    DEFINE_PROP_UINT32("irq", TPMStateI2C, state.irq_num, TPM_TIS_IRQ),
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
> +    /* Get the backend pointer. It is not initialized propery during
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
> +}
> +
> +static void tpm_tis_i2c_reset(DeviceState *dev)
> +{
> +    TPMStateI2C *i2cst = TPM_TIS_I2C(dev);
> +    TPMState *s = &i2cst->state;
> +
> +    tpm_tis_i2c_init_cache(i2cst);
> +
> +    return tpm_tis_reset(s);
> +}
> +
> +static void tpm_tis_i2c_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
> +    TPMIfClass *tc = TPM_IF_CLASS(klass);
> +
> +    dc->realize = tpm_tis_i2c_realizefn;
> +    dc->reset = tpm_tis_i2c_reset;
> +    dc->vmsd = &vmstate_tpm_tis_i2c;
> +    device_class_set_props(dc, tpm_tis_i2c_properties);
> +
> +    k->event = tpm_tis_i2c_event;
> +    k->recv = tpm_tis_i2c_recv;
> +    k->send = tpm_tis_i2c_send;
> +
> +    tc->model = TPM_MODEL_TPM_TIS;
> +    tc->request_completed = tpm_tis_i2c_request_completed;
> +    tc->get_version = tpm_tis_i2c_get_tpm_version;
> +}
> +
> +static const TypeInfo tpm_tis_i2c_info = {
> +    .name          = TYPE_TPM_TIS_I2C,
> +    .parent        = TYPE_I2C_SLAVE,
> +    .instance_size = sizeof(TPMStateI2C),
> +    .class_init    = tpm_tis_i2c_class_init,
> +        .interfaces = (InterfaceInfo[]) {
> +        { TYPE_TPM_IF },
> +        { }
> +    }
> +};
> +
> +static void tpm_tis_i2c_register_types(void)
> +{
> +    type_register_static(&tpm_tis_i2c_info);
> +}
> +
> +type_init(tpm_tis_i2c_register_types)
> diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
> index fb40e30ff6..66e3b45f30 100644
> --- a/include/sysemu/tpm.h
> +++ b/include/sysemu/tpm.h
> @@ -48,6 +48,7 @@ struct TPMIfClass {
>   #define TYPE_TPM_TIS_SYSBUS         "tpm-tis-device"
>   #define TYPE_TPM_CRB                "tpm-crb"
>   #define TYPE_TPM_SPAPR              "tpm-spapr"
> +#define TYPE_TPM_TIS_I2C            "tpm-tis-i2c"
>   
>   #define TPM_IS_TIS_ISA(chr)                         \
>       object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_ISA)
> @@ -57,6 +58,8 @@ struct TPMIfClass {
>       object_dynamic_cast(OBJECT(chr), TYPE_TPM_CRB)
>   #define TPM_IS_SPAPR(chr)                           \
>       object_dynamic_cast(OBJECT(chr), TYPE_TPM_SPAPR)
> +#define TPM_IS_TIS_I2C(chr)                      \
> +    object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_I2C)
>   
>   /* returns NULL unless there is exactly one TPM device */
>   static inline TPMIf *tpm_find(void)

