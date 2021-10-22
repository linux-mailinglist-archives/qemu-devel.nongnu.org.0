Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C7D43752B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 11:55:25 +0200 (CEST)
Received: from localhost ([::1]:42072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdrGm-0008Sb-8C
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 05:55:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1mdrFK-0007dh-JA; Fri, 22 Oct 2021 05:53:54 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1mdrFI-0001Mn-4u; Fri, 22 Oct 2021 05:53:53 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso2753873wmc.1; 
 Fri, 22 Oct 2021 02:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vwGdRKci3ZcNcStPpM0Q7+Z34Cq1DJ0kFqnISlcdnxc=;
 b=UUGDKZQTwZToZ7Md5ZV3EJ0i045PXAklSZsfXTEcscjdxAtwiqBjZ6exKqUyEynTna
 nx8GVVgDn7kV1qdJ9QGYh0quynxzwm1iPdZE2dCqgK6YNWVlPFKZwQfVkm9GU5eJeHeq
 aJGFIjDQxC0lRQyyWJR5QIqhlb2UQkVmYlC/U4cL6ejo3OAkuTE/QBOE7FXUp2FRLq5a
 5wkY2JZyUkkycQybUeH39293p1tK3D8LndlhdN8sFii58IN463NkcaRWFwm6IMF68+wt
 KLQ6TFYrsLuJSO80nP12WPic5X0vz0eXL9NJWbSDUEO5e/sOUGhD0aLaYc1OwWP8t3T4
 BgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vwGdRKci3ZcNcStPpM0Q7+Z34Cq1DJ0kFqnISlcdnxc=;
 b=NCjYgUrEvU16n2jc7MX3bfidC50v015gei/du8t259QTVydoay28vzKjPYAD3tuheg
 BY4hA0iG4GbHjvtUlfBBZdA5z5Cy7JXKsFoO8nage3HaeyAczY6D8nGFZKVOY19VXVWZ
 eaVzl7VSPRq88j0DqiV+DOlShB0CuM303JZTp1GPLjW7Zzb0KxmqKkg1xecV5yk6nB6u
 jz1aLzhyB0dgYhXA8vo6MxZLNvKuRDgmLXwmHvP5p0XirL4hCLQK5EKd7rd1iOnYOPAw
 XvTTsO9L4Lxuz7//tT1CJF1n2CW8HQyoyaFFDJSsO9Zfe/cqfNXuuFxi81lREJAS+MQ2
 rBgg==
X-Gm-Message-State: AOAM533GZV8y1qXAJ19I6ai4nad7P3uXbnVoMF/+OMoRgIyN7C9JifSg
 SrSwIFfLWo7YrcDKygGURPrAojatIMU=
X-Google-Smtp-Source: ABdhPJzC0xf2eYS0vpUar9KNJ4KxJVbCtLOM9vlpj4AQlX9jQq/Gf5Wx+cNFFtww2UeBlNXNaxbzQw==
X-Received: by 2002:a1c:e911:: with SMTP id q17mr12511105wmc.174.1634896429404; 
 Fri, 22 Oct 2021 02:53:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id u10sm9278508wrs.5.2021.10.22.02.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 02:53:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] block/export/fuse.c: fix musl build
Date: Fri, 22 Oct 2021 11:52:09 +0200
Message-Id: <20211022095209.1319671-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=fontaine.fabrice@gmail.com; helo=mail-wm1-x331.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Include linux/falloc.h if CONFIG_FALLOCATE_ZERO_RANGE is defined to fix
https://gitlab.com/qemu-project/qemu/-/commit/50482fda98bd62e072c30b7ea73c985c4e9d9bbb
and avoid the following build failure on musl:

../block/export/fuse.c: In function 'fuse_fallocate':
../block/export/fuse.c:643:21: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
  643 |     else if (mode & FALLOC_FL_ZERO_RANGE) {
      |                     ^~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/be24433a429fda681fb66698160132c1c99bc53b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 block/export/fuse.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index 2e3bf8270b..823c126d23 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -31,6 +31,10 @@
 #include <fuse.h>
 #include <fuse_lowlevel.h>
 
+#if defined(CONFIG_FALLOCATE_ZERO_RANGE)
+#include <linux/falloc.h>
+#endif
+
 #ifdef __linux__
 #include <linux/fs.h>
 #endif
-- 
2.33.0


