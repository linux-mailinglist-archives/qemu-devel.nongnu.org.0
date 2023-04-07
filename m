Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B956DAFB9
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 17:33:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pko5S-0007b3-AZ; Fri, 07 Apr 2023 11:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pko5R-0007at-4F
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 11:33:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pko5P-0003TX-2V
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 11:33:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680881590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0aEPzaPevddFSsPSDOUvK1Jtpd81nOT9/nMcTZup4zQ=;
 b=jEnCP0UX4gWxYkTOdRlyQzDY6uP3wH3WdP5i6P7SkEVoAo1UDXjVmZU2qOr+IDrm8W47wQ
 GFSv+6WZxCsNH2vZWaKUor8iGYRWJIbFjTACXvfoHmm27MNQ+3TSmkZhfOtCppZGKqJ2nH
 3pfkYRP1iv9zCwufsb45iDPAv7Ijjxw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-OtVdL9zPMga0p06Y48HQAA-1; Fri, 07 Apr 2023 11:33:09 -0400
X-MC-Unique: OtVdL9zPMga0p06Y48HQAA-1
Received: by mail-wm1-f69.google.com with SMTP id
 o1-20020a05600c4fc100b003edecc610abso890164wmq.7
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 08:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680881588; x=1683473588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0aEPzaPevddFSsPSDOUvK1Jtpd81nOT9/nMcTZup4zQ=;
 b=RePDVkMEqN69VOd+kwOCjZFzGL+2mwThRf/oxh4MG5joUmXwfEbPzj5roQ0qSkm1G2
 vQe1/7nW81HtMjc9mwgdp/Jkx0rIQv5f4Kpd6MMINoaiPQ1D0YvknBHEn7byRrDNqxXj
 2Hetno5URvA6AcvhzighUTbWLrWo8178KXp+kP06P7XyRTVzrCfTp0YRQ+bOlijYVu2q
 rcGXYOPyzw34LKWJ9BrzCyzJv+xQPaBxlkfRp+p8Fj+kZW7ofhzBdzegyLkz/ciwVE3X
 RZRQSra1ni7gIGA3PomsTnEzwCht3HDXYwrjYUiCd60S4Yr8YFEKfieb5wgnqWjlThX1
 4LDg==
X-Gm-Message-State: AAQBX9fwAOEAcQw1e8khCe9WHeuQavRbfjg0FWF0NsuUynW3+/v2+Dsc
 xc9U8PUC3HxkTNEMz6OAA9jv/ekAq0V8PaF8wXOm+W809edlOQY1Daly19X46kWA2+9wMM9+hHZ
 1ydUvpKH5kiehUqxGjy2bVDPKM0YrhMv9MDgMCGNqiFP/GoArnSYsE8vidO25FhJuIMliol7yll
 k=
X-Received: by 2002:adf:f1c9:0:b0:2cf:e3d8:5dff with SMTP id
 z9-20020adff1c9000000b002cfe3d85dffmr1177790wro.9.1680881587794; 
 Fri, 07 Apr 2023 08:33:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350aM7mhPPrcXFxWuGz7yQXAQ3k0b4bVdqleRTYu9An/AsXxxNtRMaSnEpIQFVW+LmWnrR00Gbw==
X-Received: by 2002:adf:f1c9:0:b0:2cf:e3d8:5dff with SMTP id
 z9-20020adff1c9000000b002cfe3d85dffmr1177778wro.9.1680881587384; 
 Fri, 07 Apr 2023 08:33:07 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 iz1-20020a05600c554100b003ed51cdb94csm8437106wmb.26.2023.04.07.08.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 08:33:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, kwolf@redhat.com, qemu-block@nongnu.org,
 hreitz@redhat.com
Subject: [PATCH 1/8] block: move has_variable_length to BlockLimits
Date: Fri,  7 Apr 2023 17:32:56 +0200
Message-Id: <20230407153303.391121-2-pbonzini@redhat.com>
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

At the protocol level, has_variable_length only needs to be true in the
very special case of host CD-ROM drives, so that they do not need an
explicit monitor command to read the new size when a disc is loaded
in the tray.

However, at the format level has_variable_length has to be true for all
raw blockdevs and for all filters, even though in practice the length
depends on the underlying file and thus will not change except in the
case of host CD-ROM drives.

As a first step towards computing an accurate value of has_variable_length,
add the value into the BlockLimits structure and initialize the field
from the BlockDriver.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block.c                          | 2 +-
 block/io.c                       | 6 ++++++
 include/block/block_int-common.h | 8 ++++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 89a79c321fab..b1b7c7efe036 100644
--- a/block.c
+++ b/block.c
@@ -5849,7 +5849,7 @@ int64_t coroutine_fn bdrv_co_nb_sectors(BlockDriverState *bs)
     if (!drv)
         return -ENOMEDIUM;
 
-    if (drv->has_variable_length) {
+    if (bs->bl.has_variable_length) {
         int ret = bdrv_co_refresh_total_sectors(bs, bs->total_sectors);
         if (ret < 0) {
             return ret;
diff --git a/block/io.c b/block/io.c
index db438c765757..c49917c74677 100644
--- a/block/io.c
+++ b/block/io.c
@@ -182,6 +182,8 @@ void bdrv_refresh_limits(BlockDriverState *bs, Transaction *tran, Error **errp)
                                 drv->bdrv_aio_preadv ||
                                 drv->bdrv_co_preadv_part) ? 1 : 512;
 
+    bs->bl.has_variable_length = drv->has_variable_length;
+
     /* Take some limits from the children as a default */
     have_limits = false;
     QLIST_FOREACH(c, &bs->children, next) {
@@ -190,6 +192,10 @@ void bdrv_refresh_limits(BlockDriverState *bs, Transaction *tran, Error **errp)
             bdrv_merge_limits(&bs->bl, &c->bs->bl);
             have_limits = true;
         }
+
+        if (c->role & BDRV_CHILD_FILTERED) {
+            bs->bl.has_variable_length |= c->bs->bl.has_variable_length;
+        }
     }
 
     if (!have_limits) {
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index ce51c1f7f999..95c934589571 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -855,6 +855,14 @@ typedef struct BlockLimits {
 
     /* maximum number of iovec elements */
     int max_iov;
+
+    /*
+     * true if the length of the underlying file can change, and QEMU
+     * is expected to adjust automatically.  Mostly for CD-ROM drives,
+     * whose length is zero when the tray is empty (they don't need
+     * an explicit monitor command to load the disk inside the guest).
+     */
+    bool has_variable_length;
 } BlockLimits;
 
 typedef struct BdrvOpBlocker BdrvOpBlocker;
-- 
2.39.2


