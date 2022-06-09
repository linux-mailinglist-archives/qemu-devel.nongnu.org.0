Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4153A545120
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:44:25 +0200 (CEST)
Received: from localhost ([::1]:35234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKKe-0003We-9R
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nzK5D-0008HY-P7
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:28:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nzK5B-0000vw-CN
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654788503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EolcNd+EbkDu3M5k3Rz1LtOOnBr2DmUQhEgC8hrZV5E=;
 b=d+vDzAjK3Y4iibj5S4K6eqaWGzE2usmNLm19I4m2K9BbIVYJ3qlP0ojfDWuN7A8CFnNTYc
 yNT+NoqClY8ziSF0mWza0jrkJxdGmFDa2l03Aqkl+l3mkouaE5cgOn1MbmxRIYtgZUN3Vr
 z7Al5ehxSAeQIwigWITsLyjJdRE4xzo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-7CK3c65WM1yJjiT2Sh-LlQ-1; Thu, 09 Jun 2022 11:28:23 -0400
X-MC-Unique: 7CK3c65WM1yJjiT2Sh-LlQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D2A618E0043;
 Thu,  9 Jun 2022 15:28:22 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BD3F492CA3;
 Thu,  9 Jun 2022 15:28:19 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Ari Sundholm <ari@tuxera.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Fam Zheng <fam@euphon.net>,
 Jeff Cody <codyprime@gmail.com>, qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Alberto Faria <afaria@redhat.com>
Subject: [PATCH v5 10/10] block/qcow2: Use bdrv_pwrite_sync() in
 qcow2_mark_dirty()
Date: Thu,  9 Jun 2022 16:27:44 +0100
Message-Id: <20220609152744.3891847-11-afaria@redhat.com>
In-Reply-To: <20220609152744.3891847-1-afaria@redhat.com>
References: <20220609152744.3891847-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Use bdrv_pwrite_sync() instead of calling bdrv_pwrite() and bdrv_flush()
separately.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/qcow2.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index f2fb54c51f..90a2dd406b 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -516,12 +516,9 @@ int qcow2_mark_dirty(BlockDriverState *bs)
     }
 
     val = cpu_to_be64(s->incompatible_features | QCOW2_INCOMPAT_DIRTY);
-    ret = bdrv_pwrite(bs->file, offsetof(QCowHeader, incompatible_features),
-                      sizeof(val), &val, 0);
-    if (ret < 0) {
-        return ret;
-    }
-    ret = bdrv_flush(bs->file->bs);
+    ret = bdrv_pwrite_sync(bs->file,
+                           offsetof(QCowHeader, incompatible_features),
+                           sizeof(val), &val, 0);
     if (ret < 0) {
         return ret;
     }
-- 
2.35.3


