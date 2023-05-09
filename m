Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F226FCE69
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 21:18:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwSqi-0004Qu-7z; Tue, 09 May 2023 15:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwSqg-0004La-1m
 for qemu-devel@nongnu.org; Tue, 09 May 2023 15:18:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwSqe-0006cR-GC
 for qemu-devel@nongnu.org; Tue, 09 May 2023 15:18:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683659885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EXFLxsOojO36t9lZ90qTxaAgi8JWSTRtAUEm+5nsQXo=;
 b=ios+dO6Jh2W+rKWGbM+PuH20gF0HAg/Ot8pJ1Ki18WPfaj23NrXiFTVs6XjNE+Z7jG3VPN
 8uY5gqsrgjR24xLoJSjAm1TnSEmvlS3S17QT97GM95+z8DPSjYwJBfS/MdmOlCXH/fauRe
 meW6+2gldtcSs7UIpZCZ3mE54aPtD0M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-LcJ253w4N1SHrorwr2xMLA-1; Tue, 09 May 2023 15:17:58 -0400
X-MC-Unique: LcJ253w4N1SHrorwr2xMLA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32E5685A5B1;
 Tue,  9 May 2023 19:17:53 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D79C863F5B;
 Tue,  9 May 2023 19:17:50 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 Leonardo Bras <leobras@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hailiang Zhang <zhanghailiang@xfusion.com>, Eric Blake <eblake@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Lukas Straub <lukasstraub2@web.de>, Zhang Chen <chen.zhang@intel.com>
Subject: [PULL 10/10] migration: block incoming colo when capability is
 disabled
Date: Tue,  9 May 2023 21:17:24 +0200
Message-Id: <20230509191724.86159-11-quintela@redhat.com>
In-Reply-To: <20230509191724.86159-1-quintela@redhat.com>
References: <20230509191724.86159-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

We generally require same set of capabilities on source and target.
Let's require x-colo capability to use COLO on target.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Message-Id: <20230428194928.1426370-11-vsementsov@yandex-team.ru>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 docs/COLO-FT.txt      | 1 +
 migration/migration.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/docs/COLO-FT.txt b/docs/COLO-FT.txt
index 8ec653f81c..2e760a4aee 100644
--- a/docs/COLO-FT.txt
+++ b/docs/COLO-FT.txt
@@ -210,6 +210,7 @@ children.0=childs0 \
 
 3. On Secondary VM's QEMU monitor, issue command
 {"execute":"qmp_capabilities"}
+{"execute": "migrate-set-capabilities", "arguments": {"capabilities": [ {"capability": "x-colo", "state": true } ] } }
 {"execute": "nbd-server-start", "arguments": {"addr": {"type": "inet", "data": {"host": "0.0.0.0", "port": "9999"} } } }
 {"execute": "nbd-server-add", "arguments": {"device": "parent0", "writable": true } }
 
diff --git a/migration/migration.c b/migration/migration.c
index 4959f7ee44..7558c8edbd 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -398,6 +398,12 @@ int migration_incoming_enable_colo(void)
     return -ENOTSUP;
 #endif
 
+    if (!migrate_colo()) {
+        error_report("ENABLE_COLO command come in migration stream, but c-colo "
+                     "capability is not set");
+        return -EINVAL;
+    }
+
     if (ram_block_discard_disable(true)) {
         error_report("COLO: cannot disable RAM discard");
         return -EBUSY;
-- 
2.40.0


