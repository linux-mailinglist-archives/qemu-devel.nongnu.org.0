Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D755B6C821E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 17:05:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfhiL-0002Ar-BG; Fri, 24 Mar 2023 09:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pfhiG-0002AP-Qu
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 09:44:12 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pfhi5-00049b-Ds
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 09:44:12 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32OCMBVZ008190; Fri, 24 Mar 2023 13:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=gPHwHm4Kr2FpiiiSQDSuKa/Z+OiNr4qUy0twTbkCJO0=;
 b=D6hPD+mFko2T3LI1C32+fYF9gN5+mLy/MZkD2JmRhDbRWHBT94t0LmycJupQ9wvf0dfG
 UajaDbJMeKKbP62SMC51JZkKBTQ0cDbMmozplLvd1R46H69XtHHk1/7cd7OowdGd01xN
 Gk1NNvhKoTqryMbFbagPmBvVzAa/A58Z9s+qkQxwodjAjZwfvy3sLsz51sIIlyEX79sI
 yb+hZ9n2c4LhHBgbVWi3zgQ2IGNMbBCfXDLUJsbFGFixESJkyWZKz6MxldJHocQKm7dQ
 6eKhXF6mclulrTxg1JpnAlAf2Eq+CjmV6nkm/XlaZMJOFSVZnAQFu0iRCHpAaVrdOqpL Lw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3phbtaj1ye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Mar 2023 13:43:31 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32OCTwp6002396;
 Fri, 24 Mar 2023 13:43:30 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3pgy3tcsv7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Mar 2023 13:43:30 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32ODhTKi27066928
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Mar 2023 13:43:29 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0BB1358052;
 Fri, 24 Mar 2023 13:43:29 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4E0E5805D;
 Fri, 24 Mar 2023 13:43:28 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 24 Mar 2023 13:43:28 +0000 (GMT)
Message-ID: <0b2e37e7-1c0a-84b7-f717-e309d278023d@linux.ibm.com>
Date: Fri, 24 Mar 2023 09:43:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 3/3] New I2C: Add support for TPM devices over I2C bus
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au
References: <20230324030251.2589040-1-ninad@linux.ibm.com>
 <20230324030251.2589040-4-ninad@linux.ibm.com>
 <90d1dcd4-c5b8-566d-325b-5a550e25a1cc@kaod.org>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <90d1dcd4-c5b8-566d-325b-5a550e25a1cc@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: C54hDR7BRT9pyvL_kVhx0qDKACQDhsdW
X-Proofpoint-ORIG-GUID: C54hDR7BRT9pyvL_kVhx0qDKACQDhsdW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_08,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303240109
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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



On 3/24/23 04:24, Cédric Le Goater wrote:
> Hello Ninad,
> 

>> +
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
> Why is this endianess test  needed ? Something looks wrong.
> 
> Could you please explain the endianess used by the various devices and
> the endianness of the MMIO ops ?
> 
> If you want to test on a BE host, simply install a debian PPC64 VM/LPAR
> on a POWER9/10 box. I suppose you have access to one in IBM.

I found it's not that simple anymore since all distros moved to little endian. I have been using Fedora 28 for big endian tests for swtpm but I have never tried it with QEMU...

    Stefan

