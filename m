Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5C537FC9F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:40:52 +0200 (CEST)
Received: from localhost ([::1]:33720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhFKM-0007Yo-88
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lhFHX-0005El-TO
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:37:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lhFHU-00015D-IF
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620927471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FoCsF4K0aI3UzmKpenjR22UTkU/nWhHsEnYBzkdG+ys=;
 b=EnlxLVAqc0e6q0zIuloB24dsQTO3pqlVmaLCLCbiWJy7WfaX8SYDAsmDZnaviqAEdWvkUv
 k1CwkyA271/94362l7OqFlByd9VHGfE5ECAZE9FueGaiEPFFgDhr/7m7ffgcf9gBw0rQTN
 b6JtDPnk0KpXGC5r4+zDCJV507e6Has=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-SWD2RF5vMGiD0Ph1UVVeGQ-1; Thu, 13 May 2021 13:37:47 -0400
X-MC-Unique: SWD2RF5vMGiD0Ph1UVVeGQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73F4780ED8D;
 Thu, 13 May 2021 17:37:45 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-200.ams2.redhat.com
 [10.36.113.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 570FE5D6AC;
 Thu, 13 May 2021 17:37:43 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, david@redhat.com, zhukeqian1@huawei.com,
 jiangkunkun@huawei.com, armbru@redhat.com, peter.maydell@linaro.org,
 huangy81@chinatelecom.cn
Subject: [PULL 00/17] migration queue
Date: Thu, 13 May 2021 18:37:20 +0100
Message-Id: <20210513173737.279402-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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

The following changes since commit dab59ce031228066eb95a9c518846fcacfb0dbbf:

  Merge remote-tracking branch 'remotes/philmd/tags/pflash-20210511' into staging (2021-05-13 14:45:38 +0100)

are available in the Git repository at:

  git://github.com/dagrh/qemu.git tags/pull-migration-20210513a

for you to fetch changes up to 1c3baa1ac4dee2b52837fda89d1d9deeb5da512e:

  tests/migration: introduce multifd into guestperf (2021-05-13 18:21:14 +0100)

----------------------------------------------------------------
Migration pull 2021-05-13

Fix of the 2021-05-11 version, with a fix to build on the armhf
cross.

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


