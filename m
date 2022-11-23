Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ED1635C16
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 12:48:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxo9K-0002fA-JC; Wed, 23 Nov 2022 06:42:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oxo9G-0002bk-2R
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:42:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oxo9D-0005zu-23
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:42:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669203754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BG3RABa1AnoYOZIUsX172/qsRfCCqnI9wQZdEtdFN7o=;
 b=cpZ5nFjPVf9sycPl7IoBphlxRvXSiHrdB0DulHsNVZG3kc3fJGZAbyEjn79zwfKLZetu5j
 odnR3xCCTIC/MMI0wrhjlP2z9Oun1u0poIfbGwNP686N3w6cCMgM9ans8kqVHJuKaNud4T
 7zcrO7TYE+n4SjD040lMrBOWwr40AAM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-Y7pBJ5K5Pey1-AVNTnxzBw-1; Wed, 23 Nov 2022 06:42:32 -0500
X-MC-Unique: Y7pBJ5K5Pey1-AVNTnxzBw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11998802314;
 Wed, 23 Nov 2022 11:42:32 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB15FC1D3AD;
 Wed, 23 Nov 2022 11:42:31 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v5 05/15] block/vmdk: add missing coroutine_fn annotations
Date: Wed, 23 Nov 2022 06:42:17 -0500
Message-Id: <20221123114227.85757-6-eesposit@redhat.com>
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

These functions end up calling bdrv_create() implemented as generated_co_wrapper
functions.
In addition, they also happen to be always called in coroutine context,
meaning all callers are coroutine_fn.
This means that the g_c_w function will enter the qemu_in_coroutine()
case and eventually suspend (or in other words call qemu_coroutine_yield()).
Therefore we need to mark such functions coroutine_fn too.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
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


