Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B50365CB7
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 17:57:04 +0200 (CEST)
Received: from localhost ([::1]:49924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYskJ-0000H8-Lf
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 11:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lYsbQ-0001nN-UN
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:47:57 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lYsbK-0003QO-3f
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:47:52 -0400
Received: by mail-wr1-x433.google.com with SMTP id r7so26124743wrm.1
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LrbTd6tSNQjqaBaj1lpQXcV7DowubxzC111+FmraES4=;
 b=KetU5L0oYdz+enH/xtchCDwmc2o+w40N8VfbpoR5w8ixB0GzrCzo41FGsnc+iVZA3p
 Rui9+FQngfe9DHiiIIWuwWcylCh9pkCoG6X/L8zis6H0126T7uNh0yik0m91bYPlIJdb
 61p/DkGBLPpi9fHwDKgxzgrgqFQ3SnDoLhkW/H4T+WR6DqNBMCoRZ2l+lWl1r2METv5X
 2M+VNMGbD0sQaxafRXQFTNhu25O5nycp7cNBzpk8AG67DxtfpSmMJY6C1T4VGvkEPMoL
 eMLPweBCBH/YKGNezBUepPf8zcn0jTD7OWVPIXdPgYy6zt8doZED6vSY/6eBYeTCLoBn
 3K3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LrbTd6tSNQjqaBaj1lpQXcV7DowubxzC111+FmraES4=;
 b=P2dbngujiNmS/Gz6bDXmyNmgoGJKK540GWO1YyxByTKQz/893b2brgUiHVPWltFlcN
 L9Ksd7tTOm+ufRdlM90OHKi6G0lUH2jecaTVpjgnoUloBr4JidRpYSWCTu6JDK+2gnlV
 dZ21jIKHeY7nFplRp5rbWFEYMfG7DlJ+9vR/c6IlzIprYFnJ3oSCs+SZKYlrPoyGfb0z
 N5icLQKJIkMZAyH93XFgwP0Xga1mVllG2n7t6YICjw0ABjkaEOZr5aNzrHQkjfLg9OqA
 bGWsnWod1O16kdJux+b9R79bo0tMuqwsBaujSLwTbt3SZYDl8EDtYwRPJ0s5mt9DLVqA
 7V9g==
X-Gm-Message-State: AOAM5322wXTjwEK8xInrSQ3HM9sRlMvoCc+QEGtlocNDMIphhFKC7zSq
 Gc9vNAvIOK9Sh0JPtIJVEwsGc6GCEjw=
X-Google-Smtp-Source: ABdhPJzdQxbf1AiHvCxmg5nx87g2VRK3wAu1EWJHm+Alfa0go7Mr8GswsxytQE77qzAz7cosiZCNgA==
X-Received: by 2002:a5d:65d2:: with SMTP id e18mr21674915wrw.31.1618933660297; 
 Tue, 20 Apr 2021 08:47:40 -0700 (PDT)
Received: from localhost.localdomain ([197.61.162.183])
 by smtp.googlemail.com with ESMTPSA id d5sm25025824wrx.15.2021.04.20.08.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 08:47:40 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/7] virtiofsd/passthrough_ll.c: Changed local allocations
 to GLib functions
Date: Tue, 20 Apr 2021 17:46:41 +0200
Message-Id: <20210420154643.58439-7-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420154643.58439-1-ma.mandourr@gmail.com>
References: <20210420154643.58439-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x433.google.com
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

Changed the allocations of some local variables to GLib's allocation
functions, such as g_try_malloc0(), and annotated those variables
as g_autofree. Subsequently, I was able to remove the calls to free().

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index b9260c26d4..886498e8c3 100644
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
@@ -2727,7 +2726,7 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
                         size_t size)
 {
     struct lo_data *lo = lo_data(req);
-    char *value = NULL;
+    g_autofree char *value = NULL;
     char procname[64];
     const char *name;
     char *mapped_name;
@@ -2768,7 +2767,7 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
              ino, name, size);
 
     if (size) {
-        value = malloc(size);
+        value = g_try_malloc(size);
         if (!value) {
             goto out_err;
         }
@@ -2807,8 +2806,6 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
         fuse_reply_xattr(req, ret);
     }
 out_free:
-    free(value);
-
     if (fd >= 0) {
         close(fd);
     }
@@ -2827,7 +2824,7 @@ out:
 static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
 {
     struct lo_data *lo = lo_data(req);
-    char *value = NULL;
+    g_autofree char *value = NULL;
     char procname[64];
     struct lo_inode *inode;
     ssize_t ret;
@@ -2849,7 +2846,7 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
              size);
 
     if (size) {
-        value = malloc(size);
+        value = g_try_malloc(size);
         if (!value) {
             goto out_err;
         }
@@ -2934,8 +2931,6 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
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


