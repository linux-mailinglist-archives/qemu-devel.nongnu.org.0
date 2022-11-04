Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D10756193F7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 10:58:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqtSY-0005tu-8P; Fri, 04 Nov 2022 05:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqtRp-0005a6-QT
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:57:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqtRl-0000IW-Rc
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667555829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=umTz3uT/8e+lpHzfHGCAFJFZLsQOJKoTN7iqlDweJc4=;
 b=D5iSD5TH3KPi+ASXhwd4cD1GiiVAmDI8FIeczmzI8MDC36R7fNBfAutBtKqRalW1j33tHH
 VFe7mKZxHzlrlGVaX3j5shsLJoX3Sj88QXuXRmQGGOu4YqSNyiercElj0DOIwetf2HxPc4
 vusYqycNXtBhi7wkwSgt5SM60qeI6eU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-TF__9d3XODyfwTjZx7qqjw-1; Fri, 04 Nov 2022 05:57:05 -0400
X-MC-Unique: TF__9d3XODyfwTjZx7qqjw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BF4285A5B6;
 Fri,  4 Nov 2022 09:57:04 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F16A40C8459;
 Fri,  4 Nov 2022 09:57:04 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v2 7/9] block: bdrv_create_file is a coroutine_fn
Date: Fri,  4 Nov 2022 05:56:58 -0400
Message-Id: <20221104095700.4117433-8-eesposit@redhat.com>
In-Reply-To: <20221104095700.4117433-1-eesposit@redhat.com>
References: <20221104095700.4117433-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It is always called in coroutine_fn callbacks, therefore
it can directly call bdrv_co_create().

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                            | 6 ++++--
 include/block/block-global-state.h | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/block.c b/block.c
index 0823563e4d..c6a80d775c 100644
--- a/block.c
+++ b/block.c
@@ -527,6 +527,7 @@ static int coroutine_fn bdrv_co_create(BlockDriver *drv, const char *filename,
 {
     int ret;
     GLOBAL_STATE_CODE();
+    assert(qemu_in_coroutine());
     assert(*errp == NULL);
 
     if (!drv->bdrv_co_create_opts) {
@@ -717,7 +718,8 @@ out:
     return ret;
 }
 
-int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp)
+int coroutine_fn bdrv_create_file(const char *filename, QemuOpts *opts,
+                                  Error **errp)
 {
     QemuOpts *protocol_opts;
     BlockDriver *drv;
@@ -758,7 +760,7 @@ int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp)
         goto out;
     }
 
-    ret = bdrv_create(drv, filename, protocol_opts, errp);
+    ret = bdrv_co_create(drv, filename, protocol_opts, errp);
 out:
     qemu_opts_del(protocol_opts);
     qobject_unref(qdict);
diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 73795a0095..bd461f06a1 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -57,7 +57,8 @@ BlockDriver *bdrv_find_protocol(const char *filename,
 BlockDriver *bdrv_find_format(const char *format_name);
 int bdrv_create(BlockDriver *drv, const char* filename,
                 QemuOpts *opts, Error **errp);
-int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp);
+int coroutine_fn bdrv_create_file(const char *filename, QemuOpts *opts,
+                                  Error **errp);
 
 BlockDriverState *bdrv_new(void);
 int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
-- 
2.31.1


