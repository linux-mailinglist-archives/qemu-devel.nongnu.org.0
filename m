Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0295D488D8
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 18:27:32 +0200 (CEST)
Received: from localhost ([::1]:49094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcuTj-0007XD-5j
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 12:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56699)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shmuel.eiderman@oracle.com>) id 1hctGu-0002gJ-V9
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 11:10:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shmuel.eiderman@oracle.com>) id 1hctGt-00019s-O6
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 11:10:12 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:56424)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shmuel.eiderman@oracle.com>)
 id 1hctGq-00012r-QN; Mon, 17 Jun 2019 11:10:09 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5HF4HwS009173;
 Mon, 17 Jun 2019 15:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2018-07-02;
 bh=jqbdsqX/1qHtZ2wACksMnh8gjBLAhbMRhbQvlKmb+gg=;
 b=m5mwocfvM3tgOeQmvQaom0blmShLTb7Ne/AbvAoQcc6dKNrOB/Hxsm4s2RA5YtpwjjIp
 koy9R5STBAxmpw/y3WIoDwel6v4NKX9gveJvok/VHZ0fbSgC43teaN1NyO43k3azGldi
 AxLdc62a3t70ug4GuoRAvTle8h6uHEZQWHESU4JthmF5EVeuBHP/syMTRiqbKtKdoTxH
 8diSPjgOEStpusXSJCYxe4KlO78N6erEXseSOOEZy3iph4sR1RwkafItFK7dGZZnDmwi
 uBk3KNxNhiIbppak9gPBSgTdzYKHjmEqdfm/JMmbGUrdTRpx4rN9MiY8oE4W1rMmP257 tw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2t4saq73ej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 15:10:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5HF8Ot6071738;
 Mon, 17 Jun 2019 15:10:05 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2t5mgbd9d7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 15:10:04 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5HFA3OS031712;
 Mon, 17 Jun 2019 15:10:03 GMT
Received: from nexus.ravello.local (/213.57.127.2)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 17 Jun 2019 08:10:02 -0700
From: Sam Eiderman <shmuel.eiderman@oracle.com>
To: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, seabios@seabios.org, kraxel@redhat.com,
 kevin@koconnor.net
Date: Mon, 17 Jun 2019 18:09:42 +0300
Message-Id: <20190617150950.5264-1-shmuel.eiderman@oracle.com>
X-Mailer: git-send-email 2.13.3
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=783
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906170136
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=825 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906170136
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 156.151.31.85
Subject: [Qemu-devel] [QEMU] [PATCH v3 0/8] Add Qemu to SeaBIOS LCHS
 interface
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
Cc: liran.alon@oracle.com, shmuel.eiderman@oracle.com, karl.heubaum@oracle.com,
 arbel.moshe@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v1:

Non-standard logical geometries break under QEMU.

A virtual disk which contains an operating system which depends on
logical geometries (consistent values being reported from BIOS INT13
AH=08) will most likely break under QEMU/SeaBIOS if it has non-standard
logical geometries - for example 56 SPT (sectors per track).
No matter what QEMU will guess - SeaBIOS, for large enough disks - will
use LBA translation, which will report 63 SPT instead.

In addition we can not enforce SeaBIOS to rely on phyiscal geometries at
all. A virtio-blk-pci virtual disk with 255 phyiscal heads can not
report more than 16 physical heads when moved to an IDE controller, the
ATA spec allows a maximum of 16 heads - this is an artifact of
virtualization.

By supplying the logical geometies directly we are able to support such
"exotic" disks.

We will use fw_cfg to do just that.

v2:

Fix missing parenthesis check in
    "hd-geo-test: Add tests for lchs override"

v3:

* Rename fw_cfg key to "bios-geometry".
* Remove "extendible" interface.
* Add cpu_to_le32 fix as Laszlo suggested or big endian hosts
* Fix last qtest commit - automatic docker tester for some reason does not have qemu-img set

Sam Eiderman (8):
  block: Refactor macros - fix tabbing
  block: Support providing LCHS from user
  bootdevice: Add interface to gather LCHS
  scsi: Propagate unrealize() callback to scsi-hd
  bootdevice: Gather LCHS from all relevant devices
  bootdevice: Refactor get_boot_devices_list
  bootdevice: FW_CFG interface for LCHS values
  hd-geo-test: Add tests for lchs override

 bootdevice.c             | 154 ++++++++++---
 hw/block/virtio-blk.c    |   6 +
 hw/ide/qdev.c            |   7 +-
 hw/nvram/fw_cfg.c        |  14 +-
 hw/scsi/scsi-bus.c       |  15 ++
 hw/scsi/scsi-disk.c      |  14 ++
 include/hw/block/block.h |  22 +-
 include/hw/scsi/scsi.h   |   1 +
 include/sysemu/sysemu.h  |   4 +
 tests/Makefile.include   |   2 +-
 tests/hd-geo-test.c      | 566 +++++++++++++++++++++++++++++++++++++++++++++++
 11 files changed, 764 insertions(+), 41 deletions(-)

-- 
2.13.3


