Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8D86D79C5
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 12:34:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk0RM-000125-83; Wed, 05 Apr 2023 06:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pk0RJ-00010d-Hb
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:32:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pk0RG-0007bF-Ib
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:32:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680690745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cWCmqRJ7FD5WGIGTqakMZCDpKu840VhqTlbHYtjTE2g=;
 b=gSDSTKcoaekl3g9EIBNUj7slEhwNjf2v6OoG7j6k9QDS3UM8+yUKaub/rF9HqtqY7kUSKQ
 FBM55QQ1fegZqUXfvaNDYfKWBv+ZE2MdDNSk1lG8fTAilktHiIIBf+qRkei5T2vjVstRoC
 h8r0EMV1ddhBE7T90wi0gf9++ZLPhd8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-xvS3sSGNMHyyUUHXssV7Gw-1; Wed, 05 Apr 2023 06:32:24 -0400
X-MC-Unique: xvS3sSGNMHyyUUHXssV7Gw-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-4fd22779a36so267412a12.3
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 03:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680690743; x=1683282743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cWCmqRJ7FD5WGIGTqakMZCDpKu840VhqTlbHYtjTE2g=;
 b=qeic/Y8eEQ0K86ZxYpIbTeMzmB9T4xJwuPxrUlfGhDadEBKBwnYsZb810uxSLpssPk
 vxlX9AZ3bw2yTc6EmbM2nMyUwmrtGhPAp4J/VQfpnRHhnN5+XSdsXXkwQd65NL46NSHn
 2yJTonwCny7Z6l+PwD7uB+W62m9H0Lg5Wj04hKvND3+2cWKlXFVwrsA9/7XoDoQvwsIu
 gTcY2WqnzNgN7bHLjvNhawrgsd3fv1TETQAKkrCU67Fvt+3jcFrziVStbSUZyj+bNkt0
 FVhDAwD7FpOx1fMYw+BiHm6M5re9o4p8KDAmIH9akoe66wsSnDYY5S7ELSCAwrr5JvlV
 vg0Q==
X-Gm-Message-State: AAQBX9fSTE70QpHto8LS/cDDMZNVPXG2mT/7nGdlAbhoZGnYjB/PSj66
 iMI1QFjywYy9Mbufo9O9Zh4uxDOHruS6VyI4ZcXFMsfyre7JLTvjZhAARhz/9lHmr5Nyl/v68UL
 Ja9yru421XNYEkuQ7zgoX0CU/p/EFxTLOgxCBySkWhkYg618KQoSHgJ3VUpcHH5BpQjfTaGXFyB
 U=
X-Received: by 2002:aa7:c543:0:b0:4fb:54b7:50ea with SMTP id
 s3-20020aa7c543000000b004fb54b750eamr1433870edr.21.1680690743048; 
 Wed, 05 Apr 2023 03:32:23 -0700 (PDT)
X-Google-Smtp-Source: AKy350b0rg5p0Cl9n98ZI7d/lDa3/gfirXsgoIjBA4gSPVlqEQmb5hG+updwio92bxUWLbi2blypVg==
X-Received: by 2002:aa7:c543:0:b0:4fb:54b7:50ea with SMTP id
 s3-20020aa7c543000000b004fb54b750eamr1433847edr.21.1680690742662; 
 Wed, 05 Apr 2023 03:32:22 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a170906941200b009316783c92csm7274644ejx.12.2023.04.05.03.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 03:32:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Subject: [PATCH 3/4] block: switch to co_wrapper for bdrv_is_allocated_*
Date: Wed,  5 Apr 2023 12:32:15 +0200
Message-Id: <20230405103216.128103-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405103216.128103-1-pbonzini@redhat.com>
References: <20230405103216.128103-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/io.c               | 53 ++++++----------------------------------
 include/block/block-io.h | 12 +++++----
 2 files changed, 14 insertions(+), 51 deletions(-)

diff --git a/block/io.c b/block/io.c
index 0aad0f57d8c7..cacde79a3e98 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2623,45 +2623,6 @@ int coroutine_fn bdrv_co_is_allocated(BlockDriverState *bs, int64_t offset,
     return !!(ret & BDRV_BLOCK_ALLOCATED);
 }
 
-int bdrv_is_allocated(BlockDriverState *bs, int64_t offset, int64_t bytes,
-                      int64_t *pnum)
-{
-    int ret;
-    int64_t dummy;
-    IO_CODE();
-
-    ret = bdrv_common_block_status_above(bs, bs, true, false, offset,
-                                         bytes, pnum ? pnum : &dummy, NULL,
-                                         NULL, NULL);
-    if (ret < 0) {
-        return ret;
-    }
-    return !!(ret & BDRV_BLOCK_ALLOCATED);
-}
-
-/* See bdrv_is_allocated_above for documentation */
-int coroutine_fn bdrv_co_is_allocated_above(BlockDriverState *top,
-                                            BlockDriverState *base,
-                                            bool include_base, int64_t offset,
-                                            int64_t bytes, int64_t *pnum)
-{
-    int depth;
-    int ret;
-    IO_CODE();
-
-    ret = bdrv_co_common_block_status_above(top, base, include_base, false,
-                                            offset, bytes, pnum, NULL, NULL,
-                                            &depth);
-    if (ret < 0) {
-        return ret;
-    }
-
-    if (ret & BDRV_BLOCK_ALLOCATED) {
-        return depth;
-    }
-    return 0;
-}
-
 /*
  * Given an image chain: ... -> [BASE] -> [INTER1] -> [INTER2] -> [TOP]
  *
@@ -2679,18 +2640,18 @@ int coroutine_fn bdrv_co_is_allocated_above(BlockDriverState *top,
  * words, the result is not necessarily the maximum possible range);
  * but 'pnum' will only be 0 when end of file is reached.
  */
-int bdrv_is_allocated_above(BlockDriverState *top,
-                            BlockDriverState *base,
-                            bool include_base, int64_t offset,
-                            int64_t bytes, int64_t *pnum)
+int coroutine_fn bdrv_co_is_allocated_above(BlockDriverState *bs,
+                                            BlockDriverState *base,
+                                            bool include_base, int64_t offset,
+                                            int64_t bytes, int64_t *pnum)
 {
     int depth;
     int ret;
     IO_CODE();
 
-    ret = bdrv_common_block_status_above(top, base, include_base, false,
-                                         offset, bytes, pnum, NULL, NULL,
-                                         &depth);
+    ret = bdrv_co_common_block_status_above(bs, base, include_base, false,
+                                            offset, bytes, pnum, NULL, NULL,
+                                            &depth);
     if (ret < 0) {
         return ret;
     }
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 0947f83d9ac7..9e179861895c 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -134,16 +134,18 @@ bdrv_block_status_above(BlockDriverState *bs, BlockDriverState *base,
 int coroutine_fn GRAPH_RDLOCK
 bdrv_co_is_allocated(BlockDriverState *bs, int64_t offset, int64_t bytes,
                      int64_t *pnum);
-int bdrv_is_allocated(BlockDriverState *bs, int64_t offset, int64_t bytes,
-                      int64_t *pnum);
+int co_wrapper_mixed_bdrv_rdlock
+bdrv_is_allocated(BlockDriverState *bs, int64_t offset,
+                  int64_t bytes, int64_t *pnum);
 
 int coroutine_fn GRAPH_RDLOCK
 bdrv_co_is_allocated_above(BlockDriverState *top, BlockDriverState *base,
                            bool include_base, int64_t offset, int64_t bytes,
                            int64_t *pnum);
-int bdrv_is_allocated_above(BlockDriverState *top, BlockDriverState *base,
-                            bool include_base, int64_t offset, int64_t bytes,
-                            int64_t *pnum);
+int co_wrapper_mixed_bdrv_rdlock
+bdrv_is_allocated_above(BlockDriverState *bs, BlockDriverState *base,
+                        bool include_base, int64_t offset,
+                        int64_t bytes, int64_t *pnum);
 
 int coroutine_fn GRAPH_RDLOCK
 bdrv_co_is_zero_fast(BlockDriverState *bs, int64_t offset, int64_t bytes);
-- 
2.39.2


