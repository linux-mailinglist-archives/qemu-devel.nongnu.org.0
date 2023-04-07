Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984BF6DAFBF
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 17:34:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pko5e-0007ib-HV; Fri, 07 Apr 2023 11:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pko5c-0007hT-6u
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 11:33:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pko5Z-0003oN-Qa
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 11:33:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680881601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dLCvIxboMWYDOjV9oBM41OkmrCZ9mwtLw9wyeDaVzcs=;
 b=BTCFZYFrBqz/LICnAsoa4P8qOFkVv5DAJLzUBX/1mByj3tGahQncTvN7rq/sj98JKBKbGE
 B62on3S/ZeNprbcxwQvQ3VE/k1ihllRMPT+8xzgISZ8zxBxQ0xLk7SZvZH5Z4mcotwaEmR
 Gc63bY0ubIrgFrPoYC+neyaZqmIx8Og=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-cFT-Jx39NRWqRWmY-vPabg-1; Fri, 07 Apr 2023 11:33:19 -0400
X-MC-Unique: cFT-Jx39NRWqRWmY-vPabg-1
Received: by mail-wm1-f71.google.com with SMTP id
 m7-20020a05600c4f4700b003ee7e120bdfso19252473wmq.6
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 08:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680881598; x=1683473598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dLCvIxboMWYDOjV9oBM41OkmrCZ9mwtLw9wyeDaVzcs=;
 b=GniVe42qikJlWYOh8TwriilTYlrFFnjMfQ7jlqW4cNQ/7FhWtcIh+FK3KSbvRMxFyq
 DLGktkPRbZdCxFfDBhgOTQD3h28Hk9e07Jx1M3oEopBy1CWhuWI/oJ7Px3re3H+57Rtt
 c6Rv2w0oqCa2/wwFwsldd4BKug384RJbqfI06k7UGsY5grKkhb+bD55SMNnNtACbwXZP
 uDF6711vbKUmwcGwn9a1hQUf17MKnME8UnjoRr3DiKSOFRqImaIu4RWZshA5v4zhO9IG
 IKtZ4EqiGkMjrElwr0sumPXsEThnhFVW91YqeOpP/2PzQ4zZtDDRQ59YpFpY35yNXWPt
 y5ug==
X-Gm-Message-State: AAQBX9dIGUbZ4IIsdHuqKcMU44j4BHTVSdTIwmstmqzQBLm8+DvBPVpz
 nrcptGArYp+AXZqysg71GeLM8aourlbUij111blavRWs563mOSc3ugcWO8C+x3L71IOIJcigu4m
 JBJtRXtOoO7wWnj5RHDi+1i9TDAwBv9w9jFKL9AN3a7QyK/vp9vaWtXYwlV2XqECMsnryndbiLw
 w=
X-Received: by 2002:a1c:6a06:0:b0:3ed:ff92:dd2a with SMTP id
 f6-20020a1c6a06000000b003edff92dd2amr1574221wmc.12.1680881598342; 
 Fri, 07 Apr 2023 08:33:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350a64ZRFCDb3zSLp4jnLJwj2gtdj1dbz/UH2gWbDPRQDg19MXrRu/2ajMVy3qoOgq8NIVv4hSw==
X-Received: by 2002:a1c:6a06:0:b0:3ed:ff92:dd2a with SMTP id
 f6-20020a1c6a06000000b003edff92dd2amr1574206wmc.12.1680881598093; 
 Fri, 07 Apr 2023 08:33:18 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a05600c154800b003f034c76e85sm8948337wmg.38.2023.04.07.08.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 08:33:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, kwolf@redhat.com, qemu-block@nongnu.org,
 hreitz@redhat.com
Subject: [PATCH 7/8] block-backend: ignore inserted state in blk_co_nb_sectors
Date: Fri,  7 Apr 2023 17:33:02 +0200
Message-Id: <20230407153303.391121-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230407153303.391121-1-pbonzini@redhat.com>
References: <20230407153303.391121-1-pbonzini@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

All callers of blk_co_nb_sectors (and blk_nb_sectors) are able to
handle a non-inserted CD-ROM as a zero-length file, they do not need
to raise an error.

Not using blk_co_is_available() aligns the function with
blk_co_get_geometry(), which becomes a simple wrapper for
blk_co_nb_sectors().  It will also make it possible to skip the creation
of a coroutine in the (common) case where bs->bl.has_variable_length
is false.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/block-backend.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index f159cc51d264..d08e949799ee 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1627,9 +1627,7 @@ int64_t coroutine_fn blk_co_getlength(BlockBackend *blk)
     return bdrv_co_getlength(blk_bs(blk));
 }
 
-/* return 0 as number of sectors if no device present or error */
-void coroutine_fn blk_co_get_geometry(BlockBackend *blk,
-                                      uint64_t *nb_sectors_ptr)
+int64_t coroutine_fn blk_co_nb_sectors(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
 
@@ -1637,23 +1635,18 @@ void coroutine_fn blk_co_get_geometry(BlockBackend *blk,
     GRAPH_RDLOCK_GUARD();
 
     if (!bs) {
-        *nb_sectors_ptr = 0;
+        return -ENOMEDIUM;
     } else {
-        int64_t nb_sectors = bdrv_co_nb_sectors(bs);
-        *nb_sectors_ptr = nb_sectors < 0 ? 0 : nb_sectors;
+        return bdrv_co_nb_sectors(bs);
     }
 }
 
-int64_t coroutine_fn blk_co_nb_sectors(BlockBackend *blk)
+/* return 0 as number of sectors if no device present or error */
+void coroutine_fn blk_co_get_geometry(BlockBackend *blk,
+                                      uint64_t *nb_sectors_ptr)
 {
-    IO_CODE();
-    GRAPH_RDLOCK_GUARD();
-
-    if (!blk_co_is_available(blk)) {
-        return -ENOMEDIUM;
-    }
-
-    return bdrv_co_nb_sectors(blk_bs(blk));
+    int64_t ret = blk_co_nb_sectors(blk);
+    *nb_sectors_ptr = ret < 0 ? 0 : ret;
 }
 
 BlockAIOCB *blk_aio_preadv(BlockBackend *blk, int64_t offset,
-- 
2.39.2


