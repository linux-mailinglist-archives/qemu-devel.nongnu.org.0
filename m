Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F896C5B83
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 01:45:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf93f-0002lO-GM; Wed, 22 Mar 2023 20:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pf93c-0002k7-18
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 20:43:56 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pf93Z-0008Ko-QU
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 20:43:55 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32MNHKgi024338; Thu, 23 Mar 2023 00:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=uQXh+Svd79AAQi15EJP0LxRbJxnoMauqE3Wd5irx0lQ=;
 b=UvdV0ZxTKMdpQuFk7CCDphlXGrn/xX98mxBwY0izvXYnzKtT9FnLwEPEyW/PAukpirIz
 Aein5/7gLOBdShL03MNlqBYHWO0ES/BEMC9OsK54Km1Jb3opMyt6DQ8DoWw8rwc5Upov
 kmeY+balGD0hmgPQ/tZh34D078gOLTsBEjjT0MqdncKcVa3x7ZckXbeHVv6T1wikOBfR
 aXu3VN/LZxLxUBuIq+ocX+wYcQmwagyO1VwwrcEGBEaV/PPFI6d1pvRdb3JmVRsWaUPH
 Wm2DoSJHFVtR9Sim9/GtkYCMcaqh6spNLl0lIfrvQhI1kh+PEhSS8+XU1CCf47s1uHSa ZQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pgb76hd3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Mar 2023 00:43:38 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32MNoh87005381;
 Thu, 23 Mar 2023 00:43:37 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3pd4x7hsvs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Mar 2023 00:43:37 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32N0hZjM32440882
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Mar 2023 00:43:35 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 303BD58055;
 Thu, 23 Mar 2023 00:43:35 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE9205804B;
 Thu, 23 Mar 2023 00:43:34 +0000 (GMT)
Received: from [9.211.152.166] (unknown [9.211.152.166])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 23 Mar 2023 00:43:34 +0000 (GMT)
Message-ID: <bf76aa4c-1759-53cb-c9fa-5f102a10e459@linux.vnet.ibm.com>
Date: Wed, 22 Mar 2023 19:43:34 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 3/3] Add support for TPM devices over I2C bus
Content-Language: en-US
To: Stefan Berger <stefanb@linux.ibm.com>, Ninad Palsule
 <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au, clg@kaod.org
References: <20230321053001.3886666-1-ninad@linux.ibm.com>
 <20230321053001.3886666-4-ninad@linux.ibm.com>
 <2d32bfa7-0804-c046-bb8c-ca30d400ed4a@linux.ibm.com>
 <9d656af9-913b-c586-79cf-eae842f45281@linux.vnet.ibm.com>
 <a9f83d77-73dc-cc91-4d60-32f473af321b@linux.ibm.com>
 <57be0b95-adb5-14f0-2674-e832d3f069f2@linux.ibm.com>
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <57be0b95-adb5-14f0-2674-e832d3f069f2@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JXmypEnXJ4ys8saq8wb8ByWWrtvolAxc
X-Proofpoint-ORIG-GUID: JXmypEnXJ4ys8saq8wb8ByWWrtvolAxc
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303150002 definitions=main-2303230003
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


On 3/22/23 8:04 AM, Stefan Berger wrote:
>
>
> On 3/22/23 07:50, Stefan Berger wrote:
>>
>>
>> On 3/22/23 07:28, Ninad Palsule wrote:
>>>
>>> On 3/21/23 8:30 PM, Stefan Berger wrote:
>>>>
>
>>>>
>>>> I think there should be tpm_tis_set_data_buffer function that you 
>>>> can call rather than transferring the data byte-by-byte.
>>>>
>>>> Thanks for the series!
>>>>
>>>>   Stefan
>>>
>>> I thought about it but the FIFO case performs multiple operations 
>>> hence I did not want to change it. Currently there is no function to 
>>> set data buffer in the common code.
>>
>> It may not be correct to transfer it in one go, either. I just 
>> printed the I2C specs and I am going to look at them now.
>> When one writes TPM command data to the TIS the STS register has its 
>> TPM_TIS_STS_VALID bit set and TPM_TIS_STS_EXPECT bit reset once the 
>> command is complete. This would imply that you should not have a 
>> holding area for the command bytes but pass them on to the TIS 
>> immediately to get the effect of the STS register...
>
> Regarding the registers defined for the I2C: You can pass the data 
> onto the TIS but you should mask out input flags that are not defined 
> for I2C and if the return value has flags not defined for I2C you 
> should also mask those out as well. This applies to the TPM_INT_ENABLE 
> & TPM_STS registers on read and write and to the TPM_INT_CAPABILITY on 
> read. Also you should implement support for 
> TPM_I2C_INTERACE_CAPABILITY on the I2C layer and return sensible 
> values for the defined bits. The TPM_I2C_DEVICE_ADDRESS register 
> should be handled probably assuming fixed address support only.
>
Good catch.

- Added capability conversion for TPM_I2C_INTERFACE_CAPABILITY.

- Added clearing of bits in TPM_STS register.

- Adde check to reject TPM_I2C_DEVICE_ADDRESS register.

- No changes are required for TPM_INT_ENABLE and TPM_INT_CAPABILITY as 
they have same bits between TPM TIS and TPM I2C.


> Ideally there would be a test case similar to this one here 
> https://github.com/qemu/qemu/blob/master/tests/qtest/tpm-tis-util.c . 
> However, I am not sure how easy it is to talk to I2C without a driver 
> for it.
Ok, Thanks.
>
>   Stefan


Thanks for the review!

Ninad Palsule


