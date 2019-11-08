Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E66F439E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 10:40:54 +0100 (CET)
Received: from localhost ([::1]:51122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT0lB-0007US-Cc
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 04:40:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37718)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <baiyaowei@cmss.chinamobile.com>) id 1iT0h9-0003Bp-IU
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 04:36:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <baiyaowei@cmss.chinamobile.com>) id 1iT0h7-0002Sy-QG
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 04:36:43 -0500
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:2544)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <baiyaowei@cmss.chinamobile.com>)
 id 1iT0h0-0002FL-Df; Fri, 08 Nov 2019 04:36:35 -0500
Received: from spf.mail.chinamobile.com (unknown[172.16.121.3]) by
 rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee35dc536d4101-8563d;
 Fri, 08 Nov 2019 17:35:17 +0800 (CST)
X-RM-TRANSID: 2ee35dc536d4101-8563d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.novalocal (unknown[112.25.65.41])
 by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee25dc536d2c26-16e35;
 Fri, 08 Nov 2019 17:35:17 +0800 (CST)
X-RM-TRANSID: 2ee25dc536d2c26-16e35
From: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
To: pbonzini@redhat.com, fam@euphon.net, dillaman@redhat.com, kwolf@redhat.com,
 mreitz@redhat.com
Subject: [PATCH 0/4 V2] SCSI COMPARE_AND_WRITE command support
Date: Fri,  8 Nov 2019 17:35:37 +0800
Message-Id: <1573205741-2094-1-git-send-email-baiyaowei@cmss.chinamobile.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.79
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

v1->v2: fix checkpatch script complaints and cleanup

Yaowei Bai (4):
  block: add SCSI COMPARE_AND_WRITE support
  block/rbd: implement bdrv_aio_compare_and_write interface
  hw/scsi: add SCSI COMPARE_AND_WRITE support
  scsi-disk: add FUA support for COMPARE_AND_WRITE

 block/io.c                  | 20 +++++++++
 block/raw-format.c          |  3 +-
 block/rbd.c                 | 45 ++++++++++++++++++++-
 hw/scsi/emulation.c         |  1 +
 hw/scsi/scsi-bus.c          |  4 ++
 hw/scsi/scsi-disk.c         | 98 +++++++++++++++++++++++++++++++++++++++++++++
 hw/scsi/trace-events        |  1 +
 include/block/block.h       |  5 ++-
 include/block/block_int.h   |  3 ++
 include/hw/scsi/emulation.h |  3 ++
 include/scsi/utils.h        |  2 +
 scsi/utils.c                |  5 +++
 12 files changed, 185 insertions(+), 5 deletions(-)

-- 
1.8.3.1




