Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA155EDBB2
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 13:24:29 +0200 (CEST)
Received: from localhost ([::1]:54286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odVAy-0003O8-7i
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 07:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1odSIX-0002hW-PA; Wed, 28 Sep 2022 04:20:05 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:64592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1odSIV-0000Px-Oe; Wed, 28 Sep 2022 04:20:05 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28S7V0Lo001030;
 Wed, 28 Sep 2022 08:20:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vgCI2GHYQPSqk/HJi+GmHDvRy8qMsQiIR9aMmeHoJtg=;
 b=kjDzYv+QiJeVuMXLcvXz63D3ZYw/byj9srFC4u4EgMsatE9jEpHrSA/le53PaqmQqow4
 Na49zx/H5YH/+2zdUpoajRq0Oapss30stZ55YS//BGn2dVub0b8JL+hitrXbi66edQYD
 4pez5zUb2gWgWshpHe0/zub3tI0YYVALyW3ZKpNZJh2etUzjrfQMYoxOk2o2uCKE6Tca
 OCf9nOnIK5AmKjXlAsckbQ2vb7PRPsSClqY3k0YYHwZ6tJKsoSfUjFPBv07A8Zeg0dtE
 VLtmsy0BNgxVIL14bCxj4VhnzJj1SKrB/5BMQaiuV/JmXe4GKVEvQz0HL/gGAMOqq6N8 9Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jvhxv9d9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 08:19:59 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28S7ViDU003638;
 Wed, 28 Sep 2022 08:19:54 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jvhxv9d8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 08:19:53 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28S85g2D024193;
 Wed, 28 Sep 2022 08:19:51 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3jssh9cwsf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 08:19:51 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 28S8KG6K49283506
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Sep 2022 08:20:16 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 266094C040;
 Wed, 28 Sep 2022 08:19:48 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D04D4C04A;
 Wed, 28 Sep 2022 08:19:47 +0000 (GMT)
Received: from [9.171.31.212] (unknown [9.171.31.212])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 28 Sep 2022 08:19:47 +0000 (GMT)
Message-ID: <7ac187ae-44ab-bec0-7548-823f0cf5cb45@linux.ibm.com>
Date: Wed, 28 Sep 2022 10:19:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v9 10/10] docs/s390x: document s390x cpu topology
Content-Language: en-US
To: Janis Schoetterl-Glausch <scgl@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com
References: <20220902075531.188916-1-pmorel@linux.ibm.com>
 <20220902075531.188916-11-pmorel@linux.ibm.com>
 <f1270e3783e72641a0e8a4ba138a6e858f82cc80.camel@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <f1270e3783e72641a0e8a4ba138a6e858f82cc80.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1fhHyPePNofLbm-xksBdton-ZB2PeLSO
X-Proofpoint-ORIG-GUID: wPVlCaiVCV2IEAg3ytUvCsmFViCte6o9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_03,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280048
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



On 9/12/22 15:41, Janis Schoetterl-Glausch wrote:
> On Fri, 2022-09-02 at 09:55 +0200, Pierre Morel wrote:
>> Add some basic examples for the definition of cpu topology
>> in s390x.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   docs/system/s390x/cpu_topology.rst | 88 ++++++++++++++++++++++++++++++
>>   1 file changed, 88 insertions(+)
>>   create mode 100644 docs/system/s390x/cpu_topology.rst
>>
>> diff --git a/docs/system/s390x/cpu_topology.rst b/docs/system/s390x/cpu_topology.rst
>> new file mode 100644
>> index 0000000000..00977d4319
>> --- /dev/null
>> +++ b/docs/system/s390x/cpu_topology.rst
>> @@ -0,0 +1,88 @@
>> +CPU Topology on s390x
>> +=====================
>> +
>> +CPU Topology on S390x provides up to 4 levels of topology containers:
>> +drawers, books, sockets and CPUs.
>> +While the three higher level containers, Containers Topology List Entries,
>> +(Containers TLE) define a tree hierarchy, the lowest level of topology
>> +definition, the CPU Topology List Entry (CPU TLE), provides the placement
>> +of the CPUs inside the last container.
> 
> inside the parent container

OK

>> +
>> +Prerequisites
>> +-------------
>> +
>> +To use CPU Topology a Linux QEMU/KVM machine providing the CPU Topology facility
>> +(STFLE bit 11) is required.
>> +
>> +However, since this facility has been enabled by default in an early version,
>> +the capability ``KVM_CAP_S390_CPU_TOPOLOGY`` is needed to indicate to KVM
>> +that QEMU support CPU Topology.
> 
> I don't understand this paragraph. Early version of what?

of QEMU, I add this

>> +
>> +Indicating the CPU topology to the Virtual Machine
>> +--------------------------------------------------
>> +
>> +The CPU Topology, number of drawers, number of books per drawers, number of
>> +sockets per book and number of cores per sockets is specified with the
>> +``-smp`` qemu command arguments.
>> +
>> +Like in :
>> +
>> +.. code-block:: sh
>> +    -smp cpus=1,drawers=3,books=4,sockets=2,cores=8,maxcpus=192
>> +
>> +If drawers or books are not specified, their default to 1.
>> +
>> +New CPUs can be plugged using the device_add hmp command like in:
>> +
>> +.. code-block:: sh
>> +   (qemu) device_add host-s390x-cpu,core-id=9
>> +
>> +The core-id defines the placement of the core in the topology by
>> +starting with core 0 in socket 0, book 0 and drawer 0 up to the maximum
>> +core number of the last socket of the last book in the last drawer.
>> +
>> +In the example above:
>> +
>> +* the core with ID 9 will be placed in container (0,0,1), as core 9
>> +  of CPU TLE 0 of socket 1 in book 0 from drawer 0.
>> +* the core ID 0 is defined by the -smp cpus=1 command and will be
>> +  placed as core 0 in CPU TLE 0 of container (0,0,0)
>> +
>> +Note that the core ID is machine wide and the CPU TLE masks provided
>> +by the STSI instruction will be:
>> +
>> +* in socket 0: 0x80000000 (core id 0)
>> +* in socket 1: 0x00400000 (core id 9)
>> +
>> +Indicating the CPU topology to the Guest
>> +----------------------------------------
>> +
>> +The guest can query for topology changes using the PTF instruction.
>> +In case of a topology change it can request the new topology by issuing
>> +STSI instructions specifying the level of detail required, drawer with
>> +STSI(15.1.4) or books STSI(15.1.3).
>> +
>> +The virtual machine will fill the provided buffer with the count of
>> +drawers (MAG4), books per drawer (MAG3), sockets per book (MAG2) and
>> +cores per socket (MAG1).
>> +
>> +Note that the STSI(15.1.2) is special in two ways:
>> +
>> +* When the firmware detect a change in the values calculated for STSI(15.1.2)
>> +  it will trigger the report of the topology change for the PTF instruction.
> 
> I don't know if we need this section, after all documenting this is the
> job of the principles of operation. You could just refer to the
> relevant sections.

OK, I will make it shorter

Thanks,
Pierre


-- 
Pierre Morel
IBM Lab Boeblingen

