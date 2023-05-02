Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00AE6F40F8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:19:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptn67-0004n3-Ms; Tue, 02 May 2023 06:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ptn65-0004lV-7O
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:19:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ptn63-0000L5-6U
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:19:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683022738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=31b0d8QLBF0vY+1zakSA7/awSDWXgOMapmyXoEDqdwA=;
 b=iwQ6K+eI550IDUxflkBSBkaV8ZBk7dbFwBVJiUeTRZYzqmIilfE4ZnKz/9rgFGy5A0ajlt
 ls63TBXhwbnv3ZUb1ItcOOooWFjLpZrZLjahxcThTKvlb0MRKPQn+wUEjai7GkYSCUCkUx
 tiV3f0oPt6mZlUgdU22T6JWHDTp1B5A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-AAR9oWqgPRSsxM-yow34OQ-1; Tue, 02 May 2023 06:18:55 -0400
X-MC-Unique: AAR9oWqgPRSsxM-yow34OQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E06A029AB3EA;
 Tue,  2 May 2023 10:18:54 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33251C15BAD;
 Tue,  2 May 2023 10:18:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Alexander Bulekov <alxndr@bu.edu>
Subject: [PULL 3/3] async: avoid use-after-free on re-entrancy guard
Date: Tue,  2 May 2023 12:18:49 +0200
Message-Id: <20230502101849.1655453-4-thuth@redhat.com>
In-Reply-To: <20230502101849.1655453-1-thuth@redhat.com>
References: <20230502101849.1655453-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

From: Alexander Bulekov <alxndr@bu.edu>

A BH callback can free the BH, causing a use-after-free in aio_bh_call.
Fix that by keeping a local copy of the re-entrancy guard pointer.

Buglink: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=58513
Fixes: 9c86c97f12 ("async: Add an optional reentrancy guard to the BH API")
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20230501141956.3444868-1-alxndr@bu.edu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 util/async.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/util/async.c b/util/async.c
index 9df7674b4e..055070ffbd 100644
--- a/util/async.c
+++ b/util/async.c
@@ -156,18 +156,20 @@ void aio_bh_call(QEMUBH *bh)
 {
     bool last_engaged_in_io = false;
 
-    if (bh->reentrancy_guard) {
-        last_engaged_in_io = bh->reentrancy_guard->engaged_in_io;
-        if (bh->reentrancy_guard->engaged_in_io) {
+    /* Make a copy of the guard-pointer as cb may free the bh */
+    MemReentrancyGuard *reentrancy_guard = bh->reentrancy_guard;
+    if (reentrancy_guard) {
+        last_engaged_in_io = reentrancy_guard->engaged_in_io;
+        if (reentrancy_guard->engaged_in_io) {
             trace_reentrant_aio(bh->ctx, bh->name);
         }
-        bh->reentrancy_guard->engaged_in_io = true;
+        reentrancy_guard->engaged_in_io = true;
     }
 
     bh->cb(bh->opaque);
 
-    if (bh->reentrancy_guard) {
-        bh->reentrancy_guard->engaged_in_io = last_engaged_in_io;
+    if (reentrancy_guard) {
+        reentrancy_guard->engaged_in_io = last_engaged_in_io;
     }
 }
 
-- 
2.31.1


