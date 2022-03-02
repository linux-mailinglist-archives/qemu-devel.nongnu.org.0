Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366394CADF9
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:55:36 +0100 (CET)
Received: from localhost ([::1]:60334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPU8N-0002PC-8Y
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:55:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTlo-0004Ge-Dy
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:32:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTli-0000Uj-KM
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:32:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646245927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ahpEIO1A4ypveZmCdcQ2DkEgQpXU13a1uc/9UoWdzbo=;
 b=h5oX7waqISytFJURdE85s6uBC4jpStcBb9Reoj0ZGVxT71V38Itkch5JaARN5zBB1LNp2q
 4QV6XNJxjcOZe/ZE5xa/EfdNO8UTbWwXl16UTDTzoZPhhYO6VSYvw6X3vUvkDj8YFDn6Yn
 fuN9MF92yBoqhgd2FbFQlW0xMxwr+OU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-OImzQMhANpCZxQSXW50Daw-1; Wed, 02 Mar 2022 13:31:23 -0500
X-MC-Unique: OImzQMhANpCZxQSXW50Daw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C4E780D6A5;
 Wed,  2 Mar 2022 18:30:29 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E763E1059172;
 Wed,  2 Mar 2022 18:29:41 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, f.ebner@proxmox.com, hreitz@redhat.com,
 jinpu.wang@ionos.com, peter.maydell@linaro.org, peterx@redhat.com,
 s.reiter@proxmox.com
Subject: [PULL 00/18] migration queue
Date: Wed,  2 Mar 2022 18:29:18 +0000
Message-Id: <20220302182936.227719-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit 64ada298b98a51eb2512607f6e6180cb330c47b1:

  Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220302' into staging (2022-03-02 12:38:46 +0000)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220302b

for you to fetch changes up to 18621987027b1800f315fb9e29967e7b5398ef6f:

  migration: Remove load_state_old and minimum_version_id_old (2022-03-02 18:20:45 +0000)

----------------------------------------------------------------
Migration/HMP/Virtio pull 2022-03-02

A bit of a mix this time:
  * Minor fixes from myself, Hanna, and Jack
  * VNC password rework by Stefan and Fabian
  * Postcopy changes from Peter X that are
    the start of a larger series to come
  * Removing the prehistoic load_state_old
    code from Peter M

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Dr. David Alan Gilbert (1):
      clock-vmstate: Add missing END_OF_LIST

Hanna Reitz (1):
      virtiofsd: Let meson check for statx.stx_mnt_id

Jack Wang (1):
      migration/rdma: set the REUSEADDR option for destination

Peter Maydell (1):
      migration: Remove load_state_old and minimum_version_id_old

Peter Xu (11):
      migration: Dump sub-cmd name in loadvm_process_command tp
      migration: Finer grained tracepoints for POSTCOPY_LISTEN
      migration: Tracepoint change in postcopy-run bottom half
      migration: Introduce postcopy channels on dest node
      migration: Dump ramblock and offset too when non-same-page detected
      migration: Add postcopy_thread_create()
      migration: Move static var in ram_block_from_stream() into global
      migration: Enlarge postcopy recovery to capture !-EIO too
      migration: postcopy_pause_fault_thread() never fails
      migration: Add migration_incoming_transport_cleanup()
      tests: Pass in MigrateStart** into test_migrate_start()

Stefan Reiter (3):
      monitor/hmp: add support for flag argument with value
      qapi/monitor: refactor set/expire_password with enums
      qapi/monitor: allow VNC display id in set/expire_password

 docs/devel/migration.rst         |  12 +---
 hmp-commands.hx                  |  24 ++++----
 hw/core/clock-vmstate.c          |   1 +
 hw/ssi/xlnx-versal-ospi.c        |   1 -
 include/migration/vmstate.h      |   2 -
 meson.build                      |  13 +++++
 migration/migration.c            |  26 +++++----
 migration/migration.h            |  48 ++++++++++++++--
 migration/postcopy-ram.c         | 108 ++++++++++++++++++++++-------------
 migration/postcopy-ram.h         |   4 ++
 migration/ram.c                  |  64 +++++++++++----------
 migration/rdma.c                 |   7 +++
 migration/savevm.c               |  46 ++++++++++-----
 migration/trace-events           |   7 +--
 migration/vmstate.c              |   6 --
 monitor/hmp-cmds.c               |  47 ++++++++++++++-
 monitor/hmp.c                    |  19 ++++++-
 monitor/monitor-internal.h       |   3 +-
 monitor/qmp-cmds.c               |  49 +++++-----------
 qapi/ui.json                     | 120 +++++++++++++++++++++++++++++++++------
 tests/qtest/migration-test.c     |  27 +++++----
 tools/virtiofsd/passthrough_ll.c |   2 +-
 22 files changed, 435 insertions(+), 201 deletions(-)


