Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AC8365CA7
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 17:51:02 +0200 (CEST)
Received: from localhost ([::1]:37596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYseT-0003NK-Rt
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 11:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lYsbC-0001gK-Rz
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:47:38 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lYsbA-0003O6-Ui
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:47:38 -0400
Received: by mail-wr1-x430.google.com with SMTP id h4so29099861wrt.12
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zHUPL2SMYE0/WNVg5aveYt3okNxRR0QJ0JhoTKs4tEM=;
 b=AiuUT/S8ilQXj5mlQdFcSctG3Hkv+u2kX5NJVd8vXjeIkHc6JGBSpBjO7SAvqKMawo
 5C7Igv064RwVbjonhv0qO5taw7xsS3h+RoEc5c3K1ySgeblD7EDJMP+Lb/yDlpMasvWP
 Iv498gJwpyHpSof5UyhZ6f4wLXtRpb9Onuj2u3DxffrcNdjsAB/k4DmVkQl+lg+MrxqH
 Hei11XB8tSM27+kMCziJwYE532mKRxMc2clvTjklRJv1sJZttspQRDJ9rXvwTbGgRb4u
 uNNfciYlonwbazZlrm5bmS1VcA+jUNrG8tII2Ot2H3ESKK/pX64xsaIKaL7ffdpiBRKa
 eKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zHUPL2SMYE0/WNVg5aveYt3okNxRR0QJ0JhoTKs4tEM=;
 b=rYHWzL8LINE/LzieZTk2/HrCY6lJ+EU8nyOpqokPeXUU9TIUqM9unecaUpxh1Vte+A
 FU6ZfJnTR2HMga0bQSGHXjM/fjXKbMzH6B7C3hhM2PN429p/dH1ab4wQgpki3OOvf7h2
 QqJxAiUk8YhPNqhtWg4ViAg/vHQtl27khO2501ZGMhK9CxSaOiKHgRCJO2pQrC4MMdg1
 vudK7u0VyLe8TgO+/rN6h9tBneFTAbhzhqoT4OXxGXQjbrs6Kzgth7QZ/r3FPA5wp+RO
 /CGG3nmueY7S2MO9Yj3QlwpIijKTY5I20d5B8/U4P8+sQk5HVuDkRd6s0Go9d4xP8a38
 zN0g==
X-Gm-Message-State: AOAM531HSDT19mY12Dh1DtGzXqsJLLJQCwqfoeBTvWGV+mhXYXGZ3sd3
 7CsDy9yRW0rQUwEhUFQmMpFzg1MGlAY=
X-Google-Smtp-Source: ABdhPJxjzf5m8B9y8YFBrGvV0VUz7H9ZyX+bMTpdskZunSZsWOI5CGiFdyLSA3nofbN5KftwYSNweA==
X-Received: by 2002:a5d:4010:: with SMTP id n16mr21527259wrp.225.1618933655415; 
 Tue, 20 Apr 2021 08:47:35 -0700 (PDT)
Received: from localhost.localdomain ([197.61.162.183])
 by smtp.googlemail.com with ESMTPSA id d5sm25025824wrx.15.2021.04.20.08.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 08:47:35 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/7] virtiofds: Changed allocations of iovec to GLib's
 functions
Date: Tue, 20 Apr 2021 17:46:37 +0200
Message-Id: <20210420154643.58439-3-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420154643.58439-1-ma.mandourr@gmail.com>
References: <20210420154643.58439-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x430.google.com
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

Replaced the calls to malloc()/calloc() and their respective
calls to free() of iovec structs with GLib's allocation and
deallocation functions.

Also, in one instance, used g_new0() instead of a calloc() call plus
a null-checking assertion.

iovec structs were created locally and freed as the function
ends. Hence, I used g_autofree and removed the respective calls to
free().

In one instance, a struct fuse_ioctl_iovec pointer is returned from a
function, namely, fuse_ioctl_iovec_copy. There, I used g_steal_pointer()
in conjunction with g_autofree, this gives the ownership of the pointer
to the calling function and still auto-frees the memory when the calling
function finishes (maintaining the symantics of previous code).

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.c | 19 +++++++------------
 tools/virtiofsd/fuse_virtio.c   |  6 +-----
 2 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index 812cef6ef6..f965299ad9 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -217,9 +217,9 @@ static int send_reply(fuse_req_t req, int error, const void *arg,
 int fuse_reply_iov(fuse_req_t req, const struct iovec *iov, int count)
 {
     int res;
-    struct iovec *padded_iov;
+    g_autofree struct iovec *padded_iov;
 
-    padded_iov = malloc((count + 1) * sizeof(struct iovec));
+    padded_iov = g_try_new(struct iovec, count + 1);
     if (padded_iov == NULL) {
         return fuse_reply_err(req, ENOMEM);
     }
@@ -228,7 +228,6 @@ int fuse_reply_iov(fuse_req_t req, const struct iovec *iov, int count)
     count++;
 
     res = send_reply_iov(req, 0, padded_iov, count);
-    free(padded_iov);
 
     return res;
 }
@@ -565,10 +564,10 @@ int fuse_reply_bmap(fuse_req_t req, uint64_t idx)
 static struct fuse_ioctl_iovec *fuse_ioctl_iovec_copy(const struct iovec *iov,
                                                       size_t count)
 {
-    struct fuse_ioctl_iovec *fiov;
+    g_autofree struct fuse_ioctl_iovec *fiov;
     size_t i;
 
-    fiov = malloc(sizeof(fiov[0]) * count);
+    fiov = g_try_new(fuse_ioctl_iovec, count);
     if (!fiov) {
         return NULL;
     }
@@ -578,7 +577,7 @@ static struct fuse_ioctl_iovec *fuse_ioctl_iovec_copy(const struct iovec *iov,
         fiov[i].len = iov[i].iov_len;
     }
 
-    return fiov;
+    return g_steal_pointer(&fiov);
 }
 
 int fuse_reply_ioctl_retry(fuse_req_t req, const struct iovec *in_iov,
@@ -629,9 +628,6 @@ int fuse_reply_ioctl_retry(fuse_req_t req, const struct iovec *in_iov,
 
     res = send_reply_iov(req, 0, iov, count);
 out:
-    free(in_fiov);
-    free(out_fiov);
-
     return res;
 
 enomem:
@@ -663,11 +659,11 @@ int fuse_reply_ioctl(fuse_req_t req, int result, const void *buf, size_t size)
 int fuse_reply_ioctl_iov(fuse_req_t req, int result, const struct iovec *iov,
                          int count)
 {
-    struct iovec *padded_iov;
+    g_autofree struct iovec *padded_iov;
     struct fuse_ioctl_out arg;
     int res;
 
-    padded_iov = malloc((count + 2) * sizeof(struct iovec));
+    padded_iov = g_try_new(struct iovec, count + 2);
     if (padded_iov == NULL) {
         return fuse_reply_err(req, ENOMEM);
     }
@@ -680,7 +676,6 @@ int fuse_reply_ioctl_iov(fuse_req_t req, int result, const struct iovec *iov,
     memcpy(&padded_iov[2], iov, count * sizeof(struct iovec));
 
     res = send_reply_iov(req, 0, padded_iov, count + 2);
-    free(padded_iov);
 
     return res;
 }
diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 3e13997406..07e5d91a9f 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -347,8 +347,7 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
      * Build a copy of the the in_sg iov so we can skip bits in it,
      * including changing the offsets
      */
-    struct iovec *in_sg_cpy = calloc(sizeof(struct iovec), in_num);
-    assert(in_sg_cpy);
+    g_autofree struct iovec *in_sg_cpy = g_new0(struct iovec, in_num);
     memcpy(in_sg_cpy, in_sg, sizeof(struct iovec) * in_num);
     /* These get updated as we skip */
     struct iovec *in_sg_ptr = in_sg_cpy;
@@ -386,7 +385,6 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
             ret = errno;
             fuse_log(FUSE_LOG_DEBUG, "%s: preadv failed (%m) len=%zd\n",
                      __func__, len);
-            free(in_sg_cpy);
             goto err;
         }
         fuse_log(FUSE_LOG_DEBUG, "%s: preadv ret=%d len=%zd\n", __func__,
@@ -410,13 +408,11 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
         if (ret != len) {
             fuse_log(FUSE_LOG_DEBUG, "%s: ret!=len\n", __func__);
             ret = EIO;
-            free(in_sg_cpy);
             goto err;
         }
         in_sg_left -= ret;
         len -= ret;
     } while (in_sg_left);
-    free(in_sg_cpy);
 
     /* Need to fix out->len on EOF */
     if (len) {
-- 
2.25.1


