Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6C26C4B43
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 14:06:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pey9T-0001EI-C6; Wed, 22 Mar 2023 09:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pey9Q-0001Dj-EX
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 09:05:12 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pey9L-0003nQ-8C
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 09:05:12 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32MCgBCx015814; Wed, 22 Mar 2023 13:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=naM9e057h2g7GkltvOE8mgDF043nLSiHGNnEKOQpWrE=;
 b=fiUMQ+zjm8A7clEWnYYesELGRgFk31uDUqGuDaBecGTWLgjbsQEZulUuLUC3lcRYEdop
 gCVSGTEYQrnFppNj8D02R/TGAX5PmqrhTdXBLhoY15PqxKLuR4NxDbGlACjgMOYWFHDG
 5ofjsWrl7/g1c8BKZ2r9GGkwPMTbFuV1FSw//b1eM5C/ryzdWkWPzTKwD7xBj2kKjI1l
 djOnk7sAZ25aKIhDRWOo2yfsVPRahqGGiFL0kS67FMrw7qaTEsVJKEi2b6B+CU/CxMLh
 VFSpB+6Tl7YgZ82zPiTRxrylOZ4pC08n7dpmbByA+rvxxVtTQPvyuCTgQ6nv9ZtCJq5v aA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pg1wj0jw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 13:04:57 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32MBqUjV006177;
 Wed, 22 Mar 2023 13:04:56 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3pd4x7pcva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 13:04:56 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32MD4sJ632834174
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Mar 2023 13:04:54 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80CEF58060;
 Wed, 22 Mar 2023 13:04:54 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09D065805A;
 Wed, 22 Mar 2023 13:04:54 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 22 Mar 2023 13:04:53 +0000 (GMT)
Message-ID: <57be0b95-adb5-14f0-2674-e832d3f069f2@linux.ibm.com>
Date: Wed, 22 Mar 2023 09:04:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] Add support for TPM devices over I2C bus
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
To: Ninad Palsule <ninad@linux.vnet.ibm.com>,
 Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au, clg@kaod.org
References: <20230321053001.3886666-1-ninad@linux.ibm.com>
 <20230321053001.3886666-4-ninad@linux.ibm.com>
 <2d32bfa7-0804-c046-bb8c-ca30d400ed4a@linux.ibm.com>
 <9d656af9-913b-c586-79cf-eae842f45281@linux.vnet.ibm.com>
 <a9f83d77-73dc-cc91-4d60-32f473af321b@linux.ibm.com>
In-Reply-To: <a9f83d77-73dc-cc91-4d60-32f473af321b@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: s1-D9_9bfXoMxxr-tlzeinB4t7NvQKMD
X-Proofpoint-ORIG-GUID: s1-D9_9bfXoMxxr-tlzeinB4t7NvQKMD
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_11,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220096
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



On 3/22/23 07:50, Stefan Berger wrote:
> 
> 
> On 3/22/23 07:28, Ninad Palsule wrote:
>>
>> On 3/21/23 8:30 PM, Stefan Berger wrote:
>>>

>>>
>>> I think there should be tpm_tis_set_data_buffer function that you can call rather than transferring the data byte-by-byte.
>>>
>>> Thanks for the series!
>>>
>>>   Stefan
>>
>> I thought about it but the FIFO case performs multiple operations hence I did not want to change it. Currently there is no function to set data buffer in the common code.
> 
> It may not be correct to transfer it in one go, either. I just printed the I2C specs and I am going to look at them now.
> When one writes TPM command data to the TIS the STS register has its TPM_TIS_STS_VALID bit set and TPM_TIS_STS_EXPECT bit reset once the command is complete. This would imply that you should not have a holding area for the command bytes but pass them on to the TIS immediately to get the effect of the STS register...

Regarding the registers defined for the I2C: You can pass the data onto the TIS but you should mask out input flags that are not defined for I2C and if the return value has flags not defined for I2C you should also mask those out as well. This applies to the TPM_INT_ENABLE & TPM_STS registers on read and write and to the TPM_INT_CAPABILITY on read. Also you should implement support for TPM_I2C_INTERACE_CAPABILITY on the I2C layer and return sensible values for the defined bits. The TPM_I2C_DEVICE_ADDRESS register should be handled probably assuming fixed address support only.

Ideally there would be a test case similar to this one here https://github.com/qemu/qemu/blob/master/tests/qtest/tpm-tis-util.c . However, I am not sure how easy it is to talk to I2C without a driver for it.

   Stefan

