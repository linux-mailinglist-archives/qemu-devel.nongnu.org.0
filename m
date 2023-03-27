Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25586CA240
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 13:18:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgkqs-0004HU-8w; Mon, 27 Mar 2023 07:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgkqn-0004Eh-Az
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 07:17:22 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgkql-00010o-FQ
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 07:17:21 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RAmpjO012455; Mon, 27 Mar 2023 11:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=CieXpXpEK5owEXgtGpfHM4H/EMdSkIddJn0GNU64uQQ=;
 b=pOpGkjLc44eGK3ToIG9gIz2yHfZXBJv6CsBPLkE+TF/4uMX9gNkOTLR1nC6QpxliJjHF
 +WAyDNxaaZuIfnLvYD4Vyf3wZKFXwWgk33MGDyvyWSVNJ/4tPaZkbtniASQVgSjFO9wf
 7CwJjF9gAlbQ4BcIyryejnJXU7lfDHV4jntTNpisObSpgfSnStNpmLle4it3BwnOV8pP
 fG1JiWq6WmtU0x1vlZ3XWb4mcW5zl3dE0upe5NLb8m17IIG3kOh3PdLkADIF4e1ae6OR
 lGWRBm6GaGcVhp/nIGMVEn45duyun1TyQTSiRkrviE4A/Tl4WqK5AjP59cyB9tzT/c6U VQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjb1adntb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 11:17:10 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32R9loFq002750;
 Mon, 27 Mar 2023 11:17:09 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
 by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3phrk72vtj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 11:17:09 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RBH70229098502
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 11:17:08 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4BF558058;
 Mon, 27 Mar 2023 11:17:07 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42A2958057;
 Mon, 27 Mar 2023 11:17:07 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Mar 2023 11:17:07 +0000 (GMT)
Message-ID: <ef4e98d1-92b5-4349-3a04-66ce57ad81a7@linux.ibm.com>
Date: Mon, 27 Mar 2023 07:17:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 0/3] Add support for TPM devices over I2C bus
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Ninad Palsule <ninad@linux.vnet.ibm.com>
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org,
 andrew@aj.id.au, clg@kaod.org
References: <20230326224426.3918167-1-ninad@linux.ibm.com>
 <CACPK8XeZA8nqhgjH_SUDrk3A49dUqnKVONtj+QtcnjOsLUjvGQ@mail.gmail.com>
 <a9ba4cf8-cd4d-2038-6328-66f61ad3ed70@linux.vnet.ibm.com>
 <CACPK8XfrM0cCdW7a2+Leiw8dD2RAc8Xakx4ptdE5wdtjp=P27Q@mail.gmail.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <CACPK8XfrM0cCdW7a2+Leiw8dD2RAc8Xakx4ptdE5wdtjp=P27Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4Q097V9ury71oU_iGXvKcXM7WLOW4NIU
X-Proofpoint-GUID: 4Q097V9ury71oU_iGXvKcXM7WLOW4NIU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270088
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



On 3/27/23 04:04, Joel Stanley wrote:
> On Mon, 27 Mar 2023 at 03:52, Ninad Palsule <ninad@linux.vnet.ibm.com> wrote:
>>
>> Hi Joel,
>>
>> On 3/26/23 8:05 PM, Joel Stanley wrote:
>>> Hi Ninad,
>>>
>>> On Sun, 26 Mar 2023 at 22:44, Ninad Palsule <ninad@linux.ibm.com> wrote:
>>>> Hello,
>>>>
>>>> I have incorporated review comments from Stefan. Please review.
>>>>
>>>> This drop adds support for the TPM devices attached to the I2C bus. It
>>>> only supports the TPM2 protocol. You need to run it with the external
>>>> TPM emulator like swtpm. I have tested it with swtpm.
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
>>
>> Yes, As per kernel code this is an expected error for some emulators.
>>
>> On swtpm emulator, It returns TPM2_RC_INITIALIZE if emulator is not
>> initialized. I searched it in swtpm and it indicated that selftest
>> requested before it is initialized. I meant to ask Stefan but busy with
>> the review comments.
> 
> The swtpm man page mentions some flags we can set. Perhaps they would help?
> 
>         --flags [not-need-init]
> [,startup-clear|startup-state|startup-deactivated|startup-none]

With firmware initializing the TPM 2 neither of these options is necessary.
If firmware doesn't initialize the TPM 2 then Linux will show that error message and initialize it.



    Stefan

