Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DFE62F3CD
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 12:34:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovzcU-0002MM-N9; Fri, 18 Nov 2022 06:33:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovzcS-0002Ll-S5
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 06:33:16 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovzcR-0002xR-0I
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 06:33:16 -0500
Received: by mail-wr1-x42c.google.com with SMTP id l14so8877932wrw.2
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 03:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qULwiyV9C4bIT1QDUCkTK52AWSmcqnEMRqJzJ8/vEmQ=;
 b=RZxzCznsyvGCbW8r5P46u67U4Mv4fmdlvaHeu6GQyH8r8bhbBXhyuzeHiJ5yXqAxld
 /Zd0jE8F4fs8XGsUnKBcGIL9IXXsCX/VK2cbKjKB/31qcpuMouu+5gid7YTimaJYF2fg
 c0jqhlaKjUJ8fJGdVSMOzhVv8lwncP8Slr/xgLQL0nXVCLPAHFUL9BMLNKovNb0cuKmo
 Cx6nxhstb1St7RTvI9e75sZ0kxz4Ig9Zy8hluGd9WgHLrixwpr/lqcmEPn0RSdegJjI3
 iyN+z+OoNJrwTiwfn1N0GeC2cXiILZYY4yjVmqJfrRaNzXWRyUoLfxJr04QnhbMi6j4e
 hk+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qULwiyV9C4bIT1QDUCkTK52AWSmcqnEMRqJzJ8/vEmQ=;
 b=gKZI6Gu1ZlX0gEiKVoVOcL4DAY4COyk1HTlRvROJNGT/0C36Zl7hCsdwCI4ukmzRJD
 bLw9ZXrZlJkWdEa347KmLwu1yXa24yNF9QDPFXVDYdmNZmEv/yyUfRY1RWAMIjW7igVq
 g/Q4uQy3dKXHkPqCIhIXuUQdU/z/cLLOyrURhFV9JjRYK7ViRWR6D4HXkDQSwcKPe+Xs
 DisvSk+W9wZnwRtfHGd1qUeR/7/bO02GnqccDf4mhXn1ehtF2ACSkVSAvTyrYOWtBEsA
 IAXmI9jo4JJw4pLJASKHVobCxciegjzcThDgeBvKfTQUmpfdwqN4hvRhsnVR1Mc0TIrt
 lNYA==
X-Gm-Message-State: ANoB5pli3Nkhr8X/RudhVcwRo7EcNpGj/GJ6ji0VU8opQH6zU6hCzE8u
 uX34HZvz2rSyTwPP710X1AmZCA==
X-Google-Smtp-Source: AA0mqf5UfRr3aY7DhOUM6YB/jUxUfKy5QiPeklKnBN6hl9YEIqgtwvT2ArjtCntzncLjBjLHsjBpMA==
X-Received: by 2002:adf:f8d0:0:b0:22c:d1ad:3f9c with SMTP id
 f16-20020adff8d0000000b0022cd1ad3f9cmr3873583wrq.445.1668771192905; 
 Fri, 18 Nov 2022 03:33:12 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a7bc854000000b003b476cabf1csm4212138wml.26.2022.11.18.03.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 03:33:12 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AA10A1FFB7;
 Fri, 18 Nov 2022 11:33:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, philmd@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH] tests/avocado: use new rootfs for orangepi test
Date: Fri, 18 Nov 2022 11:33:09 +0000
Message-Id: <20221118113309.1057790-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

The old URL wasn't stable. I suspect the current URL will only be
stable for a few months so maybe we need another strategy for hosting
rootfs snapshots?

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/boot_linux_console.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 4c9d551f47..5a2923c423 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -793,8 +793,8 @@ def test_arm_orangepi_sd(self):
         dtb_path = '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
         rootfs_url = ('http://storage.kernelci.org/images/rootfs/buildroot/'
-                      'kci-2019.02/armel/base/rootfs.ext2.xz')
-        rootfs_hash = '692510cb625efda31640d1de0a8d60e26040f061'
+                      'buildroot-baseline/20221116.0/armel/rootfs.ext2.xz')
+        rootfs_hash = 'fae32f337c7b87547b10f42599acf109da8b6d9a'
         rootfs_path_xz = self.fetch_asset(rootfs_url, asset_hash=rootfs_hash)
         rootfs_path = os.path.join(self.workdir, 'rootfs.cpio')
         archive.lzma_uncompress(rootfs_path_xz, rootfs_path)
-- 
2.34.1


