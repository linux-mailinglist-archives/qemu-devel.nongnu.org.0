Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A34FE14DABE
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 13:38:03 +0100 (CET)
Received: from localhost ([::1]:60040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ix958-0002R2-Lx
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 07:38:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54446)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1ix92M-0005aU-2J
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 07:35:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1ix92J-0004TC-QN
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 07:35:09 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:50738
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1ix92C-0004LR-5r
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 07:35:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580387699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lkXSt8FP+k5pbk8Vkv5DhJerGILH+YoZCTN6ReU6Tpo=;
 b=b+ykK1MIJvystI42wVAEbLUvapVHxli/lroWl7J7tkSEK0k+9RJ6M6lO0nmHjwRmCopD+/
 oV6VVr8IkbfG38UPElHDWfNqH1C8mF5z3x43UfA8K17vDS5LteZWa5Z0OJJpxDiVoCbUDM
 nj9/yF3YSDDXoAd9Xq1Q6eylkskWNws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-OvI4T8pbO9WZbsGRGuB3HA-1; Thu, 30 Jan 2020 07:34:56 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E06371084426;
 Thu, 30 Jan 2020 12:34:54 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65F2619756;
 Thu, 30 Jan 2020 12:34:50 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/11] RFC: [for 5.0]: HMP monitor handlers refactoring
Date: Thu, 30 Jan 2020 14:34:37 +0200
Message-Id: <20200130123448.21093-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: OvI4T8pbO9WZbsGRGuB3HA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series is bunch of cleanups to the hmp monitor code.
It mostly moves the blockdev related hmp handlers to its own file,
and does some minor refactoring.

No functional changes expected.

Changes from V1:
   * move the handlers to block/monitor/block-hmp-cmds.c
   * tiny cleanup for the commit messages

Changes from V2:
   * Moved all the function prototypes to new header (blockdev-hmp-cmds.h)
   * Set the license of blockdev-hmp-cmds.c to GPLv2+
   * Moved hmp_snapshot_* functions to blockdev-hmp-cmds.c
   * Moved hmp_drive_add_node to blockdev-hmp-cmds.c
     (this change needed some new exports, thus in separate new patch)
   * Moved hmp_qemu_io and hmp_eject to blockdev-hmp-cmds.c
   * Added 'error:' prefix to vreport, and updated the iotests
     This is invasive change, but really feels like the right one
   * Added minor refactoring patch that drops an unused #include

Changes from V3:
   * Dropped the error prefix patches for now due to fact that it seems
     that libvirt doesn't need that after all. Oh well...
     I'll send them in a separate series.

   * Hopefully correctly merged the copyright info the new files
     Both files are GPLv2 now (due to code from hmp.h/hmp-cmds.c)

   * Addressed review feedback
   * Renamed the added header to block-hmp-cmds.h

   * Got rid of checkpatch.pl warnings in the moved code
     (cosmetic code changes only)

   * I kept the reviewed-by tags, since the changes I did are minor.
     I hope that this is right thing to do.

Best regards,
=09Maxim Levitsky

Maxim Levitsky (11):
  usb/dev-storage: remove unused include
  monitor/hmp: uninline add_init_drive
  monitor/hmp: rename device-hotplug.c to block/monitor/block-hmp-cmds.c
  monitor/hmp: move hmp_drive_del and hmp_commit to block-hmp-cmds.c
  monitor/hmp: move hmp_drive_mirror and hmp_drive_backup to
    block-hmp-cmds.c Moved code was added after 2012-01-13, thus under
    GPLv2+
  monitor/hmp: move hmp_block_job* to block-hmp-cmds.c
  monitor/hmp: move hmp_snapshot_* to block-hmp-cmds.c
    hmp_snapshot_blkdev is from GPLv2 version of the hmp-cmds.c thus
    have to change the licence to GPLv2
  monitor/hmp: move hmp_nbd_server* to block-hmp-cmds.c
  monitor/hmp: move remaining hmp_block* functions to block-hmp-cmds.c
  monitor/hmp: move hmp_info_block* to block-hmp-cmds.c
  monitor/hmp: Move hmp_drive_add_node to block-hmp-cmds.c

 MAINTAINERS                    |    1 +
 Makefile.objs                  |    2 +-
 block/Makefile.objs            |    1 +
 block/monitor/Makefile.objs    |    1 +
 block/monitor/block-hmp-cmds.c | 1002 ++++++++++++++++++++++++++++++++
 blockdev.c                     |  137 +----
 device-hotplug.c               |   91 ---
 hw/usb/dev-storage.c           |    1 -
 include/block/block-hmp-cmds.h |   54 ++
 include/block/block_int.h      |    5 +-
 include/monitor/hmp.h          |   24 -
 include/sysemu/blockdev.h      |    4 -
 include/sysemu/sysemu.h        |    3 -
 monitor/hmp-cmds.c             |  769 ------------------------
 monitor/misc.c                 |    1 +
 15 files changed, 1072 insertions(+), 1024 deletions(-)
 create mode 100644 block/monitor/Makefile.objs
 create mode 100644 block/monitor/block-hmp-cmds.c
 delete mode 100644 device-hotplug.c
 create mode 100644 include/block/block-hmp-cmds.h

--=20
2.17.2


