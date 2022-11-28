Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D8663AAC9
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 15:24:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozf3e-0004iz-FJ; Mon, 28 Nov 2022 09:24:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ozf32-0004g6-Fz
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 09:23:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ozf2y-0006ti-E0
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 09:23:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669645426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=trnlifIqLKDFI4XNVwndJ5mjIladtv4nRbVK50N/Umo=;
 b=W5knr3KuhpH+aUZ3xtOjkOKT7yHxd/ii7Sc6M5W+ejofaZWTYe0Q7V8jy+FfOzh4NdcYMN
 ga1moEwjE2390D20KoI4kAbSZ8rH8biTxNpX6h+nRfh79HSHPSanhpfKJ4B4jizIotPWNO
 TYBOgXDibqsQzgR5rdktuXf3FK93Fic=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-0lj6p4UnObGM4RXWEd79qQ-1; Mon, 28 Nov 2022 09:23:43 -0500
X-MC-Unique: 0lj6p4UnObGM4RXWEd79qQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1846E185A792;
 Mon, 28 Nov 2022 14:23:43 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF3121402BDF;
 Mon, 28 Nov 2022 14:23:42 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v7 06/14] block: avoid duplicating filename string in
 bdrv_create
Date: Mon, 28 Nov 2022 09:23:29 -0500
Message-Id: <20221128142337.657646-7-eesposit@redhat.com>
In-Reply-To: <20221128142337.657646-1-eesposit@redhat.com>
References: <20221128142337.657646-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

We know that the string will stay around until the function
returns, and the parameter of drv->bdrv_co_create_opts is const char*,
so it must not be modified either.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/block.c b/block.c
index 8c9f4ee37c..9d51e7b6e5 100644
--- a/block.c
+++ b/block.c
@@ -553,7 +553,7 @@ int bdrv_create(BlockDriver *drv, const char* filename,
     Coroutine *co;
     CreateCo cco = {
         .drv = drv,
-        .filename = g_strdup(filename),
+        .filename = filename,
         .opts = opts,
         .ret = NOT_DONE,
         .err = NULL,
@@ -561,8 +561,7 @@ int bdrv_create(BlockDriver *drv, const char* filename,
 
     if (!drv->bdrv_co_create_opts) {
         error_setg(errp, "Driver '%s' does not support image creation", drv->format_name);
-        ret = -ENOTSUP;
-        goto out;
+        return -ENOTSUP;
     }
 
     if (qemu_in_coroutine()) {
@@ -585,8 +584,6 @@ int bdrv_create(BlockDriver *drv, const char* filename,
         }
     }
 
-out:
-    g_free(cco.filename);
     return ret;
 }
 
-- 
2.31.1


