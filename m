Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B95C34756D1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:47:36 +0100 (CET)
Received: from localhost ([::1]:42820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxRos-000518-0r
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:47:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRaS-0002wX-Nu
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:32:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRaP-0007HE-4Y
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:32:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639564356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0go/oYucwrQb9URjrILXM9UBAkmykahMJxyBmR67KI8=;
 b=bDtjaqSETG+JEufzX70qukzAnrqH5rSr40+/ZIO7oJ6XNmyNLiBu6YqvfglBMqCSPiyGek
 bEQKV9fq/r220U3IXdXbc5tXUkER7Q5DEfmYUPxVAmmXNFBhLejb+HMOSLALZRx4bWm5A7
 2DiBsKT5kOah64kjhPU9lEXM6aGINAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-W3QkFv4dMZqDtoazhpeJwA-1; Wed, 15 Dec 2021 05:32:33 -0500
X-MC-Unique: W3QkFv4dMZqDtoazhpeJwA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 310DC801962;
 Wed, 15 Dec 2021 10:32:32 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94E3A6E978;
 Wed, 15 Dec 2021 10:32:30 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/18] migration: Remove is_zero_range()
Date: Wed, 15 Dec 2021 11:32:05 +0100
Message-Id: <20211215103218.17527-6-quintela@redhat.com>
In-Reply-To: <20211215103218.17527-1-quintela@redhat.com>
References: <20211215103218.17527-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It just calls buffer_is_zero().  Just change the callers.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 migration/ram.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 2c688f5bbb..57efa67f20 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -81,11 +81,6 @@
 /* 0x80 is reserved in migration.h start with 0x100 next */
 #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
 
-static inline bool is_zero_range(uint8_t *p, uint64_t size)
-{
-    return buffer_is_zero(p, size);
-}
-
 XBZRLECacheStats xbzrle_counters;
 
 /* struct contains XBZRLE cache and a static page
@@ -1180,7 +1175,7 @@ static int save_zero_page_to_file(RAMState *rs, QEMUFile *file,
     uint8_t *p = block->host + offset;
     int len = 0;
 
-    if (is_zero_range(p, TARGET_PAGE_SIZE)) {
+    if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
         len += save_page_header(rs, file, block, offset | RAM_SAVE_FLAG_ZERO);
         qemu_put_byte(file, 0);
         len += 1;
@@ -3367,7 +3362,7 @@ static inline void *colo_cache_from_block_offset(RAMBlock *block,
  */
 void ram_handle_compressed(void *host, uint8_t ch, uint64_t size)
 {
-    if (ch != 0 || !is_zero_range(host, size)) {
+    if (ch != 0 || !buffer_is_zero(host, size)) {
         memset(host, ch, size);
     }
 }
-- 
2.33.1


