Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542766F691C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 12:35:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puWHr-000429-EL; Thu, 04 May 2023 06:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puWHp-00041o-Lc
 for qemu-devel@nongnu.org; Thu, 04 May 2023 06:34:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puWHj-0003EZ-2E
 for qemu-devel@nongnu.org; Thu, 04 May 2023 06:34:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683196442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ujk3avns+nmBgOuRWFa+rgiPnIednyLGtiODp9kleV0=;
 b=Wro0L6JUVRaWz0k0uBMV0QmgNiCRKDKGMAS2BqP6M2wDGjAwSvqa7NQNfBdT+SMlM+6lcZ
 jL2wCkEJHxMbTacAkDGevqNUr57ULXrvb0O9nP7VwBrJUALLpSzFwuTvQU6nJkZdf2xwrr
 eNRU5Ry7bcBjTYSd9TtIOsxn45o8fCk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-rgea44S4O5eyxF3pbkxCcg-1; Thu, 04 May 2023 06:34:00 -0400
X-MC-Unique: rgea44S4O5eyxF3pbkxCcg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 973F5A0F380
 for <qemu-devel@nongnu.org>; Thu,  4 May 2023 10:34:00 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1CA71121331;
 Thu,  4 May 2023 10:33:59 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH 1/2] migration: Document all migration_stats
Date: Thu,  4 May 2023 12:33:56 +0200
Message-Id: <20230504103357.22130-2-quintela@redhat.com>
In-Reply-To: <20230504103357.22130-1-quintela@redhat.com>
References: <20230504103357.22130-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration-stats.h | 43 +++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/migration/migration-stats.h b/migration/migration-stats.h
index 149af932d7..0e49c236fa 100644
--- a/migration/migration-stats.h
+++ b/migration/migration-stats.h
@@ -22,17 +22,60 @@
  * one thread).
  */
 typedef struct {
+    /*
+     * number of bytes that were dirty last time that we sync with the
+     * guest memory.  We use that to calculate the downtime.  As the
+     * remaining dirty amounts to what we know that is still dirty
+     * since last iteration, not counting what the guest has dirtied
+     * sync we synchronize bitmaps.
+     */
     Stat64 dirty_bytes_last_sync;
+    /*
+     * number of pages dirtied by second.
+     */
     Stat64 dirty_pages_rate;
+    /*
+     * number of times we have synchronize guest bitmaps.
+     */
     Stat64 dirty_sync_count;
+    /*
+     * number of times zero copy failed to send any page using zero
+     * copy.
+     */
     Stat64 dirty_sync_missed_zero_copy;
+    /*
+     * number of bytes sent at migration completion stage while the
+     * guest is stopped.
+     */
     Stat64 downtime_bytes;
+    /*
+     * number of pages transferred that were full of zeros.
+     */
     Stat64 zero_pages;
+    /*
+     * number of bytes sent through multifd channels.
+     */
     Stat64 multifd_bytes;
+    /*
+     * number of pages transferred that were not full of zeros.
+     */
     Stat64 normal_pages;
+    /*
+     * number of bytes sent during postcopy.
+     */
     Stat64 postcopy_bytes;
+    /*
+     * number of postcopy page faults that we have handled during
+     * postocpy stage.
+     */
     Stat64 postcopy_requests;
+    /*
+     *  number of bytes sent during precopy stage.
+     */
     Stat64 precopy_bytes;
+    /*
+     * total number of bytes transferred.
+     */
     Stat64 transferred;
 } MigrationAtomicStats;
 
-- 
2.40.0


