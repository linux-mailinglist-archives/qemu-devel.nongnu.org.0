Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 069885FC943
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 18:28:43 +0200 (CEST)
Received: from localhost ([::1]:53110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oieb4-0006wS-4F
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 12:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oieU5-0003bR-AR; Wed, 12 Oct 2022 12:21:29 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:28800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oieU2-00088v-Ph; Wed, 12 Oct 2022 12:21:28 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CFCYJi029528;
 Wed, 12 Oct 2022 16:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=zZT2uzSpT3q9XjUcEP7tqYMqB0dCmsWj/XCbAGFuCo8=;
 b=Eq/unVxBzrjpLYHYS9S+c1yLOFpSQJCKywlHN2lKipH9favCsMSHpmzJd3By9PjWhAPB
 MUelE9Ys6J/fanPmQxQEs+p4Lzutg2f9SwyjTvldhnS8x5qS9cbL/8GOgfUHt+BwgCwf
 Y6WLQ0J7OOGbFYPSQeMKuJqmxzNTz3MGeFTTYCnQQS9vyo9Z2jdNQ4EQoLrgQ7lRIfCz
 lkU/ozMEzuiS4jsgh1iyFH11r+296vRS8Rmp0Bmifxyc2mXKD9tTjNQj3Rg60Q7RtI/x
 qAFkHTY028fJHCeinh6XhH8DSXGatEocEb0oMVMDTfI0tgHWQr+tJckWgTV5/kOX24vE aQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k5xwvmcq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 16:21:19 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29CFDpol035001;
 Wed, 12 Oct 2022 16:21:18 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k5xwvmcp4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 16:21:18 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29CGLEYA026194;
 Wed, 12 Oct 2022 16:21:16 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 3k30u9mqu8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 16:21:16 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29CGLCi557803230
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Oct 2022 16:21:12 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A7C6A405B;
 Wed, 12 Oct 2022 16:21:12 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B453A4054;
 Wed, 12 Oct 2022 16:21:11 +0000 (GMT)
Received: from li-c6ac47cc-293c-11b2-a85c-d421c8e4747b.ibm.com.com (unknown
 [9.171.34.168])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Oct 2022 16:21:11 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
Subject: [PATCH v10 0/9] s390x: CPU Topology
Date: Wed, 12 Oct 2022 18:20:58 +0200
Message-Id: <20221012162107.91734-1-pmorel@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: y-nHzy9ghktJqVRhEZuQClpyy4cgiluJ
X-Proofpoint-ORIG-GUID: ALjjRAjiZS66q8u3d4tq6onKwk0vmAaN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_07,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 adultscore=0 mlxscore=0 phishscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210120106
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi,

The implementation of the CPU Topology in QEMU has been drastically
modified since the last patch series and the number of LOCs has been
greatly reduced.

1) Unnecessary objects have been removed, only a single S390Topology
   object is created to support migration and reset.

2) The introduction of drawers and books is deferred to a later version.

3) A new property, topology-disable, is added for new machines for test
   purpose and migration to/from a host without facility 11 from/to a
   host with the facility 11.

Also a documentation has been added to the series.


To use the QEMU patches, you will need Linux V6-rc1 or newer,
or use the following Linux mainline patches:

f5ecfee94493 2022-07-20 KVM: s390: resetting the Topology-Change-Report    
24fe0195bc19 2022-07-20 KVM: s390: guest support for topology function     
0130337ec45b 2022-07-20 KVM: s390: Cleanup ipte lock access and SIIF fac.. 

Currently this code is for KVM only, I have no idea if it is interesting
to provide a TCG patch. If ever it will be done in another series.

To have a better understanding of the S390x CPU Topology and its
implementation in QEMU you can have a look at the documentation in the
last patch of this series.

The admin will want to match the host and the guest topology, taking
into account that the guest does not recognize multithreading.
Consequently, two vCPU assigned to threads of the same real CPU should
preferably be assigned to the same socket of the guest machine.

Regards,
Pierre

Pierre Morel (9):
  s390x/cpu topology: core_id sets s390x CPU topology
  s390x/cpu topology: reporting the CPU topology to the guest
  s390x/cpu_topology: resetting the Topology-Change-Report
  s390x/cpu_topology: CPU topology migration
  target/s390x: interception of PTF instruction
  s390x/cpu topology: add topology-disable machine property
  s390x/cpu topology: add max_threads machine class attribute
  s390x/cpu_topology: activating CPU topology
  docs/s390x: document s390x cpu topology

 docs/system/s390x/cpu_topology.rst |  80 +++++++++
 include/hw/boards.h                |   3 +
 include/hw/s390x/cpu-topology.h    |  65 +++++++
 include/hw/s390x/s390-virtio-ccw.h |   9 +
 target/s390x/cpu.h                 |  50 ++++++
 target/s390x/kvm/kvm_s390x.h       |   1 +
 hw/core/machine.c                  |   5 +
 hw/s390x/cpu-topology.c            | 279 +++++++++++++++++++++++++++++
 hw/s390x/s390-virtio-ccw.c         |  85 ++++++++-
 target/s390x/cpu-sysemu.c          |  15 ++
 target/s390x/cpu_topology.c        | 109 +++++++++++
 target/s390x/kvm/kvm.c             |  56 +++++-
 util/qemu-config.c                 |   4 +
 hw/s390x/meson.build               |   1 +
 qemu-options.hx                    |   6 +-
 target/s390x/meson.build           |   1 +
 16 files changed, 766 insertions(+), 3 deletions(-)
 create mode 100644 docs/system/s390x/cpu_topology.rst
 create mode 100644 include/hw/s390x/cpu-topology.h
 create mode 100644 hw/s390x/cpu-topology.c
 create mode 100644 target/s390x/cpu_topology.c

-- 
2.31.1

Changelog:

- since v9

- remove books and drawers

- remove thread denying and replace with a merge
  of cores * threads to specify the CPUs available
  to the guest

- add a class option to avoid topology on older
  machines
  (Cedric)

- Allocate a SYSIB buffer of the maximal length to
  avoid overflow.
  (Nico, Janis)

- suppress redundancy of smp parameters in topology
  and use directly the machine smp structure

- Early check for topology support
  (Cedric)

- since v8

- Linux patches are now mainline

- simplification of the implementation
  (Janis)

- Migration, new machine definition
  (Thomas)

- Documentation

- since v7

- Coherence with the Linux patch series changes for MTCR get
  (Pierre)

- check return values during new CPU creation
  (Thomas)

- Improving codding style and argument usages
  (Thomas)

- since v6

- Changes on smp args in qemu-options
  (Daniel)
  
- changed comments in machine.jason
  (Daniel)
 
- Added reset
  (Janosch)

- since v5

- rebasing on newer QEMU version

- reworked most lines above 80 characters.

- since v4

- Added drawer and books to topology

- Added numa topology

- Added documentation

- since v3

- Added migration
  (Thomas)

- Separated STSI instruction from KVM to prepare TCG
  (Thomas)

- Take care of endianess to prepare TCG
  (Thomas)

- Added comments on STSI CPU container and PFT instruction
  (Thomas)

- Moved enabling the instructions as the last patch
  (Thomas)

