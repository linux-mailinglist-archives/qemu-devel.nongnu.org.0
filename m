Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5BB5EDF42
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 16:54:11 +0200 (CEST)
Received: from localhost ([::1]:57050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odYRu-0004xw-Ug
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 10:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1odX0P-00076z-1g; Wed, 28 Sep 2022 09:21:47 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1odX0M-0007fT-Bm; Wed, 28 Sep 2022 09:21:40 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28SChGX6006075;
 Wed, 28 Sep 2022 13:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vPzLLnjSI8dYz88u2ZUiK+qlhcT6/Tdl8G9dDpLZBTw=;
 b=UrZ3aIdAv3ubpp0AhbIYp+e74Axtnq4PZj/ttcACKdGV7CTyymmRYXeu8di8I1TYKrGf
 7J4rA5cbm2d7LmAiK9TmlITbhLfPDYUL4iEHNUtSQgd+qiZmsTE5KxOpxAApWzZzaT+x
 ZBu+DEnQCu3dbZ6Ek3x1/Xm8guqbELLPLeqOQL+JU/zDBnV7UWkCcSXTF62HPbULzAhC
 PDpaYvhsP4oOIb4bl7PDV0g2gzqfrOvU8NIfWiPbS7e1qQ30PBxBwSLSpuTShJVlPWeZ
 r2dPu7R/cWc4ue46jduueBkRCJ5Bz+JaS4XjXQwv0ZM7Ubp/LLThnfZi7hbfyr7+X3kO /Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jvmtr4fa5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 13:21:33 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28SC4vM1028989;
 Wed, 28 Sep 2022 13:21:32 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jvmtr4f80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 13:21:32 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28SD7WMQ021143;
 Wed, 28 Sep 2022 13:21:29 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3jss5j59xu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 13:21:29 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28SDLQhe64684342
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Sep 2022 13:21:26 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE9044C046;
 Wed, 28 Sep 2022 13:21:26 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CB084C04A;
 Wed, 28 Sep 2022 13:21:25 +0000 (GMT)
Received: from [9.171.31.212] (unknown [9.171.31.212])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 28 Sep 2022 13:21:25 +0000 (GMT)
Message-ID: <724d962a-c11b-c18d-f67f-9010eb2f32e2@linux.ibm.com>
Date: Wed, 28 Sep 2022 15:21:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v9 01/10] s390x/cpus: Make absence of multithreading clear
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Nico Boehr <nrb@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 frankja@linux.ibm.com
References: <20220902075531.188916-1-pmorel@linux.ibm.com>
 <20220902075531.188916-2-pmorel@linux.ibm.com>
 <166237756810.5995.16085197397341513582@t14-nrb>
 <c394823e-edd5-a722-486f-438e5fba2c9d@linux.ibm.com>
 <0d3fd34e-d060-c72e-ee19-e9054e06832a@kaod.org>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <0d3fd34e-d060-c72e-ee19-e9054e06832a@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -mtszjlEy56KIsMK3Dc5_tfkQm-2nudz
X-Proofpoint-ORIG-GUID: 9wXwODKGJ_Hkj2OfF8B1ymC0WwsadxTm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_05,2022-09-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 phishscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280081
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/27/22 11:44, Cédric Le Goater wrote:
> On 9/5/22 17:10, Pierre Morel wrote:
>>
>>
>> On 9/5/22 13:32, Nico Boehr wrote:
>>> Quoting Pierre Morel (2022-09-02 09:55:22)
>>>> S390x do not support multithreading in the guest.
>>>> Do not let admin falsely specify multithreading on QEMU
>>>> smp commandline.
>>>>
>>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>>> ---
>>>>   hw/s390x/s390-virtio-ccw.c | 3 +++
>>>>   1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>>>> index 70229b102b..b5ca154e2f 100644
>>>> --- a/hw/s390x/s390-virtio-ccw.c
>>>> +++ b/hw/s390x/s390-virtio-ccw.c
>>>> @@ -86,6 +86,9 @@ static void s390_init_cpus(MachineState *machine)
>>>>       MachineClass *mc = MACHINE_GET_CLASS(machine);
>>>>       int i;
>>>> +    /* Explicitely do not support threads */
>>>            ^
>>>            Explicitly
>>>
>>>> +    assert(machine->smp.threads == 1);
>>>
>>> It might be nicer to give a better error message to the user.
>>> What do you think about something like (broken whitespace ahead):
>>>
>>>      if (machine->smp.threads != 1) {if (machine->smp.threads != 1) {
>>>          error_setg(&error_fatal, "More than one thread specified, 
>>> but multithreading unsupported");
>>>          return;
>>>      }
>>>
>>
>>
>> OK, I think I wanted to do this and I changed my mind, obviously, I do 
>> not recall why.
>> I will do almost the same but after a look at error.h I will use 
>> error_report()/exit() instead of error_setg()/return as in:
>>
>>
>> +    /* Explicitly do not support threads */
>> +    if (machine->smp.threads != 1) {
>> +        error_report("More than one thread specified, but 
>> multithreading unsupported");
>> +        exit(1);
>> +    }
> 
> 
> or add an 'Error **errp' parameter to s390_init_cpus() and use error_setg()
> as initially proposed. s390x_new_cpu() would benefit from it also.
> 
OK, Thanks,

Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

