Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2CF6E7F87
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 18:25:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppAbZ-0000Wv-3J; Wed, 19 Apr 2023 12:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppAbW-0000WJ-R2
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:24:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppAbV-0008CR-D9
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:24:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681921459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8cujxrPfiYKQq8/hBwd7VMZuHZIJo3d69fRCDXBUql4=;
 b=JwM0mRHCZbys/9nD56+RklrJEIcVtFO0+lkddVfckVA2x2ylxi/0nld9MsLBJxIQOcd88B
 fYOCDRRkwokv/cJ+LiTfLCUXgnOn3F41bujz8tmf88yXZ5JI5wvXl35VWpBmlM7+m4d+ds
 4fBAKcruMot97LgomFUGnBRDd+cUGIo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-uOgg59oKOD6zP1cZ-usETw-1; Wed, 19 Apr 2023 12:24:17 -0400
X-MC-Unique: uOgg59oKOD6zP1cZ-usETw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A128811E7B
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 16:24:17 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C8AF1121318;
 Wed, 19 Apr 2023 16:24:16 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v3 00/12] Migration: Make more ram_counters atomic
Date: Wed, 19 Apr 2023 18:24:03 +0200
Message-Id: <20230419162415.16260-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi

In this v3:
- Addressed reviews
- All counters are now atomic, either Stat64 or atomic.
- Rename duplicated to zero_pages
- Rename normal to zero_pages.

Please review.

[v2]
- fix typos found by David Edmondson
- Add review-by tags.

Please review.

[v1]
On previous series we cerate ram_atomic_counters.  But we basically
need that all counters are atomic.  So move back to only have
ram_counters, just with a new type that allows the atomic counters.

Once there, move update of stats out of RAM mutex.
And make multifd_bytes atomic.

Later, Juan.

Juan Quintela (12):
  migration: Merge ram_counters and ram_atomic_counters
  migration: Update atomic stats out of the mutex
  migration: Make multifd_bytes atomic
  migration: Make dirty_sync_missed_zero_copy atomic
  migration: Make precopy_bytes atomic
  migration: Make downtime_bytes atomic
  migration: Make dirty_sync_count atomic
  migration: Make postcopy_requests atomic
  migration: Make dirty_pages_rate atomic
  migration: Make dirty_bytes_last_sync atomic
  migration: Rename duplicate to zero_pages
  migration: Rename normal to full_pages

 migration/ram.h       | 34 ++++++++++-----------
 migration/migration.c | 34 ++++++++++++---------
 migration/multifd.c   | 10 +++---
 migration/ram.c       | 71 +++++++++++++++++++------------------------
 4 files changed, 73 insertions(+), 76 deletions(-)

-- 
2.39.2


