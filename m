Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FD9536821
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:36:37 +0200 (CEST)
Received: from localhost ([::1]:33404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nughI-00088L-Pc
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nufgT-0004JM-GH
 for qemu-devel@nongnu.org; Fri, 27 May 2022 15:31:41 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:21072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nufgR-0007Ey-8f
 for qemu-devel@nongnu.org; Fri, 27 May 2022 15:31:40 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24RJ7Yng021978
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 19:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=mQxkNWxa9TQyIsCngDa9qqIb6UocxuP2tej9FBWOywU=;
 b=JvHHwIFoHx35vX81JZpKqxy+drNkaHQUr+uF6E1pd9ohwLytDkM/ai0esrS6w8kl/kSK
 i6dfA6QdW5wog80iMvdK0YU+lw27wNRZPv9JwGILw93X8uY4Gj1Y8Ojfu4Pu8qQKulYP
 bP8UawllnlJQZbPegVvt6p1zfSY8H2ZlEl8uRujH+lrW2av8nqagvUgQePa7tQsnw/ea
 ZN6cnFr3jaFfdxezbWkHXHzP+1j8ulrhUlAp7674Li1aWWkj//3/fjd5QsYqpfM5QKcg
 7eqTE7l6aIy4F84ftMWSuMmEfspioxSlP/YBxl79GaXNrjtzwFYGO1oJpzC/rKya9oUb qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gb46trj6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 19:31:29 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24RJSb3b009697
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 19:31:29 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gb46trj6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 May 2022 19:31:29 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24RJHFQJ010112;
 Fri, 27 May 2022 19:31:28 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 3g93v8ubcj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 May 2022 19:31:28 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24RJVROV31719874
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 May 2022 19:31:27 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D23378063;
 Fri, 27 May 2022 19:31:27 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FE3C7805C;
 Fri, 27 May 2022 19:31:27 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 27 May 2022 19:31:27 +0000 (GMT)
Message-ID: <7b6d1edf-882f-a369-67c9-5ed5f1d7ce51@linux.ibm.com>
Date: Fri, 27 May 2022 15:31:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/2] backend/tpm: Resolve issue with TPM 2 DA lockout
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
References: <20220527173058.226210-1-stefanb@linux.ibm.com>
 <CAMxuvax1PkLZb+Ms6n1wCyd8hHFsPQwi3xaM+RM0c1x7imQAzA@mail.gmail.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <CAMxuvax1PkLZb+Ms6n1wCyd8hHFsPQwi3xaM+RM0c1x7imQAzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 76CL-IuHpbo9cEvNotbflDX0UJznyFZ9
X-Proofpoint-GUID: Aq9pNjP8hEAYSv8eY_u4D-IFYo7cbFNE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-27_05,2022-05-27_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205270093
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 5/27/22 15:24, Marc-André Lureau wrote:
> Hi
> 
> On Fri, May 27, 2022 at 7:36 PM Stefan Berger <stefanb@linux.ibm.com> wrote:
>>
>> This series of patches resolves an issue with a TPM 2's dictionary attack
>> lockout logic being triggered upon well-timed VM resets. Normally, the OS
>> TPM driver sends a TPM2_Shutdown to the TPM 2 upon reboot and before a VM
>> is reset. However, the OS driver cannot do this when the user resets a VM.
>> In this case QEMU must send the command because otherwise several well-
>> timed VM resets will trigger the TPM 2's dictionary attack (DA) logic and
>> it will then refuse to do certain key-related operations until the DA
>> logic has timed out.
> 
> How does real hardware deal with that situation? Shouldn't this
> "shutdown"/reset logic be implemented on swtpm side instead, when
> CMD_INIT is received? (when the VM is restarted)
I don't know what real hardware can actually do when the machine is 
reset, presumably via some reset line, or the power is removed. Probably 
it has no way to react to this.

Typically the OS driver has to send the command and since it cannot do 
this I would defer it to the TPM emulator reset handler code, so the 
next layer down.



> 
>>
>> Regards,
>>    Stefan
>>
>> Stefan Berger (2):
>>    backends/tpm: Record the last command sent to the TPM
>>    backends/tpm: Send TPM2_Shutdown upon VM reset
>>
>>   backends/tpm/tpm_emulator.c | 44 +++++++++++++++++++++++++++++++++++++
>>   backends/tpm/tpm_int.h      |  3 +++
>>   backends/tpm/tpm_util.c     |  9 ++++++++
>>   backends/tpm/trace-events   |  1 +
>>   include/sysemu/tpm_util.h   |  3 +++
>>   5 files changed, 60 insertions(+)
>>
>> --
>> 2.35.3
>>
> 

