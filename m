Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8B340CC8C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 20:29:13 +0200 (CEST)
Received: from localhost ([::1]:44370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZeh-0005JQ-Jh
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 14:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ70-0007XG-R0
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6y-0007BK-Qr
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631728460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wk6xFgIjoymCAZ9mM2AceqT6xK7ZGXGDRVC8mDtLZog=;
 b=QiwajBLReImsWo2IXRSokcnyL0zwALIYIpJbJVxZJu3zVM6e10Dy5cwmu3VqEh+iyE8hUO
 YWEcMVqyKMsMhNOhqnTL5Ly2RSxHSix3TgWLrW9QHLNE+r3OCxwmORu6hBn2Q6Y0FD8Ter
 EqkKNS/KwxeGS3FdRVeVeno6I960l84=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-X1RZ2bNAP4SPehSsDL6Khw-1; Wed, 15 Sep 2021 13:54:17 -0400
X-MC-Unique: X1RZ2bNAP4SPehSsDL6Khw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42EDD1006ACA;
 Wed, 15 Sep 2021 17:54:16 +0000 (UTC)
Received: from localhost (unknown [10.39.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB6B019736;
 Wed, 15 Sep 2021 17:54:15 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 26/32] qcow2-refcount: fix_l2_entry_by_zero(): also zero L2
 entry bitmap
Date: Wed, 15 Sep 2021 19:53:12 +0200
Message-Id: <20210915175318.853225-27-hreitz@redhat.com>
In-Reply-To: <20210915175318.853225-1-hreitz@redhat.com>
References: <20210915175318.853225-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We'll reuse the function to fix wrong L2 entry bitmap. Support it now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20210914122454.141075-6-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/qcow2-refcount.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 184b96ad63..f48c5e1b5d 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1588,7 +1588,8 @@ enum {
 };
 
 /*
- * Fix L2 entry by making it QCOW2_CLUSTER_ZERO_PLAIN.
+ * Fix L2 entry by making it QCOW2_CLUSTER_ZERO_PLAIN (or making all its present
+ * subclusters QCOW2_SUBCLUSTER_ZERO_PLAIN).
  *
  * This function decrements res->corruptions on success, so the caller is
  * responsible to increment res->corruptions prior to the call.
@@ -1605,9 +1606,20 @@ static int fix_l2_entry_by_zero(BlockDriverState *bs, BdrvCheckResult *res,
     int idx = l2_index * (l2_entry_size(s) / sizeof(uint64_t));
     uint64_t l2e_offset = l2_offset + (uint64_t)l2_index * l2_entry_size(s);
     int ign = active ? QCOW2_OL_ACTIVE_L2 : QCOW2_OL_INACTIVE_L2;
-    uint64_t l2_entry = has_subclusters(s) ? 0 : QCOW_OFLAG_ZERO;
 
-    set_l2_entry(s, l2_table, l2_index, l2_entry);
+    if (has_subclusters(s)) {
+        uint64_t l2_bitmap = get_l2_bitmap(s, l2_table, l2_index);
+
+        /* Allocated subclusters become zero */
+        l2_bitmap |= l2_bitmap << 32;
+        l2_bitmap &= QCOW_L2_BITMAP_ALL_ZEROES;
+
+        set_l2_bitmap(s, l2_table, l2_index, l2_bitmap);
+        set_l2_entry(s, l2_table, l2_index, 0);
+    } else {
+        set_l2_entry(s, l2_table, l2_index, QCOW_OFLAG_ZERO);
+    }
+
     ret = qcow2_pre_write_overlap_check(bs, ign, l2e_offset, l2_entry_size(s),
                                         false);
     if (metadata_overlap) {
-- 
2.31.1


