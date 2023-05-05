Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8A96F7A2B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 02:50:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujcc-00043m-QP; Thu, 04 May 2023 20:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pujca-00040s-J7
 for qemu-devel@nongnu.org; Thu, 04 May 2023 20:48:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pujcY-0000xd-NS
 for qemu-devel@nongnu.org; Thu, 04 May 2023 20:48:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683247705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NjWeSAwuFXK3lY7+hC3CU1kM8vnZ6nAS8j/XYnec7VA=;
 b=J6gVXH9BChUOldhlnKpdB+tZTduRHHpziG35I0Ek7yGNPdAmJEKO6QXSJdL0wPAZcqubck
 aYiISmWm7jbWnVnW4AdtTvHDD4b457xPA0CMUXfbBX5HtorVOPHTask3UqaFhCH/GwqB7h
 hBLAtrfeius0Bzd7rZ7j/5MD8rnv0Vk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-MEQrCG5LNjea-23pQMOdKg-1; Thu, 04 May 2023 20:48:22 -0400
X-MC-Unique: MEQrCG5LNjea-23pQMOdKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3755285D537;
 Fri,  5 May 2023 00:48:22 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50914404B24D;
 Fri,  5 May 2023 00:48:20 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Leonardo Bras <leobras@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Xu <peterx@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 03/16] migration: Document all migration_stats
Date: Fri,  5 May 2023 02:47:59 +0200
Message-Id: <20230505004812.31583-4-quintela@redhat.com>
In-Reply-To: <20230505004812.31583-1-quintela@redhat.com>
References: <20230505004812.31583-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Message-Id: <20230504103357.22130-2-quintela@redhat.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration-stats.h | 43 +++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/migration/migration-stats.h b/migration/migration-stats.h
index 149af932d7..50966328b2 100644
--- a/migration/migration-stats.h
+++ b/migration/migration-stats.h
@@ -22,17 +22,60 @@
  * one thread).
  */
 typedef struct {
+    /*
+     * Number of bytes that were dirty last time that we synced with
+     * the guest memory.  We use that to calculate the downtime.  As
+     * the remaining dirty amounts to what we know that is still dirty
+     * since last iteration, not counting what the guest has dirtied
+     * since we synchronized bitmaps.
+     */
     Stat64 dirty_bytes_last_sync;
+    /*
+     * Number of pages dirtied per second.
+     */
     Stat64 dirty_pages_rate;
+    /*
+     * Number of times we have synchronized guest bitmaps.
+     */
     Stat64 dirty_sync_count;
+    /*
+     * Number of times zero copy failed to send any page using zero
+     * copy.
+     */
     Stat64 dirty_sync_missed_zero_copy;
+    /*
+     * Number of bytes sent at migration completion stage while the
+     * guest is stopped.
+     */
     Stat64 downtime_bytes;
+    /*
+     * Number of pages transferred that were full of zeros.
+     */
     Stat64 zero_pages;
+    /*
+     * Number of bytes sent through multifd channels.
+     */
     Stat64 multifd_bytes;
+    /*
+     * Number of pages transferred that were not full of zeros.
+     */
     Stat64 normal_pages;
+    /*
+     * Number of bytes sent during postcopy.
+     */
     Stat64 postcopy_bytes;
+    /*
+     * Number of postcopy page faults that we have handled during
+     * postcopy stage.
+     */
     Stat64 postcopy_requests;
+    /*
+     * Number of bytes sent during precopy stage.
+     */
     Stat64 precopy_bytes;
+    /*
+     * Total number of bytes transferred.
+     */
     Stat64 transferred;
 } MigrationAtomicStats;
 
-- 
2.40.0


