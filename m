Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FE83B2004
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 20:06:24 +0200 (CEST)
Received: from localhost ([::1]:37754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw7GZ-0005yH-92
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 14:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lw7BB-0005zQ-PV; Wed, 23 Jun 2021 14:00:49 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:46698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lw7B8-000393-Ut; Wed, 23 Jun 2021 14:00:49 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 v20-20020a05600c2154b02901dcefb16af0so1921701wml.5; 
 Wed, 23 Jun 2021 11:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2XYaMzq79oJ14Mdhp8DY6/ioX+j6FXQDMcscp3/hpSM=;
 b=pq3bP9YV30SMxXr0g199HWQ2mwWrCaWuXViMQzax80LXWgezYHSfDhWxzg6EM6c7hS
 EOiNW+ydFQbkVXrLfW5ZpyrC8S84DQS78IUCoMvjs8o/TYFY+L5md+OL4xL2E03Fk7TG
 X2LgoPt40Tv+ui4U1v+9OJco0sLxBcXDM0EoshfqrdOMBANpaNbZiGsKkjbiO+c9/zWL
 4e3i7soZa7Qi41irTD0qGjbLrAJyDhccFRyTLpH9uADiY6qH0q+LnTRgGm9GX8upq+eB
 PBo8uX2unB9VAnNrFH/iZnbjDxlwyEnL7Klo3tVOrMSA0D3cfRcVdRSnK7XSYzlZCIXH
 nAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2XYaMzq79oJ14Mdhp8DY6/ioX+j6FXQDMcscp3/hpSM=;
 b=l2LQFI3vpw+cyKA83+eMmF2AIHRC1zjQlES+dlmXS6Ez9TU8Du0r9YoHZ3ymAbKAHR
 ELltpsxOaVQUeXRcB4AVp1aM2gsPFUs7a3vLYhNMRlLhqsakKdlQr+WaahGvBLcdkUKc
 IhxtbJ0MeZ3AqylHNVAzsFEw2eEqkuSNMDAAA+7OcUvjMGHM4fLv7Jw3RbUqVzmB20EO
 0CrLsPNECoZxOsMBqvYPCLomDSKxw78CQlCm53mcbJTxl6A9CN3Bb3WdOOa2ks4R4sm6
 97F2z/qupvCVoj3AW2GX+gCH1XDFE25uEctdbko1LNmsHq512680lDXckvO6Kz4UXbg1
 JhhQ==
X-Gm-Message-State: AOAM530LNpnp7dt8bdobmE81xQrtXilQjqAyJ8JdgC/xVlMggivYYMPu
 mYtv8stxnNQrJfo4dOYQpSlQ95IRR2Ycrw==
X-Google-Smtp-Source: ABdhPJwWA6U52E/h61LwJHok19ZJNSQbLwQOZDQGnqdwTlTdKEe3WQWCVBe58eGKN5N1QO3egwcXRg==
X-Received: by 2002:a05:600c:3791:: with SMTP id
 o17mr12503338wmr.187.1624471244908; 
 Wed, 23 Jun 2021 11:00:44 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id g83sm662070wma.10.2021.06.23.11.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 11:00:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] tests/acceptance: Extract image_expand() helper
Date: Wed, 23 Jun 2021 20:00:16 +0200
Message-Id: <20210623180021.898286-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623180021.898286-1-f4bug@amsat.org>
References: <20210623180021.898286-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Tom Yan <tom.ty89@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to expand an image to a non-power-of-2 value,
extract image_expand() from image_pow2ceil_expand().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/boot_linux_console.py | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 20d57c1a8c6..61069f0064f 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -35,15 +35,19 @@
 def pow2ceil(x):
     return 1 if x == 0 else 2**(x - 1).bit_length()
 
+"""
+Expand file size
+"""
+def image_expand(path, size):
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
+    image_expand(path, pow2ceil(os.path.getsize(path)))
 
 class LinuxKernelTest(Test):
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
-- 
2.31.1


