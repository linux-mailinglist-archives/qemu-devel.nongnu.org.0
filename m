Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C96606CA19D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 12:47:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgkND-0003Zq-UE; Mon, 27 Mar 2023 06:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgkMr-0003XD-Qj
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 06:46:25 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgkMp-0000RU-AR
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 06:46:25 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32R8csc1012299; Mon, 27 Mar 2023 10:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=aPNlIU73sMxrdVLDZtc6w/qAd6nMJegdM7tGzWvIv64=;
 b=pmAMGT+nLktmmIKYcJEXXcPug4CA38HSJwCc6J/mZ878uEPoOU0uHEYwc7Qc9m6J/8Je
 fwI1gsFciA5XEtoNJz9cVPj4kRe/vhz19Y56jAJWG2MACbTq1oaNGS7EBzdJ/03XnxPK
 RO5TkAawBjVTO4MUsVnufjRljiKjH/yraXxDUZriHcHyeLQxawG2NIQ5ITCcNDiT0tVi
 uOijgBa5jqjHforN3SplZx7E7Ac7XwloKe8eI8aHgEBx8JIjHMUR1s9gNeKnLyvhhQsd
 y0FLQYCKQDK28p0IIf8ozY5tGKINR4zX4T3yIXK8Qk64FZK09y03eUt4PozstRa94ZFq MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjb1act2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 10:46:12 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32RAZ7LW012907;
 Mon, 27 Mar 2023 10:46:11 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjb1act1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 10:46:11 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32R9eAFf003018;
 Mon, 27 Mar 2023 10:46:10 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
 by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3phrk72s6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 10:46:10 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RAk94a24380062
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 10:46:09 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DFE558054;
 Mon, 27 Mar 2023 10:46:09 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F8115805C;
 Mon, 27 Mar 2023 10:46:08 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Mar 2023 10:46:08 +0000 (GMT)
Message-ID: <28410a99-e0ec-5478-0bd9-5e2674be1e6c@linux.ibm.com>
Date: Mon, 27 Mar 2023 06:46:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] qtest: Add a test case for TPM TIS I2C connected to
 Aspeed I2C controller
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, ninad@linux.ibm.com, joel@jms.id.au,
 andrew@aj.id.au
References: <20230327003703.3539303-1-stefanb@linux.ibm.com>
 <20230327003703.3539303-3-stefanb@linux.ibm.com>
 <166f52c2-0896-c75e-1644-1136f48e7951@kaod.org>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <166f52c2-0896-c75e-1644-1136f48e7951@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uhz4m-6492kkRC0obcor4KyWJORprVJJ
X-Proofpoint-GUID: J9YZ6YKHCOx16nAKNjCaK6WD23RBpTuZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270084
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



On 3/27/23 03:49, Cédric Le Goater wrote:
> On 3/27/23 02:37, Stefan Berger wrote:
>> Add a test case for the TPM TIS I2C device exercising most of its
>> functionality, including localities.
>>
>> Add library functions for being able to read from and write to registers
>> of the TPM TIS I2C device connected to the Aspeed i2c controller.
>>
>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> 
> Thanks for doing the I2C qtest driver. This gives the opportunity to write
> more unit tests.
> 
>> ---
>>   tests/qtest/meson.build        |   3 +
>>   tests/qtest/qtest_aspeed.c     | 117 ++++++
>>   tests/qtest/qtest_aspeed.h     |  27 ++
>>   tests/qtest/tpm-tis-i2c-test.c | 628 +++++++++++++++++++++++++++++++++
>>   4 files changed, 775 insertions(+)
>>   create mode 100644 tests/qtest/qtest_aspeed.c
>>   create mode 100644 tests/qtest/qtest_aspeed.h
>>   create mode 100644 tests/qtest/tpm-tis-i2c-test.c
>>
>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>> index 29a4efb4c2..065a00d34d 100644
>> --- a/tests/qtest/meson.build
>> +++ b/tests/qtest/meson.build
>> @@ -200,6 +200,7 @@ qtests_arm = \
>>     (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed : []) + \
>>     (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
>>     (config_all_devices.has_key('CONFIG_GENERIC_LOADER') ? ['hexloader-test'] : []) + \
>> +  (config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
>>     ['arm-cpu-features',
>>      'microbit-test',
>>      'test-arm-mptimer',
>> @@ -212,6 +213,7 @@ qtests_aarch64 = \
>>       ['tpm-tis-device-test', 'tpm-tis-device-swtpm-test'] : []) +                                         \
>>     (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
>>     (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test'] : []) +  \
>> +  (config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
>>     ['arm-cpu-features',
>>      'numa-test',
>>      'boot-serial-test',
>> @@ -303,6 +305,7 @@ qtests = {
>>     'tpm-crb-test': [io, tpmemu_files],
>>     'tpm-tis-swtpm-test': [io, tpmemu_files, 'tpm-tis-util.c'],
>>     'tpm-tis-test': [io, tpmemu_files, 'tpm-tis-util.c'],
>> +  'tpm-tis-i2c-test': [io, tpmemu_files, 'qtest_aspeed.c'],
>>     'tpm-tis-device-swtpm-test': [io, tpmemu_files, 'tpm-tis-util.c'],
>>     'tpm-tis-device-test': [io, tpmemu_files, 'tpm-tis-util.c'],
>>     'vmgenid-test': files('boot-sector.c', 'acpi-utils.c'),
>> diff --git a/tests/qtest/qtest_aspeed.c b/tests/qtest/qtest_aspeed.c
>> new file mode 100644
>> index 0000000000..2b316178e4
>> --- /dev/null
>> +++ b/tests/qtest/qtest_aspeed.c
>> @@ -0,0 +1,117 @@
>> +/*
>> + * Aspeed i2c bus interface to reading and writing to i2c device registers
>> + *
>> + * Copyright (c) 2023 IBM Corporation
>> + *
>> + * Authors:
>> + *   Stefan Berger <stefanb@linux.ibm.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +
>> +#include "qtest_aspeed.h"
>> +
>> +#include "hw/i2c/aspeed_i2c.h"
>> +#include "libqtest-single.h"
>> +
>> +#define A_I2CD_M_STOP_CMD       BIT(5)
>> +#define A_I2CD_M_RX_CMD         BIT(3)
>> +#define A_I2CD_M_TX_CMD         BIT(1)
>> +#define A_I2CD_M_START_CMD      BIT(0)
>> +
>> +#define A_I2CD_MASTER_EN        BIT(0)
> 
> Why do you need to include the aspeed_i2c.h file and add some more
> definitions ? Couldn't we gather all of them under the same file ?

I moved them now.



>> +
>> +#define I2C_SLAVE_ADDR   0x2e
>> +#define I2C_DEV_BUS_NUM  10
>> +
>> +static const uint8_t TPM_CMD[12] =
>> +    "\x80\x01\x00\x00\x00\x0c\x00\x00\x01\x44\x00\x00";
>> +
>> +uint32_t aspeed_dev_addr = 0X1e78a000 + 0x80 + I2C_DEV_BUS_NUM * 0x80;
> 
> 0X1e78a000 could be a define

Is it suitable for a public header file or limited to the board we are using it with?
Where should the define go? Into the qtest_aspeed.h file under this name?

#define AST2600_ASPEED_I2C_BASE_ADDR 0x1e78a0000

> > The resulting address should be calculated with an helper defined in
> qtest_aspeed.h, with an ast2600_ prefix in the name since the calculation
> is SoC dependent.  See aspeed_i2c_realize()

static inline uint32_t ast2600_aspeed_i2c_calc_dev_addr(uint8_t bus_num)
{
     return AST2600_ASPEED_I2C_BASE_ADDR + 0x80 + bus_num * 0x80;
}
Like this?

> 
> My knowledge on TPM is too limited to comment. Could you please extract
> the I2C driver in its own patch ?

Will do.

    Stefan

