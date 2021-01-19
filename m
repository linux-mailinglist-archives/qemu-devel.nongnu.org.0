Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 800792FBE9D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:12:37 +0100 (CET)
Received: from localhost ([::1]:44462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1vUa-0006BY-8r
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:12:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1vB4-00012M-S5
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:52:27 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1vAv-0003nI-3W
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:52:26 -0500
Received: by mail-wm1-x32a.google.com with SMTP id m187so591562wme.2
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 09:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l9hs2c1uUiGj7MHevQ781qlr6u6iQ0XBGuGPt72flqQ=;
 b=iB0kqQYAowRt+V2KPtEaKcSP2sDe4IlJfkIO+iE0nTIvD5csYOSiE5hoSec7OLx9mX
 ZB/Z4m1aWJHqfISGPG+53GA9142wLc+H8nvCQ9B1mSAJUVjqEbtr2GIIYdBBIn2/QgYe
 GHGyETilsvWpbkHihuG4iYyHakF2KBYjXp3NPld8+tXknvtUoTNwSUGXacekQY0q+jsd
 DmfAvacIuyrxWIrynQzSRcQn23UjZtmwl0Hzv8FP5aDsFLt8HdodwnXKhPTSxsOvFMYT
 vhtSjQN/4fX9/Y/3RdYoI0vvrzVKVYbtHQrf3914TTwMhc+TsnmYyzqA717dW3pD3ncT
 1fqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l9hs2c1uUiGj7MHevQ781qlr6u6iQ0XBGuGPt72flqQ=;
 b=iT/yJQ3+RLemRBr30VhRWtTc3rrlnHZZrq3sEX49n3GTH1LjM1rSS8F5Wm3P1aYvJC
 RhhIeVVBw02I6Bn3bA7qmJ8zUERNRuXrZANtaGuaavFrdEPDVoyVOo2B3lIpj4TFv8Fz
 1wT5M1fzQ/UhqJKyYnXqVnVVXHTPhEKSZCjLubp+A2CgutfBqGK6OBvATT1JrkKqFA9S
 ffj7Gi0KsYk1DdYkH1iAHIFDiN599rWcRYEJ3N2zVx0p+ZC8TIQiBOKoUwqVP+Wm4rkr
 NYHn3QNkSMrH6gMhBTOno3+m1j6rZhVuMiuhUdoqCPfpkxZsdwR9UTPQ8hdRguj/R8yL
 ZENQ==
X-Gm-Message-State: AOAM5329rhanKacJUICg/f5nEsH3PVwgGg1QeGbL39bm8fNkchf4oT6M
 JURrqUolnN66GStJx/QVWLk2g3ooA2nd+aLM
X-Google-Smtp-Source: ABdhPJyrY1Vh1ZnvkM4Ctxsn1/365A9wMsHwauJvl+C0468PPZO237aHWqucjiVXruAh3A/O8lo/9Q==
X-Received: by 2002:a7b:c196:: with SMTP id y22mr713914wmi.91.1611078735692;
 Tue, 19 Jan 2021 09:52:15 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l18sm5381254wme.37.2021.01.19.09.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 09:52:12 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 642051FF90;
 Tue, 19 Jan 2021 17:52:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 4/6] tests/docker: preserve original name when copying libs
Date: Tue, 19 Jan 2021 17:52:05 +0000
Message-Id: <20210119175208.763-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119175208.763-1-alex.bennee@linaro.org>
References: <20210119175208.763-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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


