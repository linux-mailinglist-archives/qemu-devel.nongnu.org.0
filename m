Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E1F6D79C6
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 12:34:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk0RH-0000zU-Tf; Wed, 05 Apr 2023 06:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pk0RF-0000yB-1y
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:32:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pk0RD-0007TZ-8G
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:32:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680690742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mdKtTCDBgF2Xg2cUKGIiCmE72BwPaSPWYrcU4MbXnj0=;
 b=XEVRE8Gj5Rt6sABZ3M62h/+oqxXU8pvRLotiUSMHO4GqhSKMoKx4ONseDeEnR9OS9HQ1sk
 dbQV4bPMZt+NawIrB+s0shumFDLHK3mwUlAMAVQzh8N/qaUUn+I0+dEOW6gqq68KCOgmZh
 Q+Fvt2biG7s1/GoauJKFe5ih8dHEqTM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-O79WWdF-PoeYweYgldHq4w-1; Wed, 05 Apr 2023 06:32:21 -0400
X-MC-Unique: O79WWdF-PoeYweYgldHq4w-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-4f9e6d2cc4bso1183554a12.1
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 03:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680690739; x=1683282739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mdKtTCDBgF2Xg2cUKGIiCmE72BwPaSPWYrcU4MbXnj0=;
 b=av6l3K/d0UOLMcpHu9ayX9/03IjLX2SCYkobOvsbsT5mbQbtARJB7+Y9gyuIIGhEWV
 tSgTUoYo1Aa4RyuH9Y9SgWZR/VtpLW+LiMsbMLN8u93ZE+A/IFJeuueRfKAk5W1/XAJl
 UR7EFlCJ6jsOVBl98syn2Nhep34uwbVAOqT9Girq0JWXsYmevRtpzzjWnK3hhD+q953f
 gFbHEyAGC18dJMhe4cyn0JEkWA7leyUhkLstOW6bapWOWgUu14nrAQef2mZ6yPxL7kmM
 Oord+nkqpaZkzqbVzJ/mIDuv/4kSDRkp/SUAs3a2g/7XxMknkrNa9hNf1In2UOBvqOva
 1Jkw==
X-Gm-Message-State: AAQBX9fsoqxsyV8kv8e4yVJ4auIhhVOkZ+s/LEhlCMKKV3Y6o02u81bO
 7emZklbugsmBYzAIQ4nu8lPxYP8+EfgvqaMj8v2ujsHKOdcYUkly9evnzHJmJYc3Oa+TNruuG3/
 dsCVAj0nON9dU0/9fFwRa3AhdfYSA+TP2mVV6bLok1IDA8+wUC2QNZ+0aZoxP5ERL3f859xUbhw
 s=
X-Received: by 2002:a05:6402:2813:b0:500:58cb:3afd with SMTP id
 h19-20020a056402281300b0050058cb3afdmr1043447ede.3.1680690739672; 
 Wed, 05 Apr 2023 03:32:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350YZTHMgm6e0qzhPp3Ab8X6VFy8ERXAmvxxXaRDUuUZbnKpjydjshH8974vWQ/ZhmCLWzkkMGQ==
X-Received: by 2002:a05:6402:2813:b0:500:58cb:3afd with SMTP id
 h19-20020a056402281300b0050058cb3afdmr1043436ede.3.1680690739425; 
 Wed, 05 Apr 2023 03:32:19 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 y93-20020a50bb66000000b004fb30fc1dabsm7087774ede.96.2023.04.05.03.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 03:32:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Subject: [PATCH 1/4] block: rename the bdrv_co_block_status static function
Date: Wed,  5 Apr 2023 12:32:13 +0200
Message-Id: <20230405103216.128103-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405103216.128103-1-pbonzini@redhat.com>
References: <20230405103216.128103-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

bdrv_block_status exists as a wrapper for bdrv_block_status_above,
but the name of the (hypothetical) coroutine version, bdrv_co_block_status,
is squatted by a random static function.  Rename it to bdrv_do_block_status.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/io.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/io.c b/block/io.c
index db438c765757..e86090b7692b 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2230,7 +2230,7 @@ int bdrv_flush_all(void)
  * set to the host mapping and BDS corresponding to the guest offset.
  */
 static int coroutine_fn GRAPH_RDLOCK
-bdrv_co_block_status(BlockDriverState *bs, bool want_zero,
+bdrv_do_block_status(BlockDriverState *bs, bool want_zero,
                      int64_t offset, int64_t bytes,
                      int64_t *pnum, int64_t *map, BlockDriverState **file)
 {
@@ -2391,7 +2391,7 @@ bdrv_co_block_status(BlockDriverState *bs, bool want_zero,
 
     if (ret & BDRV_BLOCK_RAW) {
         assert(ret & BDRV_BLOCK_OFFSET_VALID && local_file);
-        ret = bdrv_co_block_status(local_file, want_zero, local_map,
+        ret = bdrv_do_block_status(local_file, want_zero, local_map,
                                    *pnum, pnum, &local_map, &local_file);
         goto out;
     }
@@ -2419,7 +2419,7 @@ bdrv_co_block_status(BlockDriverState *bs, bool want_zero,
         int64_t file_pnum;
         int ret2;
 
-        ret2 = bdrv_co_block_status(local_file, want_zero, local_map,
+        ret2 = bdrv_do_block_status(local_file, want_zero, local_map,
                                     *pnum, &file_pnum, NULL, NULL);
         if (ret2 >= 0) {
             /* Ignore errors.  This is just providing extra information, it
@@ -2487,7 +2487,7 @@ bdrv_co_common_block_status_above(BlockDriverState *bs,
         return 0;
     }
 
-    ret = bdrv_co_block_status(bs, want_zero, offset, bytes, pnum, map, file);
+    ret = bdrv_do_block_status(bs, want_zero, offset, bytes, pnum, map, file);
     ++*depth;
     if (ret < 0 || *pnum == 0 || ret & BDRV_BLOCK_ALLOCATED || bs == base) {
         return ret;
@@ -2503,7 +2503,7 @@ bdrv_co_common_block_status_above(BlockDriverState *bs,
     for (p = bdrv_filter_or_cow_bs(bs); include_base || p != base;
          p = bdrv_filter_or_cow_bs(p))
     {
-        ret = bdrv_co_block_status(p, want_zero, offset, bytes, pnum, map,
+        ret = bdrv_do_block_status(p, want_zero, offset, bytes, pnum, map,
                                    file);
         ++*depth;
         if (ret < 0) {
-- 
2.39.2


