Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB74339F30
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 17:45:40 +0100 (CET)
Received: from localhost ([::1]:38998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL7OV-0008KB-Gh
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 11:45:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lL7HO-0002Vt-R1
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:38:18 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lL7HL-0007MU-H0
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:38:18 -0500
Received: by mail-wr1-x433.google.com with SMTP id j7so3438011wrd.1
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 08:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FBWETjBx7yR8JhCne1xrs11sERKEjTujz/IcxswUR6c=;
 b=LsdbMdYNFEnv732xQltVLIvXeLbi+qR+SFfK5oUMdhpXbB0gXi63Vzdx3Cs4d+1gsM
 4KmCZcQyNZX+ZVXGBUt/SUue21YQOY1SGzgaY8mI/Ixk23baL//MwII/fU+x8pasuJZ3
 M5/8z9f3OV1XYwZ/LM48XTebmlNnZ+cRxXKOwqDbsvLqgJQvRMNtpRmK/hSNLzPzwKAD
 8yZXdIABfJItDx5OiZuas9xg9YOfyG3I0E8OmTF2C/qq9N5czk97Yl2KviwZIdRL8qMQ
 6R9vss4IIbAmCVhug0Iv9mskR3ejC5CywRGjSHJCEdjQSPUIXuHEHn1yBwjiL3lLXsgP
 AfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FBWETjBx7yR8JhCne1xrs11sERKEjTujz/IcxswUR6c=;
 b=n73sXAneFpitANjfBs12CthDW+DoEfowtybXbR4dO7lgyYiO4jo3GtoguWb6NHEeVf
 OBNBGLOnBwnt9Mkobg0nI4bxUVBvYPC+NyrLKfDLLr5Q65P2JB+rFUnCAgMBMbfOxPYf
 9qKpbh676azcoCfgedoQ3/qSa8JGvsgeHUrD7y2aQyxOulKm1gJHdKDlzgmmWmVx8eZ5
 wVPWt5mYjxEXTxBOw/8/yy6fF6J6Q82G9F4VVOWjAHVPdAUf5LIwITYBol451lzZWi7C
 ByOhYWhOZb/QAw1VxOR1imuOBMBEJJyKIf5uAqhIIvOfCpyofXwPevimFpKBmV4Rp7Vc
 J2DQ==
X-Gm-Message-State: AOAM531fx83JIowYKnXL+TYdRJs0sKfIJYvTKfJsT7p1JQ54hjily4kf
 U09HeVQXoEfgQOn4NolR7yxNwHGg35s=
X-Google-Smtp-Source: ABdhPJz9Tc/gsFq+AKRp1HYIUnmFnrTJ7b9oW7KhYcmGBewdl6xWeSnevORhsi5s0aYZ+RjfOIhttA==
X-Received: by 2002:adf:ecca:: with SMTP id s10mr18803479wro.324.1615653491884; 
 Sat, 13 Mar 2021 08:38:11 -0800 (PST)
Received: from localhost.localdomain ([197.61.164.30])
 by smtp.googlemail.com with ESMTPSA id n6sm13173441wrt.1.2021.03.13.08.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 08:38:11 -0800 (PST)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/9] tools/virtiofsd/buffer.c: replaced a calloc call with
 GLib's g_try_new0
Date: Sat, 13 Mar 2021 18:36:51 +0200
Message-Id: <20210313163653.37089-8-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210313163653.37089-1-ma.mandourr@gmail.com>
References: <20210313163653.37089-1-ma.mandourr@gmail.com>
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaced a call to calloc() and its respective free() call
with GLib's g_try_new0() and g_free() calls.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 tools/virtiofsd/buffer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/virtiofsd/buffer.c b/tools/virtiofsd/buffer.c
index 874f01c488..b5f04be356 100644
--- a/tools/virtiofsd/buffer.c
+++ b/tools/virtiofsd/buffer.c
@@ -37,7 +37,7 @@ static ssize_t fuse_buf_writev(struct fuse_buf *out_buf,
     struct iovec *iov;
     int fd = out_buf->fd;
 
-    iov = calloc(iovcnt, sizeof(struct iovec));
+    iov = g_try_new0(struct iovec, iovcnt);
     if (!iov) {
         return -ENOMEM;
     }
@@ -61,7 +61,7 @@ static ssize_t fuse_buf_writev(struct fuse_buf *out_buf,
         res = -errno;
     }
 
-    free(iov);
+    g_free(iov);
     return res;
 }
 
-- 
2.25.1


