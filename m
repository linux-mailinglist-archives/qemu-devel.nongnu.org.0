Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D91D6C48E5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 12:18:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pewU5-00087F-Aw; Wed, 22 Mar 2023 07:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pewU1-000872-Af
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 07:18:21 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pewTz-0002Vo-CI
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 07:18:21 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32MAgGHs001796; Wed, 22 Mar 2023 11:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6gr/TbA49CfRwne4eC+fKaGq8VcECj/Ea1zEwWldd3o=;
 b=s+E5l972AtLNjgUolcjKD4T0KdSjgdkkf/vdUhaVChf1kQ5ku0ZcgYdzRgp5AcQeZo77
 DmSZ7Kk9GOfd4u74nR+Rm/VcEvapmcJ5XhL94No4Q0JZtHkMly2MfzBmFLnjwP6cYy/s
 Ye24jANqHVzz1qCAMJCVeyLnvRGWCgqV645dLEFZAdayFkbEvoPsL+JOYTaP9VKRwjE9
 3s38R43HbMgqg85VgUkWglHHGPoXw/eZSVNeu0CSX0uGTZc6uBgJpmZtaIqdmmiVixdc
 CBH1MIuyGXSNtWelv8qKi0weoknO/MHlVE7OtHGuCOMgqaZm4f17zuecuizGhgjA4sAX Fw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pg05a8ycr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 11:18:05 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32MAvS9a023551;
 Wed, 22 Mar 2023 11:18:04 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3pd4x6yyv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 11:18:03 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32MBI2o62687522
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Mar 2023 11:18:02 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 037165805D;
 Wed, 22 Mar 2023 11:18:02 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C532358043;
 Wed, 22 Mar 2023 11:18:01 +0000 (GMT)
Received: from [9.211.67.180] (unknown [9.211.67.180])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 22 Mar 2023 11:18:01 +0000 (GMT)
Message-ID: <f3d1ff99-f38e-441a-5e07-3e68f97599c2@linux.vnet.ibm.com>
Date: Wed, 22 Mar 2023 06:18:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 2/3] Add support for TPM devices over I2C bus
Content-Language: en-US
To: Stefan Berger <stefanb@linux.ibm.com>, Ninad Palsule
 <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au, clg@kaod.org
References: <20230321053001.3886666-1-ninad@linux.ibm.com>
 <20230321053001.3886666-3-ninad@linux.ibm.com>
 <1ec4d7f7-7f51-1b40-ee8f-775233e0127f@linux.ibm.com>
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <1ec4d7f7-7f51-1b40-ee8f-775233e0127f@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uXtWxI08nsOmjroIkrz7cDtG-oUVyZGO
X-Proofpoint-ORIG-GUID: uXtWxI08nsOmjroIkrz7cDtG-oUVyZGO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_08,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220072
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=ninad@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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


On 3/21/23 6:54 PM, Stefan Berger wrote:
>
>
> On 3/21/23 01:30, Ninad Palsule wrote:
>> Qemu already supports devices attached to ISA and sysbus. This drop adds
>> support for the I2C bus attached TPM devices.
>>
>> This commit includes changes for the common code.
>> - Added support for the new checksum registers which are required for
>>    the I2C support. The checksum calculation is handled in the qemu
>>    common code.
>> - Added wrapper function for read and write data so that I2C code can
>>    call it without MMIO interface.
>>
>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>> ---
>>   hw/tpm/tpm_tis.h        |  2 ++
>>   hw/tpm/tpm_tis_common.c | 33 +++++++++++++++++++++++++++++++++
>>   include/hw/acpi/tpm.h   |  2 ++
>>   3 files changed, 37 insertions(+)
>>
>> diff --git a/hw/tpm/tpm_tis.h b/hw/tpm/tpm_tis.h
>> index f6b5872ba6..16b7baddd8 100644
>> --- a/hw/tpm/tpm_tis.h
>> +++ b/hw/tpm/tpm_tis.h
>> @@ -86,5 +86,7 @@ int tpm_tis_pre_save(TPMState *s);
>>   void tpm_tis_reset(TPMState *s);
>>   enum TPMVersion tpm_tis_get_tpm_version(TPMState *s);
>>   void tpm_tis_request_completed(TPMState *s, int ret);
>> +uint32_t tpm_tis_read_data(TPMState *s, hwaddr addr, unsigned size);
>> +void tpm_tis_write_data(TPMState *s, hwaddr addr, uint64_t val, 
>> uint32_t size);
>>     #endif /* TPM_TPM_TIS_H */
>> diff --git a/hw/tpm/tpm_tis_common.c b/hw/tpm/tpm_tis_common.c
>> index 503be2a541..3c82f63179 100644
>> --- a/hw/tpm/tpm_tis_common.c
>> +++ b/hw/tpm/tpm_tis_common.c
>> @@ -26,6 +26,8 @@
>>   #include "hw/irq.h"
>>   #include "hw/isa/isa.h"
>>   #include "qapi/error.h"
>> +#include "qemu/bswap.h"
>> +#include "qemu/crc-ccitt.h"
>>   #include "qemu/module.h"
>>     #include "hw/acpi/tpm.h"
>> @@ -422,6 +424,9 @@ static uint64_t tpm_tis_mmio_read(void *opaque, 
>> hwaddr addr,
>>               shift = 0; /* no more adjustments */
>>           }
>>           break;
>> +    case TPM_TIS_REG_DATA_CSUM_GET:
>> +        val = bswap16(crc_ccitt(0, s->buffer, s->rw_offset));
>
> Should this not rather be cpu_to_be16() so that it would also work on 
> a big endian host (assuming you tested this on a little e endian host)?


Changed code to use cpu_to_be16. Yes, I did not run on big endian host.

>
>> +        break;
>>       case TPM_TIS_REG_INTERFACE_ID:
>>           val = s->loc[locty].iface_id;
>>           break;
>> @@ -447,6 +452,15 @@ static uint64_t tpm_tis_mmio_read(void *opaque, 
>> hwaddr addr,
>>       return val;
>>   }
>>   +/*
>> + * A wrapper read function so that it can be directly called without
>> + * mmio.
>> + */
>> +uint32_t tpm_tis_read_data(TPMState *s, hwaddr addr, unsigned size)
>> +{
>> +    return tpm_tis_mmio_read(s, addr, size);
>> +}
>> +
>>   /*
>>    * Write a value to a register of the TIS interface
>>    * See specs pages 33-63 for description of the registers
>> @@ -600,6 +614,15 @@ static void tpm_tis_mmio_write(void *opaque, 
>> hwaddr addr,
>>       case TPM_TIS_REG_INT_VECTOR:
>>           /* hard wired -- ignore */
>>           break;
>> +    case TPM_TIS_REG_DATA_CSUM_ENABLE:
>> +        /*
>> +         * Checksum implemented by common code so no need to set
>> +         * any flags.
>> +         */
>> +        break;
>> +    case TPM_TIS_REG_DATA_CSUM_GET:
>> +        /* This is readonly register so ignore */
>> +        break;
>>       case TPM_TIS_REG_INT_STATUS:
>>           if (s->active_locty != locty) {
>>               break;
>> @@ -703,6 +726,7 @@ static void tpm_tis_mmio_write(void *opaque, 
>> hwaddr addr,
>>           break;
>>       case TPM_TIS_REG_DATA_FIFO:
>>       case TPM_TIS_REG_DATA_XFIFO ... TPM_TIS_REG_DATA_XFIFO_END:
>> +
>
> you can remove this one
Sorry, I am not clear what you are asking me to remove.
>
>>           /* data fifo */
>>           if (s->active_locty != locty) {
>>               break;
>> @@ -767,6 +791,15 @@ static void tpm_tis_mmio_write(void *opaque, 
>> hwaddr addr,
>>       }
>>   }
>>   +/*
>> + * A wrapper write function so that it can be directly called without
>> + * mmio.
>> + */
>> +void tpm_tis_write_data(TPMState *s, hwaddr addr, uint64_t val, 
>> uint32_t size)
>> +{
>> +    tpm_tis_mmio_write(s, addr, val, size);
>> +}'
>> +
>>   const MemoryRegionOps tpm_tis_memory_ops = {
>>       .read = tpm_tis_mmio_read,
>>       .write = tpm_tis_mmio_write,
>> diff --git a/include/hw/acpi/tpm.h b/include/hw/acpi/tpm.h
>> index 559ba6906c..db12c002f4 100644
>> --- a/include/hw/acpi/tpm.h
>> +++ b/include/hw/acpi/tpm.h
>> @@ -40,6 +40,8 @@
>>   #define TPM_TIS_REG_STS                   0x18
>>   #define TPM_TIS_REG_DATA_FIFO             0x24
>>   #define TPM_TIS_REG_INTERFACE_ID          0x30
>> +#define TPM_TIS_REG_DATA_CSUM_ENABLE      0x40
>> +#define TPM_TIS_REG_DATA_CSUM_GET         0x44
>>   #define TPM_TIS_REG_DATA_XFIFO            0x80
>>   #define TPM_TIS_REG_DATA_XFIFO_END        0xbc
>>   #define TPM_TIS_REG_DID_VID               0xf00
>
> Looks good.


Thank you for the review!

Ninad Palsule


