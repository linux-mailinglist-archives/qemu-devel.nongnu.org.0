Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ADD536DF1
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 19:24:50 +0200 (CEST)
Received: from localhost ([::1]:58746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nv0BE-00073j-LI
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 13:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nv09i-0006Ml-PQ
 for qemu-devel@nongnu.org; Sat, 28 May 2022 13:23:15 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nv09g-0002pA-T2
 for qemu-devel@nongnu.org; Sat, 28 May 2022 13:23:14 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24SC1qkA009397
 for <qemu-devel@nongnu.org>; Sat, 28 May 2022 17:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=AzTSHmrZMOd9WqtqCzZmRzLsDMFHNkdlRSBxEexoGw0=;
 b=X80LB8uTibsCP1yAGmvI0QRCc/xJIqZz4RQ5Im8ImSIPJ36QOaBP6D0D7974H+VLpr8Q
 Fx2Fb3EhwBls3KDWMQ0SivZZBs7LTBZN33UhRiLM0jo+xUGiBXqDYbrvNsR9oiPDseq3
 fS12Yk5wVvlc8FfeqrmQGZq8su0WrWbrkxZrXCdSULBTtqFaU9unjfY9hRfPM0fC1eFl
 MvNXyTMji+hOVMt3Igc18BneRkxpfuuujNTN4O1+KfkB/ZvwDGd9Z2TzpPWidd40dQYB
 AffbojA2D1/eXF55F0id+GqV+kkw6XmlG+tf5HA2h9OrgeZGvGXK3YuZMZVpukJ2Z442 ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gbkct3k12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Sat, 28 May 2022 17:23:10 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24SHNAJH022966
 for <qemu-devel@nongnu.org>; Sat, 28 May 2022 17:23:10 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gbkct3k0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 28 May 2022 17:23:09 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24SHLR2V025021;
 Sat, 28 May 2022 17:23:08 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03wdc.us.ibm.com with ESMTP id 3gbc9uu0yq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 28 May 2022 17:23:08 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24SHN8ev23200214
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 28 May 2022 17:23:08 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32905124052;
 Sat, 28 May 2022 17:23:08 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15C35124054;
 Sat, 28 May 2022 17:23:08 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 28 May 2022 17:23:08 +0000 (GMT)
Message-ID: <1eef83c7-9fb9-1060-a993-5b7d3ac47ffe@linux.ibm.com>
Date: Sat, 28 May 2022 13:23:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/2] backend/tpm: Resolve issue with TPM 2 DA lockout
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
References: <20220527173058.226210-1-stefanb@linux.ibm.com>
 <CAMxuvax1PkLZb+Ms6n1wCyd8hHFsPQwi3xaM+RM0c1x7imQAzA@mail.gmail.com>
 <7b6d1edf-882f-a369-67c9-5ed5f1d7ce51@linux.ibm.com>
In-Reply-To: <7b6d1edf-882f-a369-67c9-5ed5f1d7ce51@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bGq_PfSlIOC1xCLDSguEMkVTgHmCKPIW
X-Proofpoint-ORIG-GUID: 80jMitmaOAqV_kvMBY_XGtf2pzlDhmBz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-28_07,2022-05-27_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 clxscore=1015 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2205280095
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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



On 5/27/22 15:31, Stefan Berger wrote:
> 
> 
> On 5/27/22 15:24, Marc-André Lureau wrote:
>> Hi
>>
>> On Fri, May 27, 2022 at 7:36 PM Stefan Berger <stefanb@linux.ibm.com> 
>> wrote:
>>>
>>> This series of patches resolves an issue with a TPM 2's dictionary 
>>> attack
>>> lockout logic being triggered upon well-timed VM resets. Normally, 
>>> the OS
>>> TPM driver sends a TPM2_Shutdown to the TPM 2 upon reboot and before 
>>> a VM
>>> is reset. However, the OS driver cannot do this when the user resets 
>>> a VM.
>>> In this case QEMU must send the command because otherwise several well-
>>> timed VM resets will trigger the TPM 2's dictionary attack (DA) logic 
>>> and
>>> it will then refuse to do certain key-related operations until the DA
>>> logic has timed out.
>>
>> How does real hardware deal with that situation? Shouldn't this
>> "shutdown"/reset logic be implemented on swtpm side instead, when
>> CMD_INIT is received? (when the VM is restarted)
> I don't know what real hardware can actually do when the machine is 
> reset, presumably via some reset line, or the power is removed. Probably 
> it has no way to react to this.
> 
> Typically the OS driver has to send the command and since it cannot do 
> this I would defer it to the TPM emulator reset handler code, so the 
> next layer down.

Also, when this is done in QEMU we don't need to do a data channel 
operation (run TPM2_Shutdown) from within the control channel (upon 
CMD_INIT) inside of swtpm. This way we can deal with it properly. The 
usage model for the TPM 2 prescribes that a TPM2_Shutdown must be sent 
before a shutdown or reset of the system, so let's let QEMU do it if the 
OS cannot do it.

> 
> 
> 
>>
>>>
>>> Regards,
>>>    Stefan
>>>
>>> Stefan Berger (2):
>>>    backends/tpm: Record the last command sent to the TPM
>>>    backends/tpm: Send TPM2_Shutdown upon VM reset
>>>
>>>   backends/tpm/tpm_emulator.c | 44 +++++++++++++++++++++++++++++++++++++
>>>   backends/tpm/tpm_int.h      |  3 +++
>>>   backends/tpm/tpm_util.c     |  9 ++++++++
>>>   backends/tpm/trace-events   |  1 +
>>>   include/sysemu/tpm_util.h   |  3 +++
>>>   5 files changed, 60 insertions(+)
>>>
>>> -- 
>>> 2.35.3
>>>
>>

