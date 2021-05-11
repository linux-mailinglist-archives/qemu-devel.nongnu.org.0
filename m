Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D7B37AA5F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:13:24 +0200 (CEST)
Received: from localhost ([::1]:33786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgU4Z-0005Ln-Cv
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgU0M-0006YT-PB
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:09:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgU0L-0004G0-1s
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:09:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620745740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WGwr5klsQJ4hZu/8Hv71B3eClWz6qSPCAdx18ZLy1WY=;
 b=bwJaHp+D3EzTqNxrs7GM4oCGSxmXUUn0Tz9N3BbRlg0EgnCPq6zth7RdcnV/jypX9XUiHZ
 Ad8zCGkdmu+OzsHbHTBhQi3VNc+OmhcGuhe+yGU2qwQu0clAkSQQEub+ZZnLtI6e3eLprw
 uWIM9VhSJnCCxEHWu6SsC6egBCPBfiI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-JN6Uj6c9OYK4bhvT-hceNg-1; Tue, 11 May 2021 11:08:56 -0400
X-MC-Unique: JN6Uj6c9OYK4bhvT-hceNg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 225A5107AD32;
 Tue, 11 May 2021 15:08:55 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-51.ams2.redhat.com
 [10.36.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5C5E614EB;
 Tue, 11 May 2021 15:08:46 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, david@redhat.com, zhukeqian1@huawei.com,
 jiangkunkun@huawei.com, armbru@redhat.com, peter.maydell@linaro.org,
 huangy81@chinatelecom.cn
Subject: [PULL 00/17] migration queue
Date: Tue, 11 May 2021 16:08:25 +0100
Message-Id: <20210511150842.207155-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit e4f3ede95ce813d5705c65e1c0e1c80c70739ebb:

  Merge remote-tracking branch 'remotes/kraxel/tags/usb-20210505-pull-request' into staging (2021-05-10 19:55:06 +0100)

are available in the Git repository at:

  git://github.com/dagrh/qemu.git tags/pull-migration-20210511a

for you to fetch changes up to 872df23afc70985af5a458e0c4bd2b984559015c:

  tests/migration: introduce multifd into guestperf (2021-05-11 11:26:19 +0100)

----------------------------------------------------------------
Migration pull 2021-05-11

The largest change in this set is David's changes for ram block size
changing; then there's a pile of other cleanups and fixes.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
David Hildenbrand (11):
      migrate/ram: remove "ram_bulk_stage" and "fpo_enabled"
      util: vfio-helpers: Factor out and fix processing of existing ram blocks
      numa: Teach ram block notifiers about resizeable ram blocks
      numa: Make all callbacks of ram block notifiers optional
      migration/ram: Handle RAM block resizes during precopy
      exec: Relax range check in ram_block_discard_range()
      migration/ram: Discard RAM when growing RAM blocks after ram_postcopy_incoming_init()
      migration/ram: Simplify host page handling in ram_load_postcopy()
      migration/ram: Handle RAM block resizes during postcopy
      migration/multifd: Print used_length of memory block
      migration/ram: Use offset_in_ramblock() in range checks

Dr. David Alan Gilbert (1):
      tests/migration-test: Fix "true" vs true

Hyman (1):
      tests/migration: introduce multifd into guestperf

Kunkun Jiang (2):
      migration/ram: Reduce unnecessary rate limiting
      migration/ram: Optimize ram_save_host_page()

Markus Armbruster (1):
      migration: Drop redundant query-migrate result @blocked

Peter Maydell (1):
      tests/qtest/migration-test: Use g_autofree to avoid leaks on error paths

 hw/core/numa.c                          |  41 +++++-
 hw/i386/xen/xen-mapcache.c              |   7 +-
 hw/virtio/virtio-balloon.c              |   4 +-
 hw/virtio/virtio-mem.c                  |   3 -
 include/exec/cpu-common.h               |   1 +
 include/exec/memory.h                   |  10 +-
 include/exec/ramblock.h                 |  10 ++
 include/exec/ramlist.h                  |  13 +-
 include/migration/misc.h                |   1 -
 migration/migration.c                   |  38 ++---
 migration/migration.h                   |   1 +
 migration/multifd.c                     |   2 +-
 migration/postcopy-ram.c                |  15 +-
 migration/ram.c                         | 246 ++++++++++++++++++--------------
 monitor/hmp-cmds.c                      |   2 +-
 qapi/migration.json                     |   6 -
 softmmu/physmem.c                       |  26 +++-
 target/i386/hax/hax-mem.c               |   5 +-
 target/i386/sev.c                       |  18 +--
 tests/migration/guestperf/comparison.py |  14 ++
 tests/migration/guestperf/engine.py     |  16 +++
 tests/migration/guestperf/scenario.py   |  12 +-
 tests/migration/guestperf/shell.py      |  10 +-
 tests/qtest/migration-test.c            |  75 ++++------
 util/vfio-helpers.c                     |  41 ++----
 25 files changed, 367 insertions(+), 250 deletions(-)


