Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F4630F950
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 18:16:17 +0100 (CET)
Received: from localhost ([::1]:41068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7iEq-00027G-Gl
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 12:16:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7hgA-0000qk-5P
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:40:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7hfv-0004cQ-Q1
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:40:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612456809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sJRtlrRi+ayfBnt4kwlZNaPoqEJSlXBxZjL3PYNPR6s=;
 b=HVKHfOutfCvv1Fifgnirho8ApT6HdyIyhUo2MlPwvsgH/Sj10yPLgaL/N69EczLTXIzr68
 BpPD0r/ewcGarmAcb+NuJHt86jXs3BJ+50zOc4OMEJ2N2ly9siqq4ek7vpCkst05+FyhIP
 bKxBww/z3mlFipm07tNHEqF4Cc3QOwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-Qms0SK3fN9qUrTbWVsspeg-1; Thu, 04 Feb 2021 11:40:07 -0500
X-MC-Unique: Qms0SK3fN9qUrTbWVsspeg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1116A85B6F9;
 Thu,  4 Feb 2021 16:40:04 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-21.ams2.redhat.com
 [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E17D19708;
 Thu,  4 Feb 2021 16:40:01 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com, berrange@redhat.com,
 gaojinhao@huawei.com, armbru@redhat.com, mst@redhat.com, philmd@redhat.com,
 wainersm@redhat.com
Subject: [PULL 00/27] migration queue
Date: Thu,  4 Feb 2021 16:39:32 +0000
Message-Id: <20210204163959.377618-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit 1ba089f2255bfdb071be3ce6ac6c3069e8012179:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-qmp-2021-02-04' into staging (2021-02-04 14:15:35 +0000)

are available in the Git repository at:

  git://github.com/dagrh/qemu.git tags/pull-migration-20210204a

for you to fetch changes up to ef74d46576a9e5aff96f285b74150f341a525688:

  migration: introduce snapshot-{save, load, delete} QMP commands (2021-02-04 16:29:03 +0000)

----------------------------------------------------------------
Migration pull 2020-02-04

 New snapshot features:
   a) Andrey's RAM snapshot feature using userfault-wp
   b) Dan's native-QMP snapshots

Cleanups:
   c) Jinhao's memory leeak fixes
   d) Wainer's maybe unitialized fix
   e) Markus's parameter fixes

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Andrey Gruzdev (5):
      migration: introduce 'background-snapshot' migration capability
      migration: introduce UFFD-WP low-level interface helpers
      migration: support UFFD write fault processing in ram_save_iterate()
      migration: implementation of background snapshot thread
      migration: introduce 'userfaultfd-wrlat.py' script

Daniel P. Berrangé (11):
      block: push error reporting into bdrv_all_*_snapshot functions
      migration: stop returning errno from load_snapshot()
      block: add ability to specify list of blockdevs during snapshot
      block: allow specifying name of block device for vmstate storage
      block: rename and alter bdrv_all_find_snapshot semantics
      migration: control whether snapshots are ovewritten
      migration: wire up support for snapshot device selection
      migration: introduce a delete_snapshot wrapper
      iotests: add support for capturing and matching QMP events
      iotests: fix loading of common.config from tests/ subdir
      migration: introduce snapshot-{save, load, delete} QMP commands

Dr. David Alan Gilbert (2):
      migration: Add blocker information
      migration: Display the migration blockers

Jinhao Gao (3):
      spapr_pci: Fix memory leak of vmstate_spapr_pci
      savevm: Fix memory leak of vmstate_configuration
      vmstate: Fix memory leak in vmstate_handle_alloc()

Markus Armbruster (4):
      migration: Fix migrate-set-parameters argument validation
      migration: Clean up signed vs. unsigned XBZRLE cache-size
      migration: Fix cache_init()'s "Failed to allocate" error messages
      migration: Fix a few absurdly defective error messages

Philippe Mathieu-Daudé (1):
      migration: Make save_snapshot() return bool, not 0/-1

Wainer dos Santos Moschetta (1):
      migration/qemu-file: Fix maybe uninitialized on qemu_get_buffer_in_place()

 block/monitor/block-hmp-cmds.c |   7 +-
 block/snapshot.c               | 256 ++++++++++++++++++--------
 hw/ppc/spapr_pci.c             |  11 ++
 include/block/snapshot.h       |  23 ++-
 include/exec/memory.h          |   8 +
 include/migration/snapshot.h   |  47 ++++-
 include/qemu/userfaultfd.h     |  35 ++++
 migration/migration.c          | 409 +++++++++++++++++++++++++++++++++++++++--
 migration/migration.h          |   6 +-
 migration/page_cache.c         |   8 +-
 migration/page_cache.h         |   2 +-
 migration/qemu-file.c          |   2 +-
 migration/ram.c                | 305 +++++++++++++++++++++++++++++-
 migration/ram.h                |   8 +-
 migration/savevm.c             | 341 +++++++++++++++++++++++++++++-----
 migration/savevm.h             |   3 +
 migration/trace-events         |   2 +
 migration/vmstate.c            |   1 +
 monitor/hmp-cmds.c             |  45 +++--
 qapi/job.json                  |   9 +-
 qapi/migration.json            | 218 ++++++++++++++++++++--
 replay/replay-debugging.c      |  12 +-
 replay/replay-snapshot.c       |   5 +-
 scripts/userfaultfd-wrlat.py   | 122 ++++++++++++
 softmmu/vl.c                   |   2 +-
 tests/qemu-iotests/267.out     |  12 +-
 tests/qemu-iotests/common.qemu | 106 ++++++++++-
 tests/qemu-iotests/common.rc   |  10 +-
 util/meson.build               |   1 +
 util/trace-events              |   9 +
 util/userfaultfd.c             | 345 ++++++++++++++++++++++++++++++++++
 31 files changed, 2145 insertions(+), 225 deletions(-)
 create mode 100644 include/qemu/userfaultfd.h
 create mode 100755 scripts/userfaultfd-wrlat.py
 create mode 100644 util/userfaultfd.c


