Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E1E635C2B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 12:53:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxo9I-0002cT-1K; Wed, 23 Nov 2022 06:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oxo9F-0002bP-RK
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:42:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oxo9D-00060H-9T
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:42:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669203754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+82cBlNV+3lriRI4Ef6kEA7/U6YlDWy6VmChSSkAUI4=;
 b=d8QDXX4LKz1UEUBTw99ZYRf5QbMymRk0EAZjJ5nd8VO56zxMHVkDLlN71fG+vDLgaP7q2F
 +tJuLsrYxXhsTfeLfcABQCFxTGCd57iK/1KxmkwIbhdGAKz29jPxhZSLdwLtX2LYRHF0Sj
 GU3woxuDx5NbhMjyWzwGwFtL+n9xee8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-bQ0jyijTPESJ27TP8-yb-A-1; Wed, 23 Nov 2022 06:42:33 -0500
X-MC-Unique: bQ0jyijTPESJ27TP8-yb-A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CECFE101A528;
 Wed, 23 Nov 2022 11:42:32 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78672C2C8CA;
 Wed, 23 Nov 2022 11:42:32 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v5 07/15] block: introduce QEMU_IN_COROUTINE macro
Date: Wed, 23 Nov 2022 06:42:19 -0500
Message-Id: <20221123114227.85757-8-eesposit@redhat.com>
In-Reply-To: <20221123114227.85757-1-eesposit@redhat.com>
References: <20221123114227.85757-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This macro will be used to mark all coroutine_fn functions.
Right now, it will be used for the newly introduced coroutine_fn, since
we know the callers.

As a TODO, in the future we might want to add this macro to all
corotuine_fn functions, to be sure that they are only called in
coroutines context.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/block/block-common.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/block/block-common.h b/include/block/block-common.h
index 297704c1e9..24de1d63fd 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -34,6 +34,17 @@
 #include "qemu/hbitmap.h"
 #include "qemu/transactions.h"
 
+/*
+ * QEMU_IN_COROUTINE
+ *
+ * To be used in all coroutine_fn functions, to make sure that the caller
+ * is always a coroutine.
+ */
+#define QEMU_IN_COROUTINE()                                         \
+    do {                                                            \
+        assert(qemu_in_coroutine());                                \
+    } while (0)
+
 /*
  * generated_co_wrapper
  *
-- 
2.31.1


