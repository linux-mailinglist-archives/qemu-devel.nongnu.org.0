Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E19166403
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 18:08:50 +0100 (CET)
Received: from localhost ([::1]:46548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4pJh-0005EQ-L7
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 12:08:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37253)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1j4pI4-0004Dj-Gi
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 12:07:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1j4pI2-000824-RS
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 12:07:08 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25566
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1j4pI2-0007z8-Le
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 12:07:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582218424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SGiDBCdkjagbe6Y5oV6ELHb+gMT13LWeobOzHQXZy/4=;
 b=AMMxFOduhtPbBDkxLiWzJLVtQByb0qT9VwfFv8F1KtOaaVxxIAIcwAkuk6aKJPVOB3CR7A
 3ZfoE5F7mpGbbc1+QYwtoH8MJgLcPuw3yKkB7apscFrb3MEHbeW1aqjlxBr6hE0LCGzday
 bTpcE2o/ZDbKFy23nK/FHVcGgZk1CLY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-s2nUKkMcMWmE1lxFMt-slw-1; Thu, 20 Feb 2020 12:06:58 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6907DB2F;
 Thu, 20 Feb 2020 17:06:57 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7497119756;
 Thu, 20 Feb 2020 17:06:53 +0000 (UTC)
Message-ID: <8e47f2027cd371cdf0dd15972ede7841b40302f5.camel@redhat.com>
Subject: Re: [PATCH v4 00/11] RFC: [for 5.0]: HMP monitor handlers refactoring
From: Maxim Levitsky <mlevitsk@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Date: Thu, 20 Feb 2020 19:06:52 +0200
In-Reply-To: <20200207182835.GQ3302@work-vm>
References: <20200130123448.21093-1-mlevitsk@redhat.com>
 <20200203195758.GQ2822@work-vm>
 <94ba85dcc5213d386a55706a7bdbb507cfe64d8f.camel@redhat.com>
 <20200207182835.GQ3302@work-vm>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: s2nUKkMcMWmE1lxFMt-slw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2020-02-07 at 18:28 +0000, Dr. David Alan Gilbert wrote:
> * Maxim Levitsky (mlevitsk@redhat.com) wrote:
> > On Mon, 2020-02-03 at 19:57 +0000, Dr. David Alan Gilbert wrote:
> > > * Maxim Levitsky (mlevitsk@redhat.com) wrote:
> > > > This patch series is bunch of cleanups to the hmp monitor code.
> > > > It mostly moves the blockdev related hmp handlers to its own file,
> > > > and does some minor refactoring.
> > > > 
> > > > No functional changes expected.
> > > 
> > > You've still got the title marked as RFC - are you actually ready for
> > > this log?
> > 
> > I forgot to update this to be honest, I don't consider this an RFC,
> > especially since I dropped for now the patches that might cause
> > issues. This is now just a nice refactoring.
> 
> OK, so if we can get some block people to say they're happy, then
> I'd be happy to take this through HMP or they can take it through block.


Any update?

Best regards,
	Maxim Levitsky

> 
> Dave
> 
> > Best regards,
> > 	Maxim Levitsky
> > 
> > > 
> > > Dave
> > > 
> > > > 
> > > > Changes from V1:
> > > >    * move the handlers to block/monitor/block-hmp-cmds.c
> > > >    * tiny cleanup for the commit messages
> > > > 
> > > > Changes from V2:
> > > >    * Moved all the function prototypes to new header (blockdev-hmp-cmds.h)
> > > >    * Set the license of blockdev-hmp-cmds.c to GPLv2+
> > > >    * Moved hmp_snapshot_* functions to blockdev-hmp-cmds.c
> > > >    * Moved hmp_drive_add_node to blockdev-hmp-cmds.c
> > > >      (this change needed some new exports, thus in separate new patch)
> > > >    * Moved hmp_qemu_io and hmp_eject to blockdev-hmp-cmds.c
> > > >    * Added 'error:' prefix to vreport, and updated the iotests
> > > >      This is invasive change, but really feels like the right one
> > > >    * Added minor refactoring patch that drops an unused #include
> > > > 
> > > > Changes from V3:
> > > >    * Dropped the error prefix patches for now due to fact that it seems
> > > >      that libvirt doesn't need that after all. Oh well...
> > > >      I'll send them in a separate series.
> > > > 
> > > >    * Hopefully correctly merged the copyright info the new files
> > > >      Both files are GPLv2 now (due to code from hmp.h/hmp-cmds.c)
> > > > 
> > > >    * Addressed review feedback
> > > >    * Renamed the added header to block-hmp-cmds.h
> > > > 
> > > >    * Got rid of checkpatch.pl warnings in the moved code
> > > >      (cosmetic code changes only)
> > > > 
> > > >    * I kept the reviewed-by tags, since the changes I did are minor.
> > > >      I hope that this is right thing to do.
> > > > 
> > > > Best regards,
> > > > 	Maxim Levitsky
> > > > 
> > > > Maxim Levitsky (11):
> > > >   usb/dev-storage: remove unused include
> > > >   monitor/hmp: uninline add_init_drive
> > > >   monitor/hmp: rename device-hotplug.c to block/monitor/block-hmp-cmds.c
> > > >   monitor/hmp: move hmp_drive_del and hmp_commit to block-hmp-cmds.c
> > > >   monitor/hmp: move hmp_drive_mirror and hmp_drive_backup to
> > > >     block-hmp-cmds.c Moved code was added after 2012-01-13, thus under
> > > >     GPLv2+
> > > >   monitor/hmp: move hmp_block_job* to block-hmp-cmds.c
> > > >   monitor/hmp: move hmp_snapshot_* to block-hmp-cmds.c
> > > >     hmp_snapshot_blkdev is from GPLv2 version of the hmp-cmds.c thus
> > > >     have to change the licence to GPLv2
> > > >   monitor/hmp: move hmp_nbd_server* to block-hmp-cmds.c
> > > >   monitor/hmp: move remaining hmp_block* functions to block-hmp-cmds.c
> > > >   monitor/hmp: move hmp_info_block* to block-hmp-cmds.c
> > > >   monitor/hmp: Move hmp_drive_add_node to block-hmp-cmds.c
> > > > 
> > > >  MAINTAINERS                    |    1 +
> > > >  Makefile.objs                  |    2 +-
> > > >  block/Makefile.objs            |    1 +
> > > >  block/monitor/Makefile.objs    |    1 +
> > > >  block/monitor/block-hmp-cmds.c | 1002 ++++++++++++++++++++++++++++++++
> > > >  blockdev.c                     |  137 +----
> > > >  device-hotplug.c               |   91 ---
> > > >  hw/usb/dev-storage.c           |    1 -
> > > >  include/block/block-hmp-cmds.h |   54 ++
> > > >  include/block/block_int.h      |    5 +-
> > > >  include/monitor/hmp.h          |   24 -
> > > >  include/sysemu/blockdev.h      |    4 -
> > > >  include/sysemu/sysemu.h        |    3 -
> > > >  monitor/hmp-cmds.c             |  769 ------------------------
> > > >  monitor/misc.c                 |    1 +
> > > >  15 files changed, 1072 insertions(+), 1024 deletions(-)
> > > >  create mode 100644 block/monitor/Makefile.objs
> > > >  create mode 100644 block/monitor/block-hmp-cmds.c
> > > >  delete mode 100644 device-hotplug.c
> > > >  create mode 100644 include/block/block-hmp-cmds.h
> > > > 
> > > > -- 
> > > > 2.17.2
> > > > 
> > > 
> > > --
> > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > 
> > 
> 
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK



