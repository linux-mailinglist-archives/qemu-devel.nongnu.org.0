Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7B4671C6E
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 13:45:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI7nV-0006Gv-Ck; Wed, 18 Jan 2023 07:44:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pI7nP-0006Fb-8N
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:44:03 -0500
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pI7nN-0006vJ-L8
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:44:03 -0500
Received: by mail-oi1-x229.google.com with SMTP id d188so17331623oia.3
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 04:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VQ0HV4ABPoswzzyafBmNSldjR99NF5+QCvcSo1iG33k=;
 b=VYNwuIltHyBfVGvE0hK8wptASl+yBg4e2/SMFC5mJbM7vW3IUFtOh2ZRUFrbATcu7C
 HkEOwo7XNSA6KHvwzx9E8ZuLfOxaaPVcwHtUIQN/Mud2xSRyPMfyknz1fEot9eDmLGdT
 4ahKO+6bOHwGaxWD4SGvuD+8/Zfu59SQUYyf4yQY+bOYvsqxVEGPoZ8CiSJK0tgntQpR
 6figEbm51Hh8JjJvZZcuRcusYrTqqe5qBg5XjozbtjQZgtlvLyIHF3qfHpXAebOotC5P
 r2X5dId3e7vfkeag80tCsqevYwWOjcrl1F5Bmitn5jCJ3lb1mbvSlxaUS0y80tOM0VyS
 UZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VQ0HV4ABPoswzzyafBmNSldjR99NF5+QCvcSo1iG33k=;
 b=Oyiu7f6xGIBUtCoHmS81rXIlqIL5OoR/U6MNsrpYZuUQ0WAlZYJv7+vWUu6p9OkwSh
 Y3ZqOmikBCzXlT41Xf32rVaLwTsV11fpZXP/Glxvl0Lbl23SvRQt5TI+MYX3Fhs8+OIJ
 BrAlg6S/9DZh4vhouQJJ3//kACshCz9xvza/ObA+Yes2Wd1lp/QrylPUmwJ/Mqk+KMGI
 uqw4DPkqKodGK43iej7T3cvFawN4ApBd3LibwkyhVqJBcQJ9Dl4K09+S4cu/z//fiBX8
 TvCeWN2PwT2lpl9FCKHZ3LaJsIlnWrlPmECel9FNpBMjxBq9F4veYA+UloWbzThLVRGi
 L40Q==
X-Gm-Message-State: AFqh2kqYbQw3cWbNlT/Yd4tNQpzpQvmKTFFapMQjw/ncxooI9S8m/Hdy
 ioq/xZjp22fvUwkJC9JvD0uC4rnhbj3BstVRiMU=
X-Google-Smtp-Source: AMrXdXv6Y5aJmtiADk1CFAvSotmRiJqHNggQqcobwB39NwOPZsPu6zkndKQvGxa0ebsLVhnhs1Eukw==
X-Received: by 2002:a05:6808:20a9:b0:363:8f75:a1bc with SMTP id
 s41-20020a05680820a900b003638f75a1bcmr4303782oiw.15.1674045840205; 
 Wed, 18 Jan 2023 04:44:00 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 cb2-20020a056830618200b0068460566f4bsm18158432otb.30.2023.01.18.04.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 04:43:59 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 2/3] avocado_qemu: add AVOCADO_DEFAULT_ARCH for cross-arch
 tests
Date: Wed, 18 Jan 2023 09:43:47 -0300
Message-Id: <20230118124348.364771-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118124348.364771-1-dbarboza@ventanamicro.com>
References: <20230118124348.364771-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

All avocado tests that are arch agnostic (i.e. does not set an 'arch'
tag) are run with arch=None in pick_default_qemu_bin(), and then 'arch'
is set to os.uname()[4], meaning that it will take the arch of the
running host.

This means that if one compiles QEMU binaries for non-x86 targets on an
x86 machine, and then run 'make check-avocado', all arch agnostic tests
will be cancelled because there's no qemu-system-x86_64 to be found.

There is no particular reason to not allow these tests to be run with
other arch binaries in a x86_64 host. Allow the developer to do it by
adding a a new env variable called AVOCADO_DEFAULT_ARCH. Any 'arch' that
is set by this variable will take precedence of setting it via
os.uname()[4]. We can then run non-x86 binaries tests in a x86_64 host
as follows:

$ AVOCADO_DEFAULT_ARCH=riscv64 make check-avocado
(...)
RESULTS: PASS 11 | ERROR 0 | FAIL 0 | SKIP 1 | WARN 0 | INTERRUPT 0 | CANCEL 0

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 docs/devel/testing.rst                 | 7 +++++++
 tests/avocado/avocado_qemu/__init__.py | 9 ++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index e10c47b5a7..95d0a3e626 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -1144,6 +1144,13 @@ the framework or by the test itself.  At the framework level, it will
 currently influence the selection of a QEMU binary (when one is not
 explicitly given).
 
+When ``arch`` is not set, an env variable AVOCADO_DEFAULT_ARCH can
+be used as default value if set.  This allows hosts of different
+architectures to run arch-agnostic tests using binaries from other
+archs (i.e. a x86_64 host can use aarch64/riscv64 binaries as
+default).  If this variable isn't set, ``arch`` defaults to the
+host system arch given by ``os.uname``.
+
 Tests are also free to use this attribute value, for their own needs.
 A test may, for instance, use the same value when selecting the
 architecture of a kernel or disk image to boot a VM with.
diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 8614ac3978..bc42985cbb 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -107,14 +107,17 @@ def pick_default_qemu_bin(bin_prefix='qemu-system-', arch=None):
     directory or in the source tree root directory.
 
     :param arch: the arch to use when looking for a QEMU binary (the target
-                 will match the arch given).  If None (the default), arch
-                 will be the current host system arch (as given by
-                 :func:`os.uname`).
+                 will match the arch given).  If None (the default), check
+                 if the AVOCADO_DEFAULT_ARCH env var is set and use it as
+                 arch.  If it's not set, arch will be the current host
+                 system arch (as given by :func:`os.uname`).
     :type arch: str
     :returns: the path to the default QEMU binary or None if one could not
               be found
     :rtype: str or None
     """
+    if arch is None:
+        arch = os.getenv('AVOCADO_DEFAULT_ARCH')
     if arch is None:
         arch = os.uname()[4]
     # qemu binary path does not match arch for powerpc, handle it
-- 
2.39.0


