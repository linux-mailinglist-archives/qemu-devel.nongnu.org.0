Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC816C84B5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 19:18:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pflzA-0007kP-RL; Fri, 24 Mar 2023 14:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pflz8-0007kH-Fc
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 14:17:54 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pflz3-0000FU-SJ
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 14:17:54 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32OIF2vp021109; Fri, 24 Mar 2023 18:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Mpw35U0A9JXh0Bmr+vAt3GK/A19o9SIn+0YJ+JjgOmQ=;
 b=mjPxhrLr8Me07lAXfcoaKkibrT4iJfSjTm775uS11gO6++CF1Gpi0A254Sb4qVqZEc+7
 gdc2op/EDEQSYXhJ3dvJa//9T4PfPOfinL2mqHcKsJLjmGWF7EZjUPyLVJUqTNUtBCi1
 MtB4DvSHdaBpxevfNrCIKX/ruM77Rh+2aRVzc5gKwqn9slDknCH5PiapZ+YkGZGsIskF
 MID2gt8YcAgkbVNUqPZirjg8I+2WaclEm64atEKwECNLIuAN8ki+BEBh9g1sY1Vt/Sz7
 VO6M/wC9xM1crrx+yKpMg0nFVIsw98xuoV+JXSEdKM9wW4Y2ft+8+X3I83FOpA/2zqhD Ow== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3phgyf01my-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Mar 2023 18:17:29 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32OICfUJ004457;
 Fri, 24 Mar 2023 18:17:28 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3pgy7dp6rd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Mar 2023 18:17:28 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32OIHRoA11469378
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Mar 2023 18:17:27 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDED558065;
 Fri, 24 Mar 2023 18:17:26 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C82E58067;
 Fri, 24 Mar 2023 18:17:26 +0000 (GMT)
Received: from [9.163.28.178] (unknown [9.163.28.178])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 24 Mar 2023 18:17:26 +0000 (GMT)
Message-ID: <02d122f7-96d9-11ef-f087-503c5f5a30ba@linux.vnet.ibm.com>
Date: Fri, 24 Mar 2023 13:17:25 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/3] New I2C: Add support for TPM devices over I2C bus
Content-Language: en-US
To: Stefan Berger <stefanb@linux.ibm.com>, Ninad Palsule
 <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au, clg@kaod.org
References: <20230324030251.2589040-1-ninad@linux.ibm.com>
 <20230324030251.2589040-4-ninad@linux.ibm.com>
 <520f9691-287f-ddcb-d89a-74f765e6b7ca@linux.ibm.com>
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <520f9691-287f-ddcb-d89a-74f765e6b7ca@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: z4e7186fNKW6D6elx040ahTTsNimCuy3
X-Proofpoint-ORIG-GUID: z4e7186fNKW6D6elx040ahTTsNimCuy3
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303240142
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

On 3/24/23 9:19 AM, Stefan Berger wrote:
>
>
> On 3/23/23 23:02, Ninad Palsule wrote:
>> Qemu already supports devices attached to ISA and sysbus. This drop adds
>> support for the I2C bus attached TPM devices. I2C model only supports
>> TPM2 protocol.
>>
>> This commit includes changes for the common code.
>> - Added I2C emulation model. Logic was added in the model to temporarily
>>    cache the data as I2C interface works per byte basis.
>> - New tpm type "tpm-tis-i2c" added for I2C support. User specify this
>>    string on command line.
>>
>> Testing:
>>    TPM I2C device modulte is tested using SWTPM (software based TPM
>>    package). The qemu used the rainier machine and it was connected to
>>    swtpm over the socket interface.
>
> I ported the ISA TIS tests to I2C and the great news is that almost 
> all tests,
> including those related to locality, are passing. There's one 
> exception, though,
> and that one is related to the checksum.
>
> With this patch applied:
>
> diff --git a/hw/tpm/tpm_tis_common.c b/hw/tpm/tpm_tis_common.c
> index 84f3e2259f..0a1878defd 100644
> --- a/hw/tpm/tpm_tis_common.c
> +++ b/hw/tpm/tpm_tis_common.c
> @@ -463,7 +463,10 @@ uint32_t tpm_tis_read_data(TPMState *s, hwaddr 
> addr, unsigned size)
>   */
>  uint16_t tpm_tis_get_checksum(TPMState *s, uint8_t locty)
>  {
> +    printf("GET CHECKSUM\n");
>      if (TPM_TIS_IS_VALID_LOCTY(locty) && (s->active_locty == locty)) {
> +        fprintf(stderr, "Checksum over %d bytes: 0x%x\n", 
> s->rw_offset, crc_ccitt(0, (const uint8_t*)"1122334455", 10));
> +        fprintf(stderr, "Checksum over %d bytes: 0x%x\n", 
> s->rw_offset, crc_ccitt(0, s->buffer, s->rw_offset));
>          return cpu_to_be16(crc_ccitt(0, s->buffer, s->rw_offset));
>      } else {
>          return 0;
>
> GET CHECKSUM
> Checksum over 12 bytes: 0x67d3
> Checksum over 12 bytes: 0x3367
>
> Following the I2C spec (6.5.12) the former should have 0xd367 and the 
> latter 0x6733 (case iv). So it's just twisted by either the
> API or the spec is wrong.
>
> But otherwise this is f(u/a)ntastic!
>
> Top-most patch is the test case: 
> https://github.com/stefanberger/qemu-tpm/commits/tpm-i2c.v3
>
Great. Thanks a lot!

I have made changes to use bswap16() function.

>>
>>    The command to start swtpm is as follows:
>>    $ swtpm socket --tpmstate dir=/tmp/mytpm1    \
>>                   --ctrl type=unixio,path=/tmp/mytpm1/swtpm-sock  \
>>                   --tpm2 --log level=100
>>
>>    The command to start qemu is as follows:
>>    $ qemu-system-arm -M rainier-bmc -nographic \
>>              -kernel ${IMAGEPATH}/fitImage-linux.bin \
>>              -dtb ${IMAGEPATH}/aspeed-bmc-ibm-rainier.dtb \
>>              -initrd 
>> ${IMAGEPATH}/obmc-phosphor-initramfs.rootfs.cpio.xz \
>>              -drive 
>> file=${IMAGEPATH}/obmc-phosphor-image.rootfs.wic.qcow2,if=sd,index=2 \
>>              -net nic -net 
>> user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443-:443 \
>>              -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
>>              -tpmdev emulator,id=tpm0,chardev=chrtpm \
>>              -device 
>> tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e
>>
>>    Note: Currently you need to specify the I2C bus and device address on
>>          command line. In future we can add a device at board level.
>>
>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>> ---
>> V2:
>> Incorporated Stephen's review comments.
>> - Handled checksum related register in I2C layer
>> - Defined I2C interface capabilities and return those instead of
>>    capabilities from TPM TIS. Add required capabilities from TIS.
>> - Do not cache FIFO data in the I2C layer.
>> - Make sure that Device address change register is not passed to I2C
>>    layer as capability indicate that it is not supported.
>> - Added boundary checks.
>> - Make sure that bits 26-31 are zeroed for the TPM_STS register on read
>> - Updated Kconfig files for new define.
>>
>> ---
>> V3:
>> - Moved processing of register TPM_I2C_LOC_SEL in the I2C. So I2C layer
>>    remembers the locality and pass it to TIS on each read/write.
>> - The write data is no more cached in the I2C layer so the buffer size
>>    is reduced to 16 bytes.
>> - Checksum registers are now managed by the I2C layer. Added new
>>    function in TIS layer to return the checksum and used that to process
>>    the request.
>> - Now 2-4 byte register value will be passed to TIS layer in a single
>>    write call instead of 1 byte at a time. Added functions to convert
>>    between little endian stream of bytes to single 32 bit unsigned
>>    integer. Similarly 32  bit integer to stream of bytes.
>> - Added restriction on device change register.
>> - Replace few if-else statement with switch statement for clarity.
>> - Log warning when unknown register is received.
>> - Moved all register definations to acpi/tmp.h
>> ---
>>   hw/arm/Kconfig       |   1 +
>>   hw/tpm/Kconfig       |   7 +
>>   hw/tpm/meson.build   |   1 +
>>   hw/tpm/tpm_tis_i2c.c | 513 +++++++++++++++++++++++++++++++++++++++++++
>>   include/sysemu/tpm.h |   3 +
>>   5 files changed, 525 insertions(+)
>>   create mode 100644 hw/tpm/tpm_tis_i2c.c
>>
>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>> index b5aed4aff5..05d6ef1a31 100644
>> --- a/hw/arm/Kconfig
>> +++ b/hw/arm/Kconfig
>> @@ -6,6 +6,7 @@ config ARM_VIRT
>>       imply VFIO_PLATFORM
>>       imply VFIO_XGMAC
>>       imply TPM_TIS_SYSBUS
>> +    imply TPM_TIS_I2C
>>       imply NVDIMM
>>       select ARM_GIC
>>       select ACPI
>> diff --git a/hw/tpm/Kconfig b/hw/tpm/Kconfig
>> index 29e82f3c92..a46663288c 100644
>> --- a/hw/tpm/Kconfig
>> +++ b/hw/tpm/Kconfig
>> @@ -1,3 +1,10 @@
>> +config TPM_TIS_I2C
>> +    bool
>> +    depends on TPM
>> +    select TPM_BACKEND
>> +    select I2C
>> +    select TPM_TIS
>> +
>>   config TPM_TIS_ISA
>>       bool
>>       depends on TPM && ISA_BUS
>> diff --git a/hw/tpm/meson.build b/hw/tpm/meson.build
>> index 7abc2d794a..76fe3cb098 100644
>> --- a/hw/tpm/meson.build
>> +++ b/hw/tpm/meson.build
>> @@ -1,6 +1,7 @@
>>   softmmu_ss.add(when: 'CONFIG_TPM_TIS', if_true: 
>> files('tpm_tis_common.c'))
>>   softmmu_ss.add(when: 'CONFIG_TPM_TIS_ISA', if_true: 
>> files('tpm_tis_isa.c'))
>>   softmmu_ss.add(when: 'CONFIG_TPM_TIS_SYSBUS', if_true: 
>> files('tpm_tis_sysbus.c'))
>> +softmmu_ss.add(when: 'CONFIG_TPM_TIS_I2C', if_true: 
>> files('tpm_tis_i2c.c'))
>>   softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
>>   softmmu_ss.add(when: 'CONFIG_TPM_TIS', if_true: files('tpm_ppi.c'))
>>   softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_ppi.c'))
>> diff --git a/hw/tpm/tpm_tis_i2c.c b/hw/tpm/tpm_tis_i2c.c
>> new file mode 100644
>> index 0000000000..4f67c28111
>> --- /dev/null
>> +++ b/hw/tpm/tpm_tis_i2c.c
>> @@ -0,0 +1,513 @@
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
>> +#include "hw/qdev-properties.h"
>> +#include "hw/acpi/tpm.h"
>> +#include "migration/vmstate.h"
>> +#include "tpm_prop.h"
>> +#include "tpm_tis.h"
>> +#include "qom/object.h"
>> +#include "block/aio.h"
>> +#include "qemu/main-loop.h"
>> +#include "qemu/log.h"
>> +
>> +/* TPM_STS mask for read bits 31:26 must be zero */
>> +#define TPM_I2C_STS_READ_MASK          0x03ffffff
>> +
>> +/* Operations */
>> +#define OP_SEND   1
>> +#define OP_RECV   2
>> +
>> +typedef struct TPMStateI2C {
>> +    /*< private >*/
>> +    I2CSlave parent_obj;
>> +
>> +    int      offset;     /* offset in to data[] */
>> +    int      size;       /* Size of the current reg data */
>> +    uint8_t  operation;  /* OP_SEND & OP_RECV */
>> +    uint8_t  data[16];   /* Data */
>
> Do you need 16 bytes of data ?  I thought that 1+4 bytes should be 
> enough.
>
good point, I changed it to 5 bytes.
>> +
>> +    uint8_t  locality;      /* Current locality */
>> +
>> +    bool     checksum_enable;
>
> This should be a uint8_t csum_enable and become part of the saved 
> state of this device.

Done.

>
>> +    uint32_t tis_intf_cap;  /* save TIS interface Capabilities */
>> +
>> +    /*< public >*/
>> +    TPMState state; /* not a QOM object */
>> +
>> +} TPMStateI2C;
>> +
>> +DECLARE_INSTANCE_CHECKER(TPMStateI2C, TPM_TIS_I2C,
>> +                         TYPE_TPM_TIS_I2C)
>> +
>> +/* Register map */
>> +typedef struct regMap {
>> +    uint16_t  i2c_reg;    /* I2C register */
>> +    uint16_t  tis_reg;    /* TIS register */
>> +    uint32_t  data_size;  /* data size expected */
>> +} i2cRegMap;
>> +
>> +/*
>> + * The register values in the common code is different than the latest
>> + * register numbers as per the spec hence add the conversion map
>> + */
>> +static const i2cRegMap tpm_tis_reg_map[] = {
>> +    /* These registers are sent to TIS layer */
>> +    { TPM_TIS_I2C_REG_ACCESS, TPM_TIS_REG_ACCESS,               1, },
>> +    { TPM_TIS_I2C_REG_INT_ENABLE, TPM_TIS_REG_INT_ENABLE,           
>> 4, },
>> +    { TPM_TIS_I2C_REG_INT_CAPABILITY, 
>> TPM_TIS_REG_INT_VECTOR,           4, },
>> +    { TPM_TIS_I2C_REG_STS, TPM_TIS_REG_STS,                  4, },
>> +    { TPM_TIS_I2C_REG_DATA_FIFO, TPM_TIS_REG_DATA_FIFO,            
>> 0, },
>> +    { TPM_TIS_I2C_REG_INTF_CAPABILITY, 
>> TPM_TIS_REG_INTF_CAPABILITY,      4, },
>> +    { TPM_TIS_I2C_REG_DID_VID, TPM_TIS_REG_DID_VID,              4, },
>> +    { TPM_TIS_I2C_REG_RID, TPM_TIS_REG_RID,                  1, },
>> +
>> +    /* These registers are handled in I2C layer */
>> +    { TPM_TIS_I2C_REG_LOC_SEL, TPM_TIS_I2C_REG_LOC_SEL,          1, },
>> +    { TPM_TIS_I2C_REG_I2C_DEV_ADDRESS, 
>> TPM_TIS_I2C_REG_I2C_DEV_ADDRESS,  2, },
>> +    { TPM_TIS_I2C_REG_DATA_CSUM_ENABLE, 
>> TPM_TIS_I2C_REG_DATA_CSUM_ENABLE, 1, },
>> +    { TPM_TIS_I2C_REG_DATA_CSUM_GET, 
>> TPM_TIS_I2C_REG_DATA_CSUM_GET,    2, },
>
> Are these still needed? They should not be needed if you switches are 
> complete.


OK, I have moved the last set to switch and removed it from here.


>> +};
>> +
>> +/*
>> + * Generate interface capability based on what is returned by TIS 
>> and what is
>> + * expected by I2C. Save the capability in the data array 
>> overwriting the TIS
>> + * capability.
>> + */
>> +static uint32_t tpm_i2c_interface_capability(TPMStateI2C *i2cst,
>> +                                             uint32_t tis_cap)
>> +{
>> +    uint32_t i2c_cap = 0;
>> +
>> +    i2cst->tis_intf_cap = tis_cap;
>> +
>> +    /* Now generate i2c capability */
>> +    i2c_cap = (TPM_I2C_CAP_INTERFACE_TYPE |
>> +               TPM_I2C_CAP_INTERFACE_VER  |
>> +               TPM_I2C_CAP_TPM2_FAMILY    |
>> +               TPM_I2C_CAP_LOCALITY_CAP   |
>> +               TPM_I2C_CAP_BUS_SPEED      |
>> +               TPM_I2C_CAP_DEV_ADDR_CHANGE);
>> +
>> +    /* Now check the TIS and set some capabilities */
>> +
>> +    /* Static burst count set */
>> +    if (i2cst->tis_intf_cap & TPM_TIS_CAP_BURST_COUNT_STATIC) {
>> +        i2c_cap |= TPM_I2C_CAP_BURST_COUNT_STATIC;
>> +    }
>> +
>> +    return i2c_cap;
>> +}
>> +
>> +static inline uint16_t tpm_tis_i2c_to_tis_reg(TPMStateI2C *i2cst, 
>> int *size)
>> +{
>> +    uint16_t tis_reg = 0xffff;
>> +    const i2cRegMap *reg_map;
>> +    int i;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(tpm_tis_reg_map); i++) {
>> +        reg_map = &tpm_tis_reg_map[i];
>> +        if (reg_map->i2c_reg == (i2cst->data[0] & 0xff)) {
>> +            tis_reg = reg_map->tis_reg;
>> +            *size = reg_map->data_size;
>> +            break;
>> +        }
>> +    }
>> +
>> +    if (tis_reg == 0xffff) {
>> +        qemu_log_mask(LOG_UNIMP, "%s: Could not convert i2c 
>> register: 0x%X\n",
>> +                      __func__, i2cst->data[0]);
>> +    }
>> +
>> +    /* Include the locality in the address. */
>> +    if (i2cst->locality != TPM_TIS_NO_LOCALITY) {
>> +        tis_reg += (i2cst->locality << TPM_TIS_LOCALITY_SHIFT);
>> +    }
>> +
>> +    return tis_reg;
>> +}
>> +
>> +/* Clear some fields from the structure. */
>> +static inline void tpm_tis_i2c_clear_data(TPMStateI2C *i2cst)
>> +{
>> +    /* Clear operation and offset */
>> +    i2cst->operation = 0;
>> +    i2cst->offset = 0;
>> +    i2cst->size = 0;
>> +
>> +    return;
>> +}
>> +
>> +/* Find endianness */
>> +static inline bool tpm_i2c_is_little_endian(void)
>> +{
>> +    uint32_t val = 1;
>> +    char     *ch = (char *)&val;
>> +
>> +    return (uint32_t)*ch;
>> +}
>> +
>> +/*
>> + * Convert uint32 to stream of bytes in little endian format.
>> + */
>> +static inline void tpm_i2c_uint_to_le_bytes(TPMStateI2C *i2cst, 
>> uint32_t data)
>> +{
>> +    int      i;
>> +
>> +    /* Index 0 is register so do not thouch it. */
>> +    if (tpm_i2c_is_little_endian()) {
>> +        for (i = 1; i <= 4; i++) {
>> +            i2cst->data[i] = (data & 0xff);
>> +            data >>= 8;
>> +        }
>> +    } else {
>> +        for (i = 4; i > 0; i--) {
>> +            i2cst->data[i] = (data & 0xff);
>> +            data >>= 8;
>> +        }
>> +    > +}> +
>> +/*
>> + * Convert little endian byte stream into local formated
>> + * unsigned integer
>> + */
>> +static inline uint32_t tpm_i2c_le_bytes_to_uint(TPMStateI2C *i2cst)
>> +{
>> +    uint32_t data = 0;
>> +    int      i;
>> +
>> +    assert(i2cst->offset <= 5);  /* Including 0th register value */
>> +
>> +    if (tpm_i2c_is_little_endian()) {
>> +        for (i = 1; i < i2cst->offset; i++) {
>> +            data |= (((uint32_t)i2cst->data[i]) << (8 * (i - 1)));
>> +        }
>> +    } else {
>> +        for (i = 1; i < i2cst->offset; i++) {
>> +            data <<= 8;
>> +            data |= i2cst->data[i];
>> +        }
>> +    }
>> +
>> +    return data;
>> +}
>
>
> This shouldn't be necessary.

I have incorporated your suggestions and removed these functions.

>
>
>> +
>> +/* Send data to TPM */
>> +static inline void tpm_tis_i2c_tpm_send(TPMStateI2C *i2cst)
>> +{
>> +    uint16_t tis_reg;
>> +    uint32_t data;
>> +
>> +    if ((i2cst->operation == OP_SEND) && (i2cst->offset > 1)) {
>> +
>> +        switch (i2cst->data[0]) {
>> +        case TPM_TIS_I2C_REG_DATA_CSUM_ENABLE:
>> +            /*
>> +             * Checksum is not handled by TIS code hence we will 
>> consume the
>> +             * register here.
>> +             */
>> +            i2cst->checksum_enable = true;
>> +            break;
>> +        case TPM_TIS_I2C_REG_DATA_FIFO:
>> +            /* Handled in the main i2c_send function */
>> +            break;
>> +        case TPM_TIS_I2C_REG_LOC_SEL:
>> +            /*
>> +             * This register is not handled by TIS so save the locality
>> +             * locally
>> +             */
>> +            i2cst->locality = i2cst->data[1];
>> +            break;
>> +        default:
>> +            /* We handle non-FIFO here */
>> +            tis_reg = tpm_tis_i2c_to_tis_reg(i2cst, &i2cst->size);
>> +
>> +            /* Index 0 is always a register. Convert string to 
>> uint32_t. */
>> +            data = tpm_i2c_le_bytes_to_uint(i2cst);
>> +
>> +            tpm_tis_write_data(&i2cst->state, tis_reg, data, 4);
>> +            break;
>> +        }
>> +
>> +        tpm_tis_i2c_clear_data(i2cst);
>> +    }
>> +
>> +    return;
>> +}
>> +
>> +/* Callback from TPM to indicate that response is copied */
>> +static void tpm_tis_i2c_request_completed(TPMIf *ti, int ret)
>> +{
>> +    TPMStateI2C *i2cst = TPM_TIS_I2C(ti);
>> +    TPMState *s = &i2cst->state;
>> +
>> +    /* Inform the common code. */
>> +    tpm_tis_request_completed(s, ret);
>> +}
>> +
>> +static enum TPMVersion tpm_tis_i2c_get_tpm_version(TPMIf *ti)
>> +{
>> +    TPMStateI2C *i2cst = TPM_TIS_I2C(ti);
>> +    TPMState *s = &i2cst->state;
>> +
>> +    return tpm_tis_get_tpm_version(s);
>> +}
>> +
>> +static int tpm_tis_i2c_event(I2CSlave *i2c, enum i2c_event event)
>> +{
>> +    TPMStateI2C *i2cst = TPM_TIS_I2C(i2c);
>> +    int ret = 0;
>> +
>> +    switch (event) {
>> +    case I2C_START_RECV:
>> +        break;
>> +    case I2C_START_SEND:
>> +        tpm_tis_i2c_clear_data(i2cst);
>> +        break;
>> +    case I2C_FINISH:
>> +        if (i2cst->operation == OP_SEND) {
>> +            tpm_tis_i2c_tpm_send(i2cst);
>> +        } else {
>> +            tpm_tis_i2c_clear_data(i2cst);
>> +        }
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +/*
>> + * If data is for FIFO then it is received from tpm_tis_common buffer
>> + * otherwise it will be handled using single call to common code and
>> + * cached in the local buffer.
>> + */
>> +static uint8_t tpm_tis_i2c_recv(I2CSlave *i2c)
>> +{
>> +    int          ret = 0;
>> +    uint32_t     addr;
>> +    uint32_t     data_read;
>> +    TPMStateI2C *i2cst = TPM_TIS_I2C(i2c);
>> +    TPMState    *s = &i2cst->state;
>> +    uint16_t     i2c_reg = i2cst->data[0];
>
> Is the i2cst->offset guaranteed to be > 0 when you get into this 
> function?

If we come to this function first time after SEND then we will return 
data[1] and set the offset to 2 and we also set operation to recv.

Then next time the offset will be 2 or more.

>
>> +
>> +    /* Convert I2C register to TIS register */
>> +    addr = tpm_tis_i2c_to_tis_reg(i2cst, &i2cst->size);
>> +    if (addr == 0xffff) {
>> +        return 0;
>> +    }
>> +
>> +    if (i2cst->operation == OP_RECV) {
>> +
>> +        /* Do not cache FIFO data. */
>> +        if (i2cst->data[0] == TPM_TIS_I2C_REG_DATA_FIFO) {
>> +            data_read = tpm_tis_read_data(s, addr, 1);
>> +            ret = (data_read & 0xff);
>> +        } else if (sizeof(i2cst->data)) {
>> +            ret = i2cst->data[i2cst->offset++];
>> +        }
>> +
>> +    } else if ((i2cst->operation == OP_SEND) && (i2cst->offset < 2)) {
>> +        /* First receive call after send */
>> +
>> +        i2cst->operation = OP_RECV;
>> +
>> +        switch (i2c_reg) {
>> +        case TPM_TIS_I2C_REG_LOC_SEL:
>> +            /* Location selection register is managed by i2c */
>> +            i2cst->data[1] = i2cst->locality;
>> +            break;
>> +        case TPM_TIS_I2C_REG_DATA_FIFO:
>> +            /* FIFO data is directly read from TPM TIS */
>> +            data_read = tpm_tis_read_data(s, addr, 1);
>> +            i2cst->data[1] = (data_read & 0xff);
>> +            break;
>> +        case TPM_TIS_I2C_REG_DATA_CSUM_ENABLE:
>> +            i2cst->data[1] = i2cst->checksum_enable;
>> +            break;
>> +        case TPM_TIS_I2C_REG_DATA_CSUM_GET:
>> +            /*
>> +             * Checksum registers are not supported by common code 
>> hence
>> +             * call a common code to get the checksum.
>> +             */
>> +            data_read = tpm_tis_get_checksum(s, i2cst->locality);
>> +            /*
>> +             * Save the data in little endian byte stream in the data
>> +             * field.
>> +             */
>
> This should be along the lines of the following for any processor if 
> data_read is 'native' at this point:
>
> i2cst->data[1] = data_read;
> i2cst->data[2] = data_read >> 8;
>
Done
>
>> + tpm_i2c_uint_to_le_bytes(i2cst, data_read);
>> +            break;
>> +        default:
>> +            data_read = tpm_tis_read_data(s, addr, 4);
>> +
>> +            if (i2c_reg == TPM_TIS_I2C_REG_INTF_CAPABILITY) {
>> +                /* Prepare the capabilities as per I2C interface */
>> +                data_read = tpm_i2c_interface_capability(i2cst,
>> + data_read);
>> +            } else if (i2c_reg == TPM_TIS_I2C_REG_STS) {
>> +                /*
>> +                 * As per specs, STS bit 31:26 are reserved and must
>> +                 * be set to 0
>> +                 */
>> +                data_read &= TPM_I2C_STS_READ_MASK;
>> +            }
>> +            /*
>> +             * Save the data in little endian byte stream in the data
>> +             * field.
>> +             */
>> +            tpm_i2c_uint_to_le_bytes(i2cst, data_read);
>> +            break;
>> +        }
>> +
>> +
>> +        /* Return first byte with this call */
>> +        i2cst->offset = 1; /* keep the register value intact for 
>> debug */
>> +        ret = i2cst->data[i2cst->offset++];
>> +    } else {
>> +        i2cst->operation = OP_RECV;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +/*
>> + * Send function only remembers data in the buffer and then calls
>> + * TPM TIS common code during FINISH event.
>> + */
>> +static int tpm_tis_i2c_send(I2CSlave *i2c, uint8_t data)
>> +{
>> +    TPMStateI2C *i2cst = TPM_TIS_I2C(i2c);
>> +    uint16_t tis_reg;
>> +
>> +    /* Reject non-supported registers. */
>> +    if (i2cst->offset == 0) {
>> +        /* We do not support device address change */
>> +        if (data == TPM_TIS_I2C_REG_I2C_DEV_ADDRESS) {
>> +            qemu_log_mask(LOG_UNIMP, "%s: Device address change "
>> +                          "is not supported.\n", __func__);
>> +            return 1;
>> +        }
>> +    }
>> +
>> +    if (sizeof(i2cst->data)) {
>> +        i2cst->operation = OP_SEND;
>> +
>> +        /* Remember data locally for non-FIFO registers */
>> +        if ((i2cst->offset == 0) ||
>> +            (i2cst->data[0] != TPM_TIS_I2C_REG_DATA_FIFO)) {
>> +            i2cst->data[i2cst->offset++] = data;
>> +        } else {
>> +            tis_reg = tpm_tis_i2c_to_tis_reg(i2cst, &i2cst->size);
>> +            tpm_tis_write_data(&i2cst->state, tis_reg, data, 1);
>> +        }
>> +
>> +        return 0;
>> +
>> +    } else {
>> +        /* Return non-zero to indicate NAK */
>> +        return 1;
>> +    }
>> +}
>> +
>> +static Property tpm_tis_i2c_properties[] = {
>> +    DEFINE_PROP_UINT32("irq", TPMStateI2C, state.irq_num, TPM_TIS_IRQ),
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
>> +}
>> +
>> +static void tpm_tis_i2c_reset(DeviceState *dev)
>> +{
>> +    TPMStateI2C *i2cst = TPM_TIS_I2C(dev);
>> +    TPMState *s = &i2cst->state;
>> +
>> +    tpm_tis_i2c_clear_data(i2cst);
>> +
>> +    i2cst->checksum_enable = false;
>> +    i2cst->locality = TPM_TIS_NO_LOCALITY;
>> +
>> +    return tpm_tis_reset(s);
>> +}
>> +
>> +static void tpm_tis_i2c_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
>> +    TPMIfClass *tc = TPM_IF_CLASS(klass);
>> +
>> +    dc->realize = tpm_tis_i2c_realizefn;
>> +    dc->reset = tpm_tis_i2c_reset;
>> +    device_class_set_props(dc, tpm_tis_i2c_properties);
>> +
>> +    k->event = tpm_tis_i2c_event;
>> +    k->recv = tpm_tis_i2c_recv;
>> +    k->send = tpm_tis_i2c_send;
>> +
>> +    tc->model = TPM_MODEL_TPM_TIS;
>> +    tc->request_completed = tpm_tis_i2c_request_completed;
>> +    tc->get_version = tpm_tis_i2c_get_tpm_version;
>> +}
>> +
>> +static const TypeInfo tpm_tis_i2c_info = {
>> +    .name          = TYPE_TPM_TIS_I2C,
>> +    .parent        = TYPE_I2C_SLAVE,
>> +    .instance_size = sizeof(TPMStateI2C),
>> +    .class_init    = tpm_tis_i2c_class_init,
>> +        .interfaces = (InterfaceInfo[]) {
>> +        { TYPE_TPM_IF },
>> +        { }
>> +    }
>> +};
>> +
>> +static void tpm_tis_i2c_register_types(void)
>> +{
>> +    type_register_static(&tpm_tis_i2c_info);
>> +}
>> +
>> +type_init(tpm_tis_i2c_register_types)
>> diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
>> index fb40e30ff6..66e3b45f30 100644
>> --- a/include/sysemu/tpm.h
>> +++ b/include/sysemu/tpm.h
>> @@ -48,6 +48,7 @@ struct TPMIfClass {
>>   #define TYPE_TPM_TIS_SYSBUS         "tpm-tis-device"
>>   #define TYPE_TPM_CRB                "tpm-crb"
>>   #define TYPE_TPM_SPAPR              "tpm-spapr"
>> +#define TYPE_TPM_TIS_I2C            "tpm-tis-i2c"
>>     #define TPM_IS_TIS_ISA(chr)                         \
>>       object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_ISA)
>> @@ -57,6 +58,8 @@ struct TPMIfClass {
>>       object_dynamic_cast(OBJECT(chr), TYPE_TPM_CRB)
>>   #define TPM_IS_SPAPR(chr)                           \
>>       object_dynamic_cast(OBJECT(chr), TYPE_TPM_SPAPR)
>> +#define TPM_IS_TIS_I2C(chr)                      \
>> +    object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_I2C)
>>     /* returns NULL unless there is exactly one TPM device */
>>   static inline TPMIf *tpm_find(void)

