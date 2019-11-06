Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6375F1924
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Nov 2019 15:53:09 +0100 (CET)
Received: from localhost ([::1]:59704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSMgG-0008J2-RE
	for lists+qemu-devel@lfdr.de; Wed, 06 Nov 2019 09:53:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35322)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcel.apfelbaum@gmail.com>) id 1iSMek-00073k-8J
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 09:51:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcel.apfelbaum@gmail.com>) id 1iSMej-00041T-6k
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 09:51:34 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:55988)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1iSMej-00040G-0x
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 09:51:33 -0500
Received: by mail-wm1-x342.google.com with SMTP id b11so860539wmb.5
 for <qemu-devel@nongnu.org>; Wed, 06 Nov 2019 06:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ovURCSP5JXCPyC2mT33Og+1FsLn1SM62g4JS3pgQdkY=;
 b=d5FgI29HrDPIUPIV9T3sXMvOh4keDlResSCx/mqGCZmTB6Gh+93PH4UsB9CRy2H8G8
 wxPpWuaUXaabi4sbuxCaqllmsQosF4FlnK8CU9E+iWjEj9Bssfzcl8yl9hC49z759IWa
 ebJd0lUuH7Q//G7vxE3FSkdW0uJJGfxT9eYRcWH063sPRTzTcTSDs9iK3TtTmMKVNTlt
 MaK6vze8qei6TFd7pYh7/1f5BXve2u1UkyAOeTY7L68T+h3ADw00RsKUN50QYvaVfVuF
 KhSj3W9zAV7vw24jaJ3kYoiicg8+Ym1BM00gaLbyPFUvFmX3o94U7+c1Z6Ye7nDQ60nb
 qblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ovURCSP5JXCPyC2mT33Og+1FsLn1SM62g4JS3pgQdkY=;
 b=RI4PfvGdSqkTtKzuFQdMmMmAfopvcxYrEgV6TtP30rEbzDxg0kZ7+jLrHdQePFyeUH
 OBEAL2LBNYG93Bqa3qcRWNMpiI843DEYiZH5p1BhTniqvsxyQ3vFUOVYszHmy+qHJJmi
 lhU3eAql35skayUYJczhp5wJI+roNQy6P9pPq8hJQgdn/IDzUlcEXYl7lmFPuJ5tt81+
 Y8JedGOkSacAraBcRgR5xZRHqW81V3Uqh6rdkP2MIS8klbFtVXn/l76CjWfjVQW+3/K2
 ufmmTocm0YsB4YaQk2y64nUKwWaY+4MAYxbrKVaglGE+JExPSIY7mpQtpGlZuCewWSzY
 1exA==
X-Gm-Message-State: APjAAAVqz1xqDfJWJ6oSy9+3n0FDf0EA0K3Ks3NSvNHLfQAwydEKcWqj
 j5YRCFDBROnwk2S8MULRFx6zVq8u
X-Google-Smtp-Source: APXvYqx/1IhOwpMfK1PDQUwVEPQQSbc6tRYcQL6bYLAsW8WJ5BJ063vfgc7ulx2mi9fNCTzKAe3sGQ==
X-Received: by 2002:a1c:6854:: with SMTP id d81mr3058894wmc.75.1573051891727; 
 Wed, 06 Nov 2019 06:51:31 -0800 (PST)
Received: from localhost.localdomain ([37.142.144.12])
 by smtp.gmail.com with ESMTPSA id t133sm3116744wmb.1.2019.11.06.06.51.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 Nov 2019 06:51:31 -0800 (PST)
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [Qemu-devel] [PATCH PULL 1/2] configure: Check if we can use
 ibv_reg_mr_iova
Date: Wed,  6 Nov 2019 16:51:26 +0200
Message-Id: <20191106145127.23700-2-marcel.apfelbaum@gmail.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20191106145127.23700-1-marcel.apfelbaum@gmail.com>
References: <20191106145127.23700-1-marcel.apfelbaum@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: yuval.shaia@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yuval Shaia <yuval.shaia@oracle.com>

The function reg_mr_iova is an enhanced version of ibv_reg_mr function
that can help to easly register and use guest's MRs.

Add check in 'configure' phase to detect if we have libibverbs with this
support.

Signed-off-by: Yuval Shaia <yuval.shaia@oracle.com>
Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-Id: <20190818132107.18181-2-yuval.shaia@oracle.com>
Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
---
 configure | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/configure b/configure
index 72553f98ea..efe165edf9 100755
--- a/configure
+++ b/configure
@@ -3217,6 +3217,34 @@ else
     pvrdma="no"
 fi
 
+# Let's see if enhanced reg_mr is supported
+if test "$pvrdma" = "yes" ; then
+
+cat > $TMPC <<EOF &&
+#include <infiniband/verbs.h>
+
+int
+main(void)
+{
+    struct ibv_mr *mr;
+    struct ibv_pd *pd = NULL;
+    size_t length = 10;
+    uint64_t iova = 0;
+    int access = 0;
+    void *addr = NULL;
+
+    mr = ibv_reg_mr_iova(pd, addr, length, iova, access);
+
+    ibv_dereg_mr(mr);
+
+    return 0;
+}
+EOF
+    if ! compile_prog "" "-libverbs"; then
+        QEMU_CFLAGS="$QEMU_CFLAGS -DLEGACY_RDMA_REG_MR"
+    fi
+fi
+
 ##########################################
 # VNC SASL detection
 if test "$vnc" = "yes" && test "$vnc_sasl" != "no" ; then
-- 
2.17.2


