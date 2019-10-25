Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9346AE4780
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 11:39:36 +0200 (CEST)
Received: from localhost ([::1]:58058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNw4F-0007Kt-GR
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 05:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58280)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <baiyaowei@cmss.chinamobile.com>) id 1iNw0z-0004Tx-9M
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 05:36:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <baiyaowei@cmss.chinamobile.com>) id 1iNw0y-0006kH-0n
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 05:36:13 -0400
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:2985)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <baiyaowei@cmss.chinamobile.com>)
 id 1iNw0s-0006fD-Uz; Fri, 25 Oct 2019 05:36:08 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.11]) by
 rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee95db2c1ebd89-60203;
 Fri, 25 Oct 2019 17:35:39 +0800 (CST)
X-RM-TRANSID: 2ee95db2c1ebd89-60203
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.novalocal (unknown[112.25.65.41])
 by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee65db2c1ea9b0-be8c0;
 Fri, 25 Oct 2019 17:35:39 +0800 (CST)
X-RM-TRANSID: 2ee65db2c1ea9b0-be8c0
From: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
To: pbonzini@redhat.com, fam@euphon.net, dillaman@redhat.com, kwolf@redhat.com,
 mreitz@redhat.com
Subject: [PATCH 0/4] SCSI COMPARE_AND_WRITE support
Date: Fri, 25 Oct 2019 17:35:58 +0800
Message-Id: <1571996163-27688-1-git-send-email-baiyaowei@cmss.chinamobile.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.81
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
Cc: baiyaowei@cmss.chinamobile.com, yangjun@cmss.chinamobile.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recently ceph/librbd added several interfaces to handle SCSI commands like
COMPARE_AND_WRITE directly. However they were only be used in special
scenarios, i.e. ISCSI. That involves more software components which makes
the IO path longer and could bring more potential issues. Actually we're
maintaining several ceph clusters with ISCSI protocal being used which,
i have to say, is not an easy job.

So supporting COMPARE_AND_WRITE in scsi-disk would be a reasonable solution
and easy to implement with the help of the SCSI handlers in librbd, which
could leave alone the ISCSI stuff and make the IO path shorter.

This patchset implements it by reusing the blk_aio_pwritev interface and
introducing a new BDRV_REQ_COMPARE_AND_WRITE element into BdrvRequestFlags
to indicate a COMPARE_AND_WRITE request, rather than adding a new interface
into block-backend.c.

The FUA support is implemented in the blk_aio_pwritev's callback function
similar to its emulation in scsi_write_do_fua function, maybe through
BDRV_REQ_FUA is another doable way.

This patchset is tested with the method of sg_compare_and_write.txt from
sg3_utils. Link below:

https://github.com/hreinecke/sg3_utils/blob/master/examples/sg_compare_and_write.txt

Yaowei Bai (4):
  block: add SCSI COMPARE_AND_WRITE support
  block/rbd: implement bdrv_aio_compare_and_write interface
  hw/scsi: add SCSI COMPARE_AND_WRITE support
  scsi-disk: add FUA support for COMPARE_AND_WRITE

 block/io.c                  | 20 +++++++++
 block/raw-format.c          |  3 +-
 block/rbd.c                 | 41 ++++++++++++++++++-
 hw/scsi/emulation.c         |  1 +
 hw/scsi/scsi-bus.c          |  4 ++
 hw/scsi/scsi-disk.c         | 98 +++++++++++++++++++++++++++++++++++++++++++++
 hw/scsi/trace-events        |  1 +
 include/block/block.h       |  5 ++-
 include/block/block_int.h   |  3 ++
 include/hw/scsi/emulation.h |  3 ++
 include/scsi/utils.h        |  2 +
 include/tcmu/tcmu.h         | 14 +++++++
 scsi/utils.c                |  5 +++
 13 files changed, 195 insertions(+), 5 deletions(-)
 create mode 100644 include/tcmu/tcmu.h

-- 
1.8.3.1




