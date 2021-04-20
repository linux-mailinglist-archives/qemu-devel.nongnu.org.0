Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C34365CB6
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 17:57:01 +0200 (CEST)
Received: from localhost ([::1]:49796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYskG-0000DU-QV
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 11:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lYsbO-0001mm-Te
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:47:52 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lYsbE-0003Pz-Go
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:47:50 -0400
Received: by mail-wr1-x42d.google.com with SMTP id h4so29100127wrt.12
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DMmCP/nq64/5+dSP7ehwkK/KzSCcP4/pvUdlB1H1Ib8=;
 b=uyJe/qGT8CrrzJIynMquh4rDa+/5CQGgn6RE/u1a4p5RvDa7jTXAmZnb1Ouwl+BVLn
 cKnMB+bsd1tCTQl3gqLwGUkkfaq5OcXCBtkcFBfR6M/szumNJbQhSk+hH2KctK4O5xwO
 2pGaOFxg6h/xTJXFJGIySm+A3MKk8GCNY2H5xXDSrbA37wJID4y/upxEtYmUZQ4javZn
 XXryLQBxNYdau/7XS+2/bbgkcItabe2Qz3QBPcrmIIKItZ0X6z3TxKA4NxcTyD3Qw1k+
 CUrRG1C9kjBtnn1h0fvGBiOeMwCriAbZ2xfDNh+YdTs/Bvf4jLXI3vuRZUxImuUQgWR7
 OIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DMmCP/nq64/5+dSP7ehwkK/KzSCcP4/pvUdlB1H1Ib8=;
 b=Yrokg9GPacI4CZxTq6WKOoQeqMvOuB9lh9OQnNTQ3zE9hqyHQGMcOdxWc7M+CqoPyi
 FdpRXTzZMa0mVIe9GatVlg5R/IFBrFERSqDWx3T3jM7BLqjyNxmMV7zrUwybBbIpNGAy
 5GIS2W4610liGnazxLuWl4GrAES5TKeEtNIDpUhJvXa5ai8HqjjVcJELZ0pEdvIsJjPF
 eVCI8wOMlCqaG8xn3hma4ZHnilSrxlFp658IrQeKx9MGStjmw3dDAXwUYmPj/FV0LLvX
 fT+Oci6VWK8Fap1hvpBDQpID3rNqiRJp0HUgxwM1YYVY28y1pzME4mnplrGl20H/xLs3
 xgfA==
X-Gm-Message-State: AOAM5304uXeO1Ogi8JLOafML5wLqal+vSOwesTAmFuLBY47Pm/6BNt6D
 4KVLnKfqEtragPGGbcD3qXUbt0zAq2c=
X-Google-Smtp-Source: ABdhPJwQO5co/FiAdNpEuPw2iBDh1Aa5MntwuDZU0lY8RfSS19XCIZkK+ZukN9gN+oRbhnp4Y66gMA==
X-Received: by 2002:a5d:47c1:: with SMTP id o1mr19835060wrc.216.1618933659093; 
 Tue, 20 Apr 2021 08:47:39 -0700 (PDT)
Received: from localhost.localdomain ([197.61.162.183])
 by smtp.googlemail.com with ESMTPSA id d5sm25025824wrx.15.2021.04.20.08.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 08:47:38 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/7] virtiofsd: Changed allocations of fv_VuDev & its
 internals to GLib functions
Date: Tue, 20 Apr 2021 17:46:40 +0200
Message-Id: <20210420154643.58439-6-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420154643.58439-1-ma.mandourr@gmail.com>
References: <20210420154643.58439-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42d.google.com
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
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
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


