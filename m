Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5A93D2B62
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 19:48:33 +0200 (CEST)
Received: from localhost ([::1]:41516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6coD-0005PT-07
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 13:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m6cit-0005hi-Kt; Thu, 22 Jul 2021 13:43:04 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:11594
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m6cir-00042v-H2; Thu, 22 Jul 2021 13:43:03 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16MHYETf043574; Thu, 22 Jul 2021 13:43:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version; s=pp1;
 bh=1UjlNWJ8fbW9y2UeXhWyngGmsOyANAAY3yuXoabLbC8=;
 b=A5WI9yx2O18DCFAilcmHduPI6RP4d5dOODg6SMg2UH/FMwNJAGFIhAr1FySokOH2oDFv
 XLb4+UjZrbW+1qMPS3G5RYefNc2fBRpIXT4cDTb4kdY/CGGsD43ha5NGJM2IbOWR4O4d
 Or2wCyDM2oyNp9kA4HwafXzu5jGrFsjwirZhkvndYfurdqV88pgrcDtEj+Vh7PElieWe
 YEOjYV9FEaWftz1ZZkAJ9ukpzRrqG9WaT1RroNXhYSWQig0S/Sk5HhftIjLt2veSRJPP
 vECWSLpsnVP6TYyMOTZMhd4DXQCOQWv/XmjmOGR+q78xgFGU6qt0BP037+wpedoS03E8 uQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39yah37cgq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 13:42:59 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16MHgxbi106537;
 Thu, 22 Jul 2021 13:42:59 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39yah37cfw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 13:42:59 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16MHYLuO017534;
 Thu, 22 Jul 2021 17:42:57 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 39upu8am1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 17:42:57 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16MHgr6W28377486
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Jul 2021 17:42:53 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5BC311C054;
 Thu, 22 Jul 2021 17:42:53 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3826211C04A;
 Thu, 22 Jul 2021 17:42:53 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.18.177])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 22 Jul 2021 17:42:53 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v2 0/5] s390x: CPU Topology
Date: Thu, 22 Jul 2021 19:42:39 +0200
Message-Id: <1626975764-22131-1-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dGrv6SXGNMmdRMMumUSXkABqMcyWHqpJ
X-Proofpoint-GUID: -DUVkQ0g-bzkXSSgOjELWarAU9_Pe4u7
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-22_12:2021-07-22,
 2021-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=965 spamscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107220116
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series is a first part of the implementation of CPU topology
for S390 greatly reduced from the first spin.

In particular, we reduced the scope to the S390x specificities, removing
all code touching to SMP or NUMA, with the goal to:
- facilitate review and acceptance
- let for later the SMP part currently actively discussed in mainline
- be able despite the reduction of code to handle CPU topology for S390
  using the current S390 topology provided by QEMU with cores and sockets
  only.

To use these patches you will need the Linux series.
You find it there:
https://marc.info/?l=kvm&m=162697338719109&w=3

Currently this code is for KVM only, I have no idea if it is interesting
to provide a TCG patch. If ever it will be done in another series.

====================
A short introduction
====================

CPU Topology is described in the S390 POP with essentially the description
of two instructions:

PTF Perform Topology function used to poll for topology change
    and used to set the polarization but this part is not part of this item.

STSI Store System Information and the SYSIB 15.1.x providing the Topology
    configuration.

S390 Topology is a 6 levels hierarchical topology with up to 5 level
    of containers. The last topology level, specifying the CPU cores.

    This patch series only uses the two lower levels sockets and cores.
    
    To get the information on the topology, S390 provides the STSI
    instruction, which stores a structures providing the list of the
    containers used in the Machine topology: the SYSIB.
    A selector within the STSI instruction allow to chose how many topology
    levels will be provide in the SYSIB.

    Using the Topology List Entries (TLE) provided inside the SYSIB we
    the Linux kernel is able to compute the information about the cache
    distance between two cores and can use this information to take
    scheduling decisions.

Note:
-----
     Z15 reports 3 levels of containers, drawers, book, sockets as
     Container-TLEs above the core description inside CPU-TLEs.

The Topology can be seen at several places inside zLinux:
    - sysfs: /sys/devices/system/cpu/cpuX/topology
    - procfs: /proc/sysinfo and /proc/cpuinfo
    - lscpu -e : gives toplogy information

The different Topology levels have names:
    - Node - Drawer - Book - sockets or physical package - core

Threads:
    Multithreading, is not part of the topology as described by the
    SYSIB 15.1.x

The interest of the guest to know the CPU topology is obviously to be
able to optimise the load balancing and the migration of threads.
KVM will have the same interest concerning vCPUs scheduling and cache
optimisation.


==========
The design
==========

1) To be ready for hotplug, I chose an Object oriented design
of the topology containers:
- A node is a bridge on the SYSBUS and defines a "node bus"
- A drawer is hotplug on the "node bus"
- A book on the "drawer bus"
- A socket on the "book bus"
- And the CPU Topology List Entry (CPU-TLE)sits on the socket bus.
These objects will be enhanced with the cache information when
NUMA is implemented.

This also allows for easy retrieval when building the different SYSIB
for Store Topology System Information (STSI)

2) Perform Topology Function (PTF) instruction is made available to the
guest with a new KVM capability and intercepted in QEMU, allowing the
guest to pool for topology changes.


=====================
Features and TBD list
=====================

- There is no direct match between IDs shown by:
    - lscpu (unrelated numbered list),
    - SYSIB 15.1.x (topology ID)

- The CPU number, left column of lscpu, is used to reference a CPU
    by Linux tools
    While the CPU address is used by QEMU for hotplug.

- Effect of -smp parsing on the topology with an example:
    -smp 9,sockets=4,cores=4,maxcpus=16

    We have 4 socket each holding 4 cores so that we have a maximum 
    of 16 CPU, 9 of them are active on boot. (Should be obvious)

# lscpu -e
CPU NODE DRAWER BOOK SOCKET CORE L1d:L1i:L2d:L2i ONLINE CONFIGURED POLARIZATION ADDRESS
  0    0      0    0      0    0 0:0:0:0            yes yes        horizontal   0
  1    0      0    0      0    1 1:1:1:1            yes yes        horizontal   1
  2    0      0    0      0    2 2:2:2:2            yes yes        horizontal   2
  3    0      0    0      0    3 3:3:3:3            yes yes        horizontal   3
  4    0      0    0      1    4 4:4:4:4            yes yes        horizontal   4
  5    0      0    0      1    5 5:5:5:5            yes yes        horizontal   5
  6    0      0    0      1    6 6:6:6:6            yes yes        horizontal   6
  7    0      0    0      1    7 7:7:7:7            yes yes        horizontal   7
  8    0      0    0      2    8 8:8:8:8            yes yes        horizontal   8
# 


- To plug a new CPU inside the topology one can simply use the CPU
    address like in:
  
(qemu) device_add host-s390x-cpu,core-id=12
# lscpu -e
CPU NODE DRAWER BOOK SOCKET CORE L1d:L1i:L2d:L2i ONLINE CONFIGURED POLARIZATION ADDRESS
  0    0      0    0      0    0 0:0:0:0            yes yes        horizontal   0
  1    0      0    0      0    1 1:1:1:1            yes yes        horizontal   1
  2    0      0    0      0    2 2:2:2:2            yes yes        horizontal   2
  3    0      0    0      0    3 3:3:3:3            yes yes        horizontal   3
  4    0      0    0      1    4 4:4:4:4            yes yes        horizontal   4
  5    0      0    0      1    5 5:5:5:5            yes yes        horizontal   5
  6    0      0    0      1    6 6:6:6:6            yes yes        horizontal   6
  7    0      0    0      1    7 7:7:7:7            yes yes        horizontal   7
  8    0      0    0      2    8 8:8:8:8            yes yes        horizontal   8
  9    -      -    -      -    - :::                 no yes        horizontal   12
# chcpu -e 9
CPU 9 enabled
# lscpu -e
CPU NODE DRAWER BOOK SOCKET CORE L1d:L1i:L2d:L2i ONLINE CONFIGURED POLARIZATION ADDRESS
  0    0      0    0      0    0 0:0:0:0            yes yes        horizontal   0
  1    0      0    0      0    1 1:1:1:1            yes yes        horizontal   1
  2    0      0    0      0    2 2:2:2:2            yes yes        horizontal   2
  3    0      0    0      0    3 3:3:3:3            yes yes        horizontal   3
  4    0      0    0      1    4 4:4:4:4            yes yes        horizontal   4
  5    0      0    0      1    5 5:5:5:5            yes yes        horizontal   5
  6    0      0    0      1    6 6:6:6:6            yes yes        horizontal   6
  7    0      0    0      1    7 7:7:7:7            yes yes        horizontal   7
  8    0      0    0      2    8 8:8:8:8            yes yes        horizontal   8
  9    0      0    0      3    9 9:9:9:9            yes yes        horizontal   12
#

It is up to the admin level, Libvirt for example, to pin the righ CPU to the right
vCPU, but as we can see without NUMA, chosing separate sockets for CPUs is not easy
without hotplug because without information the code will assign the vCPU and fill
the sockets one after the other.
Note that this is also the default behavior on the LPAR.


Regards,
Pierre

Pierre Morel (5):
  s390x: kvm: topology: Linux header update
  s390x: kvm: topology: interception of PTF instruction
  s390x: topology: CPU topology objects and structures
  s390x: topology: Topology list entries and SYSIB 15.x.x
  s390x: topology: implementating Store Topology System Information

 hw/s390x/cpu-topology.c            | 334 +++++++++++++++++++++++++++++
 hw/s390x/meson.build               |   1 +
 hw/s390x/s390-virtio-ccw.c         |  49 +++++
 include/hw/s390x/cpu-topology.h    |  67 ++++++
 include/hw/s390x/s390-virtio-ccw.h |   7 +
 linux-headers/linux/kvm.h          |   1 +
 target/s390x/cpu.h                 |  44 ++++
 target/s390x/kvm/kvm.c             | 122 +++++++++++
 8 files changed, 625 insertions(+)
 create mode 100644 hw/s390x/cpu-topology.c
 create mode 100644 include/hw/s390x/cpu-topology.h

-- 
2.25.1


