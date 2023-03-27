Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 451CD6CA24D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 13:24:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgkxj-00081T-4H; Mon, 27 Mar 2023 07:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgkxg-000813-Ed
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 07:24:28 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgkxd-0007nR-MG
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 07:24:27 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RBC3FT008472; Mon, 27 Mar 2023 11:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/H0G7nYdmtAm/Jv0VcVOqnWCRCPR0o6NJO/o+O99T8g=;
 b=dEzSJs2tJt9oNz/jyF+DYpAvIMPzIOFVByfNwx54jk6VCILWKsWULBSjhb4VUQUBJAez
 RfWLtTxM0CpZ1V4frozIF8Gm7QcgzGIM2+uucux9qDgOEBIA/fn0q9IXpUt8xNB/bNvS
 KeF2LfbGql2/G3AbTJkrbq7aAuzRfaiVCYlpGP8enqXjXE5/tAujYTdMwlCTHsKjIK7W
 3QpM8oEtFPO5JsQ5g9uStvhA+nvfL8V2hNiq8t/mwDyfFAuM/SLFx0WI4oeerFy04iq4
 waL8SuBg/UZU3BmiwRVQoD1ycDCGuMuCAlRLuVbxYSJLmPRiFyL/4S3p7QOLFpIakKdY BA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pka2ag87c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 11:24:17 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32R9vL2s029018;
 Mon, 27 Mar 2023 11:24:16 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3phrk7djyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 11:24:16 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RBOEvg38732478
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 11:24:14 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 513D15805A;
 Mon, 27 Mar 2023 11:24:14 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC01558056;
 Mon, 27 Mar 2023 11:24:13 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Mar 2023 11:24:13 +0000 (GMT)
Message-ID: <633a1c3a-6dd8-4f20-6194-a866fd9c3b7c@linux.ibm.com>
Date: Mon, 27 Mar 2023 07:24:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 0/3] Add support for TPM devices over I2C bus
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org,
 andrew@aj.id.au, clg@kaod.org
References: <20230326224426.3918167-1-ninad@linux.ibm.com>
 <CACPK8XeZA8nqhgjH_SUDrk3A49dUqnKVONtj+QtcnjOsLUjvGQ@mail.gmail.com>
 <2ef78250-dfe6-688f-eb27-9af97ce593e7@linux.ibm.com>
 <CACPK8Xfp06JdTt32T9e=KDaBq5DURyv05OG4Ks9Bk3914_zO9g@mail.gmail.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <CACPK8Xfp06JdTt32T9e=KDaBq5DURyv05OG4Ks9Bk3914_zO9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SznBBgFuJiK-UTHZnjWk8ycNJzfaTtWB
X-Proofpoint-GUID: SznBBgFuJiK-UTHZnjWk8ycNJzfaTtWB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303270088
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



On 3/27/23 07:18, Joel Stanley wrote:
> On Mon, 27 Mar 2023 at 11:11, Stefan Berger <stefanb@linux.ibm.com> wrote:
>>
>>
>>
>> On 3/26/23 21:05, Joel Stanley wrote:
>>> Hi Ninad,
>>>
>>> On Sun, 26 Mar 2023 at 22:44, Ninad Palsule <ninad@linux.ibm.com> wrote:
>>>>
>>>> Hello,
>>>>
>>>> I have incorporated review comments from Stefan. Please review.
>>>>
>>>> This drop adds support for the TPM devices attached to the I2C bus. It
>>>> only supports the TPM2 protocol. You need to run it with the external
>>>> TPM emulator like swtpm. I have tested it with swtpm.
>>>
>>> Nice work. I tested these stop cedric's aspeed-8.0 qemu tree, using
>>> the rainier machine and the openbmc dev-6.1 kernel.
>>>
>>> We get this message when booting from a kernel:
>>>
>>> [    0.582699] tpm_tis_i2c 12-002e: 2.0 TPM (device-id 0x1, rev-id 1)
>>> [    0.586361] tpm tpm0: A TPM error (256) occurred attempting the self test
>>> [    0.586623] tpm tpm0: starting up the TPM manually
>>>
>>> Do we understand why the error appears?
>>
>> The firmware did not initialize the TPM 2.
> 
> Which firmware are we talking about here?

This happens if either no firmware is used or the firmware doesn't know how to talk to the TPM 2.
Linux detects that the TPM 2 wasn't initialized (TPM2_Startup was not sent).
   
    Stefan

