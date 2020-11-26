Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66712C57F9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 16:21:25 +0100 (CET)
Received: from localhost ([::1]:32824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiJ5I-0005bT-JZ
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 10:21:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kiJ2B-0003oU-76
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 10:18:11 -0500
Received: from relay.sw.ru ([185.231.240.75]:49550 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kiJ28-000831-4f
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 10:18:10 -0500
Received: from [192.168.15.178] (helo=andrey-MS-7B54.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kiJ1a-00AT4g-JY; Thu, 26 Nov 2020 18:17:34 +0300
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [PATCH v4 0/6] UFFD write-tracking migration/snapshots
Date: Thu, 26 Nov 2020 18:17:28 +0300
Message-Id: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.gruzdev@virtuozzo.com; helo=relay3.sw.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
From: Andrey Gruzdev via <qemu-devel@nongnu.org>

This patch series is a kind of 'rethinking' of Denis Plotnikov's ideas he's
implemented in his series '[PATCH v0 0/4] migration: add background snapshot'.

Currently the only way to make (external) live VM snapshot is using existing
dirty page logging migration mechanism. The main problem is that it tends to
produce a lot of page duplicates while running VM goes on updating already
saved pages. That leads to the fact that vmstate image size is commonly several
times bigger then non-zero part of virtual machine's RSS. Time required to
converge RAM migration and the size of snapshot image severely depend on the
guest memory write rate, sometimes resulting in unacceptably long snapshot
creation time and huge image size.

This series propose a way to solve the aforementioned problems. This is done
by using different RAM migration mechanism based on UFFD write protection
management introduced in v5.7 kernel. The migration strategy is to 'freeze'
guest RAM content using write-protection and iteratively release protection
for memory ranges that have already been saved to the migration stream.
At the same time we read in pending UFFD write fault events and save those
pages out-of-order with higher priority.

How to use:
1. Enable write-tracking migration capability
   virsh qemu-monitor-command <domain> --hmp migrate_set_capability.
track-writes-ram on

2. Start the external migration to a file
   virsh qemu-monitor-command <domain> --hmp migrate exec:'cat > ./vm_state'

3. Wait for the migration finish and check that the migration has completed.
state.

Changes v3->v4:

* 1. Renamed migrate capability 'track-writes-ram'->'background-snapshot'.
* 2. Use array of incompatible caps to replace bulky 'if' constructs.
* 3. Moved UFFD low-level code to the separate module ('util/userfaultfd.c').
* 4. Always do UFFD wr-unprotect on cleanup; just closing file descriptor
*    won't cleanup PTEs anyhow, it will release registration ranges, wait 
*    queues etc. but won't cleanup process MM context on MMU level.
* 5. Allow to enable 'background-snapshot' capability on Linux-only hosts.
* 6. Put UFFD code usage under '#ifdef CONFIG_LINUX' prerequisite.
* 7. Removed 'wt_' from RAMState struct.
* 8. Refactored ram_find_and_save_block() to make more clean - poll UFFD
*    wr-fault events in get_queued_page(), use ram_save_host_page_pre(),
*    ram_save_host_page_post() notifiers around ram_save_host_page()
*    instead of bulky inline write-unprotect code.

Andrey Gruzdev (6):
  introduce 'background-snapshot' migration capability
  introduce UFFD-WP low-level interface helpers
  support UFFD write fault processing in ram_save_iterate()
  implementation of background snapshot thread
  the rest of write tracking migration code
  introduce simple linear scan rate limiting mechanism

 include/exec/memory.h      |   7 +
 include/qemu/userfaultfd.h |  29 ++++
 migration/migration.c      | 314 +++++++++++++++++++++++++++++++++-
 migration/migration.h      |   4 +
 migration/ram.c            | 334 ++++++++++++++++++++++++++++++++++++-
 migration/ram.h            |   4 +
 migration/savevm.c         |   1 -
 migration/savevm.h         |   2 +
 qapi/migration.json        |   7 +-
 util/meson.build           |   1 +
 util/userfaultfd.c         | 215 ++++++++++++++++++++++++
 11 files changed, 908 insertions(+), 10 deletions(-)
 create mode 100644 include/qemu/userfaultfd.h
 create mode 100644 util/userfaultfd.c

-- 
2.25.1


