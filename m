Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6661F3BBAC4
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:04:55 +0200 (CEST)
Received: from localhost ([::1]:33602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0LTC-0002SZ-Ce
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m0LRP-0008LW-JO
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:03:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m0LRN-0000lK-Ee
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:03:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625479380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+8B9BuQ1mj1/y3OYbCcqfHAPV2J4udysis1xMDyEghM=;
 b=YaYTOwvJAvBEAfAwLBj0c9yUHdihqvYmTqPRx0yGPPXUSLm739T9Kwf2bLd7z+NC8YaKTj
 DEdIYDUTQEFNQ3ICl8w99A903L67NtB53lxPjeKJ+vGkAYZA3yP4OrOKWbTFCTAz8KFdwW
 n08vveHtYfQ1dAsQmEfm8NxheNFP7F4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-pnvGPJkDPi261dEkl4eKVg-1; Mon, 05 Jul 2021 06:02:59 -0400
X-MC-Unique: pnvGPJkDPi261dEkl4eKVg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2ED34100C609;
 Mon,  5 Jul 2021 10:02:55 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-11.ams2.redhat.com
 [10.36.114.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D457A60C0F;
 Mon,  5 Jul 2021 10:02:40 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, linfeng23@huawei.com,
 groug@kaod.org, huangy81@chinatelecom.cn, lvivier@redhat.com,
 lizhijian@cn.fujitsu.com, peterx@redhat.com, vgoyal@redhat.com
Subject: [PULL v2 00/19] migration queue
Date: Mon,  5 Jul 2021 11:02:16 +0100
Message-Id: <20210705100235.157093-1-dgilbert@redhat.com>
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
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: leobras@redhat.com, stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit 711c0418c8c1ce3a24346f058b001c4c5a2f0f81:

  Merge remote-tracking branch 'remotes/philmd/tags/mips-20210702' into staging (2021-07-04 14:04:12 +0100)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-migration-20210705a

for you to fetch changes up to e5f607913cee3f3b486eb024dbc7079b51f6da57:

  migration/rdma: Use error_report to suppress errno message (2021-07-05 10:51:26 +0100)

----------------------------------------------------------------
Migration and virtiofs pull 2021-07-01 v2

Dropped Peter Xu's migration-test fix to reenable
most of the migration tests when uffd isn't available;
we're seeing at least one seg in github CI (on qemu-system-i386)
and Peter Maydell is reporting a hang on Openbsd.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Daniel P. Berrangé (2):
      virtiofsd: use GDateTime for formatting timestamp for debug messages
      docs: describe the security considerations with virtiofsd xattr mapping

Feng Lin (1):
      migration: fix the memory overwriting risk in add_to_iovec

Greg Kurz (1):
      virtiofsd: Don't allow file creation with FUSE_OPEN

Hyman Huang(黄勇) (2):
      tests/migration: parse the thread-id key of CpuInfoFast
      tests/migration: fix "downtime_limit" type when "migrate-set-parameters"

Laurent Vivier (2):
      migration: move wait-unplug loop to its own function
      migration: failover: continue to wait card unplug on error

Li Zhijian (1):
      migration/rdma: Use error_report to suppress errno message

Peter Xu (3):
      tests: migration-test: Add dirty ring test
      migration: Move yank outside qemu_start_incoming_migration()
      migration: Allow reset of postcopy_recover_triggered when failed

Vivek Goyal (7):
      virtiofsd: Fix fuse setxattr() API change issue
      virtiofsd: Fix xattr operations overwriting errno
      virtiofsd: Add support for extended setxattr
      virtiofsd: Add umask to seccom allow list
      virtiofsd: Add capability to change/restore umask
      virtiofsd: Switch creds, drop FSETID for system.posix_acl_access xattr
      virtiofsd: Add an option to enable/disable posix acls

 docs/tools/virtiofsd.rst              |  58 +++++++-
 migration/migration.c                 |  89 +++++++-----
 migration/qemu-file.c                 |   5 +
 migration/rdma.c                      |   4 +-
 tests/migration/guestperf/engine.py   |   4 +-
 tests/qtest/migration-test.c          |  58 +++++++-
 tools/virtiofsd/fuse_common.h         |   5 +
 tools/virtiofsd/fuse_lowlevel.c       |  24 +++-
 tools/virtiofsd/fuse_lowlevel.h       |   3 +-
 tools/virtiofsd/helper.c              |   1 +
 tools/virtiofsd/passthrough_ll.c      | 254 +++++++++++++++++++++++++++++-----
 tools/virtiofsd/passthrough_seccomp.c |   1 +
 12 files changed, 423 insertions(+), 83 deletions(-)


