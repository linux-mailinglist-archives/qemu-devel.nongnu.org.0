Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C7E3C8922
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 18:57:07 +0200 (CEST)
Received: from localhost ([::1]:40682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3iC2-0005lS-8c
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 12:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m3i8Z-0007NC-8B; Wed, 14 Jul 2021 12:53:31 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:7336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m3i8W-0000yz-0R; Wed, 14 Jul 2021 12:53:31 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16EGXsGv089891; Wed, 14 Jul 2021 12:53:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=9lSGitzm2dN+694ZD8HntCafu53PObziIm4EetvXqO4=;
 b=s3/1LMKD8ldZ/1Jucx9niu/SjuMCBtRD+/Lj+VhfmtRew23nwOLDqW8Pjvof6qRdfKSa
 pjNtbG1r9stSAZ+HBrAXwW23DPAL5NKtYiORPPkFTHiwgG5eHWLJPkDPucd1W3ll6FM3
 e1pmfdw4VZ1DSRsjopF0pd3fzJVZhI9a26NssgipcdYimZasVQGwOoNlh0Pr5OH0fF3A
 dWDj4FHW5FqGZrGxWy+biTaEOVUTgejA7rmyFNlzGebOrc8Tgudk4WnDbVMmXfTKiPeX
 RwQkzM0JEJhgDsHsrSyGftLjlRwpDRYQWzo3HMBMaSnvM51ZP60Ame8dzXPvWsCklHAe jQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39sufyfvqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 12:53:24 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16EGYNTY097562;
 Wed, 14 Jul 2021 12:53:24 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39sufyfvpb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 12:53:23 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16EGrLhD016232;
 Wed, 14 Jul 2021 16:53:21 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 39q368h021-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 16:53:21 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16EGrIYT32571680
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 16:53:18 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C09CA405F;
 Wed, 14 Jul 2021 16:53:18 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EA15A4054;
 Wed, 14 Jul 2021 16:53:17 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.181.132])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Jul 2021 16:53:17 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v1 0/9] s390x: CPU Topology
Date: Wed, 14 Jul 2021 18:53:07 +0200
Message-Id: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VCfvnqQr9Nm7nvbIyHzI5haY7pqODCEn
X-Proofpoint-ORIG-GUID: VmVmnNlMZix-_6dxMicgGn4E4c-Bq6ql
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-14_08:2021-07-14,
 2021-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107140096
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, ehabkost@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, pbonzini@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series is a first part of the implementation of CPU topology
for S390.

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
    
     To get the information on the topology, S390 provides the STSI
     instruction, which stores a structures providing the list of the
     containers used in the Machine topology: the SYSIB.
     A selector within the STSI instruction allow to chose how many topology
     levels will be provide in the SYSIB.

     Using the Topology List Entries (TLE) provided inside the SYSIB we
     the Linux kernel is able to compute the information about the cache
     distance between two cores and can use this information to take
     scheduling decisions.

     We first provide a simple topology for the case QEMU does not
     use NUMA by extending the -smp argument and then we provide more
     fine grain topology in the case QEMU uses the -numa arguments.

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


====================
The design
====================

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


======================
Current implementation
======================

* qemu command line is extended with the new topology levels.
  Here a comparison with X86

for X86:
-smp [cpus=]n[,cores=cores][,threads=threads][,dies=dies][,sockets=sockets][,maxcpus=maxcpus]

old S390:
-smp [cpus=]n[,sockets=sockets][,cores=cores][,maxcpus=maxcpus]

new S390:
-smp [cpus=]n[,drawers=drawers][,books=books][,sockets=sockets][,cores=cores][,maxcpus=maxcpus]


Example:
--------

Here we want to use all cores on book 3, on socket-id 2 and the cores 0 and 1:

/usr/local/bin/qemu-system-s390x \
        -machine s390-ccw-virtio,accel=kvm \
        -enable-kvm \
        -m 10G \
        \
        -smp 15,drawers=5,books=2,sockets=2,cores=12,maxcpus=240 \
        \
        -object memory-backend-ram,id=mem0,size=2G  \
        -object memory-backend-ram,id=mem1,size=2G  \
        -object memory-backend-ram,id=mem2,size=2G  \
        -object memory-backend-ram,id=mem3,size=2G  \
        -object memory-backend-ram,id=mem4,size=2G  \
        \
        -numa node,nodeid=0,memdev=mem0\
        -numa node,nodeid=1,memdev=mem1\
        -numa node,nodeid=2,memdev=mem2\
        -numa node,nodeid=3,memdev=mem3\
        -numa node,nodeid=4,memdev=mem4\
        \
     -numa cpu,node-id=1,core-id=0 \
     -numa cpu,node-id=4,core-id=1 \
     -numa cpu,node-id=2,socket-id=2 \
     -numa cpu,node-id=3,book-id=3 \
        \
        -netdev tap,id=hn0,queues=1 \
        \
        -device virtio-net-ccw,netdev=hn0,mq=on \
        -kernel /boot/vmlinuz-${YOUR_KERNEL} \
        -initrd ${YOUR_ROOTFS} \
        -append "loglevel=8 selinux=0 root=/dev/ram earlyprintk=1" \
        -nographic

=====================
Features and TBD list
=====================

- using a default memory device

- There is a warning about all CPU should be described in NUMA config and that
  this would be obsolete in the future, I will need help to know how to 
  handle this.

- There is no direct match between IDs shown by:
  - lscpu (unrelated numbered list),
  - used by -numa cpu (numbered list related to topology)
  - SYSIB 15.1.x (topology ID)

  in the example above socket-id=6 is shown in SYSIB 15.1.x as
  socket ID 0 of Book ID 3 since a Book has 2 sockets and appear
  on lscpu as socket 2.

- The CPU number, left column of lscpu, is used to reference a CPU
  by Linux tools
  While the CPU address is used by QEMU for hotplug.

- To plug a new CPU inside the topology one can simply use the CPU
  address like in:

  (qemu) device_add host-s390x-cpu,core-id=8
CPU NODE DRAWER BOOK SOCKET CORE L1d:L1i:L2d:L2i ONLINE CONFIGURED POLARIZATION ADDRESS
  0    0      0    0      0    0 0:0:0:0            yes yes        horizontal   0
  1    0      0    1      1    1 1:1:1:1            yes yes        horizontal   24
  2    0      0    1      1    2 2:2:2:2            yes yes        horizontal   25
....
 36    0      1    3      4   36 36:36:36:36        yes yes        horizontal   94
 37    0      1    3      4   37 37:37:37:37        yes yes        horizontal   95
 38    -      -    -      -    - :::                 no yes        horizontal   8

  # chcpu -e 38


- Documentation will come with the next iteration


Regards,
Pierre

Pierre Morel (9):
  s390x: smp: s390x dedicated smp parsing
  s390x: toplogy: adding drawers and books to smp parsing
  s390x: cpu topology: CPU topology objects and structures
  s390x: Topology list entries and SYSIB 15.x.x
  s390x: topology: implementating Store Topology System Information
  s390x: kvm: topology: interception of PTF instruction
  s390x: SCLP: reporting the maximum nested topology entries
  s390x: numa: define drawers and books for NUMA
  s390x: numa: implement NUMA for S390x

 hw/core/machine.c                  |  18 +
 hw/s390x/cpu-topology.c            | 595 +++++++++++++++++++++++++++++
 hw/s390x/meson.build               |   1 +
 hw/s390x/s390-virtio-ccw.c         | 107 +++++-
 hw/s390x/sclp.c                    |   1 +
 include/hw/s390x/cpu-topology.h    |  99 +++++
 include/hw/s390x/s390-virtio-ccw.h |   3 +
 include/hw/s390x/sclp.h            |   4 +-
 qapi/machine.json                  |   2 +
 softmmu/vl.c                       |   6 +
 target/s390x/cpu.c                 |   4 +
 target/s390x/cpu.h                 |  45 +++
 target/s390x/kvm/kvm.c             | 273 +++++++++++++
 13 files changed, 1150 insertions(+), 8 deletions(-)
 create mode 100644 hw/s390x/cpu-topology.c
 create mode 100644 include/hw/s390x/cpu-topology.h

-- 
2.25.1


