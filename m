Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEFC54525D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:51:44 +0200 (CEST)
Received: from localhost ([::1]:33624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzLNn-0001lv-9G
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nzJso-00051Q-D6
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:15:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nzJsm-0006lv-Om
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:15:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654787736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FYkBzLLtmlIkJEpoQJ4WaoAUoOIG4EPcEIw6zgksXzY=;
 b=jKjpc2cSnPnf2OOFnd7S2/DmcuuM9JmpjbuqsisYJl3GKZeB8C+1Rgn2Ws447bPOorms8S
 0hjIpp0bi7m6nma+QLtyAhft8ce2ErcmAWPMmSsJTAVDzYihUeSE4qvjdngyCfWcZ0cfPZ
 po3u6GlhQshUGJXEI4QK2CELit3w4n8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-efJv-8cuOdWoghnHzoEB_A-1; Thu, 09 Jun 2022 11:15:32 -0400
X-MC-Unique: efJv-8cuOdWoghnHzoEB_A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 846BC811E75;
 Thu,  9 Jun 2022 15:15:31 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B81E62026D64;
 Thu,  9 Jun 2022 15:15:28 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Ari Sundholm <ari@tuxera.com>, qemu-block@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Jeff Cody <codyprime@gmail.com>, Alberto Faria <afaria@redhat.com>
Subject: [PATCH v4 10/10] block/qcow2: Use bdrv_pwrite_sync() in
 qcow2_mark_dirty()
Date: Thu,  9 Jun 2022 16:14:51 +0100
Message-Id: <20220609151451.3883195-11-afaria@redhat.com>
In-Reply-To: <20220609151451.3883195-1-afaria@redhat.com>
References: <20220609151451.3883195-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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


