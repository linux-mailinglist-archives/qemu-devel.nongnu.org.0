Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985BC617E3B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 14:44:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqaUU-0001U6-Nb; Thu, 03 Nov 2022 09:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqaUE-0001NG-Sd
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 09:42:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqaU2-0002AS-8q
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 09:42:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667482932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R8Y6MqeY9uMftCHi6j1YVmdZ2ZBL/Gmr9aHkUtAGbI0=;
 b=Z1cTHOVlqLPkkKI4BZl6Tn5vHZKDYBXFr9GyZhr5kXbMDn5fQ2jT75Wm5RDzzEh9Cm+1Ym
 AYEjuKcBu2cNpYlJHZ9cy6pymXh8k/VtVIy2NTIv7qNjwQX9bcFDgVk0iu4u8elGOxhrM8
 DIJWNFnUCkZqnW0ZzIT5o4N8JVnFtFA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-2kQiEL81MUWm9YtYGPVgEg-1; Thu, 03 Nov 2022 09:42:10 -0400
X-MC-Unique: 2kQiEL81MUWm9YtYGPVgEg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75EBE8027F5;
 Thu,  3 Nov 2022 13:42:10 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B58A40C6EC3;
 Thu,  3 Nov 2022 13:42:10 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 6/9] block/vmdk: add missing coroutine_fn annotations
Date: Thu,  3 Nov 2022 09:42:03 -0400
Message-Id: <20221103134206.4041928-7-eesposit@redhat.com>
In-Reply-To: <20221103134206.4041928-1-eesposit@redhat.com>
References: <20221103134206.4041928-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

vmdk_co_create_opts() is a coroutine_fn, and calls vmdk_co_do_create()
which in turn can call two callbacks: vmdk_co_create_opts_cb and
vmdk_co_create_cb.

Mark all these functions as coroutine_fn, since vmdk_co_create_opts()
is the only caller.

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


