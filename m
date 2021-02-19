Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522D331FD0E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 17:23:40 +0100 (CET)
Received: from localhost ([::1]:42950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD8Z9-0004kr-BY
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 11:23:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nirsof@gmail.com>)
 id 1lD8K7-0007RN-KI; Fri, 19 Feb 2021 11:08:07 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:46506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nirsof@gmail.com>)
 id 1lD8K1-0004Hm-FI; Fri, 19 Feb 2021 11:08:07 -0500
Received: by mail-ed1-x52f.google.com with SMTP id v22so10755107edx.13;
 Fri, 19 Feb 2021 08:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fyt+CBqBxQoPWXG1Aq4FUCSxDW9F55kFppO9VvGybUw=;
 b=rFlHzm4jq1LyCR4PiLkLfp9nQJ8aHpLGAgGepmdHnoxDs9FSIAgpI/f4M2PSE3BAeL
 Mn604U6g0I2XB4e7oy2FTJfavmBu3GH9zaP9o8ho8YeDew66YrjYOnqWZVo6P6OBxrqc
 aulTqZckLzQOWz51iPRmbzuioLOPrMxX6ubIb9X7jxXV0/SW1YXQjN3kK9UH2tJb4/IL
 G46TKZSHmTeMQNJnep0hqdtO3YJMIV39kHToV1QKcslhxO+xg8vVuWBPzIE+ontTAEHl
 ybZUSTknw6l3cktZPSh/RRg+W2STHtMJROKlmo97TyuZbWBIUgaB8QXH3BVwyeXkmrxn
 q+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fyt+CBqBxQoPWXG1Aq4FUCSxDW9F55kFppO9VvGybUw=;
 b=BDeKN7onNiPK3K9FNo1Z1RdQdRtuzLX0y3sle0Cw7v0LUouM5+IoHaCUYKOx1uLb4V
 xjJv3o61zfd0LoqYdQp/z5F+WK3JirnkZRnG0Oc5TUiSfk2O1rRl3jb5mweZDUvE7b6u
 nYY+s+r5MHD5WsfaEBBkDwSyyxF5dHp84uf4xlA68aRhUcSujLfL/+yDtldG88zau5lb
 x2dPeOQyT0wdGGngJrF8xqbaBPyv5cvDeByETLCfajkq5Z9PwxMSsHn+gd0eiC0vxVs1
 RlRDa75V9OzsKd1A6dEFdrdXZMU1DiSZCdI1ApSxWFOTPw5ACZ5gQDyKvh4TUOWzIZIX
 KQLw==
X-Gm-Message-State: AOAM530Zb8KTI/4gpwWRsjyq9sk51a0lhGBWrDixJUcGuQGze2HayF/Z
 uMpkZFZN7BHWohxAZBSm6zhc42sX/q2+YA==
X-Google-Smtp-Source: ABdhPJycc2H9IcqX623KxBngBQW+4X24TN9ZTSfRrVHudY+rTyw7JTig14Na1pR1UvcIC9rFGXWh9Q==
X-Received: by 2002:a05:6402:1c0a:: with SMTP id
 ck10mr2104899edb.318.1613750878614; 
 Fri, 19 Feb 2021 08:07:58 -0800 (PST)
Received: from localhost.localdomain ([147.161.14.87])
 by smtp.gmail.com with ESMTPSA id t13sm2965141edr.17.2021.02.19.08.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 08:07:57 -0800 (PST)
From: Nir Soffer <nirsof@gmail.com>
X-Google-Original-From: Nir Soffer <nsoffer@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] nbd: server: Report holes for raw images
Date: Fri, 19 Feb 2021 18:07:52 +0200
Message-Id: <20210219160752.1826830-1-nsoffer@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=nirsof@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Nir Soffer <nsoffer@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When querying image extents for raw image, qemu-nbd reports holes as
zero:

$ qemu-nbd -t -r -f raw empty-6g.raw

$ qemu-img map --output json nbd://localhost
[{ "start": 0, "length": 6442450944, "depth": 0, "zero": true, "data": true, "offset": 0}]

$ qemu-img map --output json empty-6g.raw
[{ "start": 0, "length": 6442450944, "depth": 0, "zero": true, "data": false, "offset": 0}]

Turns out that qemu-img map reports a hole based on BDRV_BLOCK_DATA, but
nbd server reports a hole based on BDRV_BLOCK_ALLOCATED.

The NBD protocol says:

    NBD_STATE_HOLE (bit 0): if set, the block represents a hole (and
    future writes to that area may cause fragmentation or encounter an
    NBD_ENOSPC error); if clear, the block is allocated or the server
    could not otherwise determine its status.

qemu-img manual says:

    whether the sectors contain actual data or not (boolean field data;
    if false, the sectors are either unallocated or stored as
    optimized all-zero clusters);

To me, data=false looks compatible with NBD_STATE_HOLE. From user point
of view, getting same results from qemu-nbd and qemu-img is more
important than being more correct about allocation status.

Changing nbd server to report holes using BDRV_BLOCK_DATA makes qemu-nbd
results compatible with qemu-img map:

$ qemu-img map --output json nbd://localhost
[{ "start": 0, "length": 6442450944, "depth": 0, "zero": true, "data": false, "offset": 0}]

Signed-off-by: Nir Soffer <nsoffer@redhat.com>
---
 nbd/server.c               | 4 ++--
 tests/qemu-iotests/241.out | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 7229f487d2..86a44a9b41 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2087,8 +2087,8 @@ static int blockstatus_to_extents(BlockDriverState *bs, uint64_t offset,
             return ret;
         }
 
-        flags = (ret & BDRV_BLOCK_ALLOCATED ? 0 : NBD_STATE_HOLE) |
-                (ret & BDRV_BLOCK_ZERO      ? NBD_STATE_ZERO : 0);
+        flags = (ret & BDRV_BLOCK_DATA ? 0 : NBD_STATE_HOLE) |
+                (ret & BDRV_BLOCK_ZERO ? NBD_STATE_ZERO : 0);
 
         if (nbd_extent_array_add(ea, num, flags) < 0) {
             return 0;
diff --git a/tests/qemu-iotests/241.out b/tests/qemu-iotests/241.out
index 75f9f465e5..3f8c173cc8 100644
--- a/tests/qemu-iotests/241.out
+++ b/tests/qemu-iotests/241.out
@@ -5,7 +5,7 @@ QA output created by 241
   size:  1024
   min block: 1
 [{ "start": 0, "length": 1000, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 1000, "length": 24, "depth": 0, "zero": true, "data": true, "offset": OFFSET}]
+{ "start": 1000, "length": 24, "depth": 0, "zero": true, "data": false, "offset": OFFSET}]
 1 KiB (0x400) bytes     allocated at offset 0 bytes (0x0)
 
 === Exporting unaligned raw image, forced server sector alignment ===
@@ -23,6 +23,6 @@ WARNING: Image format was not specified for 'TEST_DIR/t.raw' and probing guessed
   size:  1024
   min block: 1
 [{ "start": 0, "length": 1000, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 1000, "length": 24, "depth": 0, "zero": true, "data": true, "offset": OFFSET}]
+{ "start": 1000, "length": 24, "depth": 0, "zero": true, "data": false, "offset": OFFSET}]
 1 KiB (0x400) bytes     allocated at offset 0 bytes (0x0)
 *** done
-- 
2.26.2


