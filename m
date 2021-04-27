Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B922436CAFB
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 20:17:54 +0200 (CEST)
Received: from localhost ([::1]:41546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbSHR-0006uI-RI
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 14:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lbSDo-0005Xo-Nd
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 14:14:10 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lbSDm-00080o-CZ
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 14:14:08 -0400
Received: by mail-wr1-x42f.google.com with SMTP id k14so10496304wrv.5
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 11:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oL7tT4/EkZRAjRxNnXes8qHr1hKlD6EBXOmzh2nu7XY=;
 b=CG5soQITWm+R8S0Ki19y7h/RwpwNxwNKGiJ3I+eyyVTJCUBxzn+CTgj5ueQyt+ua8Y
 WH6GgkWZiIH/R+MDShlW493fobiA7TIDeSyawFbP7llB6ksipYrBsBuCBFrm6qLmp1rT
 p3BVVdUSNMeFJn7+VIDLQ50A7RgFP2ytmpHaNbLLUURRmzZMNR1vTsqiZMF4zTUVld0b
 a4kG/z7lRURoLHwNdX+HOD7p2rIF4rPx0JTgIuCVMYF2t5esAhmn7mJPwnYwR4LERG8Z
 WcJwLTLJkQnbQTzWSOMKa42TF37BmdeDX+CCa2GWOBthVaAql7ke+SjT8cF2JRfIVlxZ
 FCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oL7tT4/EkZRAjRxNnXes8qHr1hKlD6EBXOmzh2nu7XY=;
 b=LNLs/vL21NSEibk07btq0q6bwymoi9oH9Kzdn1iOW9LLm3O3F0DV8uWpqC9pLF7oPB
 1u3Ev/ifWl+aaMBtg8rXnK54OdqHa84CzRT2fl1iDG9WwbUQJSKqM0JuzBM/Zi7PvdI8
 ofrwV9eWK5QRekkbsMeRJdnSNCfEFEWf4jS6kZh0T0QBFdcc2lwFhpVJXCH1icSH6H6n
 tvO868gDd2wpgWZKbPuozGk6eNGFZkXae//HnPk7tL9wkLzhI2SiB8UjGw3MJLcaCkrh
 FbNaTOdXn58u4X68vQsMdqcXZP5gF1qnawV6cvGyCNDKC0s+ASIskrOKwxaghBnzzqTQ
 Jwaw==
X-Gm-Message-State: AOAM5319aM40vSGR8S6ComWjNURNujshxof1psbxSBSPBrem8f/GURkX
 mG4k014kT47GzlhyI69xKltHa8VM0DU=
X-Google-Smtp-Source: ABdhPJyiXYa6TZtHrREAu6vf+LzsKpKsCL0lYowZkOmcgMw4ENKmt3pdGd/KLF/nSBWR9Qz965AhwA==
X-Received: by 2002:adf:cc89:: with SMTP id p9mr29933340wrj.223.1619547244533; 
 Tue, 27 Apr 2021 11:14:04 -0700 (PDT)
Received: from localhost.localdomain ([102.41.168.0])
 by smtp.googlemail.com with ESMTPSA id m67sm4255325wme.27.2021.04.27.11.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 11:14:03 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/7] virtiofsd: Changed allocations of iovec to GLib's
 functions
Date: Tue, 27 Apr 2021 20:13:33 +0200
Message-Id: <20210427181333.148176-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YIf2d8HuyPqwqt9C@work-vm>
References: <YIf2d8HuyPqwqt9C@work-vm>
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
Cc: "open list:virtiofs" <virtio-fs@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaced the calls to malloc()/calloc() and their respective
calls to free() of iovec structs with GLib's allocation and
deallocation functions and used g_autofree when appropriate.

Replaced the allocation of in_sg_cpy to g_new() instead of a call
to calloc() and a null-checking assertion. Not g_new0()
because the buffer is immediately overwritten using memcpy.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
v2 -> v3:
    * Removed a wrongful combination of g_autofree and g_steel_pointer().
    * Removed some goto paths that IMHO were not so useful any more.
    * In v2, I allocated in_sg_cpy through g_new0(). This patch, I use
      g_new() because the buffer is memcpy'd into right away so no need
      to zero-initialize.
    * Moved the declaration of in_sg_cpy to the top of the function
      to match QEMU's style guidelines. 

 tools/virtiofsd/fuse_lowlevel.c | 31 ++++++++++++-------------------
 tools/virtiofsd/fuse_virtio.c   |  8 +++-----
 2 files changed, 15 insertions(+), 24 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index c8bea246ab..7fe2cef1eb 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -217,9 +217,9 @@ static int send_reply(fuse_req_t req, int error, const void *arg,
 int fuse_reply_iov(fuse_req_t req, const struct iovec *iov, int count)
 {
     int res;
-    struct iovec *padded_iov;
+    g_autofree struct iovec *padded_iov = NULL;
 
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
@@ -568,7 +567,7 @@ static struct fuse_ioctl_iovec *fuse_ioctl_iovec_copy(const struct iovec *iov,
     struct fuse_ioctl_iovec *fiov;
     size_t i;
 
-    fiov = malloc(sizeof(fiov[0]) * count);
+    fiov = g_try_new(struct fuse_ioctl_iovec, count);
     if (!fiov) {
         return NULL;
     }
@@ -586,8 +585,8 @@ int fuse_reply_ioctl_retry(fuse_req_t req, const struct iovec *in_iov,
                            size_t out_count)
 {
     struct fuse_ioctl_out arg;
-    struct fuse_ioctl_iovec *in_fiov = NULL;
-    struct fuse_ioctl_iovec *out_fiov = NULL;
+    g_autofree struct fuse_ioctl_iovec *in_fiov = NULL;
+    g_autofree struct fuse_ioctl_iovec *out_fiov = NULL;
     struct iovec iov[4];
     size_t count = 1;
     int res;
@@ -603,13 +602,14 @@ int fuse_reply_ioctl_retry(fuse_req_t req, const struct iovec *in_iov,
     /* Can't handle non-compat 64bit ioctls on 32bit */
     if (sizeof(void *) == 4 && req->ioctl_64bit) {
         res = fuse_reply_err(req, EINVAL);
-        goto out;
+        return res;
     }
 
     if (in_count) {
         in_fiov = fuse_ioctl_iovec_copy(in_iov, in_count);
         if (!in_fiov) {
-            goto enomem;
+            res = fuse_reply_err(req, ENOMEM);
+            return res;
         }
 
         iov[count].iov_base = (void *)in_fiov;
@@ -619,7 +619,8 @@ int fuse_reply_ioctl_retry(fuse_req_t req, const struct iovec *in_iov,
     if (out_count) {
         out_fiov = fuse_ioctl_iovec_copy(out_iov, out_count);
         if (!out_fiov) {
-            goto enomem;
+            res = fuse_reply_err(req, ENOMEM);
+            return res;
         }
 
         iov[count].iov_base = (void *)out_fiov;
@@ -628,15 +629,8 @@ int fuse_reply_ioctl_retry(fuse_req_t req, const struct iovec *in_iov,
     }
 
     res = send_reply_iov(req, 0, iov, count);
-out:
-    free(in_fiov);
-    free(out_fiov);
 
     return res;
-
-enomem:
-    res = fuse_reply_err(req, ENOMEM);
-    goto out;
 }
 
 int fuse_reply_ioctl(fuse_req_t req, int result, const void *buf, size_t size)
@@ -663,11 +657,11 @@ int fuse_reply_ioctl(fuse_req_t req, int result, const void *buf, size_t size)
 int fuse_reply_ioctl_iov(fuse_req_t req, int result, const struct iovec *iov,
                          int count)
 {
-    struct iovec *padded_iov;
+    g_autofree struct iovec *padded_iov = NULL;
     struct fuse_ioctl_out arg;
     int res;
 
-    padded_iov = malloc((count + 2) * sizeof(struct iovec));
+    padded_iov = g_try_new(struct iovec, count + 2);
     if (padded_iov == NULL) {
         return fuse_reply_err(req, ENOMEM);
     }
@@ -680,7 +674,6 @@ int fuse_reply_ioctl_iov(fuse_req_t req, int result, const struct iovec *iov,
     memcpy(&padded_iov[2], iov, count * sizeof(struct iovec));
 
     res = send_reply_iov(req, 0, padded_iov, count + 2);
-    free(padded_iov);
 
     return res;
 }
diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 9e437618fb..9b00687cb0 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -295,6 +295,8 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
     VuVirtqElement *elem = &req->elem;
     int ret = 0;
 
+    g_autofree struct iovec *in_sg_cpy = NULL;
+
     assert(count >= 1);
     assert(iov[0].iov_len >= sizeof(struct fuse_out_header));
 
@@ -347,8 +349,7 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
      * Build a copy of the the in_sg iov so we can skip bits in it,
      * including changing the offsets
      */
-    struct iovec *in_sg_cpy = calloc(sizeof(struct iovec), in_num);
-    assert(in_sg_cpy);
+    in_sg_cpy = g_new(struct iovec, in_num);
     memcpy(in_sg_cpy, in_sg, sizeof(struct iovec) * in_num);
     /* These get updated as we skip */
     struct iovec *in_sg_ptr = in_sg_cpy;
@@ -386,7 +387,6 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
             ret = errno;
             fuse_log(FUSE_LOG_DEBUG, "%s: preadv failed (%m) len=%zd\n",
                      __func__, len);
-            free(in_sg_cpy);
             goto err;
         }
         fuse_log(FUSE_LOG_DEBUG, "%s: preadv ret=%d len=%zd\n", __func__,
@@ -410,13 +410,11 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
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


