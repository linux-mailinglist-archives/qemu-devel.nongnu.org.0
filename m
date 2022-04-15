Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19217502AEC
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:28:13 +0200 (CEST)
Received: from localhost ([::1]:53950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfLzg-0004OR-7Z
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLrS-0006Xc-0f; Fri, 15 Apr 2022 09:19:42 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:36550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLrN-0007qJ-OW; Fri, 15 Apr 2022 09:19:40 -0400
Received: by mail-ej1-x633.google.com with SMTP id k23so15364627ejd.3;
 Fri, 15 Apr 2022 06:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M0td3BIo8+I/vX9T6ItFSnDKy+nzpzS9t1PxQm6FyM8=;
 b=UrgTacxAwdMBaklaRWG6oXfXFpOCeDG71lESHgd3Pv2Mu7F1z1z5zzw8/IrkhdtkKh
 ScDGI9aSV25zwpGKVUj2nrH58VE1u87e0gGzKj3+KS7u+vH3ogoMG/bdowjog/znbz8m
 ntE7GfOF8Tk8z5p4isl5VemoFVfZOwEFZHoBJX+A2ClgKo0yif9TzN9HvcVDBpt10FGg
 QaioWC/MBoxuXtRBu6+FAObjIf6zP+mvvJ1eL3kCf1f3iG/dlfxdWzZuNuRaWUtWnFAO
 cO10sRYWW+WB2wtm1ALjeFq8w3L0d+AdVe0Wx+6ZRsYuCd8oY7PmDIR9piMyabJABrO2
 ecpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=M0td3BIo8+I/vX9T6ItFSnDKy+nzpzS9t1PxQm6FyM8=;
 b=EP+FmldwuGWB42bf79PlsvGRlCe5cP31lv2ISQgETyv89zJzo18qQBYarrLGb+mLN9
 Rqkiu8NCLbXsLIrenmfV03TyNNnlQOoL3sfVcHTb4aI2f1H9hwe6Fz3JQRNUY5tTaqAP
 eTvX/+74jy0DRkhU+bfGZhjFbhPMOwFjxCmZQyKCwpPKrUIt3ULQtqLx/oX0Hh8oBBz6
 oREeP0puxhDvGUz+i5r3jms+aXzXLfVonHJIAkvLepJHew4EHE0dtlZEHdrgXIda2yQv
 ArRBPf0z8Sm2SP8wovNiavpH2SoZuZ2asyWepRLOA8FeWnJES3uucgNqwPaciJ42GR4v
 H5Fg==
X-Gm-Message-State: AOAM532WGJuBypnY2x9/LnmL8155ZP4+kyRWEod6aeiulO9iqIAv83cQ
 5fIe3OoHUywDCYLU3d2azesW/YXUc2psfw==
X-Google-Smtp-Source: ABdhPJxRmzelbnm3buYQbzRxGPbbrohBsr8NV3oQDcnTL7I46jbn/uUCXDyCLR3fk/tqozlqQeNDOg==
X-Received: by 2002:a17:906:9c82:b0:6e1:2c94:1616 with SMTP id
 fj2-20020a1709069c8200b006e12c941616mr6260461ejc.64.1650028770886; 
 Fri, 15 Apr 2022 06:19:30 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:19:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/26] blkdebug: add missing coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:18:39 +0200
Message-Id: <20220415131900.793161-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415131900.793161-1-pbonzini@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: malureau@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 stefanha@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/blkdebug.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index bbf2948703..a93ba61487 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -587,8 +587,8 @@ out:
     return ret;
 }
 
-static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                      BlkdebugIOType iotype)
+static int coroutine_fn rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
+                                   BlkdebugIOType iotype)
 {
     BDRVBlkdebugState *s = bs->opaque;
     BlkdebugRule *rule = NULL;
@@ -672,7 +672,7 @@ blkdebug_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
     return bdrv_co_pwritev(bs->file, offset, bytes, qiov, flags);
 }
 
-static int blkdebug_co_flush(BlockDriverState *bs)
+static int coroutine_fn blkdebug_co_flush(BlockDriverState *bs)
 {
     int err = rule_check(bs, 0, 0, BLKDEBUG_IO_TYPE_FLUSH);
 
@@ -791,7 +791,7 @@ static void blkdebug_close(BlockDriverState *bs)
 }
 
 /* Called with lock held.  */
-static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
+static void coroutine_fn suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
 {
     BDRVBlkdebugState *s = bs->opaque;
     BlkdebugSuspendedReq *r;
@@ -810,8 +810,8 @@ static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
 }
 
 /* Called with lock held.  */
-static void process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
-                         int *action_count, int *new_state)
+static void coroutine_fn process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
+                                      int *action_count, int *new_state)
 {
     BDRVBlkdebugState *s = bs->opaque;
 
@@ -840,7 +840,7 @@ static void process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
     }
 }
 
-static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
+static void coroutine_fn blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
 {
     BDRVBlkdebugState *s = bs->opaque;
     struct BlkdebugRule *rule, *next;
-- 
2.35.1



