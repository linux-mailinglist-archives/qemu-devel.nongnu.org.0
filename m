Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3066EE6D0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 19:33:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prMWz-0007Ri-V3; Tue, 25 Apr 2023 13:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prMWX-0006ik-Q4
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:32:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prMWV-0004ER-9m
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682443934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E9IHo/OIqo+FqF0ZDiUvTY0qg6N31wFMiaXYuuD+6tM=;
 b=OBRB1r/86s5dHG+Zy7uiEA0M5dUwOs8jytF4NwflMo2bIvT0PZE348e5hBh0LnL4S/x97f
 wBera7f976GGnEniUfNbBf1S3rHH0jydlpq/Zb/XeoP+A5nH1FRMiZloctrBzNk1I4ODBO
 5DJY5eQHXA9DJcbATLhE5TD5yFTK2L4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-uME4vl7FNLODk3-mnOJKpA-1; Tue, 25 Apr 2023 13:32:12 -0400
X-MC-Unique: uME4vl7FNLODk3-mnOJKpA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6650885629;
 Tue, 25 Apr 2023 17:32:11 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF70E492B03;
 Tue, 25 Apr 2023 17:32:10 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 06/20] graph-lock: Add GRAPH_UNLOCKED(_PTR)
Date: Tue, 25 Apr 2023 19:31:44 +0200
Message-Id: <20230425173158.574203-7-kwolf@redhat.com>
In-Reply-To: <20230425173158.574203-1-kwolf@redhat.com>
References: <20230425173158.574203-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

For some function, parts of their interface is that are called without
holding the graph lock. Add a new macro to document this.

The macro expands to TSA_EXCLUDES(), which is a relatively weak check
because it passes in cases where the compiler just doesn't know if the
lock is held. Function pointers can't be checked at all. Therefore, its
primary purpose is documentation.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/graph-lock.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
index 18cc14de22..7ef391fab3 100644
--- a/include/block/graph-lock.h
+++ b/include/block/graph-lock.h
@@ -73,6 +73,7 @@ extern BdrvGraphLock graph_lock;
  */
 #define GRAPH_WRLOCK TSA_REQUIRES(graph_lock)
 #define GRAPH_RDLOCK TSA_REQUIRES_SHARED(graph_lock)
+#define GRAPH_UNLOCKED TSA_EXCLUDES(graph_lock)
 
 /*
  * TSA annotations are not part of function types, so checks are defeated when
@@ -83,6 +84,7 @@ extern BdrvGraphLock graph_lock;
  */
 #define GRAPH_RDLOCK_PTR TSA_GUARDED_BY(graph_lock)
 #define GRAPH_WRLOCK_PTR TSA_GUARDED_BY(graph_lock)
+#define GRAPH_UNLOCKED_PTR
 
 /*
  * register_aiocontext:
-- 
2.40.0


