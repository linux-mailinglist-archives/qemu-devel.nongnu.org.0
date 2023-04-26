Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8745B6EFB8F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 22:11:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prlSw-0003ZU-Jz; Wed, 26 Apr 2023 16:10:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prlSt-0003Yc-7C
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 16:10:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prlSq-000502-Pw
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 16:10:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682539807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=84tYL0SEgWkCwTW3jIomtztXXpEZ9v2CRsMeUEsPH/A=;
 b=QM/BEuOE9/q5mn3/0PTDky+Xr6zKbPHNBA+SkC0waIQFiDq9vQKWCEW7qzFVJqg7HSdrDM
 hhG+fFDlGYEzi5K0eFP5f3KVJszGYxII6Pf23MHESJ+19BSTTe1HZ7ZYylQKSIUflGknjZ
 Fqrlz+tHYLmv9Lf1UfUYw6PSxeew/oU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-IxjELP0TMZum-4of72KAmw-1; Wed, 26 Apr 2023 16:10:04 -0400
X-MC-Unique: IxjELP0TMZum-4of72KAmw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9AAE29AA3BE;
 Wed, 26 Apr 2023 20:10:03 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08DCE2166B41;
 Wed, 26 Apr 2023 20:10:02 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 0/2] Migration: Make more ram_counters atomic
Date: Wed, 26 Apr 2023 22:10:00 +0200
Message-Id: <20230426201002.15414-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

In this v5:

Not only change the type of the counters, also use the __nocheck()
variants of the functions.

Please, review.

[v4]
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

 migration/migration.c | 9 ++++++---
 migration/ram.c       | 7 ++++---
 migration/ram.h       | 4 ++--
 3 files changed, 12 insertions(+), 8 deletions(-)

-- 
2.40.0


