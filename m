Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F34F6EFC6B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 23:27:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prmf5-0005h4-VA; Wed, 26 Apr 2023 17:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1prmf2-0005gK-Td
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 17:26:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1prmf1-0002vn-4L
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 17:26:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682544405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5abCef3YCateCjdmpZfrEO204AADasi79sm/0fsKyCo=;
 b=YUB3o/NX2SQhxnZaAyUBtiwMpH9yYG+DN34nfEntnBwMUaTux0OzGwMCz5ukt+1VJ/dOZQ
 sZXQO/YNol1pPD8+8MiMRwAb0AD4h1kZk8MyQIyjdTrLQRzQl1YDuo5rnRBAplYG2xnB8G
 zyR0mPm30YylrvRmQc/QJpAiS5TdY7U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-AwIIagUXPyOsFu568mHMFA-1; Wed, 26 Apr 2023 17:26:42 -0400
X-MC-Unique: AwIIagUXPyOsFu568mHMFA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98ED1800B35;
 Wed, 26 Apr 2023 21:26:41 +0000 (UTC)
Received: from localhost (unknown [10.39.192.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9E63140EBF4;
 Wed, 26 Apr 2023 21:26:40 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>
Subject: [PATCH] aio-posix: zero out io_uring sqe user_data
Date: Wed, 26 Apr 2023 17:26:39 -0400
Message-Id: <20230426212639.82310-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

liburing does not clear sqe->user_data. We must do it ourselves to avoid
undefined behavior in process_cqe() when user_data is used.

Note that fdmon-io_uring is currently disabled, so this is a latent bug
that does not affect users. Let's merge this fix now to make it easier
to enable fdmon-io_uring in the future (and I'm working on that).

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 util/fdmon-io_uring.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/util/fdmon-io_uring.c b/util/fdmon-io_uring.c
index ab43052dd7..35165bcb46 100644
--- a/util/fdmon-io_uring.c
+++ b/util/fdmon-io_uring.c
@@ -184,6 +184,7 @@ static void add_poll_remove_sqe(AioContext *ctx, AioHandler *node)
 #else
     io_uring_prep_poll_remove(sqe, node);
 #endif
+    io_uring_sqe_set_data(sqe, NULL);
 }
 
 /* Add a timeout that self-cancels when another cqe becomes ready */
@@ -197,6 +198,7 @@ static void add_timeout_sqe(AioContext *ctx, int64_t ns)
 
     sqe = get_sqe(ctx);
     io_uring_prep_timeout(sqe, &ts, 1, 0);
+    io_uring_sqe_set_data(sqe, NULL);
 }
 
 /* Add sqes from ctx->submit_list for submission */
-- 
2.40.0


