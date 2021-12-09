Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE3346EABD
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 16:10:38 +0100 (CET)
Received: from localhost ([::1]:43580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvL49-0005pF-A8
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 10:10:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mvL2D-0003ji-CE; Thu, 09 Dec 2021 10:08:37 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:28718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mvL29-0003Bp-RD; Thu, 09 Dec 2021 10:08:36 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B9EXb8x001272; 
 Thu, 9 Dec 2021 15:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=kdj2fKIh5dzvz9ODg8okoIBLnABw+QZ72ypxqVfSmbQ=;
 b=QEX2LfxNJIyOP9PSNj8i80GFsUNu0MW9dZabmWmHgVKMVxnsEBr5azxD7t7YB6mg9WX2
 TDJzzvzAI7jUngpm4ECBZwcKPhQohKDLUpVlXvUIf74+go0YebLKohrS1F1nPovYNnh5
 shVmsmPMtxCgyVdMgSJap4M4qc9mrlOBbWrsvX4U2fkuyraeO3h06gxQH6wJhlRY2EV4
 9s5aWXJ87tskud9a1j5ljSTBFuTwl8ue6AZa4KqABL2xVaiTWPixwMCfONaOAzjkJU5v
 7eSJmPtQCqv8L/BT/kXpIBwOxLf9cz3pvMw3JLAH97FWieTxb0mVcgQr8CnT3xTZmRWH Og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cuk5k9p1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 15:08:30 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B9EL97o024128;
 Thu, 9 Dec 2021 15:08:30 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cuk5k9p0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 15:08:30 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B9F30dw015822;
 Thu, 9 Dec 2021 15:08:28 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3cqykjts4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 15:08:27 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B9F8OcQ29163960
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Dec 2021 15:08:24 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2380AE058;
 Thu,  9 Dec 2021 15:08:24 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A7E3AE045;
 Thu,  9 Dec 2021 15:08:24 +0000 (GMT)
Received: from [9.171.63.16] (unknown [9.171.63.16])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  9 Dec 2021 15:08:24 +0000 (GMT)
Message-ID: <a104b68e-f1a5-a176-a0e2-e816d2ed427f@linux.ibm.com>
Date: Thu, 9 Dec 2021 16:09:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 0/5] s390x: CPU Topology
Content-Language: en-US
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
References: <20211117164848.310952-1-pmorel@linux.ibm.com>
In-Reply-To: <20211117164848.310952-1-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: e7Erpvt_z0pIq3XjCUcvpD1tkukxpGr-
X-Proofpoint-GUID: MKq4ROEEuJk3f9ERrEZ3CXNT4gi9b2H_
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-09_06,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112090082
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.803,
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series is updated by a v5 series with documentation and numa 
extensions.
Some changes have been made in some of the patches contained in this 
series too.

Regards,
Pierre

On 11/17/21 17:48, Pierre Morel wrote:
> Hi,
> 
> This series is a first part of the implementation of CPU topology
> for S390 greatly reduced from the first spin.
> 
> In particular, we reduced the scope to the S390x specificities, removing
> all code touching to SMP or NUMA, with the goal to:
> - facilitate review and acceptance
> - let for later the SMP part currently actively discussed in mainline
> - be able despite the reduction of code to handle CPU topology for S390
>    using the current S390 topology provided by QEMU with cores and sockets
>    only.
> 
> To use these patches, you will need the Linux series version 4.
> You find it there:
> https://lkml.org/lkml/2021/9/16/576
> 
> Currently this code is for KVM only, I have no idea if it is interesting
> to provide a TCG patch. If ever it will be done in another series.
> 
> A short introduction
> ====================
> 
> CPU Topology is described in the S390 POP with essentially the description
> of two instructions:
> 
> PTF Perform Topology function used to poll for topology change
>      and used to set the polarization but this part is not part of this item.
> 
> STSI Store System Information and the SYSIB 15.1.x providing the Topology
>      configuration.
> 
> S390 Topology is a 6 levels hierarchical topology with up to 5 level
>      of containers. The last topology level, specifying the CPU cores.
> 
>      This patch series only uses the two lower levels sockets and cores.
>      
>      To get the information on the topology, S390 provides the STSI
>      instruction, which stores a structures providing the list of the
>      containers used in the Machine topology: the SYSIB.
>      A selector within the STSI instruction allow to chose how many topology
>      levels will be provide in the SYSIB.
> 
>      Using the Topology List Entries (TLE) provided inside the SYSIB we
>      the Linux kernel is able to compute the information about the cache
>      distance between two cores and can use this information to take
>      scheduling decisions.
> 
> Note:
> -----
>       Z15 reports 3 levels of containers, drawers, book, sockets as
>       Container-TLEs above the core description inside CPU-TLEs.
> 
> The Topology can be seen at several places inside zLinux:
>      - sysfs: /sys/devices/system/cpu/cpuX/topology
>      - procfs: /proc/sysinfo and /proc/cpuinfo
>      - lscpu -e : gives toplogy information
> 
> The different Topology levels have names:
>      - Node - Drawer - Book - sockets or physical package - core
> 
> Threads:
>      Multithreading, is not part of the topology as described by the
>      SYSIB 15.1.x
> 
> The interest of the guest to know the CPU topology is obviously to be
> able to optimise the load balancing and the migration of threads.
> KVM will have the same interest concerning vCPUs scheduling and cache
> optimisation.
> 
> 
> The design
> ==========
> 
> 1) To be ready for hotplug, I chose an Object oriented design
> of the topology containers:
> - A node is a bridge on the SYSBUS and defines a "node bus"
> - A drawer is hotplug on the "node bus"
> - A book on the "drawer bus"
> - A socket on the "book bus"
> - And the CPU Topology List Entry (CPU-TLE)sits on the socket bus.
> These objects will be enhanced with the cache information when
> NUMA is implemented.
> 
> This also allows for easy retrieval when building the different SYSIB
> for Store Topology System Information (STSI)
> 
> 2) Perform Topology Function (PTF) instruction is made available to the
> guest with a new KVM capability and intercepted in QEMU, allowing the
> guest to pool for topology changes.
> 
> 
> Features and TBD list
> =====================
> 
> - There is no direct match between IDs shown by:
>      - lscpu (unrelated numbered list),
>      - SYSIB 15.1.x (topology ID)
> 
> - The CPU number, left column of lscpu, is used to reference a CPU
>      by Linux tools
>      While the CPU address is used by QEMU for hotplug.
> 
> - Effect of -smp parsing on the topology with an example:
>      -smp 9,sockets=4,cores=4,maxcpus=16
> 
>      We have 4 socket each holding 4 cores so that we have a maximum
>      of 16 CPU, 9 of them are active on boot. (Should be obvious)
> 
> # lscpu -e
> CPU NODE DRAWER BOOK SOCKET CORE L1d:L1i:L2d:L2i ONLINE CONFIGURED POLARIZATION ADDRESS
>    0    0      0    0      0    0 0:0:0:0            yes yes        horizontal   0
>    1    0      0    0      0    1 1:1:1:1            yes yes        horizontal   1
>    2    0      0    0      0    2 2:2:2:2            yes yes        horizontal   2
>    3    0      0    0      0    3 3:3:3:3            yes yes        horizontal   3
>    4    0      0    0      1    4 4:4:4:4            yes yes        horizontal   4
>    5    0      0    0      1    5 5:5:5:5            yes yes        horizontal   5
>    6    0      0    0      1    6 6:6:6:6            yes yes        horizontal   6
>    7    0      0    0      1    7 7:7:7:7            yes yes        horizontal   7
>    8    0      0    0      2    8 8:8:8:8            yes yes        horizontal   8
> #
> 
> 
> - To plug a new CPU inside the topology one can simply use the CPU
>      address like in:
>    
> (qemu) device_add host-s390x-cpu,core-id=12
> # lscpu -e
> CPU NODE DRAWER BOOK SOCKET CORE L1d:L1i:L2d:L2i ONLINE CONFIGURED POLARIZATION ADDRESS
>    0    0      0    0      0    0 0:0:0:0            yes yes        horizontal   0
>    1    0      0    0      0    1 1:1:1:1            yes yes        horizontal   1
>    2    0      0    0      0    2 2:2:2:2            yes yes        horizontal   2
>    3    0      0    0      0    3 3:3:3:3            yes yes        horizontal   3
>    4    0      0    0      1    4 4:4:4:4            yes yes        horizontal   4
>    5    0      0    0      1    5 5:5:5:5            yes yes        horizontal   5
>    6    0      0    0      1    6 6:6:6:6            yes yes        horizontal   6
>    7    0      0    0      1    7 7:7:7:7            yes yes        horizontal   7
>    8    0      0    0      2    8 8:8:8:8            yes yes        horizontal   8
>    9    -      -    -      -    - :::                 no yes        horizontal   12
> # chcpu -e 9
> CPU 9 enabled
> # lscpu -e
> CPU NODE DRAWER BOOK SOCKET CORE L1d:L1i:L2d:L2i ONLINE CONFIGURED POLARIZATION ADDRESS
>    0    0      0    0      0    0 0:0:0:0            yes yes        horizontal   0
>    1    0      0    0      0    1 1:1:1:1            yes yes        horizontal   1
>    2    0      0    0      0    2 2:2:2:2            yes yes        horizontal   2
>    3    0      0    0      0    3 3:3:3:3            yes yes        horizontal   3
>    4    0      0    0      1    4 4:4:4:4            yes yes        horizontal   4
>    5    0      0    0      1    5 5:5:5:5            yes yes        horizontal   5
>    6    0      0    0      1    6 6:6:6:6            yes yes        horizontal   6
>    7    0      0    0      1    7 7:7:7:7            yes yes        horizontal   7
>    8    0      0    0      2    8 8:8:8:8            yes yes        horizontal   8
>    9    0      0    0      3    9 9:9:9:9            yes yes        horizontal   12
> #
> 
> It is up to the admin level, Libvirt for example, to pin the righ CPU to the right
> vCPU, but as we can see without NUMA, chosing separate sockets for CPUs is not easy
> without hotplug because without information the code will assign the vCPU and fill
> the sockets one after the other.
> Note that this is also the default behavior on the LPAR.
> 
> Conclusion
> ==========
> 
> This patch, together with the associated KVM patch allows to provide CPU topology
> information to the guest.
> Currently, only dedicated vCPU and CPU are supported and a NUMA topology can only
> be handled using CPU hotplug inside the guest.
> 
> Next extensions are to provide:
> - adding books and drawers levels
> - NUMA using the -numa QEMU parameter.
> - Topology information change for shared CPU
> 
> Regards,
> Pierre
> 
> Pierre Morel (5):
>    linux-headers update
>    s390x: topology: CPU topology objects and structures
>    s390x: topology: implementating Store Topology System Information
>    s390x: CPU topology: CPU topology migration
>    s390x: kvm: topology: interception of PTF instruction
> 
>   hw/s390x/cpu-topology.c             | 361 ++++++++++++++++++++++++++++
>   hw/s390x/meson.build                |   1 +
>   hw/s390x/s390-virtio-ccw.c          |  54 +++++
>   include/hw/s390x/cpu-topology.h     |  74 ++++++
>   include/hw/s390x/s390-virtio-ccw.h  |   6 +
>   linux-headers/linux/kvm.h           |   1 +
>   target/s390x/cpu.h                  |  50 ++++
>   target/s390x/cpu_features_def.h.inc |   1 +
>   target/s390x/cpu_models.c           |   2 +
>   target/s390x/cpu_topology.c         | 113 +++++++++
>   target/s390x/gen-features.c         |   3 +
>   target/s390x/kvm/kvm.c              |  26 ++
>   target/s390x/machine.c              |  48 ++++
>   target/s390x/meson.build            |   1 +
>   14 files changed, 741 insertions(+)
>   create mode 100644 hw/s390x/cpu-topology.c
>   create mode 100644 include/hw/s390x/cpu-topology.h
>   create mode 100644 target/s390x/cpu_topology.c
> 

-- 
Pierre Morel
IBM Lab Boeblingen

