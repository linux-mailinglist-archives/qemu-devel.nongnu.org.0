Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC766C7E42
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 13:47:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfck9-0007QP-8Y; Fri, 24 Mar 2023 04:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pfck1-0007OM-2U
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 04:25:41 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pfces-0003U9-AU
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 04:25:40 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.239])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 50D3A212A6;
 Fri, 24 Mar 2023 08:06:29 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 24 Mar
 2023 09:06:28 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004b7f3ca73-7c8f-44d1-b6f8-1942ecdab997,
 B643924C3F00DACC24514BA3944A1F2687FE8C81) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <13fe285f-7a83-401f-a75b-6538c1d57156@kaod.org>
Date: Fri, 24 Mar 2023 09:06:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/3] New I2C: Add support for TPM devices over I2C bus
Content-Language: en-US
To: Ninad Palsule <ninad@linux.vnet.ibm.com>, Ninad Palsule
 <ninad@linux.ibm.com>, <qemu-devel@nongnu.org>
CC: <joel@jms.id.au>, <andrew@aj.id.au>, <stefanb@linux.ibm.com>
References: <20230323030119.2113570-1-ninad@linux.ibm.com>
 <20230323030119.2113570-4-ninad@linux.ibm.com>
 <782dd2bd-7804-70a6-f3c4-f771abdcc15c@kaod.org>
 <c77c972c-03cb-7b5b-a6b1-97a1d774c255@linux.vnet.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <c77c972c-03cb-7b5b-a6b1-97a1d774c255@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 174f72f9-331f-4d37-adad-5c11fe5c3935
X-Ovh-Tracer-Id: 6486309366355102502
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeghedgudduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvdeigfdvlefghfdtheehvdegjeejtdejueffledvteeggeegteektddufeefteffnecuffhomhgrihhnpehophgvnhgsmhgtrdhorhhgpdhkvghrnhgvlhdrohhrghdpthhruhhsthgvuggtohhmphhuthhinhhgghhrohhuphdrohhrghenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepnhhinhgrugeslhhinhhugidrvhhnvghtrdhisghmrdgtohhmpdhnihhnrggusehlihhnuhigrdhisghmrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhjohgvlhesjhhmshdrihgurdgruhdprghnughrvgifsegrjhdrihgurdgruhdpshhtvghfrghnsgeslhhinhhugidrihgsmhdrtghomhdpoffvte
 fjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On 3/23/23 23:32, Ninad Palsule wrote:
> 
> On 3/23/23 3:37 AM, Cédric Le Goater wrote:
>> On 3/23/23 04:01, Ninad Palsule wrote:
>>> Qemu already supports devices attached to ISA and sysbus. This drop adds
>>> support for the I2C bus attached TPM devices. I2C model only supports
>>> TPM2 protocol.
>>>
>>> This commit includes changes for the common code.
>>> - Added I2C emulation model. Logic was added in the model to temporarily
>>>    cache the data as I2C interface works per byte basis.
>>> - New tpm type "tpm-tis-i2c" added for I2C support. User specify this
>>>    string on command line.
>>>
>>> Testing:
>>>    TPM I2C device modulte is tested using SWTPM (software based TPM
>>>    package). The qemu used the rainier machine and it was connected to
>>>    swtpm over the socket interface.
>>>
>>>    The command to start swtpm is as follows:
>>>    $ swtpm socket --tpmstate dir=/tmp/mytpm1    \
>>>                   --ctrl type=unixio,path=/tmp/mytpm1/swtpm-sock  \
>>>                   --tpm2 --log level=100
>>>
>>>    The command to start qemu is as follows:
>>>    $ qemu-system-arm -M rainier-bmc -nographic \
>>>              -kernel ${IMAGEPATH}/fitImage-linux.bin \
>>>              -dtb ${IMAGEPATH}/aspeed-bmc-ibm-rainier.dtb \
>>>              -initrd ${IMAGEPATH}/obmc-phosphor-initramfs.rootfs.cpio.xz \
>>>              -drive file=${IMAGEPATH}/obmc-phosphor-image.rootfs.wic.qcow2,if=sd,index=2 \
>>>              -net nic -net user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443-:443 \
>>>              -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
>>>              -tpmdev emulator,id=tpm0,chardev=chrtpm \
>>>              -device tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e
>>>
>>>    Note: Currently you need to specify the I2C bus and device address on
>>>          command line. In future we can add a device at board level.
>>
>> yes. Anyhow, it is better to start with user created device first than with
>> default devices created at the board level.
> 
> 
> I could not find the  arch/arm/boot/dts/aspeed-ast2600-evb.dtb in https://jenkins.openbmc.org/job/ci-openbmc/lastSuccessfulBuild/ <https://jenkins.openbmc.org/job/ci-openbmc/lastSuccessfulBuild/>. Can you please point me to the location?


https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/aspeed-ast2600-evb.dts


> 
>>
>>>
>>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>>> ---
>>> V2:
>>> Incorporated Stephen's review comments.
>>> - Handled checksum related register in I2C layer
>>> - Defined I2C interface capabilities and return those instead of
>>>    capabilities from TPM TIS. Add required capabilities from TIS.
>>> - Do not cache FIFO data in the I2C layer.
>>> - Make sure that Device address change register is not passed to I2C
>>>    layer as capability indicate that it is not supported.
>>> - Added boundary checks.
>>> - Make sure that bits 26-31 are zeroed for the TPM_STS register on read
>>> - Updated Kconfig files for new define.
>>> ---
>>>   hw/arm/Kconfig       |   1 +
>>>   hw/tpm/Kconfig       |   7 +
>>>   hw/tpm/meson.build   |   1 +
>>>   hw/tpm/tpm_tis_i2c.c | 440 +++++++++++++++++++++++++++++++++++++++++++
>>>   include/sysemu/tpm.h |   3 +
>>>   5 files changed, 452 insertions(+)
>>>   create mode 100644 hw/tpm/tpm_tis_i2c.c
>>>
>>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>>> index b5aed4aff5..05d6ef1a31 100644
>>> --- a/hw/arm/Kconfig
>>> +++ b/hw/arm/Kconfig
>>> @@ -6,6 +6,7 @@ config ARM_VIRT
>>>       imply VFIO_PLATFORM
>>>       imply VFIO_XGMAC
>>>       imply TPM_TIS_SYSBUS
>>> +    imply TPM_TIS_I2C
>>>       imply NVDIMM
>>>       select ARM_GIC
>>>       select ACPI
>>> diff --git a/hw/tpm/Kconfig b/hw/tpm/Kconfig
>>> index 29e82f3c92..a46663288c 100644
>>> --- a/hw/tpm/Kconfig
>>> +++ b/hw/tpm/Kconfig
>>> @@ -1,3 +1,10 @@
>>> +config TPM_TIS_I2C
>>> +    bool
>>> +    depends on TPM
>>> +    select TPM_BACKEND
>>> +    select I2C
>>> +    select TPM_TIS
>>> +
>>>   config TPM_TIS_ISA
>>>       bool
>>>       depends on TPM && ISA_BUS
>>> diff --git a/hw/tpm/meson.build b/hw/tpm/meson.build
>>> index 7abc2d794a..76fe3cb098 100644
>>> --- a/hw/tpm/meson.build
>>> +++ b/hw/tpm/meson.build
>>> @@ -1,6 +1,7 @@
>>>   softmmu_ss.add(when: 'CONFIG_TPM_TIS', if_true: files('tpm_tis_common.c'))
>>>   softmmu_ss.add(when: 'CONFIG_TPM_TIS_ISA', if_true: files('tpm_tis_isa.c'))
>>>   softmmu_ss.add(when: 'CONFIG_TPM_TIS_SYSBUS', if_true: files('tpm_tis_sysbus.c'))
>>> +softmmu_ss.add(when: 'CONFIG_TPM_TIS_I2C', if_true: files('tpm_tis_i2c.c'))
>>>   softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
>>>   softmmu_ss.add(when: 'CONFIG_TPM_TIS', if_true: files('tpm_ppi.c'))
>>>   softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_ppi.c'))
>>> diff --git a/hw/tpm/tpm_tis_i2c.c b/hw/tpm/tpm_tis_i2c.c
>>> new file mode 100644
>>> index 0000000000..5cec5f7806
>>> --- /dev/null
>>> +++ b/hw/tpm/tpm_tis_i2c.c
>>> @@ -0,0 +1,440 @@
>>> +/*
>>> + * tpm_tis_i2c.c - QEMU's TPM TIS I2C Device
>>> + *
>>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>>> + * See the COPYING file in the top-level directory.
>>> + *
>>> + * Implementation of the TIS interface according to specs found at
>>> + * http://www.trustedcomputinggroup.org. This implementation currently
>>> + * supports version 1.3, 21 March 2013
>>> + * In the developers menu choose the PC Client section then find the TIS
>>> + * specification.
>>> + *
>>> + * TPM TIS for TPM 2 implementation following TCG PC Client Platform
>>> + * TPM Profile (PTP) Specification, Familiy 2.0, Revision 00.43
>>> + *
>>> + * TPM I2C implementation follows TCG TPM I2c Interface specification,
>>> + * Family 2.0, Level 00, Revision 1.00
>>> + */
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "hw/i2c/i2c.h"
>>> +#include "hw/qdev-properties.h"
>>> +#include "hw/acpi/tpm.h"
>>> +#include "migration/vmstate.h"
>>> +#include "tpm_prop.h"
>>> +#include "tpm_tis.h"
>>> +#include "qom/object.h"
>>> +#include "block/aio.h"
>>> +#include "qemu/main-loop.h"
>>> +
>>> +/* TPM TIS I2C registers */
>>> +#define TPM_TIS_I2C_REG_LOC_SEL          0x00
>>> +#define TPM_TIS_I2C_REG_ACCESS           0x04
>>> +#define TPM_TIS_I2C_REG_INT_ENABLE       0x08
>>> +#define TPM_TIS_I2C_REG_INT_CAPABILITY   0x14
>>> +#define TPM_TIS_I2C_REG_STS              0x18
>>> +#define TPM_TIS_I2C_REG_DATA_FIFO        0x24
>>> +#define TPM_TIS_I2C_REG_INTF_CAPABILITY  0x30
>>> +#define TPM_TIS_I2C_REG_I2C_DEV_ADDRESS  0x38
>>> +#define TPM_TIS_I2C_REG_DATA_CSUM_ENABLE 0x40
>>> +#define TPM_TIS_I2C_REG_DATA_CSUM_GET    0x44
>>> +#define TPM_TIS_I2C_REG_DID_VID          0x48
>>> +#define TPM_TIS_I2C_REG_RID              0x4c
>>> +#define TPM_TIS_I2C_REG_UNKNOWN          0xff
>>> +
>>> +/* I2C specific interface capabilities */
>>> +#define TPM_I2C_CAP_INTERFACE_TYPE     (0x2 << 0) /* FIFO interface */
>>> +#define TPM_I2C_CAP_INTERFACE_VER      (0x0 << 4) /* TCG I2C intf 1.0 */
>>> +#define TPM_I2C_CAP_TPM2_FAMILY        (0x1 << 7) /* TPM 2.0 family. */
>>> +#define TPM_I2C_CAP_DEV_ADDR_CHANGE    (0x0 << 27) /* No dev addr chng */
>>> +#define TPM_I2C_CAP_BURST_COUNT_STATIC (0x1 << 29) /* Burst count static */
>>> +#define TPM_I2C_CAP_LOCALITY_CAP       (0x1 << 25) /* 0-5 locality */
>>> +#define TPM_I2C_CAP_BUS_SPEED          (3   << 21) /* std and fast mode */
>>> +
>>> +/* TPM_STS mask for read bits 31:26 must be zero */
>>> +#define TPM_I2C_STS_READ_MASK          0x03ffffff
>>> +
>>> +/* Operations */
>>> +#define OP_SEND   1
>>> +#define OP_RECV   2
>>> +
>>> +typedef struct TPMStateI2C {
>>> +    /*< private >*/
>>> +    I2CSlave parent_obj;
>>> +
>>> +    int      offset;     /* offset in to data[] */
>>> +    int      size;       /* Size of the current reg data */
>>> +    uint8_t  operation;  /* OP_SEND & OP_RECV */
>>> +    uint8_t  data[4096]; /* Data */
>>
>> That's a lot of bytes. What is the max in HW ?
> I was initially caching whole page now I change the login on write so I change the value to 16.
>>
>>> +
>>> +    bool     csum_enable;
>>> +    uint32_t tis_intf_cap;  /* save TIS interface Capabilities */
>>> +
>>> +    /*< public >*/
>>> +    TPMState state; /* not a QOM object */
>>
>> hmm, why ? is that per design of the TPM model ?
>>
> Yes, That is required for the TPM model.
> 
> 
>>> +
>>> +} TPMStateI2C;
>>> +
>>> +DECLARE_INSTANCE_CHECKER(TPMStateI2C, TPM_TIS_I2C,
>>> +                         TYPE_TPM_TIS_I2C)
>>> +
>>> +/* Register map */
>>> +typedef struct reg_map {
>>> +    uint16_t  i2c_reg;    /* I2C register */
>>> +    uint16_t  tis_reg;    /* TIS register */
>>> +    uint32_t  data_size;  /* data size expected */
>>> +} i2c_reg_map;
>>
>> QEMU prefers CamelCase coding style for types.
> 
> 
> I changed reg_map to CamelCase.
> 
>>
>>> +
>>> +/*
>>> + * The register values in the common code is different than the latest
>>> + * register numbers as per the spec hence add the conversion map
>>> + */
>>> +static const i2c_reg_map tpm_tis_reg_map[] = {
>>> +    { TPM_TIS_I2C_REG_LOC_SEL, TPM_TIS_REG_ACCESS,               1, },
>>> +    { TPM_TIS_I2C_REG_ACCESS, TPM_TIS_REG_ACCESS,               1, },
>>> +    { TPM_TIS_I2C_REG_INT_ENABLE, TPM_TIS_REG_INT_ENABLE, 4, },
>>> +    { TPM_TIS_I2C_REG_INT_CAPABILITY, TPM_TIS_REG_INT_VECTOR,           4, },
>>> +    { TPM_TIS_I2C_REG_STS, TPM_TIS_REG_STS,                  4, },
>>> +    { TPM_TIS_I2C_REG_DATA_FIFO, TPM_TIS_REG_DATA_FIFO, 0, },
>>> +    { TPM_TIS_I2C_REG_INTF_CAPABILITY, TPM_TIS_REG_INTF_CAPABILITY,      4, },
>>> +    { TPM_TIS_I2C_REG_I2C_DEV_ADDRESS, TPM_TIS_I2C_REG_I2C_DEV_ADDRESS,  2, },
>>> +    { TPM_TIS_I2C_REG_DATA_CSUM_ENABLE, TPM_TIS_I2C_REG_DATA_CSUM_ENABLE, 1, },
>>> +    { TPM_TIS_I2C_REG_DATA_CSUM_GET, TPM_TIS_I2C_REG_DATA_CSUM_GET,    2, },
>>> +    { TPM_TIS_I2C_REG_DID_VID, TPM_TIS_REG_DID_VID,              4, },
>>> +    { TPM_TIS_I2C_REG_RID, TPM_TIS_REG_RID,                  1, },
>>> +};
>>> +
>>> +/* Generate interface capability based on what is returned by TIS and what is
>>> + * expected by I2C. Save the capability in the data array overwriting the TIS
>>> + * capability.
>>> + */
>>> +static uint32_t tpm_i2c_interface_capability(TPMStateI2C *i2cst, uint32_t tis_cap)
>>> +{
>>> +    uint32_t i2c_cap = 0;
>>> +
>>> +    i2cst->tis_intf_cap = tis_cap;
>>> +
>>> +    /* Now generate i2c capability */
>>> +    i2c_cap = (TPM_I2C_CAP_INTERFACE_TYPE |
>>> +               TPM_I2C_CAP_INTERFACE_VER  |
>>> +               TPM_I2C_CAP_TPM2_FAMILY    |
>>> +               TPM_I2C_CAP_LOCALITY_CAP   |
>>> +               TPM_I2C_CAP_BUS_SPEED      |
>>> +               TPM_I2C_CAP_DEV_ADDR_CHANGE);
>>> +
>>> +    /* Now check the TIS and set some capabilities */
>>> +
>>> +    /* Static burst count set */
>>> +    if (i2cst->tis_intf_cap & 0x100) {
>>> +        i2c_cap |= TPM_I2C_CAP_BURST_COUNT_STATIC;
>>> +    }
>>> +
>>> +    return i2c_cap;
>>> +}
>>> +
>>> +static inline uint16_t tpm_tis_i2c_to_tis_reg(uint64_t i2c_reg, int *size)
>>> +{
>>> +    uint16_t tis_reg = i2c_reg;
>>> +    const i2c_reg_map *reg_map;
>>> +    int i;
>>> +
>>> +    for (i = 0; i < ARRAY_SIZE(tpm_tis_reg_map); i++) {
>>> +        reg_map = &tpm_tis_reg_map[i];
>>> +        if (reg_map->i2c_reg == (i2c_reg & 0xff)) {
>>> +            tis_reg = reg_map->tis_reg;
>>> +            *size = reg_map->data_size;
>>> +            break;
>>> +        }
>>> +    }
>>> +
>>> +    return tis_reg;
>>> +}
>>> +
>>> +/* Initialize the cached data */
>>> +static inline void tpm_tis_i2c_init_cache(TPMStateI2C *i2cst)
>>> +{
>>> +    /* Clear operation and offset */
>>> +    i2cst->operation = 0;
>>> +    i2cst->offset = 0;
>>> +    i2cst->size = 0;
>>> +
>>> +    return;
>>> +}
>>> +
>>> +/* Send data to TPM */
>>> +static inline void tpm_tis_i2c_tpm_send(TPMStateI2C *i2cst)
>>> +{
>>> +    uint16_t tis_reg;
>>> +    uint32_t data;
>>> +    int      i;
>>> +
>>> +    if ((i2cst->operation == OP_SEND) && (i2cst->offset > 1)) {
>>> +
>>> +        /*
>>> +         * Checksum is not handled by common code hence we will consume the
>>> +         * register here.
>>> +         */
>>> +        if (i2cst->data[0] == TPM_TIS_I2C_REG_DATA_CSUM_ENABLE) {
>>> +            i2cst->csum_enable = true;
>>> +        } else if (i2cst->data[0] != TPM_TIS_I2C_REG_DATA_FIFO) {
>>> +            tis_reg = tpm_tis_i2c_to_tis_reg(i2cst->data[0], &i2cst->size);
>>> +
>>> +            /* Index 0 is always a register */
>>> +            for (i = 1; i < i2cst->offset; i++) {
>>> +                data = i2cst->data[i];
>>> +                tpm_tis_write_data(&i2cst->state, tis_reg, data, 1);
>>> +            }
>>> +        }
>>> +
>>> +        tpm_tis_i2c_init_cache(i2cst);
>>> +    }
>>> +
>>> +    return;
>>> +}
>>> +
>>> +/* Callback from TPM to indicate that response is copied */
>>> +static void tpm_tis_i2c_request_completed(TPMIf *ti, int ret)
>>> +{
>>> +    TPMStateI2C *i2cst = TPM_TIS_I2C(ti);
>>> +    TPMState *s = &i2cst->state;
>>> +
>>> +    /* Inform the common code. */
>>> +    tpm_tis_request_completed(s, ret);
>>> +}
>>> +
>>> +static enum TPMVersion tpm_tis_i2c_get_tpm_version(TPMIf *ti)
>>> +{
>>> +    TPMStateI2C *i2cst = TPM_TIS_I2C(ti);
>>> +    TPMState *s = &i2cst->state;
>>> +
>>> +    return tpm_tis_get_tpm_version(s);
>>> +}
>>> +
>>> +static int tpm_tis_i2c_event(I2CSlave *i2c, enum i2c_event event)
>>> +{
>>> +    TPMStateI2C *i2cst = TPM_TIS_I2C(i2c);
>>> +    int ret = 0;
>>> +
>>> +    switch (event) {
>>> +    case I2C_START_RECV:
>>> +        break;
>>> +    case I2C_START_SEND:
>>> +        tpm_tis_i2c_init_cache(i2cst);
>>> +        break;
>>> +    case I2C_FINISH:
>>> +        if (i2cst->operation == OP_SEND) {
>>> +            tpm_tis_i2c_tpm_send(i2cst);
>>> +        } else {
>>> +            tpm_tis_i2c_init_cache(i2cst);
>>> +        }
>>> +        break;
>>> +    default:
>>> +        break;
>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +/*
>>> + * If data is for FIFO then it is received from tpm_tis_common buffer
>>> + * otherwise it will be handled using single call to common code and
>>> + * cached in the local buffer.
>>> + */
>>> +static uint8_t tpm_tis_i2c_recv(I2CSlave *i2c)
>>> +{
>>> +    int ret = 0;
>>> +    int i, j;
>>> +    uint32_t addr;
>>> +    uint32_t data_read;
>>> +    uint16_t i2c_reg;
>>> +    TPMStateI2C *i2cst = TPM_TIS_I2C(i2c);
>>> +    TPMState *s = &i2cst->state;
>>> +
>>> +    if (i2cst->operation == OP_RECV) {
>>> +
>>> +        /* Do not cache FIFO data. */
>>> +        if (i2cst->data[0] == TPM_TIS_I2C_REG_DATA_FIFO) {
>>> +            addr = tpm_tis_i2c_to_tis_reg(TPM_TIS_I2C_REG_DATA_FIFO,
>>> +                                          &i2cst->size);
>>> +            data_read = tpm_tis_read_data(s, addr, 1);
>>> +            ret = (data_read & 0xff);
>>> +        } else if (i2cst->offset < 4096) {
>>
>> use a define or sizeof(i2cst->data)
> Done
>>
>>> +            ret = i2cst->data[i2cst->offset++];
>>> +        }
>>> +
>>> +    } else if ((i2cst->operation == OP_SEND) && (i2cst->offset < 2)) {
>>> +        /* First receive call after send */
>>> +
>>> +        i2c_reg = i2cst->data[0];
>>> +
>>> +        i2cst->operation = OP_RECV;
>>> +        i2cst->offset = 1; /* keep the register value intact for debug */
>>> +
>>> +        addr = tpm_tis_i2c_to_tis_reg(i2c_reg, &i2cst->size);
>>> +
>>> +        /* FIFO data is directly read from TPM TIS */
>>> +        if (i2c_reg == TPM_TIS_I2C_REG_DATA_FIFO) {
>>> +            data_read = tpm_tis_read_data(s, addr, 1);
>>> +            ret = (data_read & 0xff);
>>> +        } else {
>>> +            /*
>>> +             * Save the data in the data field. Save it in the little
>>> +             * endian format.
>>> +             */
>>> +            for (i = 1; i <= i2cst->size;) {
>>> +                /*
>>> +                 * Checksum registers are not supported by common code hence
>>> +                 * call a common code to get the checksum.
>>> +                 */
>>> +                if (i2c_reg == TPM_TIS_I2C_REG_DATA_CSUM_GET) {
>>> +                    data_read = tpm_tis_get_checksum(s);
>>> +                } else {
>>> +                    data_read = tpm_tis_read_data(s, addr, 4);
>>> +
>>> +                    if (i2c_reg == TPM_TIS_I2C_REG_INTF_CAPABILITY) {
>>> +                        /* Prepare the capabilities as per I2C interface */
>>> +                        data_read = tpm_i2c_interface_capability(i2cst,
>>> + data_read);
>>> +                    } else if (i2c_reg == TPM_TIS_I2C_REG_STS) {
>>> +                        /*
>>> +                         * As per specs, STS bit 31:26 are reserved and must
>>> +                         * be set to 0
>>> +                         */
>>> +                        data_read &= TPM_I2C_STS_READ_MASK;
>>> +                    }
>>> +                }
>>> +                for (j = 0; j < 4; j++) {
>>> +                    i2cst->data[i++] = (data_read & 0xff);
>>> +                    data_read >>= 8;
>>> +                }
>>
>> Why do you need 2 loops ? This is complex to follow.
> You are right. Now that I moved writes to TIS , I am able to remove outer loop.
>>
>>> +            }
>>> +            /* Return first byte with this call */
>>> +            ret = i2cst->data[i2cst->offset++];
>>> +        }
>>> +    } else {
>>> +        i2cst->operation = OP_RECV;
>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +/*
>>> + * Send function only remembers data in the buffer and then calls
>>> + * TPM TIS common code during FINISH event.
>>> + */
>>> +static int tpm_tis_i2c_send(I2CSlave *i2c, uint8_t data)
>>> +{
>>> +    TPMStateI2C *i2cst = TPM_TIS_I2C(i2c);
>>> +    uint16_t tis_reg;
>>> +
>>> +    /* Reject non-supported registers. */
>>> +    if (i2cst->offset == 0) {
>>> +        /* We do not support device address change */
>>> +        if (data == TPM_TIS_I2C_REG_I2C_DEV_ADDRESS) {
>>
>> may be add a qemu_log_mask(LOG_UNIMP, "  ...");
> Done
>>
>>> +            return 1;
>>> +        }
>>> +    }
>>> +
>>> +    if (i2cst->offset < 4096) {
>>
>> use a define or sizeof(i2cst->data)
> Done
>>
>>> +        i2cst->operation = OP_SEND;
>>> +
>>> +        /* Remember data locally for non-FIFO registers */
>>> +        if ((i2cst->offset == 0) ||
>>> +            (i2cst->data[0] != TPM_TIS_I2C_REG_DATA_FIFO)) {
>>> +            i2cst->data[i2cst->offset++] = data;
>>> +        } else {
>>> +            tis_reg = tpm_tis_i2c_to_tis_reg(i2cst->data[0], &i2cst->size);
>>> +            tpm_tis_write_data(&i2cst->state, tis_reg, data, 1);
>>> +        }
>>> +
>>> +        return 0;
>>> +
>>> +    } else {
>>> +        /* Return non-zero to indicate NAK */
>>> +        return 1;
>>> +    }
>>> +}
>>> +
>>> +static Property tpm_tis_i2c_properties[] = {
>>> +    DEFINE_PROP_UINT32("irq", TPMStateI2C, state.irq_num, TPM_TIS_IRQ),
>>
>> hmm, irq seems unused.
> I is used in the TIS and backend.
>>
>>> +    DEFINE_PROP_TPMBE("tpmdev", TPMStateI2C, state.be_driver),
>>> +    DEFINE_PROP_END_OF_LIST(),
>>> +};
>>
>> I don't see an .instance_init routine initializing the TPMState sub device.
> 
> 
> The TPMState initialization happens under tpm_tis_reset.
> 
> 
>>
>>> +
>>> +static void tpm_tis_i2c_realizefn(DeviceState *dev, Error **errp)
>>> +{
>>> +    TPMStateI2C *i2cst = TPM_TIS_I2C(dev);
>>> +    TPMState *s = &i2cst->state;
>>> +
>>> +    if (!tpm_find()) {
>>> +        error_setg(errp, "at most one TPM device is permitted");
>>> +        return;
>>> +    }
>>> +
>>> +    /*
>>> +     * Get the backend pointer. It is not initialized propery during
>>> +     * device_class_set_props
>>> +     */
>>> +    s->be_driver = qemu_find_tpm_be("tpm0");
>>
>> I don't understand that part. Looks weird to me.
> It should happen under device_class_set_props() but this function is getting invoked before tpm0 is created hence I had to query separately in the realize function.
>>
>>> +    if (!s->be_driver) {
>>> +        error_setg(errp, "'tpmdev' property is required");
>>> +        return;
>>> +    }
>>> +    if (s->irq_num > 15) {
>>> +        error_setg(errp, "IRQ %d is outside valid range of 0 to 15",
>>> +                   s->irq_num);
>>> +        return;
>>> +    }
>>
>> The code above belongs to a TPMState realize routine it seems. I was
>> expecting something like :
>>
>>     if (!qdev_realize(qdev_realize(DEVICE(&i2cst->state), NULL, &errp)) {
>>     return;
>>     }
>>   Looking closer, this comment applies to some other tpm devices. May be
>> I misunderstood how TPM is designed though.
>>
> I followed direction from tpm_tis_sysbus.c code. But I still had to call find backend.


Can't you set a property of TPMState before it is realized ?

C.


