Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2E66C4913
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 12:25:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pewa0-0001r5-42; Wed, 22 Mar 2023 07:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pewZx-0001qq-Ir
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 07:24:29 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pewZw-0006Gd-1h
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 07:24:29 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32MBFHFP029215; Wed, 22 Mar 2023 11:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=0QpBIsp1z2pWaRX1m4RvYQqLCzNA593EZ9eUYxgr6vQ=;
 b=lckUtKPytHBFPZYR2KagSxdjhS0Sak5++IEXYn4Z5469COq/YOxh7OzML7eRkKzwCovr
 QkJyoHURcF4t4w76MS7AxSyQWYAxPSPDATfYsE7mn17q1T5RO25myDsYcdW5O4W9CbZk
 VU6TDyjnU29JsakuP1HKL1yhXrXaQeK5aMVSUpmZzwaKmwHjvCKaE90w8hIstgEXHCbM
 b6lNqq9OKpWyZ6U1YbIJCSbxfnL/bmJV+GJTlHABZ+4JT1/uEkjAYSq8UP+iGpkO5UMC
 0KKaW+OD6G0m6fXd6/uy7DRV5VW+WHSc0G40X35vvEhDZogedbBXgTRqZ0GmS2/lWV+I PA== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pg0mr87bf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 11:24:18 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32M8InDv021504;
 Wed, 22 Mar 2023 11:24:18 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3pd4x77xy1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 11:24:18 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32MBOGKC39256806
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Mar 2023 11:24:17 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEA7F5803F;
 Wed, 22 Mar 2023 11:24:16 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6ED0A58063;
 Wed, 22 Mar 2023 11:24:16 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 22 Mar 2023 11:24:16 +0000 (GMT)
Message-ID: <03fda37a-39eb-2166-d883-084759684f0c@linux.ibm.com>
Date: Wed, 22 Mar 2023 07:24:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] Add support for TPM devices over I2C bus
Content-Language: en-US
To: Ninad Palsule <ninad@linux.vnet.ibm.com>,
 Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au, clg@kaod.org
References: <20230321053001.3886666-1-ninad@linux.ibm.com>
 <20230321053001.3886666-3-ninad@linux.ibm.com>
 <1ec4d7f7-7f51-1b40-ee8f-775233e0127f@linux.ibm.com>
 <f3d1ff99-f38e-441a-5e07-3e68f97599c2@linux.vnet.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <f3d1ff99-f38e-441a-5e07-3e68f97599c2@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Yh617R69VLjcZYlZVCv2aHSh9QhlG_0D
X-Proofpoint-ORIG-GUID: Yh617R69VLjcZYlZVCv2aHSh9QhlG_0D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_08,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303220075
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



On 3/22/23 07:18, Ninad Palsule wrote:
> 
> On 3/21/23 6:54 PM, Stefan Berger wrote:


>>> @@ -703,6 +726,7 @@ static void tpm_tis_mmio_write(void *opaque, hwaddr addr,
>>>           break;
>>>       case TPM_TIS_REG_DATA_FIFO:
>>>       case TPM_TIS_REG_DATA_XFIFO ... TPM_TIS_REG_DATA_XFIFO_END:
>>> +
>>
>> you can remove this one
> Sorry, I am not clear what you are asking me to remove.

You added an empty line here.

    Stefan

