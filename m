Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFCC313B53
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 18:46:31 +0100 (CET)
Received: from localhost ([::1]:55772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9AcI-0001GB-RV
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 12:46:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94jp-0001Y5-VX
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:29:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94jZ-0002CC-OK
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:29:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612783776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZkYv4txIXiIXyk/z9IeUjOYCN9sFFp4eFcd+ms49UVo=;
 b=cFRqqCoHYvkNxOQfweLlEgnwIru/hy7aki+cY+nBQIjrsP28DyJNnO+HOUj/rV9VWzHaLZ
 OIeRwIiD1FGhZuJLDtPeuX00lYXcodMsxsJwR7X29Jmy+pkAQr4rEVrlcNOm0RNxCtR2k6
 2SHRj/uRFyK6j7uKKG1mpZ5ggB8qJDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-S-OBCBuiN16kfjGPliNrJQ-1; Mon, 08 Feb 2021 06:29:32 -0500
X-MC-Unique: S-OBCBuiN16kfjGPliNrJQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E6DB101F7CB;
 Mon,  8 Feb 2021 11:29:31 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-22.ams2.redhat.com
 [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08CDD1002388;
 Mon,  8 Feb 2021 11:29:21 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com, berrange@redhat.com,
 gaojinhao@huawei.com, armbru@redhat.com, mst@redhat.com, philmd@redhat.com,
 wainersm@redhat.com, s.reiter@proxmox.com
Subject: [PULL 00/27] migration queue
Date: Mon,  8 Feb 2021 11:28:51 +0000
Message-Id: <20210208112918.185058-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

The following changes since commit 2766043345748626490e04d69b7a9493c0294cfc:

  Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-20210207' into staging (2021-02-08 09:23:53 +0000)

are available in the Git repository at:

  git://github.com/dagrh/qemu.git tags/pull-migration-20210208a

for you to fetch changes up to e846b746502e94ce5cb148201ebdaa9c0f658741:

  migration: only check page size match if RAM postcopy is enabled (2021-02-08 11:19:52 +0000)

----------------------------------------------------------------
Migration pull 2021-02-08

v2
  Dropped vmstate: Fix memory leak in vmstate_handle_alloc
    Broke on Power
  Added migration: only check page size match if RAM postcopy is enabled

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

Jinhao Gao (2):
      spapr_pci: Fix memory leak of vmstate_spapr_pci
      savevm: Fix memory leak of vmstate_configuration

Markus Armbruster (4):
      migration: Fix migrate-set-parameters argument validation
      migration: Clean up signed vs. unsigned XBZRLE cache-size
      migration: Fix cache_init()'s "Failed to allocate" error messages
      migration: Fix a few absurdly defective error messages

Philippe Mathieu-Daudé (1):
      migration: Make save_snapshot() return bool, not 0/-1

Stefan Reiter (1):
      migration: only check page size match if RAM postcopy is enabled

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
 migration/ram.c                | 307 ++++++++++++++++++++++++++++++-
 migration/ram.h                |   8 +-
 migration/savevm.c             | 341 +++++++++++++++++++++++++++++-----
 migration/savevm.h             |   3 +
 migration/trace-events         |   2 +
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
 30 files changed, 2145 insertions(+), 226 deletions(-)
 create mode 100644 include/qemu/userfaultfd.h
 create mode 100755 scripts/userfaultfd-wrlat.py
 create mode 100644 util/userfaultfd.c


