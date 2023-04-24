Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0735A6ECFD1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 15:56:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqwf2-0007zI-OE; Mon, 24 Apr 2023 09:55:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqwf0-0007xW-JQ
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:55:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqwew-0006uT-5v
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:55:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682344513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=os4B5+hke6YQJnzHAO2mBJT4J5V+Kwcs9N76tn55Rz8=;
 b=BEFqrAKV5t3lVcvpx4V6g+748ULLEvavgC7wvUkWUVkJ4T0VutdyGJB2dAgEq32nKW4BQl
 +twOva6Jlm6SOu+k8kBMnEwQK2y4m2GR0RJzRqUcvPJqTzuZ97g4EN65LZS2RFJo791Z8G
 Hj9ui/fEQszKjaJMF6vxJJjK603fyuI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-nvGYDA3eN1WQOa1kUdJjHw-1; Mon, 24 Apr 2023 09:55:11 -0400
X-MC-Unique: nvGYDA3eN1WQOa1kUdJjHw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F151886463
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 13:55:11 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B06E49AF5;
 Mon, 24 Apr 2023 13:55:10 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v4 0/2] Migration: Make more ram_counters atomic
Date: Mon, 24 Apr 2023 15:55:07 +0200
Message-Id: <20230424135509.71605-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

In this v4:
- Change aligned_uint64_t to size_t to make (some) 32bit hosts happy.

Please review.

[v3]
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

Juan Quintela (2):
  migration: Make dirty_pages_rate atomic
  migration: Make dirty_bytes_last_sync atomic

 migration/migration.c | 10 +++++++---
 migration/ram.c       |  8 +++++---
 migration/ram.h       |  4 ++--
 3 files changed, 14 insertions(+), 8 deletions(-)

-- 
2.39.2


