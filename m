Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2725E92DB
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:55:05 +0200 (CEST)
Received: from localhost ([::1]:44836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQDu-0002VX-Mn
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrM-0002qF-3e
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:44 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:50766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrH-0006Ll-Id
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:43 -0400
Received: by mail-pj1-x1033.google.com with SMTP id fv3so3993054pjb.0
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=6WLhUrJWwoyaZltxXdwTFjHJ10oyCwX/30tJ/pG+zJk=;
 b=D4LPnJN11V8ZZSma2/DmCFBmZuWHf0YYiuzEfzpyxB3Rhyi25qLKOKYVj50361LB5U
 Yx97SLdcth5a2nCWKK+01zd7GiXN6WtaUsSgG1asyJqAxcHAT09BoJLBFRbsGntht/z/
 C97jgowTELj4DLqGgmlos7oFH7iEddkSrxf9QTndk6JyG0lSqhi0/x+YQaZ38wkBpnOC
 +jFr1qv0qi7rS2tTyHf8aCJFfmDKyqog4mzE4Z2F9ol9xYMWykdqa2b8lzbLO+wbZKeb
 +kz1ucr3unUqurZNLS8OiKbR8CXyNlxQNQaC7qF3RsJQdUyJQDVeJNKjQM2MHaQZWxSA
 Lrag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=6WLhUrJWwoyaZltxXdwTFjHJ10oyCwX/30tJ/pG+zJk=;
 b=uYE6ppZeF5grIJVR5j1RL6SKYtBS6xPCj+OkrX4hrEjQTa2rPU8OzvUSoVODG0RFuB
 f5h9++rzDRJJe/EXm9xEMxRY4yxWVej86VdsoBZ34BfcVdIx/MMN6i6cV6MgiKdKWDcz
 HynzLxikbYdDO7+fd0PZUgL1ba/d+YTQ9CQ0X3t9vSy+WlHuBTX/hM+NAbDmaffJ3ccb
 t7ys7+upUEHE58Sboq5MoRPYtuYlueIf00W898Rz9pGHZrjv9Zr5xVIOMi3869StnCZW
 fzbtxdkUqrK+8d4dV79zqNKht18c3RL6RVqx5qJH8PYQKlu52AcC9NyletLxoU5A/cVW
 MhvQ==
X-Gm-Message-State: ACrzQf19OmlhMyILoQ8hSxh3xM7N64z/Gqqft1Rx1m8HhYi7DyPgXaAA
 +H7yAYEavunkUhvDwhNvaTH2zSLb5D8=
X-Google-Smtp-Source: AMsMyM7Xjw6O6vbzsyxF9vOvIxGSHyXKf8CAv8mzie4gIFmQ4mblzK8fbhSpXvR7CTRUI3PaglhU6A==
X-Received: by 2002:a17:902:ec87:b0:176:d549:2f28 with SMTP id
 x7-20020a170902ec8700b00176d5492f28mr16984047plg.12.1664105497678; 
 Sun, 25 Sep 2022 04:31:37 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:31:36 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 21/54] tests/qtest: libqtest: Avoid using hardcoded /tmp
Date: Sun, 25 Sep 2022 19:29:59 +0800
Message-Id: <20220925113032.1949844-22-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

The qtest library was written to use hardcoded /tmp directory for
temporary files. Update to use g_get_tmp_dir() and g_dir_make_tmp()
for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v3:
- Split to a separate patch
- Ensure g_autofree variable is initialized

 tests/qtest/libqtest.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 7c9fc07de4..d8ffa0e7b1 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -265,8 +265,10 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
 
     s = g_new(QTestState, 1);
 
-    socket_path = g_strdup_printf("/tmp/qtest-%d.sock", getpid());
-    qmp_socket_path = g_strdup_printf("/tmp/qtest-%d.qmp", getpid());
+    socket_path = g_strdup_printf("%s/qtest-%d.sock",
+                                  g_get_tmp_dir(), getpid());
+    qmp_socket_path = g_strdup_printf("%s/qtest-%d.qmp",
+                                      g_get_tmp_dir(), getpid());
 
     /* It's possible that if an earlier test run crashed it might
      * have left a stale unix socket lying around. Delete any
@@ -390,10 +392,12 @@ QTestState *qtest_initf(const char *fmt, ...)
 QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd)
 {
     int sock_fd_init;
-    char *sock_path, sock_dir[] = "/tmp/qtest-serial-XXXXXX";
+    g_autofree char *sock_dir = NULL;
+    char *sock_path;
     QTestState *qts;
 
-    g_assert_true(g_mkdtemp(sock_dir) != NULL);
+    sock_dir = g_dir_make_tmp("qtest-serial-XXXXXX", NULL);
+    g_assert_true(sock_dir != NULL);
     sock_path = g_strdup_printf("%s/sock", sock_dir);
 
     sock_fd_init = init_socket(sock_path);
-- 
2.34.1


