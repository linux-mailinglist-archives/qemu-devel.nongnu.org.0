Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CD8653EC9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 12:11:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8JLI-0007jB-02; Thu, 22 Dec 2022 06:02:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p8JLD-0007gP-Tu
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:02:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p8JLC-0000Yh-96
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:02:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671706940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=GafvN+Y1DbaMYIh3V5J87yVDENzHGmAzmXRp0bWvcaE=;
 b=AOujQ9OkihYC614lBA/d4tOlw/daW4FtCtNft/uxKJG03X3hOjPiCJ1xkZKAcIq4i5VIxC
 piJYciiU9v4Ww6rsFDbkgC/hAZxA1ZVW6DK/95speRbkqDPrhUl0iOsA1FzzDIkuvvvKae
 jOmkszgfRbQ3Y9Ljq2yfe9gSi4laKGs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-VjlhKLOaMWOIGy3TtQlMlg-1; Thu, 22 Dec 2022 06:02:19 -0500
X-MC-Unique: VjlhKLOaMWOIGy3TtQlMlg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8FD7101A521
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 11:02:18 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B75E140E949;
 Thu, 22 Dec 2022 11:02:16 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: [PATCH v3 0/6] virtio-mem: Handle preallocation with migration
Date: Thu, 22 Dec 2022 12:02:09 +0100
Message-Id: <20221222110215.130392-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

v2 -> v3:
- New approach/rewrite, drop RB and TB of last patch

v1 -> v2:
- Added RBs and Tested-bys
- "virtio-mem: Fail if a memory backend with "prealloc=on" is specified"
-- Fail instead of warn
-- Adjust subject/description

David Hildenbrand (6):
  migration: Allow immutable device state to be migrated early (i.e.,
    before RAM)
  migration/vmstate: Introduce VMSTATE_WITH_TMP_TEST() and
    VMSTATE_BITMAP_TEST()
  migration: Factor out checks for advised and listening incomming
    postcopy
  virtio-mem: Fail if a memory backend with "prealloc=on" is specified
  virtio-mem: Migrate bitmap, size and sanity checks early
  virtio-mem: Proper support for preallocation with migration

 hw/core/machine.c              |   4 +-
 hw/virtio/virtio-mem.c         | 154 ++++++++++++++++++++++++++++++++-
 include/hw/virtio/virtio-mem.h |   8 ++
 include/migration/misc.h       |   6 +-
 include/migration/vmstate.h    |  19 +++-
 migration/migration.c          |  27 ++++++
 migration/migration.h          |   4 +
 migration/ram.c                |  16 +---
 migration/savevm.c             | 104 ++++++++++++++++------
 migration/savevm.h             |   1 +
 10 files changed, 298 insertions(+), 45 deletions(-)

-- 
2.38.1


