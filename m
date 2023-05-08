Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C49E36FB278
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 16:20:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw1iq-0006s2-IQ; Mon, 08 May 2023 10:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1pw1in-0006rq-N9
 for qemu-devel@nongnu.org; Mon, 08 May 2023 10:20:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1pw1im-0002Vf-7a
 for qemu-devel@nongnu.org; Mon, 08 May 2023 10:20:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683555610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=3quzTKsgZVdWCs30v96xwmdk2m/obW2g6CQn5NoQDD4=;
 b=LbPUUVYb5zK6lMKqnlJ/w7voVuOYkAMeMfOGVPeij+xQsrh962hy/wZ7XkaHIB55RyQfeM
 39wMqpCS+eODI0ROP3Q+KH8bvYx4XthCB9rQGazUW08sx/abUxl2Qr7Mnq/c/WvClgYO13
 uwTvxB4uj9vkkDnBnFWUsRuj2TAxhF0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-gehOQyPwPrqufoceVinWAA-1; Mon, 08 May 2023 10:20:09 -0400
X-MC-Unique: gehOQyPwPrqufoceVinWAA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAB4C811E7C;
 Mon,  8 May 2023 14:20:08 +0000 (UTC)
Received: from f37-work.redhat.com (unknown [10.39.193.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5E5A1410F23;
 Mon,  8 May 2023 14:20:07 +0000 (UTC)
From: Mauro Matteo Cascella <mcascell@redhat.com>
To: qemu-devel@nongnu.org
Cc: mcascell@redhat.com, kraxel@redhat.com, marcandre.lureau@redhat.com,
 jacek.halon@gmail.com
Subject: [PATCH] ui/cursor: incomplete check for integer overflow in
 cursor_alloc
Date: Mon,  8 May 2023 16:18:13 +0200
Message-Id: <20230508141813.1086562-1-mcascell@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The cursor_alloc function still accepts a signed integer for both the cursor
width and height. A specially crafted negative width/height could make datasize
wrap around and cause the next allocation to be 0, potentially leading to a
heap buffer overflow. Modify QEMUCursor struct and cursor_alloc prototype to
accept unsigned ints.

Fixes: CVE-2023-1601
Fixes: fa892e9a ("ui/cursor: fix integer overflow in cursor_alloc (CVE-2021-4206)")
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
Reported-by: Jacek Halon <jacek.halon@gmail.com>
---
 include/ui/console.h | 4 ++--
 ui/cursor.c          | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 2a8fab091f..92a4d90a1b 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -144,13 +144,13 @@ typedef struct QemuUIInfo {
 
 /* cursor data format is 32bit RGBA */
 typedef struct QEMUCursor {
-    int                 width, height;
+    uint32_t            width, height;
     int                 hot_x, hot_y;
     int                 refcount;
     uint32_t            data[];
 } QEMUCursor;
 
-QEMUCursor *cursor_alloc(int width, int height);
+QEMUCursor *cursor_alloc(uint32_t width, uint32_t height);
 QEMUCursor *cursor_ref(QEMUCursor *c);
 void cursor_unref(QEMUCursor *c);
 QEMUCursor *cursor_builtin_hidden(void);
diff --git a/ui/cursor.c b/ui/cursor.c
index 6fe67990e2..b5fcb64839 100644
--- a/ui/cursor.c
+++ b/ui/cursor.c
@@ -90,7 +90,7 @@ QEMUCursor *cursor_builtin_left_ptr(void)
     return cursor_parse_xpm(cursor_left_ptr_xpm);
 }
 
-QEMUCursor *cursor_alloc(int width, int height)
+QEMUCursor *cursor_alloc(uint32_t width, uint32_t height)
 {
     QEMUCursor *c;
     size_t datasize = width * height * sizeof(uint32_t);
-- 
2.40.1


