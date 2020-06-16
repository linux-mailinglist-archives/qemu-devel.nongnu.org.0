Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3731FB4D9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 16:48:08 +0200 (CEST)
Received: from localhost ([::1]:57044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlCsh-0005UJ-27
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 10:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCQD-0002vx-5w; Tue, 16 Jun 2020 10:18:41 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:34189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCQB-0006tb-GX; Tue, 16 Jun 2020 10:18:40 -0400
Received: by mail-oi1-x242.google.com with SMTP id b8so19408308oic.1;
 Tue, 16 Jun 2020 07:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jQlmFbKrxdQ+T3w4qU7PkqGJ75h4OBz177pM/jknP8g=;
 b=hhLjR0SvKu2seQ2QHHoGBlPdVSxDUN5aAodfpDF0lOu2p3XFFyeuRJXV30KxhHlq1w
 mQvuV/fbHwo624vMVpkyOXTYX77Fsv9TEN7LIfgp7w9KiLGAsjTMaRSFsKzjoQhiaFpy
 4iRAV+Iz4vKM3xcq6RGLiR5itOlMVSVS4B4YVoyPU2WKRRTZ+jo6qtOfkddvgT7A3u2Z
 Ju8/NRIe2hkoZW1XZkwehU0gZgHwkzowoYqsZc1u9ZkGuoRpE8KAURutBV3fQxSpxgUC
 bG19fL0edgOy0wOpRpWBsCQ2FhHsUuIT0WmnDpQOAYA90Fb8D1Jj8BXvhXDTMV/EEeGv
 sfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=jQlmFbKrxdQ+T3w4qU7PkqGJ75h4OBz177pM/jknP8g=;
 b=s60FzaKjZ0alcG1ExjAataVXAZGTxO2w4wEyYpjq9aossO0vvoF9HDTOH55gHwMQrp
 NR43lQIKvWRwhgPEu6EmzBAP5wwCVvmdiGoOt/yCXQMtyvpdEVF0cr/x8o2zwmHLlCGS
 SYddlo/rf5kpG81NS5PMwN2rrXws2kvhNhFR0HPVDpDE79IseVjcqIeeekT9vQ/ad/k3
 pEFdag4dk9MWvxghUf9wqtqGyM7ywGpTcsMBhmhMHXs5MaOfCPL7eOxON0YRhN7iMqfV
 K1hrR4EKwZhCPLKtkCxm1KChEXIi4syeydcIA8eRSPYgKSUa9XhRvuhk+l07v7Zw5RVt
 tKBQ==
X-Gm-Message-State: AOAM530EETfDZci5Gz379Eu+hFxfxS+EXwYnbS6yI+NP5l03lzbnTmeh
 3w2KNAB0SYSI9/lq/GTvAJZXEdAd
X-Google-Smtp-Source: ABdhPJyS97v15IR+gzSzQ4gR7KMOL3uYqtPugG8JOqu5OIgEhqJgphyLNsAzcsHHbwGUYWwrENI2sA==
X-Received: by 2002:a54:4504:: with SMTP id l4mr3385032oil.22.1592317117842;
 Tue, 16 Jun 2020 07:18:37 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id i2sm4050612otr.49.2020.06.16.07.18.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jun 2020 07:18:37 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 47/78] qcow2: Fix alloc_cluster_abort() for pre-existing
 clusters
Date: Tue, 16 Jun 2020 09:15:16 -0500
Message-Id: <20200616141547.24664-48-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
References: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=flukshun@gmail.com; helo=mail-oi1-x242.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-stable@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

handle_alloc() reuses preallocated zero clusters.  If anything goes
wrong during the data write, we do not change their L2 entry, so we
must not let qcow2_alloc_cluster_abort() free them.

Fixes: 8b24cd141549b5b264baeddd4e72902cfb5de23b
Cc: qemu-stable@nongnu.org
Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20200225143130.111267-2-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
(cherry picked from commit 3ede935fdbbd5f7b24b4724bbfb8938acb5956d8)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 block/qcow2-cluster.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index dc3c270226..f1a6d42df0 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1015,7 +1015,7 @@ err:
 void qcow2_alloc_cluster_abort(BlockDriverState *bs, QCowL2Meta *m)
 {
     BDRVQcow2State *s = bs->opaque;
-    if (!has_data_file(bs)) {
+    if (!has_data_file(bs) && !m->keep_old_clusters) {
         qcow2_free_clusters(bs, m->alloc_offset,
                             m->nb_clusters << s->cluster_bits,
                             QCOW2_DISCARD_NEVER);
-- 
2.17.1


