Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9083B9309
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 16:18:44 +0200 (CEST)
Received: from localhost ([::1]:52710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyxWd-0007Wp-2D
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 10:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyxUD-0004hB-IM
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 10:16:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyxUA-0005sU-G3
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 10:16:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625148968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RVL2wu0HI8X1Wryy8cAhcyKAD+Kiq1sxp6Rh/Rf3GW8=;
 b=aDYPd/uhae3mLz7gMhI6tLjJNP9l/MotsKYNmxnpTI5ykhkw/RhV964wQOZqNvs8vHvIto
 91TCy7Amn5kPHCopi/hdYV4nMGbgT4djMorUHWoTQtvn1p9bl0S2wA8yV48VwBlNJwztdR
 q6Or6P/sezsg8M0ofFjfBz8RKLpPv5g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-kyNBz5xpMaSznMRVJeBLWQ-1; Thu, 01 Jul 2021 10:16:06 -0400
X-MC-Unique: kyNBz5xpMaSznMRVJeBLWQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 347F4802B7E;
 Thu,  1 Jul 2021 14:16:05 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-230.ams2.redhat.com
 [10.36.114.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B4B460843;
 Thu,  1 Jul 2021 14:15:52 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, linfeng23@huawei.com,
 groug@kaod.org, huangy81@chinatelecom.cn, lvivier@redhat.com,
 lizhijian@cn.fujitsu.com, peterx@redhat.com, vgoyal@redhat.com
Subject: [PULL 00/20] migration queue
Date: Thu,  1 Jul 2021 15:15:25 +0100
Message-Id: <20210701141545.193571-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The following changes since commit 1ec2cd0ce2ca94292ce237becc2c21b4eb9edca0:

  Merge remote-tracking branch 'remotes/nvme/tags/nvme-next-pull-request' into staging (2021-06-30 21:09:27 +0100)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-migration-20210701a

for you to fetch changes up to 9c21e61435e09a7a67f951a096b93183a7a5ad89:

  migration/rdma: Use error_report to suppress errno message (2021-07-01 12:21:32 +0100)

----------------------------------------------------------------
Migration and virtiofs pull 2021-07-01

A bunch of small fixes and improvements; two particular to note:
  a) Peter's fix to migration-test for uffd, means that a lot of
migration tests will start running in a lot of places again when they'd
previously been skipped.
  b) Vivek's 'Fix fuse_setxattr...' fixes our build against an API
breakage in the kernel headers.

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

Peter Xu (4):
      tests: migration-test: Still run the rest even if uffd missing
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
 tests/qtest/migration-test.c          |  69 +++++++--
 tools/virtiofsd/fuse_common.h         |   5 +
 tools/virtiofsd/fuse_lowlevel.c       |  24 +++-
 tools/virtiofsd/fuse_lowlevel.h       |   3 +-
 tools/virtiofsd/helper.c              |   1 +
 tools/virtiofsd/passthrough_ll.c      | 254 +++++++++++++++++++++++++++++-----
 tools/virtiofsd/passthrough_seccomp.c |   1 +
 12 files changed, 428 insertions(+), 89 deletions(-)


