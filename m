Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D956806DC
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 09:05:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMP8d-0001zT-I9; Mon, 30 Jan 2023 03:03:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMP8V-0001v0-T7
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:03:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMP8S-0000zd-T5
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:03:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675065808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4tyAthjyAJfKR2wxZiLS098ns/1BTHiWpLuviegbRVQ=;
 b=IwXtxiNXunALCe6SVl3BofNcL7hhpIkQm8J1k2LtxJqwaJ4HJhqIkb/xAgPl5BUv6V48AI
 QVmpQBACeC1fTW8/hsr5O2oZTpip4TxI1R2WW0cgDKiE5gWLbHi1OWDwctVR5Vz/ukG/ep
 ANeDHWVmTbb6R/toHGoFsa9o2p4lGno=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-gYtDPhBUN9SHgDG6LCXfmQ-1; Mon, 30 Jan 2023 03:03:16 -0500
X-MC-Unique: gYtDPhBUN9SHgDG6LCXfmQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C33EA381458C;
 Mon, 30 Jan 2023 08:03:15 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0299492B01;
 Mon, 30 Jan 2023 08:03:12 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-s390x@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 qemu-stable@nongnu.org
Subject: [PULL 1/5] migration: Fix migration crash when target psize larger
 than host
Date: Mon, 30 Jan 2023 09:03:03 +0100
Message-Id: <20230130080307.1792-2-quintela@redhat.com>
In-Reply-To: <20230130080307.1792-1-quintela@redhat.com>
References: <20230130080307.1792-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Peter Xu <peterx@redhat.com>

Commit d9e474ea56 overlooked the case where the target psize is even larger
than the host psize.  One example is Alpha has 8K page size and migration
will start to crash the source QEMU when running Alpha migration on x86.

Fix it by detecting that case and set host start/end just to cover the
single page to be migrated.

This will slightly optimize the common case where host psize equals to
guest psize so we don't even need to do the roundups, but that's trivial.

Cc: qemu-stable@nongnu.org
Reported-by: Thomas Huth <thuth@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1456
Fixes: d9e474ea56 ("migration: Teach PSS about host page")
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 334309f1c6..68a45338e3 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2319,8 +2319,25 @@ static void pss_host_page_prepare(PageSearchStatus *pss)
     size_t guest_pfns = qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
 
     pss->host_page_sending = true;
-    pss->host_page_start = ROUND_DOWN(pss->page, guest_pfns);
-    pss->host_page_end = ROUND_UP(pss->page + 1, guest_pfns);
+    if (guest_pfns <= 1) {
+        /*
+         * This covers both when guest psize == host psize, or when guest
+         * has larger psize than the host (guest_pfns==0).
+         *
+         * For the latter, we always send one whole guest page per
+         * iteration of the host page (example: an Alpha VM on x86 host
+         * will have guest psize 8K while host psize 4K).
+         */
+        pss->host_page_start = pss->page;
+        pss->host_page_end = pss->page + 1;
+    } else {
+        /*
+         * The host page spans over multiple guest pages, we send them
+         * within the same host page iteration.
+         */
+        pss->host_page_start = ROUND_DOWN(pss->page, guest_pfns);
+        pss->host_page_end = ROUND_UP(pss->page + 1, guest_pfns);
+    }
 }
 
 /*
-- 
2.39.1


