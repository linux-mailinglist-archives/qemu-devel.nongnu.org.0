Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BAE667B97
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 17:44:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG0ga-0004CF-NA; Thu, 12 Jan 2023 11:44:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pG0gV-0004Bg-8C
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:44:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pG0gT-0000cw-J7
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:44:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673541848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=JuD+ydF57zYdJdsWwViUOHg05/IJZ6rpv+rPeAQxTOk=;
 b=HtjaTSu4edEydKlD7Ue473Zxuy8z5wcEx0LBTV8vZvnkLmVaiKAjBx7kUua8sWw4aQB0MK
 ciLLOYoilIOKsPa1yKZgc1Dnql1ZXGqZrpMfuPxpIM2dbXDoPLtgozesSO9EGPj1tPgIQZ
 N6Cknw4QFcZuluSBlLqADSW9AW2XA5A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-0rzpsSO5MLWsLCli73E0Dw-1; Thu, 12 Jan 2023 11:44:06 -0500
X-MC-Unique: 0rzpsSO5MLWsLCli73E0Dw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5239F380670E
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 16:44:06 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 710A24078903;
 Thu, 12 Jan 2023 16:44:04 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: [PATCH v3 0/8] virtio-mem: Handle preallocation with migration
Date: Thu, 12 Jan 2023 17:43:55 +0100
Message-Id: <20230112164403.105085-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

While playing with migration of virtio-mem with an ordinary file backing,
I realized that migration and prealloc doesn't currently work as expected
for virtio-mem. Further, Jing Qi reported that setup issues (insufficient
huge pages on the destination) result in QEMU getting killed with SIGBUS
instead of failing gracefully.

In contrast to ordinary memory backend preallocation, virtio-mem
preallocates memory before plugging blocks to the guest. Consequently,
when migrating we are not actually preallocating on the destination but
"only" migrate pages. Fix that be migrating the bitmap early, before any
RAM content, and use that information to preallocate memory early, before
migrating any RAM.

Postcopy needs some extra care, and I realized that prealloc+postcopy is
shaky in general. Let's at least try to mimic what ordinary
prealloc+postcopy does: temporarily allocate the memory, discard it, and
cross fingers that we'll still have sufficient memory when postcopy
actually tries placing pages.

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Michal Privoznik <mprivozn@redhat.com>

v3 -> v4:
- First 3 patches:
-- Minimze code changes and simplify
-- Save immutable device state during qemu_savevm_state_setup()
-- Don't use vmsd priorities, use a new flag
-- Split it logically up
- "migration/ram: Factor out check for advised postcopy"
-- Don't factor out postcopy_is_running()
- "virtio-mem: Migrate immutable properties early"
-- Adjust to changed vmsd interface
- "virtio-mem: Proper support for preallocation with migration"
-- Drop sanity check in virtio_mem_post_load_early()

v2 -> v3:
- New approach/rewrite, drop RB and TB of last patch

v1 -> v2:
- Added RBs and Tested-bys
- "virtio-mem: Fail if a memory backend with "prealloc=on" is specified"
-- Fail instead of warn
-- Adjust subject/description


David Hildenbrand (8):
  migration/savevm: Move more savevm handling into vmstate_save()
  migration/savevm: Prepare vmdesc json writer in
    qemu_savevm_state_setup()
  migration/savevm: Allow immutable device state to be migrated early
    (i.e., before RAM)
  migration/vmstate: Introduce VMSTATE_WITH_TMP_TEST() and
    VMSTATE_BITMAP_TEST()
  migration/ram: Factor out check for advised postcopy
  virtio-mem: Fail if a memory backend with "prealloc=on" is specified
  virtio-mem: Migrate immutable properties early
  virtio-mem: Proper support for preallocation with migration

 hw/core/machine.c              |   4 +-
 hw/virtio/virtio-mem.c         | 144 ++++++++++++++++++++++++++++++++-
 include/hw/virtio/virtio-mem.h |   8 ++
 include/migration/misc.h       |   4 +-
 include/migration/vmstate.h    |  17 +++-
 migration/migration.c          |  11 +++
 migration/migration.h          |   4 +
 migration/ram.c                |   8 +-
 migration/savevm.c             | 105 +++++++++++++-----------
 9 files changed, 247 insertions(+), 58 deletions(-)

-- 
2.39.0


