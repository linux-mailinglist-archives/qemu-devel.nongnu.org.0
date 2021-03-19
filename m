Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 409BE341E69
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:34:30 +0100 (CET)
Received: from localhost ([::1]:50602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFGn-0001sq-AI
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lNF9D-0001Jb-Qc
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:26:39 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lNF9A-0004D7-Hd
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:26:39 -0400
Received: by mail-wm1-x335.google.com with SMTP id g25so5491677wmh.0
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 06:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tRiDkt/PZdT5UYxHG4CdXIwPFvqt4OqFWKCOPiH+A5w=;
 b=vfRGdKzO6KmrMTkQh9J4s6ZMiSoUgtAYRrUF/evsr6PvXoUrl3WZKD6jo0rp4slJ/n
 Zfv7Cus0ljJMyrgnarQrztcz1QZahozZT71+A2mn1bkDvgOBxcammZlaAQWBeRXgTf8d
 1saUkoJLegRkWXTD/NgYrgwGgJjZ9LsOTCxS1OWObCvhqntRoJakAPdtnPT8M00R26JH
 n98pVFoPwlcMZVz5jiYTc14G7oCwYsK6DCZli+Yd+ZgKyiBo2I9teqKmtcjawFxIT+jI
 r4T+wQisWCvfeIoQ6M/WqYk8t1EXIdlX5a0tSNTM91FFSMHa3XpXpY5vaa3q1zoAfZxd
 Qczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tRiDkt/PZdT5UYxHG4CdXIwPFvqt4OqFWKCOPiH+A5w=;
 b=gR+bcxOnkP1n5u2FdzTaGpRKJg7R09dMiqlvnWx7xCnHThF8KkcSY9HvkfwLMAkkT2
 jXbF9YSF4JxC4RrvAGwg0qGCsyeHpOwS9BJ7dqhrBePmFZiouPWvZ8h/r9ctQ6iu6e6T
 GP2ixbflHqorBpRnq3zXepnJZ6NAV526KOnu3L/s6X4P0xJEPgfkWzwzeqlVcXzGH85P
 68gyUdsOT3lZoQbyyZciXnMRywXuH+IsDplN/vRK/2wQXENoixrPpnwgZ9ZNnuRU9Tnf
 6gE4LROSfEGrJRtYYZGU81RNdIw4if3s0/4no2G11FtVF7/GOwWur9bIQz7Es092gfOG
 WRQg==
X-Gm-Message-State: AOAM5303NOUe2lT9BPIVxzsNQFhtpzRlQiRRJe/pFbH/HqkziuVJXs9a
 7fl4eVWVHhm6tguu78DG9jTz+0qn6qk=
X-Google-Smtp-Source: ABdhPJxGJbH18sqefbIBK4SKUQqBmLO1I/R5KbSAAsZXNTE5JQ/C6Yef23dwRgLKPZR7kQ2x5T9pkg==
X-Received: by 2002:a1c:43c5:: with SMTP id q188mr3696767wma.94.1616160395013; 
 Fri, 19 Mar 2021 06:26:35 -0700 (PDT)
Received: from localhost.localdomain ([102.47.92.134])
 by smtp.googlemail.com with ESMTPSA id v13sm8889584wrt.45.2021.03.19.06.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 06:26:33 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/8] virtiofsd/passthrough_ll.c: Changed local allocations to
 GLib functions
Date: Fri, 19 Mar 2021 15:25:26 +0200
Message-Id: <20210319132527.3118-8-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319132527.3118-1-ma.mandourr@gmail.com>
References: <20210319132527.3118-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x335.google.com
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

Changed the allocations of some local variables to GLib's allocation
functions, such as g_try_malloc0(), and annotated those variables
as g_autofree. Subsequently, I was able to remove the calls to free().

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 tools/virtiofsd/passthrough_ll.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index d049013428..4263b383f0 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1653,7 +1653,7 @@ static void lo_do_readdir(fuse_req_t req, fuse_ino_t ino, size_t size,
     struct lo_data *lo = lo_data(req);
     struct lo_dirp *d = NULL;
     struct lo_inode *dinode;
-    char *buf = NULL;
+    g_autofree char *buf = NULL;
     char *p;
     size_t rem = size;
     int err = EBADF;
@@ -1669,7 +1669,7 @@ static void lo_do_readdir(fuse_req_t req, fuse_ino_t ino, size_t size,
     }
 
     err = ENOMEM;
-    buf = calloc(1, size);
+    buf = g_try_malloc0(size);
     if (!buf) {
         goto error;
     }
@@ -1755,7 +1755,6 @@ error:
     } else {
         fuse_reply_buf(req, buf, size - rem);
     }
-    free(buf);
 }
 
 static void lo_readdir(fuse_req_t req, fuse_ino_t ino, size_t size,
@@ -2726,7 +2725,7 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
                         size_t size)
 {
     struct lo_data *lo = lo_data(req);
-    char *value = NULL;
+    g_autofree char *value = NULL;
     char procname[64];
     const char *name;
     char *mapped_name;
@@ -2767,7 +2766,7 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
              ino, name, size);
 
     if (size) {
-        value = malloc(size);
+        value = g_try_malloc(size);
         if (!value) {
             goto out_err;
         }
@@ -2806,8 +2805,6 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
         fuse_reply_xattr(req, ret);
     }
 out_free:
-    free(value);
-
     if (fd >= 0) {
         close(fd);
     }
@@ -2826,7 +2823,7 @@ out:
 static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
 {
     struct lo_data *lo = lo_data(req);
-    char *value = NULL;
+    g_autofree char *value = NULL;
     char procname[64];
     struct lo_inode *inode;
     ssize_t ret;
@@ -2848,7 +2845,7 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
              size);
 
     if (size) {
-        value = malloc(size);
+        value = g_try_malloc(size);
         if (!value) {
             goto out_err;
         }
@@ -2933,8 +2930,6 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
         fuse_reply_xattr(req, ret);
     }
 out_free:
-    free(value);
-
     if (fd >= 0) {
         close(fd);
     }
-- 
2.25.1


