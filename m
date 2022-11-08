Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA67D621FE8
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 00:03:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osXbg-0004uS-AJ; Tue, 08 Nov 2022 18:02:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbN-0004oO-2t
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:02:01 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbI-0003eU-LY
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:01:50 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A8Mx5Ys026348
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject : date : message-id; s=corp-2022-7-12;
 bh=y8NSANPMJ/QnIZtEBP1jV/Urw6KSk7aKF1clJYJ269M=;
 b=kRGAjqqBwhMS6DVz0biGGEPmMMF4fmb6Scspdpx0nvQbYU7uBLmY9QQcq0TqKRA4yxIo
 kb0FVsrC8eRr4ndjL70kfM7mFWpuS7G6MgEtfy4zWAMcuK4liIRKSYgxyQMySmfEPG74
 g+gj0nQBR3zQqQy8Pw6FzqgHArmQNPOmjuL8BqM1VPp8lKWhpSCintUtAJVv9wNv6jUQ
 iS94wesi9kyerUdMoXt1R9DdKRCCAcijMV4eWLSfIg+fTT1QbCVAhvFvHyvVP6ukKENP
 OD2ycT9u/KH36joM7zCyC5k93I4Lt3zXsMUjzv4hvLwidYFhDXu99Nuo/vHhu10Uz1Vo Aw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kqy68g7vs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:43 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2A8LjK6C004437
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:42 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-143-202.vpn.oracle.com
 [10.65.143.202])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3kpcq2k0b9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:42 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 00/24] vfio-user client
Date: Tue,  8 Nov 2022 15:13:22 -0800
Message-Id: <cover.1667542066.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211080151
X-Proofpoint-GUID: LQSCGhRWYpIDvGbSLnMlMCaf7POq547l
X-Proofpoint-ORIG-GUID: LQSCGhRWYpIDvGbSLnMlMCaf7POq547l
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

This is the 6th revision of the vfio-user client implementation.
It is the first patch series (the previous revisions were RFCs)

First of all, thank you for your time reviewing the RFC versions.

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

John Johnson (23):
  vfio-user: add VFIO base abstract class
  vfio-user: add container IO ops vector
  vfio-user: add region cache
  vfio-user: add device IO ops vector
  vfio-user: Define type vfio_user_pci_dev_info
  vfio-user: connect vfio proxy to remote server
  vfio-user: define socket receive functions
  vfio-user: define socket send functions
  vfio-user: get device info
  vfio-user: get region info
  vfio-user: region read/write
  vfio-user: pci_user_realize PCI setup
  vfio-user: get and set IRQs
  vfio-user: forward msix BAR accesses to server
  vfio-user: proxy container connect/disconnect
  vfio-user: dma map/unmap operations
  vfio-user: add dma_unmap_all
  vfio-user: secure DMA support
  vfio-user: dma read/write operations
  vfio-user: pci reset
  vfio-user: add 'x-msg-timeout' option that specifies msg wait times
  vfio-user: add coalesced posted writes
  vfio-user: add trace points

Thanos Makatos (1):
  vfio-user: introduce vfio-user protocol specification

 MAINTAINERS                    |   11 +
 docs/devel/index-internals.rst |    1 +
 docs/devel/vfio-user.rst       | 1522 ++++++++++++++++++++++++++++++++
 hw/vfio/Kconfig                |   10 +
 hw/vfio/ap.c                   |    1 +
 hw/vfio/ccw.c                  |    7 +-
 hw/vfio/common.c               |  648 ++++++++++++--
 hw/vfio/igd.c                  |   23 +-
 hw/vfio/meson.build            |    1 +
 hw/vfio/migration.c            |    2 -
 hw/vfio/pci-quirks.c           |   19 +-
 hw/vfio/pci.c                  |  926 ++++++++++++++-----
 hw/vfio/pci.h                  |   29 +-
 hw/vfio/platform.c             |    2 +
 hw/vfio/trace-events           |   15 +
 hw/vfio/user-protocol.h        |  244 +++++
 hw/vfio/user.c                 | 1904 ++++++++++++++++++++++++++++++++++++++++
 hw/vfio/user.h                 |  112 +++
 include/hw/vfio/vfio-common.h  |   82 ++
 19 files changed, 5230 insertions(+), 329 deletions(-)
 create mode 100644 docs/devel/vfio-user.rst
 create mode 100644 hw/vfio/user-protocol.h
 create mode 100644 hw/vfio/user.c
 create mode 100644 hw/vfio/user.h

-- 
1.8.3.1


