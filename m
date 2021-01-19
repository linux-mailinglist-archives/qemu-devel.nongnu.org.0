Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AA82FC1C9
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 22:04:48 +0100 (CET)
Received: from localhost ([::1]:39272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1yBD-0004VD-Fz
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 16:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1l1xrf-0002Hv-OO; Tue, 19 Jan 2021 15:44:35 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:45848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1l1xrb-0002OR-9f; Tue, 19 Jan 2021 15:44:35 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10JKXU4k131522; Tue, 19 Jan 2021 15:44:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=HxzlhtndhO0wxC/5z7oSSCP6lEOpF77KAYuSbNz4YLU=;
 b=pAFRRtyqCUdc3yq+bkDwjbroBLX0TkF73UF37myjippK3WsYvpzqukDya9HfmIUF0tTW
 o0PCZk2YgySiS6GbnMZAAoKLxol7uvSF6hlaZhYKsCtUQsJipa34mSktZkqKQhxkMbsh
 XEnFKxKKruO52TYGI5bFnu3+5Y+uWIpz4AgVoutSqNdqtL09CqGdvsPf4lakqiWMrnGc
 T8tI2sFDDGjGpyReUuczOAlWRX5sFZ96la0+PsOa+JZ3dM2V3c5ZrqgMHNqvq5vF7YOy
 oQ+npJBHsgq3wWH5NvV11rkXMpx3oiTv4y1l9zpuS/J8hQJn3X/U1OO5eBy4YDvcF0Es Ig== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3665y31c3t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 15:44:26 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10JKYFLt133797;
 Tue, 19 Jan 2021 15:44:26 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3665y31c3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 15:44:26 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10JKaT3q006578;
 Tue, 19 Jan 2021 20:44:24 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma05wdc.us.ibm.com with ESMTP id 363qs90ww6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 20:44:24 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10JKiN3Y35455380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:44:23 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B991136059;
 Tue, 19 Jan 2021 20:44:23 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E104136053;
 Tue, 19 Jan 2021 20:44:22 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.211.56.144])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 19 Jan 2021 20:44:22 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: cohuck@redhat.com, thuth@redhat.com
Subject: [PATCH 0/8] s390x/pci: Fixing s390 vfio-pci ISM support
Date: Tue, 19 Jan 2021 15:44:11 -0500
Message-Id: <1611089059-6468-1-git-send-email-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_09:2021-01-18,
 2021-01-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101190114
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: pmorel@linux.ibm.com, david@redhat.com, schnelle@linux.ibm.com,
 richard.henderson@linaro.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Today, ISM devices are completely disallowed for vfio-pci passthrough as
QEMU rejects the device due to an (inappropriate) MSI-X check.  Removing
this fence, however, reveals additional deficiencies in the s390x PCI
interception layer that prevent ISM devices from working correctly.
Namely, ISM block write operations have particular requirements in regards
to the alignment, size and order of writes performed that cannot be
guaranteed when breaking up write operations through the typical
vfio_pci_bar_rw paths. Furthermore, ISM requires that legacy/non-MIO
s390 PCI instructions are used, which is also not guaranteed when the I/O
is passed through the typical userspace channels.

This patchset provides a set of fixes related to enabling ISM device
passthrough and includes patches to enable use of a new vfio region that
will allow s390x PCI pass-through devices to perform s390 PCI instructions
in such a way that the same instruction issued on the guest is re-issued
on the host.

Associated kernel patchset:
https://lkml.org/lkml/2021/1/19/874

Changes from RFC -> v1:
- Refresh the header sync (built using Eric's 'update-linux-headers:
Include const.h' + manually removed pvrdma_ring.h again)
- Remove s390x/pci: fix pcistb length (already merged)
- Remove s390x/pci: Fix memory_region_access_valid call (already merged)
- Fix bug: s390_pci_vfio_pcistb should use the pre-allocated PCISTB
buffer pcistb_buf rather than allocating/freeing its own.
- New patch: track the PFT (PCI Function Type) separately from guest CLP
response data -- we tell the guest '0' for now due to limitations in
measurement block support, but we can still use the real value provided via
the vfio CLP capabilities to make decisions.
- Use the PFT (pci function type) to determine when to use the region
for PCISTB/PCILG (only for ISM), rather than using the relaxed alignment
bit.
- As a result, the pcistb_default is now updated to also handle the
possibility of relaxed alignment via 2 new functions, pcistb_validate_write
and pcistb_write, which serve as wrappers to the memory_region calls.
- New patch, which partially restores the MSI-X fence for passthrough
devices...  Could potentially be squashed with 's390x/pci: MSI-X isn't
strictly required for passthrough' but left separately for now as I felt it
needed a clear commit description of why we should still fence this case.

Matthew Rosato (8):
  linux-headers: update against 5.11-rc4
  s390x/pci: Keep track of the PCI Function type
  s390x/pci: MSI-X isn't strictly required for passthrough
  s390x/pci: Introduce the ZpciOps structure
  s390x/pci: Handle devices that support relaxed alignment
  s390x/pci: PCISTB via the vfio zPCI I/O region
  s390x/pci: PCILG via the vfio zPCI I/O region
  s390x/pci: Prevent ISM device passthrough on older host kernels

 hw/s390x/s390-pci-bus.c                            |  45 ++-
 hw/s390x/s390-pci-inst.c                           | 389 +++++++++++++++------
 hw/s390x/s390-pci-vfio.c                           | 152 ++++++++
 include/hw/s390x/s390-pci-bus.h                    |  29 ++
 include/hw/s390x/s390-pci-clp.h                    |   1 +
 include/hw/s390x/s390-pci-inst.h                   |   3 +
 include/hw/s390x/s390-pci-vfio.h                   |  23 ++
 .../infiniband/hw/vmw_pvrdma/pvrdma_verbs.h        |   2 +-
 include/standard-headers/drm/drm_fourcc.h          | 175 ++++++++-
 include/standard-headers/linux/ethtool.h           |   2 +-
 include/standard-headers/linux/fuse.h              |  30 +-
 include/standard-headers/linux/kernel.h            |   9 +-
 include/standard-headers/linux/pci_regs.h          |  16 +
 include/standard-headers/linux/vhost_types.h       |   9 +
 include/standard-headers/linux/virtio_gpu.h        |  82 +++++
 include/standard-headers/linux/virtio_ids.h        |  44 ++-
 linux-headers/asm-arm64/kvm.h                      |   3 -
 linux-headers/asm-generic/unistd.h                 |   6 +-
 linux-headers/asm-mips/unistd_n32.h                |   1 +
 linux-headers/asm-mips/unistd_n64.h                |   1 +
 linux-headers/asm-mips/unistd_o32.h                |   1 +
 linux-headers/asm-powerpc/unistd_32.h              |   1 +
 linux-headers/asm-powerpc/unistd_64.h              |   1 +
 linux-headers/asm-s390/unistd_32.h                 |   1 +
 linux-headers/asm-s390/unistd_64.h                 |   1 +
 linux-headers/asm-x86/kvm.h                        |   1 +
 linux-headers/asm-x86/unistd_32.h                  |   1 +
 linux-headers/asm-x86/unistd_64.h                  |   1 +
 linux-headers/asm-x86/unistd_x32.h                 |   1 +
 linux-headers/linux/kvm.h                          |  58 ++-
 linux-headers/linux/userfaultfd.h                  |   9 +
 linux-headers/linux/vfio.h                         |   5 +
 linux-headers/linux/vfio_zdev.h                    |  34 ++
 linux-headers/linux/vhost.h                        |   4 +
 34 files changed, 996 insertions(+), 145 deletions(-)

-- 
1.8.3.1


