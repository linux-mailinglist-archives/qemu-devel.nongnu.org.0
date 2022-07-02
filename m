Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 944EF563FCE
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 13:43:18 +0200 (CEST)
Received: from localhost ([::1]:43798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7bWv-0003jR-M5
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 07:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o7bNx-0003ML-Oh
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 07:34:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o7bNw-0007z4-7g
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 07:34:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656761639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6dsFT66wWWePXhL01EUVk5ehyeBB76oxgUuM4U+Bn9I=;
 b=TOwUrw+asQs2csbDBriAjWcO77zntGeSVP0pWsc0iRhswne61Y/Vl6LgLg9OpQyMrfd/o9
 r4xmdaerGv8iD1a0I5Opr+pCv5M8hhUmb3GpR2AUkKfKj7kCGZo7xgA9TzoFC4+9+BoFMZ
 DRLK4nFPwFSYwFq5T/e4XG+1EjEXJd0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-lxLR4XDgPc2hJy4jSRiatg-1; Sat, 02 Jul 2022 07:33:58 -0400
X-MC-Unique: lxLR4XDgPc2hJy4jSRiatg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29CE185A580;
 Sat,  2 Jul 2022 11:33:58 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.194.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CB23492C3B;
 Sat,  2 Jul 2022 11:33:54 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alberto Garcia <berto@igalia.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Lieven <pl@kamp.de>, Alberto Faria <afaria@redhat.com>
Subject: [RFC 6/8] Fix some coroutine_fn indirect calls and pointer assignments
Date: Sat,  2 Jul 2022 12:33:29 +0100
Message-Id: <20220702113331.2003820-7-afaria@redhat.com>
In-Reply-To: <20220702113331.2003820-1-afaria@redhat.com>
References: <20220702113331.2003820-1-afaria@redhat.com>
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

These problems were found by static-analyzer.py. Only a few of the
reported cases were fixed.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 include/block/block_int-common.h | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 8947abab76..16c45d1262 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -731,13 +731,11 @@ struct BlockDriver {
     void coroutine_fn (*bdrv_co_drain_end)(BlockDriverState *bs);
 
     bool (*bdrv_supports_persistent_dirty_bitmap)(BlockDriverState *bs);
-    bool (*bdrv_co_can_store_new_dirty_bitmap)(BlockDriverState *bs,
-                                               const char *name,
-                                               uint32_t granularity,
-                                               Error **errp);
-    int (*bdrv_co_remove_persistent_dirty_bitmap)(BlockDriverState *bs,
-                                                  const char *name,
-                                                  Error **errp);
+    bool coroutine_fn (*bdrv_co_can_store_new_dirty_bitmap)(
+        BlockDriverState *bs, const char *name, uint32_t granularity,
+        Error **errp);
+    int coroutine_fn (*bdrv_co_remove_persistent_dirty_bitmap)(
+        BlockDriverState *bs, const char *name, Error **errp);
 };
 
 static inline bool block_driver_can_compress(BlockDriver *drv)
-- 
2.36.1


