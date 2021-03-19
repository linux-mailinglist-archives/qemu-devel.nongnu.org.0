Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDE1341E88
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:40:34 +0100 (CET)
Received: from localhost ([::1]:42608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFMf-0001k5-G6
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lNF9E-0001KV-AR
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:26:40 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:43710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lNF9B-0004E3-FE
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:26:40 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 u5-20020a7bcb050000b029010e9316b9d5so5239476wmj.2
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 06:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z2u3q3r6w6+qN78egFiLHd6jOUJq1Ybg2sCdGyDUnAM=;
 b=jQO5AkXBiHKNB+Am/VXnapVwjYC2AMFUqmbnPoYi7GlrLBKtHCc3dA1Yns9zDBt7XK
 CBUsn5ZEpM9wbqy6HDH35PZHbvmqxTGKHYLX9j+hINcs+APhhDpJoMGh2d2JHpGKsaKS
 nLNK5X1mjsNYqrQvubTRKRITaL0YNTHf9BNzBWsqKfo7d7xqfhPhy9mcxQCoxOaLA+YI
 gRYbjLHvyOhg0fCwrI07HHcBaAwKTRfBBwDqo6s3v2Ey8WqE+61Ia/g3jNzY+nWA+zwd
 71EEjOjGJ6gCLj/NhW3RI5RwF3gipDed6kg6GAaKuHKFWLWY+X1xX+JfeseWDQ0Tq2Lt
 CCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z2u3q3r6w6+qN78egFiLHd6jOUJq1Ybg2sCdGyDUnAM=;
 b=bD66HMjigX26HMtvquN4K0Kx77GIB3V6JZSRanp7AhFNf5vJiIVUh3xw3SJr53tjID
 R34dOAwiBpGc+w6fom1PaRy8PMmnZ2Utll+F6zlUJKG/tlJOp7cSJrt1brwZdIS4sNGG
 XM+044nvtVKcPP/PUxML4lb5E662xsdcBHTraJBMGjvMFR3uIPhokck7k39ST10PTDkx
 wJm0gSgvqvrYpJZ8p38q/IJ24J9xntsSG8s8iwLQZhLbsC/S7KiXNSekYHTtpoNEqCjx
 ing4LM3HMJLh5dWBIkxVr1IxAXg4/9cDMxLqLoERHmt+vQUvlTdq0h/1usqk4Ykr5L5B
 JR9Q==
X-Gm-Message-State: AOAM531pNBfuIGNhp8tM4r5Vrfw7dQmP646azMgcX5WxsDCgho8qoE5x
 9YlUtNzeVrMP1A/MIxje97IFwcCkAAE=
X-Google-Smtp-Source: ABdhPJxj7rOYhwZjq6QDiEtVp+fXMUMqw1ejkJHJJjgBzFUBHZNqSf3jlPZc4U+Cl395dkl+GZFbtQ==
X-Received: by 2002:a1c:b4c6:: with SMTP id d189mr3718417wmf.72.1616160395842; 
 Fri, 19 Mar 2021 06:26:35 -0700 (PDT)
Received: from localhost.localdomain ([102.47.92.134])
 by smtp.googlemail.com with ESMTPSA id v13sm8889584wrt.45.2021.03.19.06.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 06:26:35 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/8] virtiofsd/fuse_virtio.c: Changed allocations of locals to
 GLib
Date: Fri, 19 Mar 2021 15:25:27 +0200
Message-Id: <20210319132527.3118-9-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319132527.3118-1-ma.mandourr@gmail.com>
References: <20210319132527.3118-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32f.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaced the allocation of local variables from malloc() to
GLib allocation functions.

In one instance, dropped the usage to an assert after a malloc()
call and used g_malloc() instead.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 tools/virtiofsd/fuse_virtio.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 5828b9a76f..587403b026 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -472,8 +472,7 @@ static void fv_queue_worker(gpointer data, gpointer user_data)
      * They're spread over multiple descriptors in a scatter/gather set
      * and we can't trust the guest to keep them still; so copy in/out.
      */
-    fbuf.mem = malloc(se->bufsize);
-    assert(fbuf.mem);
+    fbuf.mem = g_malloc(se->bufsize);
 
     fuse_mutex_init(&req->ch.lock);
     req->ch.fd = -1;
@@ -524,7 +523,7 @@ static void fv_queue_worker(gpointer data, gpointer user_data)
         fbuf.size = out_sg[0].iov_len + out_sg[1].iov_len;
 
         /* Allocate the bufv, with space for the rest of the iov */
-        pbufv = malloc(sizeof(struct fuse_bufvec) +
+        pbufv = g_try_malloc(sizeof(struct fuse_bufvec) +
                        sizeof(struct fuse_buf) * (out_num - 2));
         if (!pbufv) {
             fuse_log(FUSE_LOG_ERR, "%s: pbufv malloc failed\n",
@@ -569,7 +568,7 @@ static void fv_queue_worker(gpointer data, gpointer user_data)
 
 out:
     if (allocated_bufv) {
-        free(pbufv);
+        g_free(pbufv);
     }
 
     /* If the request has no reply, still recycle the virtqueue element */
@@ -588,7 +587,7 @@ out:
     }
 
     pthread_mutex_destroy(&req->ch.lock);
-    free(fbuf.mem);
+    g_free(fbuf.mem);
     free(req);
 }
 
-- 
2.25.1


