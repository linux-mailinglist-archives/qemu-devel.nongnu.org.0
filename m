Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3166F0279
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 10:26:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prwx9-0001HW-FO; Thu, 27 Apr 2023 04:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prwx5-0001G8-RR
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:26:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prwx2-0001Eq-LE
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:26:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682583964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nYn3wZrMyYymeyCClVIgJvkXVp6ydFMMtRwUBbQ6kf0=;
 b=PwA7yN+zxfznnjsNusfKoMkUQOs+QO0Q5fucd+5y1tOUx1X2EzdbJ/hOIKL4SSf5ZEtmAJ
 0Mno6qNlDim4w2UxEqVba+OMjAMm/bFYfGcztEEkEq263RJcjZY3OxB7jFOq+8sm1i/85h
 TdQC0sYY4RM98gFalA9P7hYUhQJiEgM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-An1RLrOZPdS_28ZYMSfHHw-1; Thu, 27 Apr 2023 04:26:02 -0400
X-MC-Unique: An1RLrOZPdS_28ZYMSfHHw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D829A3806720
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 08:26:01 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FA5DC15BA0;
 Thu, 27 Apr 2023 08:25:59 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 1/7] migration: Disable postcopy + multifd migration
Date: Thu, 27 Apr 2023 10:25:51 +0200
Message-Id: <20230427082557.20994-2-quintela@redhat.com>
In-Reply-To: <20230427082557.20994-1-quintela@redhat.com>
References: <20230427082557.20994-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

From: Leonardo Bras <leobras@redhat.com>

Since the introduction of multifd, it's possible to perform a multifd
migration and finish it using postcopy.

A bug introduced by yank (fixed on cfc3bcf373) was previously preventing
a successful use of this migration scenario, and now thing should be
working on most scenarios.

But since there is not enough testing/support nor any reported users for
this scenario, we should disable this combination before it may cause any
problems for users.

Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Leonardo Bras <leobras@redhat.com>
Acked-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/options.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/migration/options.c b/migration/options.c
index 8e8753d9be..dd97c99391 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -322,6 +322,11 @@ bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp)
             error_setg(errp, "Postcopy is not compatible with ignore-shared");
             return false;
         }
+
+        if (new_caps[MIGRATION_CAPABILITY_MULTIFD]) {
+            error_setg(errp, "Postcopy is not yet compatible with multifd");
+            return false;
+        }
     }
 
     if (new_caps[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT]) {
-- 
2.40.0


