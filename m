Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334C5341E7E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:38:22 +0100 (CET)
Received: from localhost ([::1]:36784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFKX-0007nF-8Y
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lNF9B-0001Eq-JY
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:26:37 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lNF96-0004C8-RU
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:26:37 -0400
Received: by mail-wm1-x32d.google.com with SMTP id 12so5453381wmf.5
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 06:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pYkY/2Z/pLbSHd+jTUePpf2Jwa7tCLrS2ddiXxwQybM=;
 b=JA8INJ/EjLhiJttUKSQ1qbYZGiQRnPZrQ5Ys2eSo2N0fAx8cNp9VR1hJ6/8NHrQ3wh
 2dQTtnUjwGzEHWclphqWsy/5e1G+Nmhmtaq49ia3cIBJkOBna1S+NEojW/Mic5VH5r+C
 JnhF9rcvMvvtGJfuL0/CZjTKvk7RK8+/Po+4cqc/jSMp6DrfiLYF1f/FGeCnkIwqihWc
 H5NUycl9zOp29fUrgrZO+4EmpWd8n9Ou86B7DLgB9fYFbozvKncoG0sl8Jc72ll7dTVj
 JcbWCW+Ni4zVpJw/q/aG2URFhDR4L42ItfNRXSl6QzbCVf7S+9GTs/vZ8XsA7QnJpcJn
 iypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pYkY/2Z/pLbSHd+jTUePpf2Jwa7tCLrS2ddiXxwQybM=;
 b=nnSnfmTc9NATOqbLX3NR8l2XNCG8IqUzJw6I+6dN7MqvoL17uoCNmn6Yy5b9TJCfZ2
 Co+RrJPUs4pG03+klk4up+jBIg53Zb22xRg8gdHqVRqC4xeburwqlVgiQv7HXCFnz0dF
 wkDFaKIh9005M1o2kPe7DKtBO6g/8uvL7240YnAKbY+c6PpmWu6gnmaL1TTaAgcOPDAO
 S8bgTpqHNVOXqk8FotNsco+OY/mrzeXYU4+WVVsQyKfeKdkpQ93U5KaJqqPqgDCnXVPh
 qeDukL5eTw0CvR6ajSVRM3bCJqLQsRQeOEEU2CL9edCW3Gazmgk1q2UgZFpSswioctfe
 7jLQ==
X-Gm-Message-State: AOAM532lz0CwTLPDBvo186lKK8KkvcGxy/rSlj/7f1mhJFl+VpKOkDcV
 aEp11wfipZ5n652DgqvGaZjX98KLiac=
X-Google-Smtp-Source: ABdhPJw+GZe4pSB1/ybcG0At/uiwB+A5TeddMMAJEvx7k6KblvGEOm/vkVT3X7WFmT7hEg6DCT4WXA==
X-Received: by 2002:a1c:f20e:: with SMTP id s14mr3805771wmc.100.1616160390904; 
 Fri, 19 Mar 2021 06:26:30 -0700 (PDT)
Received: from localhost.localdomain ([102.47.92.134])
 by smtp.googlemail.com with ESMTPSA id v13sm8889584wrt.45.2021.03.19.06.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 06:26:30 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/8] virtiofsd: Changed allocations of fuse_session to GLib's
 functions
Date: Fri, 19 Mar 2021 15:25:23 +0200
Message-Id: <20210319132527.3118-5-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319132527.3118-1-ma.mandourr@gmail.com>
References: <20210319132527.3118-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaced the allocation and deallocation of fuse_session structs
from calloc() and free() calls to g_new0() and g_free().

Removed the NULL-check and used g_new0() mainly because fuse_session
creation is critical and an exit will occur anyway if fuse_session
allocation failed.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 tools/virtiofsd/fuse_lowlevel.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index 45527ff703..b0e9ef29a7 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -2467,7 +2467,7 @@ void fuse_session_destroy(struct fuse_session *se)
     free(se->vu_socket_path);
     se->vu_socket_path = NULL;
 
-    free(se);
+    g_free(se);
 }
 
 
@@ -2490,11 +2490,7 @@ struct fuse_session *fuse_session_new(struct fuse_args *args,
         return NULL;
     }
 
-    se = (struct fuse_session *)calloc(1, sizeof(struct fuse_session));
-    if (se == NULL) {
-        fuse_log(FUSE_LOG_ERR, "fuse: failed to allocate fuse object\n");
-        goto out1;
-    }
+    se = g_new0(struct fuse_session, 1);
     se->fd = -1;
     se->vu_listen_fd = -1;
     se->thread_pool_size = THREAD_POOL_SIZE;
@@ -2550,7 +2546,7 @@ struct fuse_session *fuse_session_new(struct fuse_args *args,
 out4:
     fuse_opt_free_args(args);
 out2:
-    free(se);
+    g_free(se);
 out1:
     return NULL;
 }
-- 
2.25.1


