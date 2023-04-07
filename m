Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B66996DAFBE
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 17:34:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pko5h-0007k6-S0; Fri, 07 Apr 2023 11:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pko5f-0007jK-Hv
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 11:33:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pko5e-0003sP-6U
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 11:33:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680881605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m/B78WBf6S8LJMMyfkMxgDgfebDyjrCYtAJ8gzCiWac=;
 b=VhBbMrFmfRSWD6P7IxNyRqKYV9eIF/iJrFY24idg3Ujlfy7zT/DX/SVgyv9JenYZ2YN8+P
 ag9zaz8bMCbVSAWzC7kc0NJwsDikI+g0joRLH91AS5GDnNHhESTxpg+HIEMZAvhU50fxON
 TYD3kJmgVAdgYPV46x0OW7rkF5X4iWk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-keFLcLSqPca6OpXVSnHR2A-1; Fri, 07 Apr 2023 11:33:16 -0400
X-MC-Unique: keFLcLSqPca6OpXVSnHR2A-1
Received: by mail-wm1-f70.google.com with SMTP id
 k1-20020a05600c1c8100b003ee6dbceb81so19870657wms.5
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 08:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680881595; x=1683473595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m/B78WBf6S8LJMMyfkMxgDgfebDyjrCYtAJ8gzCiWac=;
 b=5+SWdvcAmAnDDq8MsELtz18jl/7gByidi3RDTSeN/s1hARNzwDsy/SObjz2WnrHmcC
 7h3Ot2glJ0+/7Cj8ObZFssD/HCaHGWB8k5POHA8OVUg/zPMqAyYL9QhEpu0gk+bMPkas
 aHDcztAd5a8vksSpRg25C+GXqwAFr6n88DV9Mv9eCAPB6H6aC1utYTpuKZII+Ki/Hxpt
 EOpInkx+MHbMwumlvqL4COksUGGBUc4xW6gI+R+oL1bxHGMhfifK4dySdf8yA0Sz79b1
 LFhhNhLwVjFMfQk1Y6mTPH3XGTC9Vc6JjVwL7uxEZ7srMMKhmGCSHMWRpwwo4zbJkuO5
 IK2g==
X-Gm-Message-State: AAQBX9cFm4R/nZuYNvAyBzMZWuFgZMVT1/PDqHMXvA2LA+uZ1LCrWaoN
 TEvF/p4c84J/o8WEOr/ulsfdjHKglSJKu19KkakqWBffYj6fwnJGC6+ki7zUxd6Ps/OAzZeEwVl
 6Ie2RboGeinOE0VnZyISwVU+eMencnjcJ6EQs9hw3lAw9WzYjvXOR5H8yY6JALNxdqvWNubnvMU
 A=
X-Received: by 2002:a1c:4c08:0:b0:3ed:33a1:ba8e with SMTP id
 z8-20020a1c4c08000000b003ed33a1ba8emr1982445wmf.1.1680881595215; 
 Fri, 07 Apr 2023 08:33:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZAbRgntLJk5dmSOudJPW0EJQWyIJxN0+mgyP6Jwk2I0Bna4YIJDQHbNYXmE0adru3/iK53nQ==
X-Received: by 2002:a1c:4c08:0:b0:3ed:33a1:ba8e with SMTP id
 z8-20020a1c4c08000000b003ed33a1ba8emr1982425wmf.1.1680881594950; 
 Fri, 07 Apr 2023 08:33:14 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a1c740f000000b003edc11c2ecbsm4982442wmc.4.2023.04.07.08.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 08:33:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, kwolf@redhat.com, qemu-block@nongnu.org,
 hreitz@redhat.com
Subject: [PATCH 5/8] migration/block: replace uses of blk_nb_sectors that do
 not check result
Date: Fri,  7 Apr 2023 17:33:00 +0200
Message-Id: <20230407153303.391121-6-pbonzini@redhat.com>
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

Uses of blk_nb_sectors must check whether the result is negative.
Otherwise, underflow can happen.  Fortunately, alloc_aio_bitmap()
and bmds_aio_inflight() both have an alternative way to retrieve the
number of sectors in the file.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 migration/block.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/migration/block.c b/migration/block.c
index 426a25bb192e..b2497bbd329c 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -195,7 +195,7 @@ static int bmds_aio_inflight(BlkMigDevState *bmds, int64_t sector)
 {
     int64_t chunk = sector / (int64_t)BDRV_SECTORS_PER_DIRTY_CHUNK;
 
-    if (sector < blk_nb_sectors(bmds->blk)) {
+    if (sector < bmds->total_sectors) {
         return !!(bmds->aio_bitmap[chunk / (sizeof(unsigned long) * 8)] &
             (1UL << (chunk % (sizeof(unsigned long) * 8))));
     } else {
@@ -229,10 +229,9 @@ static void bmds_set_aio_inflight(BlkMigDevState *bmds, int64_t sector_num,
 
 static void alloc_aio_bitmap(BlkMigDevState *bmds)
 {
-    BlockBackend *bb = bmds->blk;
     int64_t bitmap_size;
 
-    bitmap_size = blk_nb_sectors(bb) + BDRV_SECTORS_PER_DIRTY_CHUNK * 8 - 1;
+    bitmap_size = bmds->total_sectors + BDRV_SECTORS_PER_DIRTY_CHUNK * 8 - 1;
     bitmap_size /= BDRV_SECTORS_PER_DIRTY_CHUNK * 8;
 
     bmds->aio_bitmap = g_malloc0(bitmap_size);
-- 
2.39.2


