Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B407953384B
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 10:21:17 +0200 (CEST)
Received: from localhost ([::1]:33136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntmGa-0005BW-K6
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 04:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1ntmAS-0002WV-Ho; Wed, 25 May 2022 04:14:57 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:27668
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1ntmAP-0003bT-I9; Wed, 25 May 2022 04:14:55 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24P6LQGQ005426;
 Wed, 25 May 2022 08:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=uEBYO+e60+IFOnmJXz37vIP5yYWYTXwOrvlfEPQzNas=;
 b=QAbDTyB7+YIwPjm4g+x4EaMyz0FlyMspL+etdChECU+w5BMY9SqjQeVcwami846tif43
 uiDhzbcnxKQdGo3x0Qy4ERgQoOTVhxGY1D9QMc1R3hFwUT211bczNvr9W2okffGmxVyJ
 Bx5D97kYBPJCRIDQD+bhXevRp+694mHEz8JBopUWYZOzL4pREJh3KUYDtdZGwGYu9f39
 mIapO8c8pFTOJzS6AM1HuoCaZ1xiQQhTrYfKRRxttHy/e2kkElQAetCrSKr462jjryGw
 z7bUnH18LvQN6RWinL6VqLfu+TGO8WPyAl5ttorKO+f3BvvGINzi/BzKFcR0CO0ltKN3 Hg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9f45j5ba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 08:14:51 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24P7uCTj000648;
 Wed, 25 May 2022 08:14:51 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9f45j5an-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 08:14:51 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24P85g2C001309;
 Wed, 25 May 2022 08:14:49 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 3g948n05ng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 08:14:49 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24P8Ekh515401368
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 May 2022 08:14:46 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 302E0A404D;
 Wed, 25 May 2022 08:14:46 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 429AFA4051;
 Wed, 25 May 2022 08:14:45 +0000 (GMT)
Received: from [9.171.31.97] (unknown [9.171.31.97])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 25 May 2022 08:14:45 +0000 (GMT)
Message-ID: <3e3eccc1-cb74-671d-6c76-9b2fe75f7465@linux.ibm.com>
Date: Wed, 25 May 2022 10:18:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v7 04/13] s390x: topology: implementating Store Topology
 System Information
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, philmd@redhat.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com
References: <20220420115745.13696-1-pmorel@linux.ibm.com>
 <20220420115745.13696-5-pmorel@linux.ibm.com>
 <3dba48f5-7e12-31b6-24b5-573956219020@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <3dba48f5-7e12-31b6-24b5-573956219020@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pDnvCLv_Awnu5QCqZZOHZydDIYvdZG7w
X-Proofpoint-ORIG-GUID: UzPhlr3lEFQu7QQ9AybBctvMcCJIyj-n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-25_02,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205250037
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
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



On 5/24/22 13:08, Thomas Huth wrote:
> On 20/04/2022 13.57, Pierre Morel wrote:
>> The handling of STSI is enhanced with the interception of the
>> function code 15 for storing CPU topology.
>>
>> Using the objects built during the pluging of CPU, we build the
> 
> s/pluging/plugging/
> 

Yes

>> SYSIB 15_1_x structures.
>>
>> With this patch the maximum MNEST level is 2, this is also
>> the only level allowed and only SYSIB 15_1_2 will be built.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
> ...
>> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
>> index f6969b76c5..a617c943ff 100644
>> --- a/target/s390x/cpu.h
>> +++ b/target/s390x/cpu.h
>> @@ -889,4 +889,5 @@ S390CPU *s390_cpu_addr2state(uint16_t cpu_addr);
>>   #include "exec/cpu-all.h"
>> +void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar);
>>   #endif
> 
> Please keep an empty line before the #endif

OK

> 
>> diff --git a/target/s390x/cpu_topology.c b/target/s390x/cpu_topology.c
>> new file mode 100644
>> index 0000000000..7f6db18829
>> --- /dev/null
>> +++ b/target/s390x/cpu_topology.c
>> @@ -0,0 +1,112 @@
>> +/*
>> + * QEMU S390x CPU Topology
>> + *
>> + * Copyright IBM Corp. 2021
> 
> 2022 ?

Yes too

> 
>> + * Author(s): Pierre Morel <pmorel@linux.ibm.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or 
>> (at
>> + * your option) any later version. See the COPYING file in the top-level
>> + * directory.
>> + */
> ...
>> +void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar)
>> +{
>> +    const MachineState *machine = MACHINE(qdev_get_machine());
>> +    void *p;
>> +    int ret, cc;
>> +
>> +    /*
>> +     * Until the SCLP STSI Facility reporting the MNEST value is used,
>> +     * a sel2 value of 2 is the only value allowed in STSI 15.1.x.
>> +     */
>> +    if (sel2 != 2) {
>> +        setcc(cpu, 3);
>> +        return;
>> +    }
>> +
>> +    p = g_malloc0(TARGET_PAGE_SIZE);
>> +
>> +    setup_stsi(machine, p, 2);
>> +
>> +    if (s390_is_pv()) {
>> +        ret = s390_cpu_pv_mem_write(cpu, 0, p, TARGET_PAGE_SIZE);
>> +    } else {
>> +        ret = s390_cpu_virt_mem_write(cpu, addr, ar, p, 
>> TARGET_PAGE_SIZE);
>> +    }
>> +    cc = ret ? 3 : 0;
>> +    setcc(cpu, cc);
> 
> Just a matter of taste (i.e. keep it if you like) - but you could 
> scratch the cc variable in this function by just doing:
> 
>      setcc(cpu, ret ? 3 : 0);
> 

OK, I will changes all occurences

Thanks,
Pierre

>> +    g_free(p);
>> +}
>> +
> 
>   Thomas
> 

-- 
Pierre Morel
IBM Lab Boeblingen

