Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 803063FA15F
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Aug 2021 00:04:29 +0200 (CEST)
Received: from localhost ([::1]:56134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJjxc-0004Px-2X
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 18:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1mJjwL-0003Ah-Q8; Fri, 27 Aug 2021 18:03:09 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1mJjwK-0006tP-3R; Fri, 27 Aug 2021 18:03:09 -0400
Received: by mail-wr1-x433.google.com with SMTP id g18so4959265wrc.11;
 Fri, 27 Aug 2021 15:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XhXzCGSOTrH6hrDItj3BNllzLNP6W7JJPv+xWmyaTBs=;
 b=fkdOZAEaK5slPNq0bOp9BBDYJlDhxrGuMN3lKALKpY1dykmlvYaIjQg3wEBfSIqNax
 4dOP7/CBwIxthFQoEyye04Br4jHxS+wfF5O0SYB2k4W6aRlR5LzGinnkbL4lCUWh+LgF
 6erm0A+chWDnDLCy1cZdg59tAEMlUMFcpJ8aYeC1Cb8xeI1F4iur2qMxUxnJCoKqDBzB
 TN2IAC45djtLALLb8AmQZN6Mz765e4+OazPTLXapBkbfrhJaOsDkZAdyqiaz2Atxzfs0
 uceGldXYif9lJh8UiYcyH34dTLM2K1IUNfYKrji3+jPH7PLbDvrYNfH2H9pRNC4vxVl4
 ymiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XhXzCGSOTrH6hrDItj3BNllzLNP6W7JJPv+xWmyaTBs=;
 b=C12THGNCrTtBm4uon1YMMayKt5L2dXwKIlIJZZwV4P/IKkr7ZAyRiGKp1yekb+dzGW
 O6jvNXJPSnbIWvGxq9wxMHc0MdNogFZru/pCFgPPNmy9/aZW1TjfFF3da/Fh12L3paB3
 MN799VJh5V6XXI+MgrvHcEcmdHeCszOsF1qR8LvpuiGCKq1hoLygNSkIkVq1iuLM8Srt
 GZuJdyKWQWKkyaTAAyR9Q+eP8NqcJqhtkLQPx3frFYx2rvCZFmxPAcyfflBPlT6W60Jp
 jhsaFgAVUD403h8uOu7JM5bk6ZgbAjS14yN4ONQ++F8PNCzzvCEANaLPLBnMinWj4/23
 UJ9A==
X-Gm-Message-State: AOAM532PC/9iVdLfRikJuboyQjUhM/Pg3HMAlZ/m7JubGmsUpTZv2p9Y
 KPX42o40H2TZ5qmFtWlR0tKePZMMNop0Bg==
X-Google-Smtp-Source: ABdhPJxgREljNzYvwnl1ClhhXqYJEhacuSuTsVWUY/NQAgO+iwp+mZTW9DeW4u6IxR6VF4aLSA89VQ==
X-Received: by 2002:a5d:6cd4:: with SMTP id c20mr694056wrc.341.1630101784936; 
 Fri, 27 Aug 2021 15:03:04 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id u16sm7414779wmc.41.2021.08.27.15.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 15:03:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] block/export/fuse.c: fix fuse-lseek on uclibc or musl
Date: Sat, 28 Aug 2021 00:03:01 +0200
Message-Id: <20210827220301.272887-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=fontaine.fabrice@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Include linux/fs.h to avoid the following build failure on uclibc or
musl raised since version 6.0.0:

../block/export/fuse.c: In function 'fuse_lseek':
../block/export/fuse.c:641:19: error: 'SEEK_HOLE' undeclared (first use in this function)
  641 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
      |                   ^~~~~~~~~
../block/export/fuse.c:641:19: note: each undeclared identifier is reported only once for each function it appears in
../block/export/fuse.c:641:42: error: 'SEEK_DATA' undeclared (first use in this function); did you mean 'SEEK_SET'?
  641 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
      |                                          ^~~~~~~~~
      |                                          SEEK_SET

Fixes:
 - http://autobuild.buildroot.org/results/33c90ebf04997f4d3557cfa66abc9cf9a3076137

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 block/export/fuse.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index fc7b07d2b5..2e3bf8270b 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -31,6 +31,9 @@
 #include <fuse.h>
 #include <fuse_lowlevel.h>
 
+#ifdef __linux__
+#include <linux/fs.h>
+#endif
 
 /* Prevent overly long bounce buffer allocations */
 #define FUSE_MAX_BOUNCE_BYTES (MIN(BDRV_REQUEST_MAX_BYTES, 64 * 1024 * 1024))
-- 
2.32.0


