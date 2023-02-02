Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DABAA68757D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 06:48:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNSP6-00084t-Rq; Thu, 02 Feb 2023 00:45:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSP5-00084l-9T
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:44:59 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSP2-0006wp-Md
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:44:59 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3124i52j006665; Thu, 2 Feb 2023 05:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2022-7-12;
 bh=YdaIZkS+G/deUtxR026ez2+CFPMAbulDh1mD4nrdFRQ=;
 b=OzMYhVwOYg3PRznep/pEVHiAZiVVl3m5sujEKyms1ZPc9Rdo3dpwfPtv0mhqYNawmcn7
 oogcNk6ctWUeCXGLFL+AfHMwgabn+v87M2PO/AIBxmAMCt9h+wjwisEEwQLG4G1CE7Jj
 9vLm/hmFLZUfyz8VbyYptxWYcUYs2fNoajgcZQdF+NIliRluTW1ie/yisMnVsB2oYwS9
 k43GBWNo4GJMGKc3VqSbbiYOX0roMIYpi8v/KjFfvHvFFgxxrgy3atbLt1A9CLR18bVU
 +urCSy1TUAmgqMt2I+mMlRweYslMz0AvZubtvnL2cv7DV2qF5mojfED3zA9gwbax1gaR 5w== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfkfe2efg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 05:44:54 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31254PpS013015; Thu, 2 Feb 2023 05:44:53 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-133-23.vpn.oracle.com
 [10.65.133.23])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nct5f5gb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 02 Feb 2023 05:44:53 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org
Subject: [PATCH v2 00/23] vfio-user client
Date: Wed,  1 Feb 2023 21:55:36 -0800
Message-Id: <cover.1675228037.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_15,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302020053
X-Proofpoint-GUID: gtzSNOLfnIxWrHarC8Y_sUL4YQAJTWs6
X-Proofpoint-ORIG-GUID: gtzSNOLfnIxWrHarC8Y_sUL4YQAJTWs6
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Hello,

This is the 2nd patch revision of the vfio-user client implementation.

First of all, thank you for your time reviewing the previous versions.

The vfio-user framework consists of 3 parts:
 1) The VFIO user protocol specification.
 2) A client - the VFIO device in QEMU that encapsulates VFIO messages
    and sends them to the server.
 3) A server - a remote process that emulates a device.

This patchset implements parts 1 and 2.

The libvfio-user project (https://github.com/nutanix/libvfio-user)
can be used by a remote process to handle the protocol to implement the third part.
We also have upstreamed a patch series that implement a server using QEMU.


Contributors:

John G Johnson <john.g.johnson@oracle.com>
John Levon <john.levon@nutanix.com>
Thanos Makatos <thanos.makatos@nutanix.com>
Elena Ufimtseva <elena.ufimtseva@oracle.com>
Jagannathan Raman <jag.raman@oracle.com>


Changes fron v1:

John Johnson (22):
  vfio-user: add VFIO base abstract class

rename VFIOKernPCIDevice to VFIOKernelPCIDevice

  vfio-user: add container IO ops vector

make vfio_cont_io_ioctl static
remove VFIOContIO CONT_* macros
rename VFIOContIO to VFIOContainerIO
rename VFIOContainer io_ops field to io

  vfio-user: add region cache

none

  vfio-user: add device IO ops vector

remove VFIODevIO VDEV_* macros
rename VFIODevIO to VFIODeviceIO
remove get_info operation from VFIODeviceIO
move short read/write check to patch 12

  vfio-user: Define type vfio_user_pci_dev_info

removed reset tests
add user-pci.c file for PCI specific vfio-user code
move pci.[ch] changes to user-pci.c

  vfio-user: connect vfio proxy to remote server

rename VFIOProxy to VFIOUserProxy
propoagate error return from vfio_user_connect_dev()
move pci.c changes to user-pci.c

  vfio-user: define socket receive functions

vfio_user_process: fix function name in error case
move pci.c changes to user-pci.c

  vfio-user: define socket send functions

set message error in vfio_user_send_wait() on invalid flags
use warn_report in caps_parse()
move pci.[ch] changes to user-pci.c

  vfio-user: get device info

remove caps_offset from VFIOUserDeviceInfo
add vfio_get_device() to user.c
change get_info operation to a vfio_get_device() call
typo:  struct_device_info -> struct vfio_device_info
move pci.c changes to user-pci.c

  vfio-user: get region info

add use_regfds boolean to VFIODevice instead of testing proxy
make vfio_user_get_region_info() return E2BIG on invalid argsz
typo:  struct_vfio -> struct vfio

  vfio-user: region read/write

add short read/write check from patch 05
move pci.c changes to user-pci.c

  vfio-user: pci_user_realize PCI setup

add pci notifier calls from patch 14
add user_instance finalize code from patch 16
move pci.c changes to user-pci.c

  vfio-user: get and set IRQs

move pci notifier calls to patch 13

  vfio-user: forward msix BAR accesses to server

rename irq_mask_works to can_mask_irq
move pci.c changes to user-pci.c

  vfio-user: proxy container connect/disconnect

refactor common IOMMU group code to be shared
move user_instance finalize code to patch 13
add user.h prototypes for vfio_user_{get,put}_group()
move common.c changes to user.c
move pci.c changes to user-pci.c

  vfio-user: dma map/unmap operations
  vfio-user: add dma_unmap_all

none

  vfio-user: no-mmap DMA support

rename secure-dma to no-mmap
move pci.[ch] changes to user-pci.c

  vfio-user: dma read/write operations

vfio_user_procss_req: fix function name in error case
move pci.c changes to user-pci.c

  vfio-user: pci reset

move pci.c changes to user-pci.c

  vfio-user: add 'x-msg-timeout' option that specifies msg wait times

initialize wait_time directly from command line property list
move pci.[ch] changes to user-pci.c

  vfio-user: add coalesced posted writes

elaborated coalesced write usage in commit msg

Removed from v1:

  vfio-user: add trace points

trace points distributed to other patches


Thanos Makatos (1):
  vfio-user: introduce vfio-user protocol specification

 docs/devel/index-internals.rst |    1 +
 docs/devel/vfio-user.rst       | 1522 +++++++++++++++++++++++++++++
 hw/vfio/pci.h                  |   35 +-
 hw/vfio/user-protocol.h        |  243 +++++
 hw/vfio/user.h                 |  116 +++
 include/hw/vfio/vfio-common.h  |   65 ++
 hw/vfio/ap.c                   |    2 +
 hw/vfio/ccw.c                  |    8 +-
 hw/vfio/common.c               |  548 ++++++++---
 hw/vfio/igd.c                  |   23 +-
 hw/vfio/migration.c            |    2 -
 hw/vfio/pci-quirks.c           |   19 +-
 hw/vfio/pci.c                  |  557 ++++++-----
 hw/vfio/platform.c             |    3 +
 hw/vfio/user-pci.c             |  435 +++++++++
 hw/vfio/user.c                 | 2057 ++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                    |    9 +
 hw/vfio/Kconfig                |   10 +
 hw/vfio/meson.build            |    2 +
 hw/vfio/trace-events           |   15 +
 20 files changed, 5283 insertions(+), 389 deletions(-)
 create mode 100644 docs/devel/vfio-user.rst
 create mode 100644 hw/vfio/user-protocol.h
 create mode 100644 hw/vfio/user.h
 create mode 100644 hw/vfio/user-pci.c
 create mode 100644 hw/vfio/user.c

-- 
1.9.4


