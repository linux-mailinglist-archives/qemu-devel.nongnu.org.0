Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D09457224F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:18:28 +0200 (CEST)
Received: from localhost ([::1]:36978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBKSp-0004hi-3A
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHS-0003HP-8c
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:06:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHQ-0006XT-4w
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:06:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657649199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QBmGXqomM6EhnsPEF7zObu5OPXwCH2wsrAu/mJBtFhc=;
 b=TULAsE0u2OHiaKHerN1s27Yfcm4ElDUtdU1AGhG0J2KOucevIJERTYaegoRO0nAoG02JXz
 ZjKbYot4J4+h9ewaVZM3wYK2ZOnGumljFP8ELqplKSOYcKKmdjII0FOAiN7c/dV3OnWIyo
 TfzlxGNXHwSHazMQtxQIFDnrZvQUKqE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-Rzya2hu7OYuu6onAXC601w-1; Tue, 12 Jul 2022 14:06:37 -0400
X-MC-Unique: Rzya2hu7OYuu6onAXC601w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A0D8802D1F;
 Tue, 12 Jul 2022 18:06:37 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3997B2166B26;
 Tue, 12 Jul 2022 18:06:37 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 10/35] block/qcow2: Use bdrv_pwrite_sync() in qcow2_mark_dirty()
Date: Tue, 12 Jul 2022 20:05:52 +0200
Message-Id: <20220712180617.1362407-11-hreitz@redhat.com>
In-Reply-To: <20220712180617.1362407-1-hreitz@redhat.com>
References: <20220712180617.1362407-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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

From: Alberto Faria <afaria@redhat.com>

Use bdrv_pwrite_sync() instead of calling bdrv_pwrite() and bdrv_flush()
separately.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220609152744.3891847-11-afaria@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
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


