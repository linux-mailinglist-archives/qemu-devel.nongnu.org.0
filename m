Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D7C3FB37C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 11:56:30 +0200 (CEST)
Received: from localhost ([::1]:39322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKe1l-000682-Kv
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 05:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mKdzk-0004kx-Uq; Mon, 30 Aug 2021 05:54:24 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:63952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mKdzf-0006Y6-2v; Mon, 30 Aug 2021 05:54:24 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17U9XjPW119342; Mon, 30 Aug 2021 05:54:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=hDrDd9tPywbAxTfHH+Qf8kqVcr6ILgsGlXl7I+/QdSI=;
 b=NZw3rO2qjdLSS4qz8FYa/ZFNv5K4qqf3mYeCcLLAGleBjXj8XGiqvKAcFHvvkOXCD8+g
 2wGAxY66MHY8JKWU/xcdPHbDPvh0LYbNVgPvVgZ+SaEyitOvPX+BaWkwQgreaLNcWSkY
 zzPGMW4V535JJ3FlOiiVVo6vwoFLjFvaMChaQUTj/jZkT8huuIQaTiInvsErHKrPcNTQ
 cTdTiYJ5a3vvdHmbGVx2cP1C4Cj4Yax4QRAmlcp/ZTVp1mseqg++Rr3fOe8Mfom/XSpK
 t/VTZpmdZ/3YDavsHVSnxuaZ+tX7IAEPkaLUfYvmjT3mWGCKlzV1gW4SbxnYdxXGa9Hr 5A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3art4dmbvs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Aug 2021 05:54:15 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17U9YAPa124655;
 Mon, 30 Aug 2021 05:54:15 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3art4dmbv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Aug 2021 05:54:15 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17U9mtVv001164;
 Mon, 30 Aug 2021 09:54:13 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3aqcs8arce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Aug 2021 09:54:12 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17U9s9Ai17891794
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Aug 2021 09:54:09 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A8F24C059;
 Mon, 30 Aug 2021 09:54:09 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D508E4C05E;
 Mon, 30 Aug 2021 09:54:08 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.145.78.133])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 30 Aug 2021 09:54:08 +0000 (GMT)
Subject: Re: [PATCH v2 0/5] s390x: CPU Topology
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
References: <1626975764-22131-1-git-send-email-pmorel@linux.ibm.com>
 <bfd70d97-b6be-6514-4966-7f110bb89334@linux.ibm.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <142ebaed-8f5a-6f2e-7cc7-d51ca23ebc68@de.ibm.com>
Date: Mon, 30 Aug 2021 11:54:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <bfd70d97-b6be-6514-4966-7f110bb89334@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CmZIF_f90UIWyb16DB6D5ZbDiM2hQwY8
X-Proofpoint-ORIG-GUID: boYU-m63NfQdR2F0KlHL3bu6kuTSsSB8
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-30_03:2021-08-27,
 2021-08-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108300070
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.58,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 26.08.21 11:22, Pierre Morel wrote:
> 
> a gentle ping :)
> 
> I would like if you have time, comments on the architecture I propose,
> if the handling is done at the right level, KVM vs QEMU.

Do we expect changes in this series due to the discussed changes of PTF interpretion?

> 
> Therefor I added Viktor as CC.
> 
> This series is independent of the changes on -smp from Yanan Wang currently reviewed in main line.
> 
> Thanks,
> 
> Regards,
> Pierre
> 
> 
> On 7/22/21 7:42 PM, Pierre Morel wrote:
>> Hi,
>>
>> This series is a first part of the implementation of CPU topology
>> for S390 greatly reduced from the first spin.
>>
>> In particular, we reduced the scope to the S390x specificities, removing
>> all code touching to SMP or NUMA, with the goal to:
>> - facilitate review and acceptance
>> - let for later the SMP part currently actively discussed in mainline
>> - be able despite the reduction of code to handle CPU topology for S390
>>    using the current S390 topology provided by QEMU with cores and sockets
>>    only.
>>
>> To use these patches you will need the Linux series.
>> You find it there:
>> https://marc.info/?l=kvm&m=162697338719109&w=3
>>
>> Currently this code is for KVM only, I have no idea if it is interesting
>> to provide a TCG patch. If ever it will be done in another series.
>>
>> ====================
>> A short introduction
>> ====================
>>
>> CPU Topology is described in the S390 POP with essentially the description
>> of two instructions:
>>
>> PTF Perform Topology function used to poll for topology change
>>      and used to set the polarization but this part is not part of this item.
>>
>> STSI Store System Information and the SYSIB 15.1.x providing the Topology
>>      configuration.
>>
>> S390 Topology is a 6 levels hierarchical topology with up to 5 level
>>      of containers. The last topology level, specifying the CPU cores.
>>
>>      This patch series only uses the two lower levels sockets and cores.
>>      To get the information on the topology, S390 provides the STSI
>>      instruction, which stores a structures providing the list of the
>>      containers used in the Machine topology: the SYSIB.
>>      A selector within the STSI instruction allow to chose how many topology
>>      levels will be provide in the SYSIB.
>>
>>      Using the Topology List Entries (TLE) provided inside the SYSIB we
>>      the Linux kernel is able to compute the information about the cache
>>      distance between two cores and can use this information to take
>>      scheduling decisions.
>>
>> Note:
>> -----
>>       Z15 reports 3 levels of containers, drawers, book, sockets as
>>       Container-TLEs above the core description inside CPU-TLEs.
>>
>> The Topology can be seen at several places inside zLinux:
>>      - sysfs: /sys/devices/system/cpu/cpuX/topology
>>      - procfs: /proc/sysinfo and /proc/cpuinfo
>>      - lscpu -e : gives toplogy information
>>
>> The different Topology levels have names:
>>      - Node - Drawer - Book - sockets or physical package - core
>>
>> Threads:
>>      Multithreading, is not part of the topology as described by the
>>      SYSIB 15.1.x
>>
>> The interest of the guest to know the CPU topology is obviously to be
>> able to optimise the load balancing and the migration of threads.
>> KVM will have the same interest concerning vCPUs scheduling and cache
>> optimisation.
>>
>>
>> ==========
>> The design
>> ==========
>>
>> 1) To be ready for hotplug, I chose an Object oriented design
>> of the topology containers:
>> - A node is a bridge on the SYSBUS and defines a "node bus"
>> - A drawer is hotplug on the "node bus"
>> - A book on the "drawer bus"
>> - A socket on the "book bus"
>> - And the CPU Topology List Entry (CPU-TLE)sits on the socket bus.
>> These objects will be enhanced with the cache information when
>> NUMA is implemented.
>>
>> This also allows for easy retrieval when building the different SYSIB
>> for Store Topology System Information (STSI)
>>
>> 2) Perform Topology Function (PTF) instruction is made available to the
>> guest with a new KVM capability and intercepted in QEMU, allowing the
>> guest to pool for topology changes.
>>
>>
>> =====================
>> Features and TBD list
>> =====================
>>
>> - There is no direct match between IDs shown by:
>>      - lscpu (unrelated numbered list),
>>      - SYSIB 15.1.x (topology ID)
>>
>> - The CPU number, left column of lscpu, is used to reference a CPU
>>      by Linux tools
>>      While the CPU address is used by QEMU for hotplug.
>>
>> - Effect of -smp parsing on the topology with an example:
>>      -smp 9,sockets=4,cores=4,maxcpus=16
>>
>>      We have 4 socket each holding 4 cores so that we have a maximum
>>      of 16 CPU, 9 of them are active on boot. (Should be obvious)
>>
>> # lscpu -e
>> CPU NODE DRAWER BOOK SOCKET CORE L1d:L1i:L2d:L2i ONLINE CONFIGURED POLARIZATION ADDRESS
>>    0    0      0    0      0    0 0:0:0:0            yes yes        horizontal   0
>>    1    0      0    0      0    1 1:1:1:1            yes yes        horizontal   1
>>    2    0      0    0      0    2 2:2:2:2            yes yes        horizontal   2
>>    3    0      0    0      0    3 3:3:3:3            yes yes        horizontal   3
>>    4    0      0    0      1    4 4:4:4:4            yes yes        horizontal   4
>>    5    0      0    0      1    5 5:5:5:5            yes yes        horizontal   5
>>    6    0      0    0      1    6 6:6:6:6            yes yes        horizontal   6
>>    7    0      0    0      1    7 7:7:7:7            yes yes        horizontal   7
>>    8    0      0    0      2    8 8:8:8:8            yes yes        horizontal   8
>> #
>>
>>
>> - To plug a new CPU inside the topology one can simply use the CPU
>>      address like in:
>> (qemu) device_add host-s390x-cpu,core-id=12
>> # lscpu -e
>> CPU NODE DRAWER BOOK SOCKET CORE L1d:L1i:L2d:L2i ONLINE CONFIGURED POLARIZATION ADDRESS
>>    0    0      0    0      0    0 0:0:0:0            yes yes        horizontal   0
>>    1    0      0    0      0    1 1:1:1:1            yes yes        horizontal   1
>>    2    0      0    0      0    2 2:2:2:2            yes yes        horizontal   2
>>    3    0      0    0      0    3 3:3:3:3            yes yes        horizontal   3
>>    4    0      0    0      1    4 4:4:4:4            yes yes        horizontal   4
>>    5    0      0    0      1    5 5:5:5:5            yes yes        horizontal   5
>>    6    0      0    0      1    6 6:6:6:6            yes yes        horizontal   6
>>    7    0      0    0      1    7 7:7:7:7            yes yes        horizontal   7
>>    8    0      0    0      2    8 8:8:8:8            yes yes        horizontal   8
>>    9    -      -    -      -    - :::                 no yes        horizontal   12
>> # chcpu -e 9
>> CPU 9 enabled
>> # lscpu -e
>> CPU NODE DRAWER BOOK SOCKET CORE L1d:L1i:L2d:L2i ONLINE CONFIGURED POLARIZATION ADDRESS
>>    0    0      0    0      0    0 0:0:0:0            yes yes        horizontal   0
>>    1    0      0    0      0    1 1:1:1:1            yes yes        horizontal   1
>>    2    0      0    0      0    2 2:2:2:2            yes yes        horizontal   2
>>    3    0      0    0      0    3 3:3:3:3            yes yes        horizontal   3
>>    4    0      0    0      1    4 4:4:4:4            yes yes        horizontal   4
>>    5    0      0    0      1    5 5:5:5:5            yes yes        horizontal   5
>>    6    0      0    0      1    6 6:6:6:6            yes yes        horizontal   6
>>    7    0      0    0      1    7 7:7:7:7            yes yes        horizontal   7
>>    8    0      0    0      2    8 8:8:8:8            yes yes        horizontal   8
>>    9    0      0    0      3    9 9:9:9:9            yes yes        horizontal   12
>> #
>>
>> It is up to the admin level, Libvirt for example, to pin the righ CPU to the right
>> vCPU, but as we can see without NUMA, chosing separate sockets for CPUs is not easy
>> without hotplug because without information the code will assign the vCPU and fill
>> the sockets one after the other.
>> Note that this is also the default behavior on the LPAR.
>>
>>
>> Regards,
>> Pierre
>>
>> Pierre Morel (5):
>>    s390x: kvm: topology: Linux header update
>>    s390x: kvm: topology: interception of PTF instruction
>>    s390x: topology: CPU topology objects and structures
>>    s390x: topology: Topology list entries and SYSIB 15.x.x
>>    s390x: topology: implementating Store Topology System Information
>>
>>   hw/s390x/cpu-topology.c            | 334 +++++++++++++++++++++++++++++
>>   hw/s390x/meson.build               |   1 +
>>   hw/s390x/s390-virtio-ccw.c         |  49 +++++
>>   include/hw/s390x/cpu-topology.h    |  67 ++++++
>>   include/hw/s390x/s390-virtio-ccw.h |   7 +
>>   linux-headers/linux/kvm.h          |   1 +
>>   target/s390x/cpu.h                 |  44 ++++
>>   target/s390x/kvm/kvm.c             | 122 +++++++++++
>>   8 files changed, 625 insertions(+)
>>   create mode 100644 hw/s390x/cpu-topology.c
>>   create mode 100644 include/hw/s390x/cpu-topology.h
>>
> 

