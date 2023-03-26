Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 971CA6C91FF
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Mar 2023 03:10:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgEtW-0001Vm-40; Sat, 25 Mar 2023 21:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pgEtU-0001Va-0W
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 21:10:00 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pgEtS-0000uO-1x
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 21:09:59 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32PNrKsF012809; Sun, 26 Mar 2023 01:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=PWJvFjLo9FIicqWo7+GMXWa+R4rQBk35hLMplMEksx8=;
 b=fWiyalc9Gb48rEZc3GAWtrUa9OH2tzmX5NKUaX0c5Wbj8HCx3h4HFYy9jr8WN47V098K
 dtFLobbkstJOSkrl9vhsYpQwCE1u4QMUrUeBdtHJMVWeOElmMNH3WziOxuZWRV8M9HMA
 cgj0YUT8E/W94BVXxhZEdfKIfwmUzUiiZp60KLglCbx+ZCqt0DjrSFpFHZZhL6UhX6Me
 h2nZma2SuKUuePUacAreEp9WoFydl2ZVhkuUx5OODFGa6/FJj1Y/zEbkMCHLpM0KDnTY
 top6aSZ5hX+lFGNDODdKfay8tey0MTRs4cAg55KCRfA+A/D0Sf0l9aoeg1eDHcccryMC pw== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjb19gy3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Mar 2023 01:09:43 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32PKwp3q003277;
 Sun, 26 Mar 2023 01:09:42 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
 by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3phrk6va05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Mar 2023 01:09:42 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32Q19fn531326832
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 26 Mar 2023 01:09:41 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1563058054;
 Sun, 26 Mar 2023 01:09:41 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ACD2258045;
 Sun, 26 Mar 2023 01:09:40 +0000 (GMT)
Received: from [9.163.70.110] (unknown [9.163.70.110])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Sun, 26 Mar 2023 01:09:40 +0000 (GMT)
Message-ID: <4c73de09-70e5-7c8c-00a7-05cfd3f3a492@linux.vnet.ibm.com>
Date: Sat, 25 Mar 2023 20:09:40 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 3/3] tpm: Add support for TPM device over I2C bus
Content-Language: en-US
To: Stefan Berger <stefanb@linux.ibm.com>, Ninad Palsule
 <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au, clg@kaod.org
References: <20230325043751.3559591-1-ninad@linux.ibm.com>
 <20230325043751.3559591-4-ninad@linux.ibm.com>
 <18a764a5-a7a6-0ff7-8e64-e977e29b7c9c@linux.ibm.com>
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <18a764a5-a7a6-0ff7-8e64-e977e29b7c9c@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XhtA8yQuhb5QFhNd3AX9TiklHtgYZ4-r
X-Proofpoint-GUID: XhtA8yQuhb5QFhNd3AX9TiklHtgYZ4-r
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303260006
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


On 3/25/23 11:46 AM, Stefan Berger wrote:
>
>
> On 3/25/23 00:37, Ninad Palsule wrote:
>> Qemu already supports devices attached to ISA and sysbus. This drop adds
>> support for the I2C bus attached TPM devices. I2C model only supports
>> TPM2 protocol.
>>
>
> Your v4 patches with my 2 patches for the test cases are here now:
>
> https://github.com/stefanberger/qemu-tpm/commits/tpm-i2c.v4

Ok, thanks for creating tests for this.

Ninad.

>
> Thanks!
>
>   Regards,
>     Stefan

