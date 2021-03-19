Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4138341E5C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:31:56 +0100 (CET)
Received: from localhost ([::1]:41810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFEJ-0006lA-Tt
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lNF9C-0001HU-Uz
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:26:38 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lNF99-0004Ck-MU
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:26:38 -0400
Received: by mail-wr1-x42f.google.com with SMTP id x13so9113053wrs.9
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 06:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eiWZx+mACoCrFVRPV7yfaFTS0OqnVjieeU+w0fMK/vM=;
 b=R2B8n6+PVJ33LQk3cWXqWrBdDPLZ0Py5YEC58bBd5rbxEjDrx3N/U4ejPPOAYB53Hm
 13r9r5qS9eAxuDZrpz6RjTNhXgWKLmEJ+qW/kp0cru0G4RKrzT2JW9QlZJHJEzjQ0cQd
 FkVMxzqQLePjYzzbTqqR4xpyaHPZOKODu4dPu6Afahh7MXv8sudVBBg3I5c/j+aY8TB5
 hVhfIfSsBOLbRf+1/Vh3bxiBE4980hb/ywaXaqZUMjZ1sL6zgVQln+zI+2Oi1pA+Z10T
 2pFiigMgAPw7jz5WcV92od26iVQid/Xx98KXXe4d+SJJXUZYUjP2qRq6gNzp1mhrKb1S
 7K1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eiWZx+mACoCrFVRPV7yfaFTS0OqnVjieeU+w0fMK/vM=;
 b=T8jWeJrceRgC28eBenCwEwtir2JRbiUQkll6nzO2xrHrTHf/JU2Zz1xUFC7T8DJhwj
 V2kxFp9oLIZ3pSrVMmg4SeN1VcmL7hbrX6NAtKGlFjNfY6D/HSynNE0tsetFRpyNoUAc
 BctLjaBPCy/lkefdx2v7Oh8wLjfUG8ie8UYwgJ0lrp0ReQCABi+T4vLy5H+QFlK6PA0T
 gbqkqKfogU5jjnxRaYk1O7Iflo9d7ilBCHnk4s9FzRGx3ExXHgbAIpR8aFPRrP2kztjk
 DGlobPQ+IplupsRdlnNrmBZjUzXvgjE7/dG8woW2bqSn0qtW3rqrwg5lf6V3mJm3SEe+
 xzgA==
X-Gm-Message-State: AOAM530jxxuFzonjqHvF8Fddc2iZbU5IX4I4WTdWUAiLkESCUvzpnnth
 TQGsEVzX1zAfhwE722b5g4DZnRYEyUw=
X-Google-Smtp-Source: ABdhPJwg+2c68Wc56HxZ5vNFPS4yCseuk7pNaBWZ4n2jj9zjSl8XT/xHHxPA272eTXxquR5n+A72vQ==
X-Received: by 2002:adf:ea0e:: with SMTP id q14mr4602850wrm.389.1616160393236; 
 Fri, 19 Mar 2021 06:26:33 -0700 (PDT)
Received: from localhost.localdomain ([102.47.92.134])
 by smtp.googlemail.com with ESMTPSA id v13sm8889584wrt.45.2021.03.19.06.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 06:26:32 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] virtiofsd: Changed allocations of fv_VuDev & its
 internals to GLib functions
Date: Fri, 19 Mar 2021 15:25:25 +0200
Message-Id: <20210319132527.3118-7-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319132527.3118-1-ma.mandourr@gmail.com>
References: <20210319132527.3118-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42f.google.com
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

Changed the allocations of fv_VuDev structs, VuDev structs, and
fv_QueueInfo strcuts from using calloc()/realloc() & free() to using
the equivalent functions from GLib.

In instances, removed the pair of allocation and assertion for
non-NULL checking with a GLib function that aborts on error.

Removed NULL-checking for fv_VuDev struct allocation and used
a GLib function that crashes on error; namely, g_new0(). This
is because allocating one struct should not be a problem on an
healthy system. Also following the pattern of aborting-on-null
behaviour that is taken with allocating VuDev structs and
fv_QueueInfo structs.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 tools/virtiofsd/fuse_virtio.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 07e5d91a9f..5828b9a76f 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -729,7 +729,7 @@ static void fv_queue_cleanup_thread(struct fv_VuDev *vud, int qidx)
     pthread_mutex_destroy(&ourqi->vq_lock);
     close(ourqi->kill_fd);
     ourqi->kick_fd = -1;
-    free(vud->qi[qidx]);
+    g_free(vud->qi[qidx]);
     vud->qi[qidx] = NULL;
 }
 
@@ -760,15 +760,13 @@ static void fv_queue_set_started(VuDev *dev, int qidx, bool started)
     if (started) {
         /* Fire up a thread to watch this queue */
         if (qidx >= vud->nqueues) {
-            vud->qi = realloc(vud->qi, (qidx + 1) * sizeof(vud->qi[0]));
-            assert(vud->qi);
+            vud->qi = g_realloc_n(vud->qi, qidx + 1, sizeof(vud->qi[0]));
             memset(vud->qi + vud->nqueues, 0,
                    sizeof(vud->qi[0]) * (1 + (qidx - vud->nqueues)));
             vud->nqueues = qidx + 1;
         }
         if (!vud->qi[qidx]) {
-            vud->qi[qidx] = calloc(sizeof(struct fv_QueueInfo), 1);
-            assert(vud->qi[qidx]);
+            vud->qi[qidx] = g_new0(struct fv_QueueInfo, 1);
             vud->qi[qidx]->virtio_dev = vud;
             vud->qi[qidx]->qidx = qidx;
         } else {
@@ -1034,12 +1032,7 @@ int virtio_session_mount(struct fuse_session *se)
              __func__);
 
     /* TODO: Some cleanup/deallocation! */
-    se->virtio_dev = calloc(sizeof(struct fv_VuDev), 1);
-    if (!se->virtio_dev) {
-        fuse_log(FUSE_LOG_ERR, "%s: virtio_dev calloc failed\n", __func__);
-        close(data_sock);
-        return -1;
-    }
+    se->virtio_dev = g_new0(struct fv_VuDev, 1);
 
     se->vu_socketfd = data_sock;
     se->virtio_dev->se = se;
@@ -1061,8 +1054,8 @@ void virtio_session_close(struct fuse_session *se)
         return;
     }
 
-    free(se->virtio_dev->qi);
+    g_free(se->virtio_dev->qi);
     pthread_rwlock_destroy(&se->virtio_dev->vu_dispatch_rwlock);
-    free(se->virtio_dev);
+    g_free(se->virtio_dev);
     se->virtio_dev = NULL;
 }
-- 
2.25.1


