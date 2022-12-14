Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD2664CB93
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 14:50:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5S5f-0005Oj-6q; Wed, 14 Dec 2022 08:46:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4r-0004QA-H3
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4p-0003aB-BI
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671025538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hwb/VAIJyr+O6SWT2aeZnlbQIs1h3MQ0Q8m5wqv55K4=;
 b=SBwJqO3Bqy6sKBFMb6XA9OkBag8KWCMnjM/Z7RcLb4fkgYlXv9o3GEzAoNNarIkoe8Y14j
 9JDTUBKf/DBXZxZRKGwm7PQeS+9ElmUs6OQRdUbeAUEDaqz3X9yTthAhC5OhDdTyPzt6zp
 dQgwkLG2qMhxvDIqjS89F0J41pL2k6M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-W7PzGWV4PYWX9Bd65PLUjg-1; Wed, 14 Dec 2022 08:45:33 -0500
X-MC-Unique: W7PzGWV4PYWX9Bd65PLUjg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7747638173C0;
 Wed, 14 Dec 2022 13:45:33 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B637714171C0;
 Wed, 14 Dec 2022 13:45:32 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 25/51] block: avoid duplicating filename string in bdrv_create
Date: Wed, 14 Dec 2022 14:44:27 +0100
Message-Id: <20221214134453.31665-26-kwolf@redhat.com>
In-Reply-To: <20221214134453.31665-1-kwolf@redhat.com>
References: <20221214134453.31665-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

We know that the string will stay around until the function
returns, and the parameter of drv->bdrv_co_create_opts is const char*,
so it must not be modified either.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-Id: <20221128142337.657646-7-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/block.c b/block.c
index 97073092c4..9d77ec8818 100644
--- a/block.c
+++ b/block.c
@@ -551,7 +551,7 @@ int bdrv_create(BlockDriver *drv, const char* filename,
     Coroutine *co;
     CreateCo cco = {
         .drv = drv,
-        .filename = g_strdup(filename),
+        .filename = filename,
         .opts = opts,
         .ret = NOT_DONE,
         .err = NULL,
@@ -559,8 +559,7 @@ int bdrv_create(BlockDriver *drv, const char* filename,
 
     if (!drv->bdrv_co_create_opts) {
         error_setg(errp, "Driver '%s' does not support image creation", drv->format_name);
-        ret = -ENOTSUP;
-        goto out;
+        return -ENOTSUP;
     }
 
     if (qemu_in_coroutine()) {
@@ -583,8 +582,6 @@ int bdrv_create(BlockDriver *drv, const char* filename,
         }
     }
 
-out:
-    g_free(cco.filename);
     return ret;
 }
 
-- 
2.38.1


