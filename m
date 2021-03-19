Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD9B341E71
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:36:24 +0100 (CET)
Received: from localhost ([::1]:57366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFId-0004cU-9H
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lNF9B-0001EN-Ck
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:26:37 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:39583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lNF96-0004B3-L4
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:26:37 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 d8-20020a1c1d080000b029010f15546281so4999908wmd.4
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 06:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cSkDb2cN4/m5oNeRgBE6KjrYKYozQlVRVVXme8ca8DY=;
 b=E7PpszS5JGLnvUfZ+vF05l10YIoTfJ8YSsGBf0CUIWqqUZF+dqGIME6A5G5BfbASN8
 YF2y1q57eWnBENDJGBmtKgdawI9kTMRYaXcWZi/zNupxUlyt9P7c/zDXjiT/b9QWKpBI
 S4pcvjBiUDc2NbXCINRl60WcijX/V0TAYIbht3a3c5sBuRPoZJCJ8KWptT5wG/K+VbLx
 LeAuvnzgSQZlNbPfSg1PhIhccbPxXFSCRx4uaH2raxcTSMP0FIpIi1VyyWKJ/aArAcv1
 D3mnYxZD12YYSsmVkqVfCdVaYULHzp7xeWbz5c48JbvcbOoqUyna5MNTuyG+8gf3QoqQ
 0mrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cSkDb2cN4/m5oNeRgBE6KjrYKYozQlVRVVXme8ca8DY=;
 b=ho9bWusFw6NIEOyulv5H+745LTLHws/AV9dbO5wTbbNJ3Whvh2HIIf77deSoJnX4xj
 oeZCBzVSQDYGseP7cc9qtnmNz/iqWQWAcuF4e8I4OjWGcVN0BIRX4n+BAVBOkjl7Iss9
 gak5ukybiKwD4gEQDmG66x1bbAv1ZS4PFocZoTcDKF+h5Jroqg3W1wv1tW7CpNT9Wlwg
 AJr62bX64BAqIy9b2bi/HMvrenf2477CWKEIL3N7F/hOdfdeJXIUHwievbaLtiTPS6NO
 FXse3fXoBT+ZzRfcXkuoEmzfH4bwQxMF4qIgiRWTzlPYRkhjcMnEC1EkLPOh893HM5fA
 +N1Q==
X-Gm-Message-State: AOAM533vx+1XNA/umlqMdAg8uk4aWVd+QMyrbXFfSQvsuGa0SMcSX/hF
 JOyqqYYoQEXbdLAH6lVhU/Z6sRwelrg=
X-Google-Smtp-Source: ABdhPJxPsSQwij9dOPOeoiaTZwhM30XbWpNqev/P/csaF8T0yMY6y6ziJWDt2SGIf8Pi1DP3HmJiSg==
X-Received: by 2002:a1c:9d51:: with SMTP id g78mr3904083wme.5.1616160389310;
 Fri, 19 Mar 2021 06:26:29 -0700 (PDT)
Received: from localhost.localdomain ([102.47.92.134])
 by smtp.googlemail.com with ESMTPSA id v13sm8889584wrt.45.2021.03.19.06.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 06:26:29 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/8] virtiofds: Changed allocations of iovec to GLib's
 functions
Date: Fri, 19 Mar 2021 15:25:21 +0200
Message-Id: <20210319132527.3118-3-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319132527.3118-1-ma.mandourr@gmail.com>
References: <20210319132527.3118-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x334.google.com
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
---
 tools/virtiofsd/fuse_lowlevel.c | 19 +++++++------------
 tools/virtiofsd/fuse_virtio.c   |  6 +-----
 2 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index ba20c73778..66607100f2 100644
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


