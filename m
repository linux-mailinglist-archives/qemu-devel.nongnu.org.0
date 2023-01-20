Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE36675481
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:31:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqVq-0001vX-Ht; Fri, 20 Jan 2023 07:28:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIqVj-0001PO-3K
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:28:47 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIqVh-0000hp-CZ
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:28:46 -0500
Received: by mail-wr1-x42f.google.com with SMTP id z5so4712842wrt.6
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 04:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y5K7GVk319HceZFwLFPBQxm2KAN+sqelChVQ5yqjTG4=;
 b=x2B8LUiw2OU1kAfbDg55M2Oa9VuscQakN/yOnl34OC9zhLeFjNUFJTzUtjNqmfTpSg
 TQr+NZbUEEdFTV5o5FpTPxitmw+fS9q22QmUEIAosB2W2TIhjX7ZN6fEt4tKGfEFbPLW
 dWBSXNlAHmfymw7iisoECyMN0PB8pZE0uUwfGjXkzhDpPkJhvctA5Jk6Httb49XI5w04
 w6q4WAX/Z6loBcU39gNoamDdN5KR67OgZ7iVku3K7lx2YL4wXmDUdxq3hltkekUlVCNg
 FgnQ4Y0a/iOp6FGTfOqTFjF4sYO9t5YAULCyja6vxXnz+Rvh/TaJaITGHRjgzNdXdQZg
 AdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y5K7GVk319HceZFwLFPBQxm2KAN+sqelChVQ5yqjTG4=;
 b=M8SVLHXEI3prg+ikkU2Sm7jPJ1P/cBtFQDrT/3o4kCwseJtiqYua7GrfCw2PwqUH1B
 pF06YwJ5rCzSL4MtBFx8v4VPzYqe2BMY0vgx5bR6N2F+JIFqLwsEuR2mS5pX/iAh09qh
 Co/YFukdfm63AlV0IhXxWxeuGr+sOhhmxZGwW/VoCxredkIjoIX90G0aMAtrD/UoDxP3
 A+bIl6mGccN0+DD1y1hZ1OYfveO++Rzyi//8YMRitx895SkDynSMr9o/e0TK+OmT1mhn
 9TiNIw0RMMEi9OQEfj3M+qIVxJDQT79jwUfBv1nDmrYhjmfDIGq63CEvk9jwntuKzTtu
 EFZg==
X-Gm-Message-State: AFqh2kqLDz7N+BJJyiTDBkQLzTcge4bhx0nLD7OKMe43IZZhDzNhtbQh
 cMXsWz/G7E82xVkDfwTMDn+blnmaUu0lh/SC
X-Google-Smtp-Source: AMrXdXuTtw4OEmH2G/b7KIhLYdOjM9xscDOG6vnc2VLvLTo3DWulmQaOfFf+kZGafuHBp1qmNUvsfw==
X-Received: by 2002:adf:ffc3:0:b0:2bb:ede4:5dd4 with SMTP id
 x3-20020adfffc3000000b002bbede45dd4mr23298180wrs.34.1674217723825; 
 Fri, 20 Jan 2023 04:28:43 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a5d6747000000b002b57bae7174sm36386286wrw.5.2023.01.20.04.28.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 04:28:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 1/2] tests/avocado: Factor file_truncate() helper out
Date: Fri, 20 Jan 2023 13:28:35 +0100
Message-Id: <20230120122836.81675-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230120122836.81675-1-philmd@linaro.org>
References: <20230120122836.81675-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Factor file_truncate() helper out of image_pow2ceil_expand()
for reuse.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/avocado/boot_linux_console.py | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 8c1d981586..49a4b22fe1 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -30,15 +30,19 @@
 def pow2ceil(x):
     return 1 if x == 0 else 2**(x - 1).bit_length()
 
+"""
+Truncate file
+"""
+def file_truncate(path, size):
+    if size != os.path.getsize(path):
+        with open(path, 'ab+') as fd:
+            fd.truncate(size)
+
 """
 Expand file size to next power of 2
 """
 def image_pow2ceil_expand(path):
-        size = os.path.getsize(path)
-        size_aligned = pow2ceil(size)
-        if size != size_aligned:
-            with open(path, 'ab+') as fd:
-                fd.truncate(size_aligned)
+    file_truncate(path, pow2ceil(size))
 
 class LinuxKernelTest(QemuSystemTest):
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
-- 
2.38.1


