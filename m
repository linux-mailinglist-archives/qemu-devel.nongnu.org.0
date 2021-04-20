Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBCB365CAE
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 17:53:49 +0200 (CEST)
Received: from localhost ([::1]:45694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYshA-0006oA-KB
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 11:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lYsbN-0001m8-2S
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:47:50 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:38841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lYsbK-0003QT-3l
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:47:48 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 d200-20020a1c1dd10000b02901384767d4a5so4359683wmd.3
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fg7014VWMzQTkIEvl7LENz5/48AAvautKhUCOqhNxxQ=;
 b=c+UJd+1qsSDp1lVZOwZ3dvdRxzZzclTMtzWLcepJqC/y+8t4QyiSflvFGgfTMa7X0/
 20kysU49505eCIwz2NenfzUGztxACJ+SmLcKbQWd/y/8g2JvIxl7T6itzFa4oB+7O9Vy
 ksfkHCqjef7FGVHQcilKh5xT4nLE4duANApD5VRGqZqehoUdqICv1zr9kzzT1Foun4VX
 pY4plgcZNaCwEaXiMyAfRX1sBQhUKKZn4FJzRxpT90wlj7T6ZEyF/Fo8Ad5w+FANjD2c
 lLBIF7ZKoWgnNhiXe9iWgFqsk9Rucosvz4UlPUvny5wBf+IMHxGbSig5ICXZ0t+WN/n2
 Yuew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fg7014VWMzQTkIEvl7LENz5/48AAvautKhUCOqhNxxQ=;
 b=APN+J0V3YHAS6rJYztctZZKfuNL6jH+BrGO2p3i6LVDR1YHIlFfYdXzKDLM4D1vSog
 f2AcImO8yyZqTp16WQQwyT+xk2ZCE5S2EKW2Lb+ZJwh8OVAuFcRBBhCbCdIk5iPi5nUw
 QWPj5PVnOW7NMxPDFj7Dw6zglo5rmpumdpzH7ZkXFBhF9c8AJJkqx7G+eh9bxuKfiu1X
 Vv2DAaKZ5O4mZpEatJpDMlc0s3+zncyQyouhk/Chth4vuMN15lo+fGWbriQMuQOkBlkC
 Yz5bqgcK/ZJOvjiXCAFe9BPdRnD441eA19oUII6XvQuYxDV9482yAlD+UEeWTo2tc2uA
 oCQw==
X-Gm-Message-State: AOAM53204/C19nfW3zkPQiqqd2YreCjwgpvkTJVjKN5NHZvWDnrN7Vl2
 OlPf9wrtDi1wokID4226MTk4PShrmNI=
X-Google-Smtp-Source: ABdhPJxbUIwdPxIK4rjL7cwKKHrobRzaxfoEOC7jk1eXdv3AaV2K42vaygeeRj1uwAdQsRhi6eI92g==
X-Received: by 2002:a1c:c918:: with SMTP id f24mr5265541wmb.12.1618933661446; 
 Tue, 20 Apr 2021 08:47:41 -0700 (PDT)
Received: from localhost.localdomain ([197.61.162.183])
 by smtp.googlemail.com with ESMTPSA id d5sm25025824wrx.15.2021.04.20.08.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 08:47:41 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/7] virtiofsd/fuse_virtio.c: Changed allocations of locals
 to GLib
Date: Tue, 20 Apr 2021 17:46:42 +0200
Message-Id: <20210420154643.58439-8-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420154643.58439-1-ma.mandourr@gmail.com>
References: <20210420154643.58439-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: "open list:virtiofs" <virtio-fs@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaced the allocation of local variables from malloc() to
GLib allocation functions.

In one instance, dropped the usage to an assert after a malloc()
call and used g_malloc() instead.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
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


