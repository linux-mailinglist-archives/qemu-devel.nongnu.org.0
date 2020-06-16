Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6FC1FB49F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 16:40:58 +0200 (CEST)
Received: from localhost ([::1]:54392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlCll-00078o-8d
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 10:40:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCQA-0002qB-CH; Tue, 16 Jun 2020 10:18:39 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCQ8-0006sF-Vo; Tue, 16 Jun 2020 10:18:38 -0400
Received: by mail-ot1-x342.google.com with SMTP id g5so16042360otg.6;
 Tue, 16 Jun 2020 07:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6gyd3nCeKQ086kzVCuZlMYnZzhczsn56DP6hYciGhgo=;
 b=hkO5oWxvX/CGRFMbv2pRZu1EvLKtf3c3/NNqFzyX/h0t4tSMIJfis7P5s7VO79t4rs
 KLy1sH9KX+Vjr+C0HVUkRbI71MLkbO1ZpriaUWufFDNV9hGkWh1dK7HQctjDmhJym1Hy
 g4XaQA1E6SeEGcxYNHEXnQzFRq98meN9lMGnUvsGuxUUOnq16LoReezYS8EKzMwOqgXi
 OP2zZgZ+aEGde9tPASmKQlz5ENBLdqP26wnIZQ0KFvIgE9cwf7SA7hEMioF9lmJheE8B
 GX2VdOd6k75JWGW146THsTxVaw2XSLK3XoCG7kkfRsSPqq9j8ssbcn2tSqTIJr/GC+QV
 quKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=6gyd3nCeKQ086kzVCuZlMYnZzhczsn56DP6hYciGhgo=;
 b=eaJL9cv7nCEm5BB/zi3o95+hQzLvKb3ypcH27Wf71teHmaZ785l6mbNewYbIi8t1qu
 lcFuFWrS8EOvaNIAyIWQbQDvuju2IimvxzRNcdKCBuLF6/G6oFjtb5tb4+18LD1OhNiS
 yhO9UNLKGKGFZpxNURcEEm3GKKQlKDq2t5GhY2zYDLYE0IBvcpdYJIDxrqAcVACn2aRF
 MXhocs6LcK6CdcM8Af9kgOd0H0GiMJE8VIqRl4fA4QCyuq8g86QGOsKvJCpmQFhecFR2
 unZfmDL/09pCuPSVvGhoRqvx50rXtdJLU0kVlqQDMoXN6e+slNN+NMoiUTErufUyuxU3
 SNZw==
X-Gm-Message-State: AOAM532YyHAEvLQaMHVb29ann8b6jgR9Piss74eL1xu2RWZuwWzCaEy9
 9C8c/ZRdL9lcFGmTD6Ax4EtQeny+
X-Google-Smtp-Source: ABdhPJx0T9yl9C+rM3AY3fudJdnBmazUnhOwYxIv3LijjGARipe/WhCQAT8UgaP1gsOBdUlgsqI7uA==
X-Received: by 2002:a9d:7484:: with SMTP id t4mr2716905otk.110.1592317115344; 
 Tue, 16 Jun 2020 07:18:35 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id m8sm1048005otc.1.2020.06.16.07.18.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jun 2020 07:18:34 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 45/78] qcow2: Fix qcow2_alloc_cluster_abort() for external
 data file
Date: Tue, 16 Jun 2020 09:15:14 -0500
Message-Id: <20200616141547.24664-46-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
References: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=flukshun@gmail.com; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kevin Wolf <kwolf@redhat.com>

For external data file, cluster allocations return an offset in the data
file and are not refcounted. In this case, there is nothing to do for
qcow2_alloc_cluster_abort(). Freeing the same offset in the qcow2 file
is wrong and causes crashes in the better case or image corruption in
the worse case.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20200211094900.17315-3-kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
(cherry picked from commit c3b6658c1a5a3fb24d6c27b2594cf86146f75b22)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 block/qcow2-cluster.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 8982b7b762..dc3c270226 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1015,8 +1015,11 @@ err:
 void qcow2_alloc_cluster_abort(BlockDriverState *bs, QCowL2Meta *m)
 {
     BDRVQcow2State *s = bs->opaque;
-    qcow2_free_clusters(bs, m->alloc_offset, m->nb_clusters << s->cluster_bits,
-                        QCOW2_DISCARD_NEVER);
+    if (!has_data_file(bs)) {
+        qcow2_free_clusters(bs, m->alloc_offset,
+                            m->nb_clusters << s->cluster_bits,
+                            QCOW2_DISCARD_NEVER);
+    }
 }
 
 /*
-- 
2.17.1


