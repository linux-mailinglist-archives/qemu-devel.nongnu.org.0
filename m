Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B20A2B7C73
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 12:24:54 +0100 (CET)
Received: from localhost ([::1]:50122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfLa1-0006hs-FZ
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 06:24:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kfLXv-00054Q-JJ
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 06:22:45 -0500
Received: from relay.sw.ru ([185.231.240.75]:41858 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kfLXq-0003Oh-HE
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 06:22:43 -0500
Received: from [192.168.15.76] (helo=andrey-MS-7B54.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kfLXa-009A89-Sd; Wed, 18 Nov 2020 14:22:22 +0300
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [PATCH 0/7] UFFD write-tracking migration/snapshots
Date: Wed, 18 Nov 2020 14:22:26 +0300
Message-Id: <20201118112233.264530-1-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.gruzdev@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 06:22:34
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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

Currently the only way to make (external) live VM snapshot is using existing
dirty page logging migration mechanism. The main problem is that it tends to
produce a lot of page duplicates while running VM goes on updating already
saved pages. That leads to the fact that vmstate image size is commonly several
times bigger then non-zero part of virtual machine's RSS. Time required to
converge RAM migration and the size of snapshot image severely depend on the
guest memory write rate, sometimes resulting in unacceptably long snapshot
creation time and huge image size 

This series propose a way to solve the aforementioned problems. This is done
by using different RAM migration mechanism based on UFFD write protection
management introduced in v5.7 kernel. The migration strategy is to 'freeze'
guest RAM content using write-protection and iteratively release protection
for memory ranges that have already been saved to the migration stream.
At the same time we read in pending UFFD write fault events and save those
pages out-of-order with higher priority.

How to use:
1. Enable write-tracking migration capability
   virsh qemu-monitor-command <domain> --hmp migrate_set_capability track-writes-ram on

2. Start the external migration to a file
   virsh qemu-monitor-command <domain> --hmp migrate exec:'cat > ./vm_state'

3. Wait for the migration finish and check that the migration has completed state.

Andrey Gruzdev (7):
  Introduce 'track-writes-ram' migration capability.
  Introduced UFFD-WP low-level interface helpers. Implemented support
    for the whole RAM block memory protection/un-protection. Higher
    level ram_write_tracking_start() and ram_write_tracking_stop() to
    start/stop tracking memory writes on the whole VM memory.
  Support UFFD write fault processing in ram_save_iterate().
  Implementation of write-tracking migration thread.
  Implementation of vm_start() BH.
  The rest of write tracking migration code.
  Introduced simple linear scan rate limiting mechanism for write
    tracking migration.

 include/exec/memory.h |   7 +
 migration/migration.c | 344 ++++++++++++++++++++++++++++++++-
 migration/migration.h |   4 +
 migration/ram.c       | 439 +++++++++++++++++++++++++++++++++++++++++-
 migration/ram.h       |   4 +
 migration/savevm.c    |   1 -
 migration/savevm.h    |   2 +
 qapi/migration.json   |   7 +-
 8 files changed, 796 insertions(+), 12 deletions(-)

-- 
2.25.1


