Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E065948814
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 17:58:20 +0200 (CEST)
Received: from localhost ([::1]:48774 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcu1U-0000TT-4G
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 11:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55468)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shmuel.eiderman@oracle.com>) id 1hctBs-0006wl-Ir
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 11:05:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shmuel.eiderman@oracle.com>) id 1hctBq-0005kF-LH
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 11:05:00 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:60222)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shmuel.eiderman@oracle.com>)
 id 1hctBl-0005dw-0p; Mon, 17 Jun 2019 11:04:53 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5HF3koU194558;
 Mon, 17 Jun 2019 15:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2018-07-02;
 bh=GH2ZKFcRrDneF5Em5GHKh2/mNlb3mNtH/TPI26ByoYs=;
 b=gIewMniyJnU2ryoLR7ajmWtMBP1+iFpYBcaMA0oRW/rc+HoWugYSPcvNTy6+9EsspXtf
 IRlhsJE0wQlFw82iIyTciJ0WKfiwFPyTJZfIFgXHeWxKJ4Ll9Ehf/yMf2U3Cjhm46ZcX
 mzbxIi/4+Vae06yeuyoqQ1OybsbU2Ddm3iOnBk1HAttZxClrnzu2lzj7xo3tmMeUr/81
 K4NRkS37NKuEuC6r35i8VI19nLFQxmNBtLXJbyujXz+7vsZmXEnI/8n4ww/csiUnqbvE
 vuKVnevb2+6RjumHWFAcai7uKdGDgVh0kvGL/0uk1iFQc1GXimHpZ/pizk3tQqFSfUVt aw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2t4r3tf5wp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 15:04:48 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5HF3Rs5191439;
 Mon, 17 Jun 2019 15:04:47 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2t5cpdgakc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 15:04:47 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5HF4hV9028563;
 Mon, 17 Jun 2019 15:04:45 GMT
Received: from nexus.ravello.local (/213.57.127.2)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 17 Jun 2019 08:04:43 -0700
From: Sam Eiderman <shmuel.eiderman@oracle.com>
To: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, seabios@seabios.org, kraxel@redhat.com,
 kevin@koconnor.net
Date: Mon, 17 Jun 2019 18:04:14 +0300
Message-Id: <20190617150419.4953-1-shmuel.eiderman@oracle.com>
X-Mailer: git-send-email 2.13.3
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=703
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906170136
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=746 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906170136
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 156.151.31.86
Subject: [Qemu-devel] [SeaBIOS] [PATCH v2 0/5] Add Qemu to SeaBIOS LCHS
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

Rename bootdevices fw_cfg key to bios-geoemtry

Sam Eiderman (5):
  geometry: Read LCHS from fw_cfg
  boot: Reorder functions in boot.c
  geometry: Add boot_lchs_find_*() utility functions
  config: Add toggle for bootdevice information
  geometry: Apply LCHS values for boot devices

 src/Kconfig          |   7 ++
 src/block.c          |  21 ++++-
 src/block.h          |   1 +
 src/boot.c           | 244 +++++++++++++++++++++++++++++++++++++++++----------
 src/hw/ahci.c        |   1 +
 src/hw/ata.c         |   8 ++
 src/hw/esp-scsi.c    |   2 +
 src/hw/lsi-scsi.c    |   2 +
 src/hw/megasas.c     |   1 +
 src/hw/mpt-scsi.c    |   2 +
 src/hw/pvscsi.c      |   1 +
 src/hw/virtio-blk.c  |   2 +
 src/hw/virtio-scsi.c |   2 +
 src/util.h           |   6 ++
 14 files changed, 254 insertions(+), 46 deletions(-)

-- 
2.13.3


