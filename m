Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 525836F7A2A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 02:50:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujcf-00044V-C2; Thu, 04 May 2023 20:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pujce-000446-4O
 for qemu-devel@nongnu.org; Thu, 04 May 2023 20:48:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pujcc-00012j-Jq
 for qemu-devel@nongnu.org; Thu, 04 May 2023 20:48:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683247709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YtKvI1WJzYVsMbE/EK+nBjHl1ilu8w2PMv/EbvE8ANA=;
 b=S6sb26xlpT5mIDTTUv0m9kyvZ3/qbngKyt3KvHdRxLGmvln06I4AbIwGDsQGQaO5Yy2sW9
 diMD6mXalo85VZ1RpxLl2BW7lueokmvXWCfaCZW1yxzKfeA+RxRH8090GaNQ4sGBgMcoVQ
 BcmmYwxaqB6epTStjV6d47YvLaPwGO8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-zcvXMxCcOFa5jhuE40G9Aw-1; Thu, 04 May 2023 20:48:25 -0400
X-MC-Unique: zcvXMxCcOFa5jhuE40G9Aw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FE67811E7C;
 Fri,  5 May 2023 00:48:24 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C659404B24D;
 Fri,  5 May 2023 00:48:22 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Leonardo Bras <leobras@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Xu <peterx@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 04/16] migration: Put zero_pages in alphabetical order
Date: Fri,  5 May 2023 02:48:00 +0200
Message-Id: <20230505004812.31583-5-quintela@redhat.com>
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

I forgot to move it when I rename it from duplicated_pages.

Message-Id: <20230504103357.22130-3-quintela@redhat.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration-stats.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/migration/migration-stats.h b/migration/migration-stats.h
index 50966328b2..cf8a4f0410 100644
--- a/migration/migration-stats.h
+++ b/migration/migration-stats.h
@@ -48,10 +48,6 @@ typedef struct {
      * guest is stopped.
      */
     Stat64 downtime_bytes;
-    /*
-     * Number of pages transferred that were full of zeros.
-     */
-    Stat64 zero_pages;
     /*
      * Number of bytes sent through multifd channels.
      */
@@ -77,6 +73,10 @@ typedef struct {
      * Total number of bytes transferred.
      */
     Stat64 transferred;
+    /*
+     * Number of pages transferred that were full of zeros.
+     */
+    Stat64 zero_pages;
 } MigrationAtomicStats;
 
 extern MigrationAtomicStats mig_stats;
-- 
2.40.0


