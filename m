Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097F95AD5CF
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 17:12:14 +0200 (CEST)
Received: from localhost ([::1]:34826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVDll-0008Ht-3m
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 11:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oVDjt-0005ue-9S; Mon, 05 Sep 2022 11:10:17 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:31440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oVDjr-0006zk-Dm; Mon, 05 Sep 2022 11:10:17 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 285EnMNJ008006;
 Mon, 5 Sep 2022 15:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=G1ZVSQbe9IXx8Q16Axw/FxEXA3GE67Xj4A3xpFNonjI=;
 b=gJ0g9cxO2qz9AIipe6btKwGXK+lgFaWc6MxY/MGDi1tN3065NfzgVw5NPYZnPJWhhU09
 HlhXVzenMyvCadUTVu/yT9PRtchZQX9v3tNpIlflaG8TcbKCkTQOkKhb1I9tmBM96cXf
 pSKaW1R2a8soO5HD3s0n6foYdNH4PP2slmyoYqlW+Tc2D0bz/uX8UYeLaOWxhs25CuaE
 0NFAtA/XKDQIcoGk7ZCjk00pVlA+HtE4epD7FSoZuX6s9eSbZbW8gSciTZA7b7yvbgxN
 ac/zHm33WPVizd4MCbGlV31a0fZ0fhSqAUtqDxpM7g5OxUYtlA242/3GuN4NZh1UX+vN XA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdk728jv6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Sep 2022 15:10:12 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 285EnTrU008183;
 Mon, 5 Sep 2022 15:10:11 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdk728ju3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Sep 2022 15:10:11 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 285F6ZmJ002479;
 Mon, 5 Sep 2022 15:10:09 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 3jbx6hswx0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Sep 2022 15:10:09 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 285F6dGT43385286
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 5 Sep 2022 15:06:39 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 234B152054;
 Mon,  5 Sep 2022 15:10:06 +0000 (GMT)
Received: from [9.171.61.194] (unknown [9.171.61.194])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 15C115204F;
 Mon,  5 Sep 2022 15:10:03 +0000 (GMT)
Message-ID: <c394823e-edd5-a722-486f-438e5fba2c9d@linux.ibm.com>
Date: Mon, 5 Sep 2022 17:10:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v9 01/10] s390x/cpus: Make absence of multithreading clear
Content-Language: en-US
To: Nico Boehr <nrb@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 frankja@linux.ibm.com
References: <20220902075531.188916-1-pmorel@linux.ibm.com>
 <20220902075531.188916-2-pmorel@linux.ibm.com>
 <166237756810.5995.16085197397341513582@t14-nrb>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <166237756810.5995.16085197397341513582@t14-nrb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bD7St4-S-x27KGZyxFTs5puOEo8dNcu3
X-Proofpoint-ORIG-GUID: _W1xAV1JIzLRbh7pjCYdniSjnfRsl10t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-05_09,2022-09-05_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209050072
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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



On 9/5/22 13:32, Nico Boehr wrote:
> Quoting Pierre Morel (2022-09-02 09:55:22)
>> S390x do not support multithreading in the guest.
>> Do not let admin falsely specify multithreading on QEMU
>> smp commandline.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   hw/s390x/s390-virtio-ccw.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>> index 70229b102b..b5ca154e2f 100644
>> --- a/hw/s390x/s390-virtio-ccw.c
>> +++ b/hw/s390x/s390-virtio-ccw.c
>> @@ -86,6 +86,9 @@ static void s390_init_cpus(MachineState *machine)
>>       MachineClass *mc = MACHINE_GET_CLASS(machine);
>>       int i;
>>   
>> +    /* Explicitely do not support threads */
>            ^
>            Explicitly
> 
>> +    assert(machine->smp.threads == 1);
> 
> It might be nicer to give a better error message to the user.
> What do you think about something like (broken whitespace ahead):
> 
>      if (machine->smp.threads != 1) {if (machine->smp.threads != 1) {
>          error_setg(&error_fatal, "More than one thread specified, but multithreading unsupported");
>          return;
>      }
> 


OK, I think I wanted to do this and I changed my mind, obviously, I do 
not recall why.
I will do almost the same but after a look at error.h I will use 
error_report()/exit() instead of error_setg()/return as in:


+    /* Explicitly do not support threads */
+    if (machine->smp.threads != 1) {
+        error_report("More than one thread specified, but 
multithreading unsupported");
+        exit(1);
+    }


Thanks,

Regards,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

