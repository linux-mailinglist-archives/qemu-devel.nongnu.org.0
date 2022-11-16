Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527C362BDBB
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 13:26:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovHRU-0000i9-Dp; Wed, 16 Nov 2022 07:23:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovHRO-0000eZ-PD
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 07:22:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovHRL-0000up-1Z
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 07:22:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668601369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j9YoMuW7ncHC3ohg3wqBTg/h0labHb8rl1YjdLKA5I4=;
 b=AqZrZ5ZdKmITZk+nfcnp65gzfnkeGLaLprFdTaZWY/QPhu5EeAzflr/HrFvPbSZhI3d0vC
 SUhOBDKLHxr0xQYsJeArNERQF/YnB71P2q5+XYetigPlNZ3RpBe2IKWPQgDLnupPmfhGYL
 PZsFScEEJYciLDv2qBgjfChJ/ImF2R4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-fAEn-k4FM8mmz5v3_UFRkQ-1; Wed, 16 Nov 2022 07:22:46 -0500
X-MC-Unique: fAEn-k4FM8mmz5v3_UFRkQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD04A3C10224;
 Wed, 16 Nov 2022 12:22:45 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A14199E70;
 Wed, 16 Nov 2022 12:22:45 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v4 07/11] block/vmdk: add missing coroutine_fn annotations
Date: Wed, 16 Nov 2022 07:22:37 -0500
Message-Id: <20221116122241.2856527-8-eesposit@redhat.com>
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

These functions end up calling bdrv_create() implemented as generated_co_wrapper
functions.
In addition, they also happen to be always called in coroutine context,
meaning all callers are coroutine_fn.
This means that the g_c_w function will enter the qemu_in_coroutine()
case and eventually suspend (or in other words call qemu_coroutine_yield()).
Therefore we need to mark such functions coroutine_fn too.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/vmdk.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index 26376352b9..0c32bf2e83 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2285,10 +2285,11 @@ exit:
     return ret;
 }
 
-static int vmdk_create_extent(const char *filename, int64_t filesize,
-                              bool flat, bool compress, bool zeroed_grain,
-                              BlockBackend **pbb,
-                              QemuOpts *opts, Error **errp)
+static int coroutine_fn vmdk_create_extent(const char *filename,
+                                           int64_t filesize, bool flat,
+                                           bool compress, bool zeroed_grain,
+                                           BlockBackend **pbb,
+                                           QemuOpts *opts, Error **errp)
 {
     int ret;
     BlockBackend *blk = NULL;
@@ -2366,14 +2367,14 @@ static int filename_decompose(const char *filename, char *path, char *prefix,
  *           non-split format.
  * idx >= 1: get the n-th extent if in a split subformat
  */
-typedef BlockBackend *(*vmdk_create_extent_fn)(int64_t size,
-                                               int idx,
-                                               bool flat,
-                                               bool split,
-                                               bool compress,
-                                               bool zeroed_grain,
-                                               void *opaque,
-                                               Error **errp);
+typedef BlockBackend * coroutine_fn (*vmdk_create_extent_fn)(int64_t size,
+                                                             int idx,
+                                                             bool flat,
+                                                             bool split,
+                                                             bool compress,
+                                                             bool zeroed_grain,
+                                                             void *opaque,
+                                                             Error **errp);
 
 static void vmdk_desc_add_extent(GString *desc,
                                  const char *extent_line_fmt,
@@ -2616,7 +2617,7 @@ typedef struct {
     QemuOpts *opts;
 } VMDKCreateOptsData;
 
-static BlockBackend *vmdk_co_create_opts_cb(int64_t size, int idx,
+static BlockBackend * coroutine_fn vmdk_co_create_opts_cb(int64_t size, int idx,
                                             bool flat, bool split, bool compress,
                                             bool zeroed_grain, void *opaque,
                                             Error **errp)
@@ -2768,10 +2769,11 @@ exit:
     return ret;
 }
 
-static BlockBackend *vmdk_co_create_cb(int64_t size, int idx,
-                                       bool flat, bool split, bool compress,
-                                       bool zeroed_grain, void *opaque,
-                                       Error **errp)
+static BlockBackend * coroutine_fn vmdk_co_create_cb(int64_t size, int idx,
+                                                     bool flat, bool split,
+                                                     bool compress,
+                                                     bool zeroed_grain,
+                                                     void *opaque, Error **errp)
 {
     int ret;
     BlockDriverState *bs;
-- 
2.31.1


