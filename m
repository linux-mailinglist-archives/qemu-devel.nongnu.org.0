Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526EE2DE1A7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:59:32 +0100 (CET)
Received: from localhost ([::1]:40086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDTv-00077N-0r
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:59:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDCX-000339-Ga
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:41:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDCU-0004Ut-2d
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:41:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608288088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2V999tfxVPzJ6KiHkHfrys2nCi1DyBpDZC4BcU8YQpI=;
 b=D5UdpaJ1JBRfcmw1DkenRsoy/7J8nr7X45ygZTVv8Pdzxej1q2P9+jyGuF6zZth8yiJMvp
 fshuweaJPUiCi3ThDxVxy1p/nMMq5rQkyG4L5SRaSLd6b+dT6UGdQWpxuUWOA8VB6yM1pi
 kNBly0VXxmzfkpqoxLMqWIo66WnGMgE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-I7BOSnskOdKrOh6kOAlezw-1; Fri, 18 Dec 2020 05:41:26 -0500
X-MC-Unique: I7BOSnskOdKrOh6kOAlezw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18B5359;
 Fri, 18 Dec 2020 10:41:25 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-200.ams2.redhat.com
 [10.36.114.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A565560C15;
 Fri, 18 Dec 2020 10:41:19 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, aiyutao@huawei.com, peter.maydell@linaro.org,
 vgoyal@redhat.com, lersek@redhat.com, alex.chen@huawei.com,
 armbru@redhat.com, tu.guoyi@h3c.com
Subject: [PULL 00/15] migration queue
Date: Fri, 18 Dec 2020 10:41:02 +0000
Message-Id: <20201218104117.199096-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit 75ee62ac606bfc9eb59310b9446df3434bf6e8c2:

  Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-request' into staging (2020-12-17 18:53:36 +0000)

are available in the Git repository at:

  git://github.com/dagrh/qemu.git tags/pull-migration-20201218a

for you to fetch changes up to 36d0fe65160d83cb065de9b6fe60114ee127d9f0:

  migration: Don't allow migration if vm is in POSTMIGRATE (2020-12-18 10:08:25 +0000)

----------------------------------------------------------------
Monitor, virtiofsd and migration pull

HMP cleanups
Migration fixes
  Note the change in behaviour of not allowing a postmigrate migrtion
  rather than crashing

Virtiofsd cleanups and fixes
  --thread-pool-size=0 for no thread pool (faster for some workloads)

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Alex Chen (1):
      virtiofsd: Remove useless code about send_notify_iov

Laszlo Ersek (2):
      virtiofsd: make the debug log timestamp on stderr more human-readable
      virtiofsd: update FUSE_FORGET comment on "lo_inode.nlookup"

Markus Armbruster (1):
      docs/devel/migration: Improve debugging section a bit

Peter Maydell (1):
      hmp-commands.hx: List abbreviation after command for cont, quit, print

Tuguoyi (3):
      savevm: Remove dead code in save_snapshot()
      savevm: Delete snapshots just created in case of error
      migration: Don't allow migration if vm is in POSTMIGRATE

Vivek Goyal (4):
      virtiofsd: Use --thread-pool-size=0 to mean no thread pool
      virtiofsd: Set up posix_lock hash table for root inode
      virtiofsd: Disable posix_lock hash table if remote locks are not enabled
      virtiofsd: Check file type in lo_flush()

Yutao Ai (3):
      monitor:open brace '{' following struct go on the same line
      monitor:braces {} are necessary for all arms of this statement
      monitor:Don't use '#' flag of printf format ('%#') in format strings

 docs/devel/migration.rst         | 11 +++--
 hmp-commands.hx                  | 12 ++---
 migration/migration.c            |  6 +++
 migration/savevm.c               | 11 ++---
 monitor/hmp-cmds.c               |  3 +-
 monitor/misc.c                   | 16 ++++---
 tools/virtiofsd/fuse_lowlevel.c  | 98 ----------------------------------------
 tools/virtiofsd/fuse_virtio.c    | 36 +++++++++++----
 tools/virtiofsd/passthrough_ll.c | 91 +++++++++++++++++++++++++++++--------
 9 files changed, 131 insertions(+), 153 deletions(-)


