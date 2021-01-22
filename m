Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DFC300B04
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 19:21:53 +0100 (CET)
Received: from localhost ([::1]:38172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l314A-00016S-Mr
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 13:21:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l311X-0007Yy-27
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:19:07 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:54901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l311U-0006rR-0N
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:19:06 -0500
Received: by mail-wm1-x32e.google.com with SMTP id i63so5103348wma.4
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 10:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l9hs2c1uUiGj7MHevQ781qlr6u6iQ0XBGuGPt72flqQ=;
 b=g85OQIQ6WyiSKxgy1XA50KLRQVouYdEGG5XkK7gN7Ls1iBxkOpD26e84ytE4x8oxu1
 +wOP6+bRIBiZomY6UptUw8M9KWoDAs9Dt92D8b5fqRKUV6ybQ92HHwR74FT6kDs1c0lM
 z2AR09w+qmcJIvpmKpblNs+ZIumIrccaSCaxYPN14XO/dC+WfBcBz9zfEgOEE0uOhIOh
 PvfOym+LMnrCUQqmycD+k5n005MxQKCoFJKkfTK4mtntdWhTQgNbnWFmFf3LrgCbhfaC
 km4rRM+7xwKZ8NIB4ROVdp//RImMt5+ZCHeMt+nNqVVHbCwPQ2vUJ1Ky0EnXxGwkMRyl
 1r1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l9hs2c1uUiGj7MHevQ781qlr6u6iQ0XBGuGPt72flqQ=;
 b=bJuQI8lOYa53A4ICZTqc/qAdb+4jCkYsaanflqy2hEdBwr4rSSOVSCjkU0++zsV0tO
 Bl8oySpGEZgXjRwC4leDqNd/9LjCSsM+tzIFVA47iHBadDRtxKQKNRTNov2KimQgq0HK
 Str2vYEmf+SRh8wUq6dmas7Eq7NBDuHkf+y0b4g2rFeXg5Y1zi7207U8j9D2Hwi7PyFq
 hS6Gd3y4LrCwyC2/vrhRzn6ZmQsuu5Un5TQn66qhEa+pLBY21Kx6e9ZHqR9zak78hZAK
 PG84jsTtIcZsSk1z9zaGWTXjC1VHomZ8HYPajxCGavXK2iTIbI1asl7c9RvhSjK6nBgQ
 LOjg==
X-Gm-Message-State: AOAM533FqO/K1vhk9T63SD53ZpS22h+wGmPp8QnBkyS2/I9HNRZswl+d
 6z5KQVLy6FBTCXqcy0s89uTHFvvgYQOxXUZd
X-Google-Smtp-Source: ABdhPJxJRIDYsciM/YD2Qi6S9uIv5HHIB1b4hzojLVkoRbmiX6iKrb96OA/rZTl8w95H08+3I6WSFQ==
X-Received: by 2002:a1c:9e4b:: with SMTP id h72mr5248884wme.116.1611339542760; 
 Fri, 22 Jan 2021 10:19:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q2sm12187529wma.6.2021.01.22.10.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 10:18:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 060A41FF90;
 Fri, 22 Jan 2021 18:18:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] tests/docker: preserve original name when copying libs
Date: Fri, 22 Jan 2021 18:18:50 +0000
Message-Id: <20210122181854.23105-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210122181854.23105-1-alex.bennee@linaro.org>
References: <20210122181854.23105-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While it is important we chase down the symlinks to copy the correct
data we can confuse the kernel by renaming the interpreter to what is
in the binary. Extend _copy_with_mkdir to preserve the original name
of the file when asked.

Fixes: 5e33f7fead ("tests/docker: better handle symlinked libs")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/docker.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index fb3de41c0b..39da3fefcf 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -93,7 +93,7 @@ def _guess_engine_command():
                     commands_txt)
 
 
-def _copy_with_mkdir(src, root_dir, sub_path='.'):
+def _copy_with_mkdir(src, root_dir, sub_path='.', name=None):
     """Copy src into root_dir, creating sub_path as needed."""
     dest_dir = os.path.normpath("%s/%s" % (root_dir, sub_path))
     try:
@@ -102,7 +102,7 @@ def _copy_with_mkdir(src, root_dir, sub_path='.'):
         # we can safely ignore already created directories
         pass
 
-    dest_file = "%s/%s" % (dest_dir, os.path.basename(src))
+    dest_file = "%s/%s" % (dest_dir, name if name else os.path.basename(src))
 
     try:
         copy(src, dest_file)
@@ -155,8 +155,9 @@ def _copy_binary_with_libs(src, bin_dest, dest_dir):
     if libs:
         for l in libs:
             so_path = os.path.dirname(l)
+            name = os.path.basename(l)
             real_l = os.path.realpath(l)
-            _copy_with_mkdir(real_l, dest_dir, so_path)
+            _copy_with_mkdir(real_l, dest_dir, so_path, name)
 
 
 def _check_binfmt_misc(executable):
-- 
2.20.1


