Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 914526C861A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 20:43:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfnJe-0004JV-8k; Fri, 24 Mar 2023 15:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pfnJc-0004JE-E3
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 15:43:08 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pfnJa-00059M-Hu
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 15:43:08 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32OJEi0b013580; Fri, 24 Mar 2023 19:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=2xLKqOpzfo4zgYBhr97ze/n3P2nEaVr5YI+FI/zYzHI=;
 b=h1LPOQkSZC1tDHQfvAOswk959WjSM/NLjcBjQUjECGFLGa3p0TKMXcDttsMwV4MOHXFw
 9Y0DD2BTK3uxpvZ269z3lYOHQt+qlZIWM/cSLl7pG6LjFDntRKTm+vjMKgljZC9vyAnv
 VKkxZJLNs2blEZxcsgs3Z81Liz3Ssk0a22bVLrfAWfsnVZZvSH/+Le4ScZY98lmVVdaP
 8ekHq9z6128VF78DrNUJK2JiX1JnQ822ICmOjTX2Ni/DyySLsypNJdioc+THS6du4zF3
 2Yn36XlxJCfvcZQxxxe31o/q+zCM+20VLg8BrnBl5w+6f9wVpZztX8C8avC6mcjigrMd yA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3phhurgk6n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Mar 2023 19:42:55 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32OJUrPK025919;
 Fri, 24 Mar 2023 19:42:54 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3pgycnw8b4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Mar 2023 19:42:54 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32OJgrIa16056848
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Mar 2023 19:42:54 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FF4B58060;
 Fri, 24 Mar 2023 19:42:53 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D29C58054;
 Fri, 24 Mar 2023 19:42:53 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 24 Mar 2023 19:42:52 +0000 (GMT)
Message-ID: <fefda353-d527-49cc-5e41-7e5b6cacb61f@linux.ibm.com>
Date: Fri, 24 Mar 2023 15:42:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/3] New I2C: Add support for TPM devices over I2C bus
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au
References: <20230324030251.2589040-1-ninad@linux.ibm.com>
 <20230324030251.2589040-4-ninad@linux.ibm.com>
 <90d1dcd4-c5b8-566d-325b-5a550e25a1cc@kaod.org>
 <0b2e37e7-1c0a-84b7-f717-e309d278023d@linux.ibm.com>
In-Reply-To: <0b2e37e7-1c0a-84b7-f717-e309d278023d@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VeuWyVU8-l_UtaOryLMV8ZK9YLXFAM-T
X-Proofpoint-ORIG-GUID: VeuWyVU8-l_UtaOryLMV8ZK9YLXFAM-T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303240151
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



On 3/24/23 09:43, Stefan Berger wrote:
> 
> 
> On 3/24/23 04:24, Cédric Le Goater wrote:
>> Hello Ninad,
>>
> 
>>> +
>>> +/*
>>> + * Convert little endian byte stream into local formated
>>> + * unsigned integer
>>> + */
>>> +static inline uint32_t tpm_i2c_le_bytes_to_uint(TPMStateI2C *i2cst)
>>> +{
>>> +    uint32_t data = 0;
>>> +    int      i;
>>> +
>>> +    assert(i2cst->offset <= 5);  /* Including 0th register value */
>>> +
>>> +    if (tpm_i2c_is_little_endian()) {
>>> +        for (i = 1; i < i2cst->offset; i++) {
>>> +            data |= (((uint32_t)i2cst->data[i]) << (8 * (i - 1)));
>>> +        }
>>> +    } else {
>>> +        for (i = 1; i < i2cst->offset; i++) {
>>> +            data <<= 8;
>>> +            data |= i2cst->data[i];
>>> +        }
>>> +    }
>>> +
>>> +    return data;
>>> +}
>>
>> Why is this endianess test  needed ? Something looks wrong.
>>
>> Could you please explain the endianess used by the various devices and
>> the endianness of the MMIO ops ?
>>
>> If you want to test on a BE host, simply install a debian PPC64 VM/LPAR
>> on a POWER9/10 box. I suppose you have access to one in IBM.
> 
> I found it's not that simple anymore since all distros moved to little endian. I have been using Fedora 28 for big endian tests for swtpm but I have never tried it with QEMU...


... Fedora 28 is still good enough to build QEMU.

    Stefan
> 
>     Stefan
> 

