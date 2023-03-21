Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB64F6C3EDC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 00:55:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pelol-0007kD-Vr; Tue, 21 Mar 2023 19:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1peloj-0007k0-Mx
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 19:55:01 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pelog-0002N9-1Y
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 19:55:01 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32LLEGhO026620; Tue, 21 Mar 2023 23:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/FpqzkfNKBLqujS0+qy9SE9BC7PdshPac1FyroziKi8=;
 b=bcaoiy0dG9gw+PTpZ/+ocH+G8amnw8Kt4dNFP1mHP6Jc3NKe0qt94CR9hBhRziftzBST
 7bv4xfdP8n4b0LLa2AvNNhXR0M4H+dwO67RTmya3mgzmqI4fslGO3zzkslQpOrkdYz0l
 nuXeoz52cFcDEAqgi/Q0pCdqYiIQ8SQSFLqrAllOblQzvpcIe5L28IBKOyy5cGiKQfAD
 Hb0VMDupXxAsl5QMNjT9D8IX2ltyZa2NJnZVs+YUYkLw6zzZPmaqrJPMMMkVtZwyvDK7
 6L0Sr/1tlrE6l5Du29c+7kgHelqC4t+kxylJ0ztwYOw/qxgwv3sFSUG6BQIp554eVPtG tw== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pfmaejw9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Mar 2023 23:54:40 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32LMtkf5030093;
 Tue, 21 Mar 2023 23:54:39 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
 by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3pd4x75dkb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Mar 2023 23:54:39 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32LNscN441615804
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Mar 2023 23:54:38 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 537A65805C;
 Tue, 21 Mar 2023 23:54:38 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD1B55805F;
 Tue, 21 Mar 2023 23:54:37 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 21 Mar 2023 23:54:37 +0000 (GMT)
Message-ID: <1ec4d7f7-7f51-1b40-ee8f-775233e0127f@linux.ibm.com>
Date: Tue, 21 Mar 2023 19:54:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] Add support for TPM devices over I2C bus
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au, clg@kaod.org
References: <20230321053001.3886666-1-ninad@linux.ibm.com>
 <20230321053001.3886666-3-ninad@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230321053001.3886666-3-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YzwkUNGjIs0gUa6ZkhExozOMCCOtGAGY
X-Proofpoint-GUID: YzwkUNGjIs0gUa6ZkhExozOMCCOtGAGY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303210186
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
> support for the I2C bus attached TPM devices.
> 
> This commit includes changes for the common code.
> - Added support for the new checksum registers which are required for
>    the I2C support. The checksum calculation is handled in the qemu
>    common code.
> - Added wrapper function for read and write data so that I2C code can
>    call it without MMIO interface.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>   hw/tpm/tpm_tis.h        |  2 ++
>   hw/tpm/tpm_tis_common.c | 33 +++++++++++++++++++++++++++++++++
>   include/hw/acpi/tpm.h   |  2 ++
>   3 files changed, 37 insertions(+)
> 
> diff --git a/hw/tpm/tpm_tis.h b/hw/tpm/tpm_tis.h
> index f6b5872ba6..16b7baddd8 100644
> --- a/hw/tpm/tpm_tis.h
> +++ b/hw/tpm/tpm_tis.h
> @@ -86,5 +86,7 @@ int tpm_tis_pre_save(TPMState *s);
>   void tpm_tis_reset(TPMState *s);
>   enum TPMVersion tpm_tis_get_tpm_version(TPMState *s);
>   void tpm_tis_request_completed(TPMState *s, int ret);
> +uint32_t tpm_tis_read_data(TPMState *s, hwaddr addr, unsigned size);
> +void tpm_tis_write_data(TPMState *s, hwaddr addr, uint64_t val, uint32_t size);
>   
>   #endif /* TPM_TPM_TIS_H */
> diff --git a/hw/tpm/tpm_tis_common.c b/hw/tpm/tpm_tis_common.c
> index 503be2a541..3c82f63179 100644
> --- a/hw/tpm/tpm_tis_common.c
> +++ b/hw/tpm/tpm_tis_common.c
> @@ -26,6 +26,8 @@
>   #include "hw/irq.h"
>   #include "hw/isa/isa.h"
>   #include "qapi/error.h"
> +#include "qemu/bswap.h"
> +#include "qemu/crc-ccitt.h"
>   #include "qemu/module.h"
>   
>   #include "hw/acpi/tpm.h"
> @@ -422,6 +424,9 @@ static uint64_t tpm_tis_mmio_read(void *opaque, hwaddr addr,
>               shift = 0; /* no more adjustments */
>           }
>           break;
> +    case TPM_TIS_REG_DATA_CSUM_GET:
> +        val = bswap16(crc_ccitt(0, s->buffer, s->rw_offset));

Should this not rather be cpu_to_be16() so that it would also work on a big endian host (assuming you tested this on a little e endian host)?

> +        break;
>       case TPM_TIS_REG_INTERFACE_ID:
>           val = s->loc[locty].iface_id;
>           break;
> @@ -447,6 +452,15 @@ static uint64_t tpm_tis_mmio_read(void *opaque, hwaddr addr,
>       return val;
>   }
>   
> +/*
> + * A wrapper read function so that it can be directly called without
> + * mmio.
> + */
> +uint32_t tpm_tis_read_data(TPMState *s, hwaddr addr, unsigned size)
> +{
> +    return tpm_tis_mmio_read(s, addr, size);
> +}
> +
>   /*
>    * Write a value to a register of the TIS interface
>    * See specs pages 33-63 for description of the registers
> @@ -600,6 +614,15 @@ static void tpm_tis_mmio_write(void *opaque, hwaddr addr,
>       case TPM_TIS_REG_INT_VECTOR:
>           /* hard wired -- ignore */
>           break;
> +    case TPM_TIS_REG_DATA_CSUM_ENABLE:
> +        /*
> +         * Checksum implemented by common code so no need to set
> +         * any flags.
> +         */
> +        break;
> +    case TPM_TIS_REG_DATA_CSUM_GET:
> +        /* This is readonly register so ignore */
> +        break;
>       case TPM_TIS_REG_INT_STATUS:
>           if (s->active_locty != locty) {
>               break;
> @@ -703,6 +726,7 @@ static void tpm_tis_mmio_write(void *opaque, hwaddr addr,
>           break;
>       case TPM_TIS_REG_DATA_FIFO:
>       case TPM_TIS_REG_DATA_XFIFO ... TPM_TIS_REG_DATA_XFIFO_END:
> +

you can remove this one

>           /* data fifo */
>           if (s->active_locty != locty) {
>               break;
> @@ -767,6 +791,15 @@ static void tpm_tis_mmio_write(void *opaque, hwaddr addr,
>       }
>   }
>   
> +/*
> + * A wrapper write function so that it can be directly called without
> + * mmio.
> + */
> +void tpm_tis_write_data(TPMState *s, hwaddr addr, uint64_t val, uint32_t size)
> +{
> +    tpm_tis_mmio_write(s, addr, val, size);
> +}'
> +
>   const MemoryRegionOps tpm_tis_memory_ops = {
>       .read = tpm_tis_mmio_read,
>       .write = tpm_tis_mmio_write,
> diff --git a/include/hw/acpi/tpm.h b/include/hw/acpi/tpm.h
> index 559ba6906c..db12c002f4 100644
> --- a/include/hw/acpi/tpm.h
> +++ b/include/hw/acpi/tpm.h
> @@ -40,6 +40,8 @@
>   #define TPM_TIS_REG_STS                   0x18
>   #define TPM_TIS_REG_DATA_FIFO             0x24
>   #define TPM_TIS_REG_INTERFACE_ID          0x30
> +#define TPM_TIS_REG_DATA_CSUM_ENABLE      0x40
> +#define TPM_TIS_REG_DATA_CSUM_GET         0x44
>   #define TPM_TIS_REG_DATA_XFIFO            0x80
>   #define TPM_TIS_REG_DATA_XFIFO_END        0xbc
>   #define TPM_TIS_REG_DID_VID               0xf00

Looks good.

