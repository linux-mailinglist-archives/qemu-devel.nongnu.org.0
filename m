Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE986FDDB9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 14:24:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwipU-0002Ke-M0; Wed, 10 May 2023 08:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwipQ-0002G0-Bb
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:21:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwipO-0007gX-5T
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:21:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683721311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UV1e7ryXEoMrxU75TJz1ZNQYdNcfJhb6y3OGomc2H7A=;
 b=Cyw3qse6SwK8vbRHIl3ydSRZ0t8NvGftOBJDxwtAIqFg1y3IgFIjyHnRyB/yJ3QgHAQC16
 RygEDftqvusFT3mcZJB7lIm+3Ct2GK6KRYqA/Du5qkSFwqpX6pzcuqTd16cjcY3hj+ytUr
 OWE1QstfgrQSflxURaEp0Ctv/Htd7Cc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-Q43Us-MPN425xHKdTlS7_A-1; Wed, 10 May 2023 08:21:49 -0400
X-MC-Unique: Q43Us-MPN425xHKdTlS7_A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F020185A79C;
 Wed, 10 May 2023 12:21:49 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF19518EC1;
 Wed, 10 May 2023 12:21:48 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 13/28] graph-lock: Add GRAPH_UNLOCKED(_PTR)
Date: Wed, 10 May 2023 14:20:56 +0200
Message-Id: <20230510122111.46566-14-kwolf@redhat.com>
In-Reply-To: <20230510122111.46566-1-kwolf@redhat.com>
References: <20230510122111.46566-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

For some functions, it is part of their interface to be called without
holding the graph lock. Add a new macro to document this.

The macro expands to TSA_EXCLUDES(), which is a relatively weak check
because it passes in cases where the compiler just doesn't know if the
lock is held. Function pointers can't be checked at all. Therefore, its
primary purpose is documentation.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20230504115750.54437-7-kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/graph-lock.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
index ac0fef8605..f17d1588e7 100644
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
2.40.1


