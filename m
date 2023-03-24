Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C7F6C8180
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:40:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfjEH-0001G9-N5; Fri, 24 Mar 2023 11:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pfjEC-00014a-K0
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 11:21:16 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pfjEA-0001dx-Ds
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 11:21:16 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32OEUH4r029702; Fri, 24 Mar 2023 14:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=l2X0Jmmod/qJT6DLytvrBWS06qipCIQdfOSY/fRXv9A=;
 b=L6cbdl6kVzR24OobUNSYLjyR9HmLSz/BqWAbcWsipLI/mZ4uUmmkMW/FZVrPDrerR3lZ
 jIt5iRQ7fx634E43fxx5ZV9YsLfk3qO8c+h9NlSDJhFvq3xRzs+m6V335zTnUBLvOj87
 koHgMKwX3v64KCU+IyKgIV3V5fXzZpPysxvjOugW7QVWP3th04wq2Mz+R3x9i4Qov8vn
 jYK48ds+AZQY25u9ZfDGb9UWik4dQBy/kvHeDsDTJhLvpOme3YeyRaTPkNI+QyWxkmCz
 SOW3CF1qCX+Yjihe0KhWrtDCY8rHF0E+Wtg/XZPbRcIdvwn9dfyd1ceeJSm+RzJWIzp3 9g== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3phbnfbs73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Mar 2023 14:36:19 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32OBqMZT016971;
 Fri, 24 Mar 2023 14:36:18 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
 by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3pgxkrc75f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Mar 2023 14:36:18 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32OEaHcT65208790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Mar 2023 14:36:17 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D2C35805B;
 Fri, 24 Mar 2023 14:36:17 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEA6658055;
 Fri, 24 Mar 2023 14:36:16 +0000 (GMT)
Received: from [9.163.28.178] (unknown [9.163.28.178])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 24 Mar 2023 14:36:16 +0000 (GMT)
Message-ID: <7aaec4cc-bcd0-e203-1652-3f79962720b4@linux.vnet.ibm.com>
Date: Fri, 24 Mar 2023 09:36:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/3] TPM TIS: Add support for TPM devices over I2C bus
Content-Language: en-US
To: Stefan Berger <stefanb@linux.ibm.com>, Ninad Palsule
 <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au, clg@kaod.org
References: <20230324030251.2589040-1-ninad@linux.ibm.com>
 <20230324030251.2589040-3-ninad@linux.ibm.com>
 <028b7888-b5a4-37be-77a8-fe04a2701ea4@linux.ibm.com>
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <028b7888-b5a4-37be-77a8-fe04a2701ea4@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JXxyuYGQc4sD4ac3RsjTvTIy8LO9Tw-1
X-Proofpoint-GUID: JXxyuYGQc4sD4ac3RsjTvTIy8LO9Tw-1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_08,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303240117
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


On 3/24/23 9:26 AM, Stefan Berger wrote:
>
>
> On 3/23/23 23:02, Ninad Palsule wrote:
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
>> V2:
>>
>> Incorporated Stephen's comments.
>>
>> - Removed checksum enable and checksum get registers.
>> - Added checksum calculation function which can be called from
>>    i2c layer.
>>
>> ---
>> V3:
>> Incorporated review comments from Cedric and Stefan.
>>
>> - Pass locality to the checksum calculation function and cleanup
>> - Moved I2C related definations in the acpi/tpm.h
>> ---
>>   hw/tpm/tpm_tis.h        |  3 +++
>>   hw/tpm/tpm_tis_common.c | 32 ++++++++++++++++++++++++++++++++
>>   include/hw/acpi/tpm.h   | 28 ++++++++++++++++++++++++++++
>>   3 files changed, 63 insertions(+)
>>
>> diff --git a/hw/tpm/tpm_tis.h b/hw/tpm/tpm_tis.h
>> index f6b5872ba6..784898ce34 100644
>> --- a/hw/tpm/tpm_tis.h
>> +++ b/hw/tpm/tpm_tis.h
>> @@ -86,5 +86,8 @@ int tpm_tis_pre_save(TPMState *s);
>>   void tpm_tis_reset(TPMState *s);
>>   enum TPMVersion tpm_tis_get_tpm_version(TPMState *s);
>>   void tpm_tis_request_completed(TPMState *s, int ret);
>> +uint32_t tpm_tis_read_data(TPMState *s, hwaddr addr, unsigned size);
>> +void tpm_tis_write_data(TPMState *s, hwaddr addr, uint64_t val, 
>> uint32_t size);
>> +uint16_t tpm_tis_get_checksum(TPMState *s, uint8_t locty);
>>     #endif /* TPM_TPM_TIS_H */
>> diff --git a/hw/tpm/tpm_tis_common.c b/hw/tpm/tpm_tis_common.c
>> index 503be2a541..84f3e2259f 100644
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
>> @@ -447,6 +449,27 @@ static uint64_t tpm_tis_mmio_read(void *opaque, 
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
>> +/*
>> + * Calculate current data buffer checksum
>> + */
>> +uint16_t tpm_tis_get_checksum(TPMState *s, uint8_t locty)
>> +{
>> +    if (TPM_TIS_IS_VALID_LOCTY(locty) && (s->active_locty == locty)) {
>> +        return cpu_to_be16(crc_ccitt(0, s->buffer, s->rw_offset));
>
> Actually, this whole function should only be the following so you can 
> have the result in 'native' byte order:
>
> return crc_ccitt(0, s->buffer, s->rw_offset);
>
> Per I2C spec table 11 (section 6.6) the locality plays no role here. 
> My bad.
>
>
Ok, Removed the locality.

But still caller will have to make sure that data is read or written in 
the TIS before calling checksum function otherwise the buffer in TIS 
will be empty and result will be 0.


Thanks for the review.

Ninad

>
>> +    } else {
>> +        return 0;
>> +    }
>> +}
>> +
>>   /*
>>    * Write a value to a register of the TIS interface
>>    * See specs pages 33-63 for description of the registers
>> @@ -767,6 +790,15 @@ static void tpm_tis_mmio_write(void *opaque, 
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
>> +}
>> +
>>   const MemoryRegionOps tpm_tis_memory_ops = {
>>       .read = tpm_tis_mmio_read,
>>       .write = tpm_tis_mmio_write,
>> diff --git a/include/hw/acpi/tpm.h b/include/hw/acpi/tpm.h
>> index 559ba6906c..82430605c7 100644
>> --- a/include/hw/acpi/tpm.h
>> +++ b/include/hw/acpi/tpm.h
>> @@ -93,6 +93,7 @@
>>   #define TPM_TIS_CAP_DATA_TRANSFER_64B    (3 << 9)
>>   #define TPM_TIS_CAP_DATA_TRANSFER_LEGACY (0 << 9)
>>   #define TPM_TIS_CAP_BURST_COUNT_DYNAMIC  (0 << 8)
>> +#define TPM_TIS_CAP_BURST_COUNT_STATIC   (1 << 8)
>>   #define TPM_TIS_CAP_INTERRUPT_LOW_LEVEL  (1 << 4) /* support is 
>> mandatory */
>>   #define TPM_TIS_CAPABILITIES_SUPPORTED1_3 \
>>       (TPM_TIS_CAP_INTERRUPT_LOW_LEVEL | \
>> @@ -209,6 +210,33 @@ REG32(CRB_DATA_BUFFER, 0x80)
>>   #define TPM_PPI_FUNC_ALLOWED_USR_NOT_REQ (4 << 0)
>>   #define TPM_PPI_FUNC_MASK                (7 << 0)
>>   +/* TPM TIS I2C registers */
>> +#define TPM_TIS_I2C_REG_LOC_SEL          0x00
>> +#define TPM_TIS_I2C_REG_ACCESS           0x04
>> +#define TPM_TIS_I2C_REG_INT_ENABLE       0x08
>> +#define TPM_TIS_I2C_REG_INT_CAPABILITY   0x14
>> +#define TPM_TIS_I2C_REG_STS              0x18
>> +#define TPM_TIS_I2C_REG_DATA_FIFO        0x24
>> +#define TPM_TIS_I2C_REG_INTF_CAPABILITY  0x30
>> +#define TPM_TIS_I2C_REG_I2C_DEV_ADDRESS  0x38
>> +#define TPM_TIS_I2C_REG_DATA_CSUM_ENABLE 0x40
>> +#define TPM_TIS_I2C_REG_DATA_CSUM_GET    0x44
>> +#define TPM_TIS_I2C_REG_DID_VID          0x48
>> +#define TPM_TIS_I2C_REG_RID              0x4c
>> +#define TPM_TIS_I2C_REG_UNKNOWN          0xff
>> +
>> +/* I2C specific interface capabilities */
>> +#define TPM_I2C_CAP_INTERFACE_TYPE     (0x2 << 0) /* FIFO interface */
>> +#define TPM_I2C_CAP_INTERFACE_VER      (0x0 << 4) /* TCG I2C intf 
>> 1.0 */
>> +#define TPM_I2C_CAP_TPM2_FAMILY        (0x1 << 7) /* TPM 2.0 family. */
>> +#define TPM_I2C_CAP_DEV_ADDR_CHANGE    (0x0 << 27) /* No dev addr 
>> chng */
>> +#define TPM_I2C_CAP_BURST_COUNT_STATIC (0x1 << 29) /* Burst count 
>> static */
>> +#define TPM_I2C_CAP_LOCALITY_CAP       (0x1 << 25) /* 0-5 locality */
>> +#define TPM_I2C_CAP_BUS_SPEED          (3   << 21) /* std and fast 
>> mode */
>> +
>> +/* TPM_STS mask for read bits 31:26 must be zero */
>> +#define TPM_I2C_STS_READ_MASK          0x03ffffff
>> +
>>   void tpm_build_ppi_acpi(TPMIf *tpm, Aml *dev);
>>     #endif /* CONFIG_TPM */

