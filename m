Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4334162BDA6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 13:24:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovHRS-0000fd-JT; Wed, 16 Nov 2022 07:22:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovHRO-0000du-6A
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 07:22:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovHRK-0000vb-Vc
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 07:22:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668601370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e/icbMw3vJn19CWAA2NfbCl2FqeUTzb2udfDHum2cnc=;
 b=On7e4dBQXlUmMKg2nKJAM+wb9rlK3sNS8clrILlvEF3TELym0QpC/L4Y8I47hJB2QqMPal
 wDqlUPDYgpJ/2xz+aWLW2cuYTONt9AX/cKTWxdfnR/NzW3c1l4JtdXRBzNNjdc9bE98Rdt
 ZkQ1veqzXzkCkQF1vMvIyRJGRGD59xw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-BFxCPF49MpmfQdX9hja7HA-1; Wed, 16 Nov 2022 07:22:46 -0500
X-MC-Unique: BFxCPF49MpmfQdX9hja7HA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7277C882820;
 Wed, 16 Nov 2022 12:22:46 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36DD89E70;
 Wed, 16 Nov 2022 12:22:46 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v4 09/11] block: bdrv_create_file is a coroutine_fn
Date: Wed, 16 Nov 2022 07:22:39 -0500
Message-Id: <20221116122241.2856527-10-eesposit@redhat.com>
In-Reply-To: <20221116122241.2856527-1-eesposit@redhat.com>
References: <20221116122241.2856527-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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

It is always called in coroutine_fn callbacks, therefore
it can directly call bdrv_co_create().

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                            | 6 ++++--
 include/block/block-global-state.h | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/block.c b/block.c
index c610a32e77..7a4c3eb540 100644
--- a/block.c
+++ b/block.c
@@ -534,6 +534,7 @@ static int coroutine_fn bdrv_co_create(BlockDriver *drv, const char *filename,
     int ret;
     char *filename_copy;
     GLOBAL_STATE_CODE();
+    assert(qemu_in_coroutine());
     assert(*errp == NULL);
     assert(drv);
 
@@ -725,7 +726,8 @@ out:
     return ret;
 }
 
-int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp)
+int coroutine_fn bdrv_create_file(const char *filename, QemuOpts *opts,
+                                  Error **errp)
 {
     QemuOpts *protocol_opts;
     BlockDriver *drv;
@@ -766,7 +768,7 @@ int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp)
         goto out;
     }
 
-    ret = bdrv_create(drv, filename, protocol_opts, errp);
+    ret = bdrv_co_create(drv, filename, protocol_opts, errp);
 out:
     qemu_opts_del(protocol_opts);
     qobject_unref(qdict);
diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 00e0cf8aea..6f35ed99e3 100644
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


