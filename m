Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C113B1E44
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 18:06:02 +0200 (CEST)
Received: from localhost ([::1]:57788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw5O5-0007bx-2k
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 12:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lw5JK-0007eb-63
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 12:01:06 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:44013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lw5JH-0000LF-1k
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 12:01:05 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 p8-20020a7bcc880000b02901dbb595a9f1so1695676wma.2
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 09:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uXGN0cpV3Gpof1WpgLXj/iSpt68g2IUYatXeahWbpps=;
 b=SlixGbALIOKPAGG0I37Lr0opuv/WApBEY1670aCs4NMvGe2tBscd172VH6UtnVrfJX
 taVLxqx8SyVaJ+pfC3Q2pGZvh+6hn+++rMkRVTSmN/xWRBbh8HkJaTGrOG6IYECZbISY
 Hp0VrhOu7i8UD7V17fi+D2nsv0EdEiTNkX4VnOMjmLs9RVUuFIeEdfiLqtco2dUwsdXP
 4u8D1i39KdJrFQrWCnAPcEiZh2HmTb9NyKYLLejho/KjcZfnZf9ljduAsIdqrNtBLzPP
 NJH2vimd0sAWfp6fMTkHXA/kj3l1bmoFryzvyuFgV9uSfHTmj74pXsrStu5Pn43M8/dm
 1fOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uXGN0cpV3Gpof1WpgLXj/iSpt68g2IUYatXeahWbpps=;
 b=cycUn3Dnz6QykEtrFgPTXuGJ3zGmpJKfWePhWwO0OXzCVv8gNRgp2TVeyZCTe8Zq0m
 tvpBFGeTmAYvkswRppU+732PaabwefYM/5Kw1d1A3/bBCDAuHW+KNlHn5RkBGLRj1mFa
 MK1y/HEkN+rwkVlbBhujSlKxOCbuZwHXzD74ovMUs1Ma60WL8K5to+ViTYFbUlJVLAQG
 4g7ulVeQV/Cr8TDCjLJWVHb777yqSGIE60kiAkMxK9p6/7OmbG3q7DzfZYZgdUamoeFI
 yFE3CUAQ1ueULu516JbmF9mlz6q0JDlAXsJ1fgIdmh3yD5+XA2YuC/mako72Acc5SxoA
 Q7gQ==
X-Gm-Message-State: AOAM531btuVLFWuXAe3JLtGapJtLyY6HNRJ855o3F9/Gcd6bURKaWRFX
 DVVFdTLjo1RDKbKTE02sgQ/z1MopAFp7MQ==
X-Google-Smtp-Source: ABdhPJw6HM8NQqlWT561l0di8r9v3ykc+azEOFU8/1x3rsIf04005BjPtPjPmezNVSk5VGBQIDJ7sg==
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr450773wmj.119.1624464059478;
 Wed, 23 Jun 2021 09:00:59 -0700 (PDT)
Received: from localhost.localdomain ([197.61.84.15])
 by smtp.gmail.com with ESMTPSA id s62sm6338273wms.13.2021.06.23.09.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 09:00:59 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2] plugins: Passed the parsed arguments directly to
 plugins
Date: Wed, 23 Jun 2021 18:00:51 +0200
Message-Id: <20210623160051.482646-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x336.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Arguments were passed to plugins in the following form:
    -plugin path/to/plugin,arg="positional_arg=value",arg="second_arg"

This patch removes the need for "arg" so that the argument name itself
is now expected and passed directly to the plugin.

Now options can be passed in the following manner:
    -plugin path/to/plugin,positional_arg=value,second_arg

Since short boolean arguments are deprecated, passing an argument that
takes no value will trigger a warning saying that the user should use a
full "arg_name=on" instead of just "arg_name". In either case, the
argument is passed to the plugin as only the name, omitting the "=on"
part.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 plugins/loader.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/plugins/loader.c b/plugins/loader.c
index 05df40398d..7f32b8c8bd 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -94,6 +94,7 @@ static int plugin_add(void *opaque, const char *name, const char *value,
 {
     struct qemu_plugin_parse_arg *arg = opaque;
     struct qemu_plugin_desc *p;
+    char *full_arg;
 
     if (strcmp(name, "file") == 0) {
         if (strcmp(value, "") == 0) {
@@ -107,7 +108,7 @@ static int plugin_add(void *opaque, const char *name, const char *value,
             QTAILQ_INSERT_TAIL(arg->head, p, entry);
         }
         arg->curr = p;
-    } else if (strcmp(name, "arg") == 0) {
+    } else {
         if (arg->curr == NULL) {
             error_setg(errp, "missing earlier '-plugin file=' option");
             return 1;
@@ -115,9 +116,12 @@ static int plugin_add(void *opaque, const char *name, const char *value,
         p = arg->curr;
         p->argc++;
         p->argv = g_realloc_n(p->argv, p->argc, sizeof(char *));
-        p->argv[p->argc - 1] = g_strdup(value);
-    } else {
-        error_setg(errp, "-plugin: unexpected parameter '%s'; ignored", name);
+        if (strcmp(value, "on")) {
+            full_arg = g_strdup_printf("%s=%s", name, value);
+        } else {
+            full_arg = g_strdup(name);
+        }
+        p->argv[p->argc - 1] = full_arg;
     }
     return 0;
 }
-- 
2.25.1


