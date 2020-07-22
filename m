Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FD4229331
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 10:12:58 +0200 (CEST)
Received: from localhost ([::1]:45086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jy9s1-0000ZM-Ew
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 04:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1jy9qt-0007jT-QW
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 04:11:47 -0400
Received: from relay.sw.ru ([185.231.240.75]:54950 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1jy9qq-0004p3-N6
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 04:11:47 -0400
Received: from [10.94.4.71] (helo=dptest2.qa.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1jy9ql-0002yK-O1; Wed, 22 Jul 2020 11:11:39 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v0 0/4] background snapshot
Date: Wed, 22 Jul 2020 11:11:29 +0300
Message-Id: <20200722081133.29926-1-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=dplotnikov@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/22 04:11:41
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_BL_SPAMCOP_NET=1.347,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: quintela@redhat.com, dgilbert@redhat.com, peterx@redhat.com,
 armbru@redhat.com, den@openvz.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently where is no way to make a vm snapshot without pausing a vm
for the whole time until the snapshot is done. So, the problem is
the vm downtime on snapshoting. The downtime value depends on the vmstate
size, the major part of which is RAM and the disk performance which is
used for the snapshot saving.

The series propose a way to reduce the vm snapshot downtime. This is done
by saving RAM, the major part of vmstate, in the background when the vm
is running.

The background snapshot uses linux UFFD write-protected mode for memory
page access intercepting. UFFD write-protected mode was added to the linux v5.7.
If UFFD write-protected mode isn't available the background snapshot rejects to
run.

How to use:
1. enable background snapshot capability
   virsh qemu-monitor-command vm --hmp migrate_set_capability background-snapshot on

2. stop the vm
   virsh qemu-monitor-command vm --hmp stop

3. Start the external migration to a file
   virsh qemu-monitor-command cent78-bs --hmp migrate exec:'cat > ./vm_state'

4. Wait for the migration finish and check that the migration has completed state.

Denis Plotnikov (4):
  bitops: add some atomic versions of bitmap operations
  migration: add background snapshot capability
  migration: add background snapshot
  background snapshot: add trace events for page fault processing

 qapi/migration.json     |   7 +-
 include/exec/ramblock.h |   8 +
 include/exec/ramlist.h  |   2 +
 include/qemu/bitops.h   |  25 ++
 migration/migration.h   |   1 +
 migration/ram.h         |  19 +-
 migration/savevm.h      |   3 +
 migration/migration.c   | 142 +++++++++-
 migration/ram.c         | 582 ++++++++++++++++++++++++++++++++++++++--
 migration/savevm.c      |   1 -
 migration/trace-events  |   2 +
 11 files changed, 771 insertions(+), 21 deletions(-)

-- 
2.17.0


