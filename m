Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C780952D699
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 16:59:11 +0200 (CEST)
Received: from localhost ([::1]:35588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrhcM-00034b-7a
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 10:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nrhSm-00071M-Iq
 for qemu-devel@nongnu.org; Thu, 19 May 2022 10:49:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nrhSk-0000zG-6C
 for qemu-devel@nongnu.org; Thu, 19 May 2022 10:49:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652971753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nx9ZwtyEAVAG7Id1TkacS5rWh0HL9VHtrY3uhNqK7b8=;
 b=L697EdnxxKgTuXDsw3pXL8BxvJN9JYWGfh75N1yeJx5eF56nvC3j64fBI35nhXABvI9Fqh
 afnjZv7YFulEoEnj03pekt819ULRj9IqYjFkKMTZhMNOK4xp+c7dn4bLjV5bqbletJowjj
 8XQO054nBa/9ZOITHhNISQinAJg1Fs0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-bAD42k50N-m8JOimFHUXNg-1; Thu, 19 May 2022 10:49:10 -0400
X-MC-Unique: bAD42k50N-m8JOimFHUXNg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E29B800B21;
 Thu, 19 May 2022 14:49:10 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A062340D1B98;
 Thu, 19 May 2022 14:49:07 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Fam Zheng <fam@euphon.net>, Ari Sundholm <ari@tuxera.com>,
 Alberto Faria <afaria@redhat.com>
Subject: [PATCH v3 08/10] block: Add bdrv_co_pwrite_sync()
Date: Thu, 19 May 2022 15:48:38 +0100
Message-Id: <20220519144841.784780-9-afaria@redhat.com>
In-Reply-To: <20220519144841.784780-1-afaria@redhat.com>
References: <20220519144841.784780-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Also convert bdrv_pwrite_sync() to being implemented using
generated_co_wrapper.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/io.c               | 9 +++++----
 include/block/block-io.h | 8 ++++++--
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/block/io.c b/block/io.c
index ecd1c2a53c..b2e35dbe23 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1109,18 +1109,19 @@ int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags)
  *
  * Returns 0 on success, -errno in error cases.
  */
-int bdrv_pwrite_sync(BdrvChild *child, int64_t offset, int64_t bytes,
-                     const void *buf, BdrvRequestFlags flags)
+int coroutine_fn bdrv_co_pwrite_sync(BdrvChild *child, int64_t offset,
+                                     int64_t bytes, const void *buf,
+                                     BdrvRequestFlags flags)
 {
     int ret;
     IO_CODE();
 
-    ret = bdrv_pwrite(child, offset, bytes, buf, flags);
+    ret = bdrv_co_pwrite(child, offset, bytes, buf, flags);
     if (ret < 0) {
         return ret;
     }
 
-    ret = bdrv_flush(child->bs);
+    ret = bdrv_co_flush(child->bs);
     if (ret < 0) {
         return ret;
     }
diff --git a/include/block/block-io.h b/include/block/block-io.h
index c81739ad16..ae90d1e588 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -49,8 +49,12 @@ int generated_co_wrapper bdrv_pread(BdrvChild *child, int64_t offset,
 int generated_co_wrapper bdrv_pwrite(BdrvChild *child, int64_t offset,
                                      int64_t bytes, const void *buf,
                                      BdrvRequestFlags flags);
-int bdrv_pwrite_sync(BdrvChild *child, int64_t offset, int64_t bytes,
-                     const void *buf, BdrvRequestFlags flags);
+int generated_co_wrapper bdrv_pwrite_sync(BdrvChild *child, int64_t offset,
+                                          int64_t bytes, const void *buf,
+                                          BdrvRequestFlags flags);
+int coroutine_fn bdrv_co_pwrite_sync(BdrvChild *child, int64_t offset,
+                                     int64_t bytes, const void *buf,
+                                     BdrvRequestFlags flags);
 /*
  * Efficiently zero a region of the disk image.  Note that this is a regular
  * I/O request like read or write and should have a reasonable size.  This
-- 
2.35.3


