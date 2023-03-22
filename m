Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AB36C5165
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 17:59:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf1nK-0006PU-Dy; Wed, 22 Mar 2023 12:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pf1nH-0006MJ-4I
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 12:58:35 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pf1nD-0004pV-BC
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 12:58:33 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32MGN2Kp019203; Wed, 22 Mar 2023 16:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=csjDqQYW/O7OIJlU0e8yP6TDfj3wRYLhI8KMhUzNJDw=;
 b=i4cSEpZseU/axed2cxPpc6HOFPy+G9HvzNb82TPkQW/IbK0A1c9OsPMj3N910pfjBL8f
 jvhrUSN6yoa/PACysBhpITIZPr8VsTqWCmNzFV5k1qTq5plWft/BibHuciWBVrD8W3Q9
 4jpKomGdoAVvYgzF7yrvKSrzAu57Idf30NyCLLxSzETNX6Q1Dw7lrbbeg3cPtU8DnVBG
 vQ4snNY9kIqmG2Br2tGnxtiNidt6+/DifvCaacXw8IbEVBZLJrob1+pFvTIcfvSAwjyB
 VdLreTSpN5j2MCbgRsP118Lg3XEiuBnro3+OqQ33XKYbHaX995UAQwZKBhl5O64YYVxm uw== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pg558gtsv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 16:58:18 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32MEwwYj005381;
 Wed, 22 Mar 2023 16:58:17 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3pd4x7fjy6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 16:58:17 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32MGwGGI11469544
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Mar 2023 16:58:16 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 082D75805E;
 Wed, 22 Mar 2023 16:58:16 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8B685805C;
 Wed, 22 Mar 2023 16:58:15 +0000 (GMT)
Received: from [9.211.118.39] (unknown [9.211.118.39])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 22 Mar 2023 16:58:15 +0000 (GMT)
Message-ID: <9accc065-9c55-b405-76fb-c7b67146486f@linux.vnet.ibm.com>
Date: Wed, 22 Mar 2023 11:58:15 -0500
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
 <d442b288-1f15-479d-c57a-b4a4b22753b7@linux.ibm.com>
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <d442b288-1f15-479d-c57a-b4a4b22753b7@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Vv3SyW-HykqUW-G657Hrxuy6PoMADmHi
X-Proofpoint-GUID: Vv3SyW-HykqUW-G657Hrxuy6PoMADmHi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_13,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 mlxscore=0 mlxlogscore=871 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 phishscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220117
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


On 3/22/23 7:05 AM, Stefan Berger wrote:
>
>
> On 3/21/23 01:30, Ninad Palsule wrote:
>> Qemu already supports devices attached to ISA and sysbus. This drop adds
>> support for the I2C bus attached TPM devices.
>
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
>
> Can you intercept handling this register on the I2C layer and add a 
> byte for its value so that it can be set correctly? We do want to be 
> able to write bit 0 to it to enable it and allow reading of bit 0 to 
> see what the state is. I don't want this byte of state on the TIS 
> layer since this creates state incompatibilities.
>
> And for getting the checksum value it should be also handled on the 
> I2C layer and ask tpm_tis_common.c to run crc_ccitt(0, s->buffer, 
> s->rw_offset) via a function call.
>
>    Stefan


Sure, Fix it by handling it in I2C and removed newly defined registers 
from TIS layer.

Thanks for the review.

Ninad Palsule



