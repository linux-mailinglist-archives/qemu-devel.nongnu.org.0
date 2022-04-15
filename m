Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA38502AFB
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:34:01 +0200 (CEST)
Received: from localhost ([::1]:36742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfM5I-0003VD-5G
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLsP-0007Ik-45; Fri, 15 Apr 2022 09:20:44 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:40544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLsM-0008Td-C9; Fri, 15 Apr 2022 09:20:40 -0400
Received: by mail-ed1-x52b.google.com with SMTP id v4so9899717edl.7;
 Fri, 15 Apr 2022 06:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WqtILOyZNJAH6lSpTMECSN6V7UXBlL2LcrOyrAYW4Co=;
 b=qTl/X5FIF3+gJaoVATSI1Diq4+HYQbfQLVdn7uWQ3M4rg5Au6v+U7uBui+EKHMfB9x
 NeRteEgndg9rtlRP7cG8Penez1/2rRhlBs1ZvvaELtICITd/zli/M7WHvOB5nouPxUu6
 DyEmahp/aTauNkaxFuPVBxV9bn8B53XHBZV4k3XAohvduRkNGNtq4tjJYnlCj2FBpMpO
 zHe7oVxQcrqizH/7x/dVLdiqxaK5p723qVGS1O45VeWC4EBItLfk2djYU2gW42BBzbjQ
 wXC/hLTxID40lQXAzo1z9GvLolAzipa4czdpt5W+SNbsGwqtZskNtstlBouwHSR6LvjL
 NK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WqtILOyZNJAH6lSpTMECSN6V7UXBlL2LcrOyrAYW4Co=;
 b=Ky8AeKtqzFAJ8vRYcq9ji3UKHq5IHY37QVaVEj+reJ2Wi+hkfYS3k4a30ycwTZ71TQ
 wNSK9DTG6Ft9mr97RvmRFH2Ym8KguIyh1PwYhE+E9uD5QJzL+WdWH12yAuk10DpvRkk4
 lzVhZf0UgNWhCzk3v6Mr+2M+yQBhwi6hJRSCRYV6dUD8QkM/fo2UcXr9ElcOvvfIvVIJ
 zvkADkPmsisE6tLbT9D3luJUes07bLzH70CEHwLh4WNSOjTrUjSkxXYqNdBfQ39WC/Nl
 zALjpklZtosKdolC/oc7X4gQmT2fBJqfaRt2P9bmRt35/TxtWbn0/BsjzKn8cg1HTKys
 FA3Q==
X-Gm-Message-State: AOAM532WikvAALualfMioQKICcHKs0mwaJ0KFx6VAsAcRKHxNUIduDNk
 D7G7UacOdqudDlbamecNvWQ10OnR+15wkw==
X-Google-Smtp-Source: ABdhPJyeM5Q7buk/hKAPjUQ16dKrm9VF1TA9h+wGPebZYe81KnSSQFfiqnKsLYgcHVnuS84g3LqtZA==
X-Received: by 2002:a05:6402:1909:b0:418:d876:3119 with SMTP id
 e9-20020a056402190900b00418d8763119mr8455403edz.266.1650028836161; 
 Fri, 15 Apr 2022 06:20:36 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:20:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/26] quorum: add missing coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:18:52 +0200
Message-Id: <20220415131900.793161-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415131900.793161-1-pbonzini@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
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
 block/quorum.c | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/block/quorum.c b/block/quorum.c
index f33f30d36b..5ff69d7443 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -161,11 +161,10 @@ static bool quorum_64bits_compare(QuorumVoteValue *a, QuorumVoteValue *b)
     return a->l == b->l;
 }
 
-static QuorumAIOCB *quorum_aio_get(BlockDriverState *bs,
-                                   QEMUIOVector *qiov,
-                                   uint64_t offset,
-                                   uint64_t bytes,
-                                   int flags)
+static QuorumAIOCB *coroutine_fn quorum_aio_get(BlockDriverState *bs,
+                                                QEMUIOVector *qiov,
+                                                uint64_t offset, uint64_t bytes,
+                                                int flags)
 {
     BDRVQuorumState *s = bs->opaque;
     QuorumAIOCB *acb = g_new(QuorumAIOCB, 1);
@@ -273,7 +272,7 @@ static void quorum_report_bad_versions(BDRVQuorumState *s,
     }
 }
 
-static void quorum_rewrite_entry(void *opaque)
+static void coroutine_fn quorum_rewrite_entry(void *opaque)
 {
     QuorumCo *co = opaque;
     QuorumAIOCB *acb = co->acb;
@@ -574,7 +573,7 @@ free_exit:
     quorum_free_vote_list(&acb->votes);
 }
 
-static void read_quorum_children_entry(void *opaque)
+static void coroutine_fn read_quorum_children_entry(void *opaque)
 {
     QuorumCo *co = opaque;
     QuorumAIOCB *acb = co->acb;
@@ -602,7 +601,7 @@ static void read_quorum_children_entry(void *opaque)
     }
 }
 
-static int read_quorum_children(QuorumAIOCB *acb)
+static int coroutine_fn read_quorum_children(QuorumAIOCB *acb)
 {
     BDRVQuorumState *s = acb->bs->opaque;
     int i;
@@ -643,7 +642,7 @@ static int read_quorum_children(QuorumAIOCB *acb)
     return acb->vote_ret;
 }
 
-static int read_fifo_child(QuorumAIOCB *acb)
+static int coroutine_fn read_fifo_child(QuorumAIOCB *acb)
 {
     BDRVQuorumState *s = acb->bs->opaque;
     int n, ret;
@@ -664,8 +663,9 @@ static int read_fifo_child(QuorumAIOCB *acb)
     return ret;
 }
 
-static int quorum_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
-                            QEMUIOVector *qiov, BdrvRequestFlags flags)
+static int coroutine_fn quorum_co_preadv(BlockDriverState *bs,
+                                         int64_t offset, int64_t bytes,
+                                         QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVQuorumState *s = bs->opaque;
     QuorumAIOCB *acb = quorum_aio_get(bs, qiov, offset, bytes, flags);
@@ -684,7 +684,7 @@ static int quorum_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
     return ret;
 }
 
-static void write_quorum_entry(void *opaque)
+static void coroutine_fn write_quorum_entry(void *opaque)
 {
     QuorumCo *co = opaque;
     QuorumAIOCB *acb = co->acb;
@@ -715,9 +715,9 @@ static void write_quorum_entry(void *opaque)
     }
 }
 
-static int quorum_co_pwritev(BlockDriverState *bs, int64_t offset,
-                             int64_t bytes, QEMUIOVector *qiov,
-                             BdrvRequestFlags flags)
+static int coroutine_fn quorum_co_pwritev(BlockDriverState *bs, int64_t offset,
+                                          int64_t bytes, QEMUIOVector *qiov,
+                                          BdrvRequestFlags flags)
 {
     BDRVQuorumState *s = bs->opaque;
     QuorumAIOCB *acb = quorum_aio_get(bs, qiov, offset, bytes, flags);
@@ -746,8 +746,9 @@ static int quorum_co_pwritev(BlockDriverState *bs, int64_t offset,
     return ret;
 }
 
-static int quorum_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
-                                   int64_t bytes, BdrvRequestFlags flags)
+static int coroutine_fn quorum_co_pwrite_zeroes(BlockDriverState *bs,
+                                                int64_t offset, int64_t bytes,
+                                                BdrvRequestFlags flags)
 
 {
     return quorum_co_pwritev(bs, offset, bytes, NULL,
-- 
2.35.1



