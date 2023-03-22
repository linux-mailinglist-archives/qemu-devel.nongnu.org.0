Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C626C49E3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 13:07:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pexED-00039w-5u; Wed, 22 Mar 2023 08:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pexDy-00039L-5B
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:05:50 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pexDv-000514-LR
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:05:49 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32MB3Jsq037111; Wed, 22 Mar 2023 12:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=x2HDaO53VErBfSD1wr0fZLxJAgkPp6W5orBOCrCaZpA=;
 b=Am7VPnQxLoXRH/8TMW0rt1ICGDvzdflBNYu+JFVVCt95NyNHwThMcvXKilTsY8vNDm9Y
 /z6YkgzSjU1+OjAucSc66vta+S8ZnUR5kXQGp7CPOiT6GvmFw8V+CBrA0tVKlqSZDR7p
 r+Qd5338jrl5SquK+5HjppJw39TOCe2mOGae0fo023rFIHXgeUi9auejLiBnwWSixSoe
 p+iZRKiKILVjoAC3ug6T9Cq+R2tAs6b3JK+sIlG32P9cf6/bVfSB73gDsJZPSb669xcN
 8DIySXM1R9cNdBP4/ZWQzYjqVArAxkbEbX9Ich0tc+MFEJCEFV0vaD7quIQVPHIhcKnS Ig== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pfx52507y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 12:05:26 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32MBk9uV023444;
 Wed, 22 Mar 2023 12:05:26 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3pd4x7e221-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 12:05:26 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32MC5Olo19136848
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Mar 2023 12:05:24 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E9E25805F;
 Wed, 22 Mar 2023 12:05:24 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E970858061;
 Wed, 22 Mar 2023 12:05:23 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 22 Mar 2023 12:05:23 +0000 (GMT)
Message-ID: <d442b288-1f15-479d-c57a-b4a4b22753b7@linux.ibm.com>
Date: Wed, 22 Mar 2023 08:05:23 -0400
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
X-Proofpoint-GUID: 6Aa_PybDkEwAIqgD6GzuZg70K8U0w4M3
X-Proofpoint-ORIG-GUID: 6Aa_PybDkEwAIqgD6GzuZg70K8U0w4M3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_08,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=727
 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220087
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



On 3/21/23 01:30, Ninad Palsule wrote:
> Qemu already supports devices attached to ISA and sysbus. This drop adds
> support for the I2C bus attached TPM devices.

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

Can you intercept handling this register on the I2C layer and add a byte for its value so that it can be set correctly? We do want to be able to write bit 0 to it to enable it and allow reading of bit 0 to see what the state is. I don't want this byte of state on the TIS layer since this creates state incompatibilities.

And for getting the checksum value it should be also handled on the I2C layer and ask tpm_tis_common.c to run crc_ccitt(0, s->buffer, s->rw_offset) via a function call.

    Stefan

