Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 101EC3E5C5A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 15:56:12 +0200 (CEST)
Received: from localhost ([::1]:36464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDSEk-0001J6-W3
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 09:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mDS7p-0007Xo-TO
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:49:01 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mDS7n-0008KA-Kc
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:49:01 -0400
Received: by mail-wm1-x32f.google.com with SMTP id u1so3120680wmm.0
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 06:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MdXHepiB7b4I1+f+BU1nXN3WnDEUOf34d9xvLH4QhNM=;
 b=BqdW0XUTT55bW7IBcEqmEbCfDYvgCzoAJTm/Ybz1iZA0iW/bv8O4vF5dWnc3nfOFfi
 Xfzi3aQldEx+xxuqn0cL+UbHafGxT3HZWvQqaIEROx1OZprvV3W6fh8PPBH+3trZTO3N
 IJwCaCQ5d9bT/Xm98mgyXIKfEdYJJG76mPVDre4Fyju0PL1On1DMNXNOhN6xBgwbaQdp
 zawpwBCN0EdhrFj5YFwNPaamiprlS31oe8nsG3QeBWqYuL2nS3Au4EQWpb7nSDAOION7
 hfnVKWVYDY644e3kPmJI5dlBlSbWaeW1HFZ7r6XrOe0F5WfuQPNYV24MzURjm6Hclp97
 AQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MdXHepiB7b4I1+f+BU1nXN3WnDEUOf34d9xvLH4QhNM=;
 b=ka/TiH7CxSEFgQ2EAKkphXtkq/gdzADrxLWiWy6Ia9oDL7evCXu8J53bojGzDI2eb5
 Pen8zIzZbz4Dmv8oA1nMQz3GSpy8Huf8nuSnaZxTYJOAEq7rpP2vANkOMD8bj2IGrBN4
 zJhljaGhCsT8brfD8r3xezSowfXp6bb9//1w6ab9JxNh/FU+BQed5VcBQP4kk6S9M6bz
 cprGbNR5h85I4VEiyfqUG3KHSM4cXQnBvMhKym4/Np79tVh+v6pSeqh8dw/yVewF/LqZ
 p/o7LyAdwnmqSrbehdh1HrRYID6NmTr9pllLH/VOpbcai0ZrxiDl6JMOOLQLtLt/SHOg
 +JDw==
X-Gm-Message-State: AOAM530ym5u2+hCh5HtOu0kqozUismNSIhjeQcBSuwBvmfnA2wHwDnnc
 JK0+HmbLYnmvxbwmU7M4HbjphEGuf50=
X-Google-Smtp-Source: ABdhPJyYj1dvluUg1IqUdzJvnbNVEUg9JK/nzfwxcbLwiRJzV/RYV0H3sWTe4E6sU2n8E8y76PQgIQ==
X-Received: by 2002:a1c:ed10:: with SMTP id l16mr4752711wmh.8.1628603338251;
 Tue, 10 Aug 2021 06:48:58 -0700 (PDT)
Received: from localhost.localdomain ([41.36.105.33])
 by smtp.gmail.com with ESMTPSA id u6sm8683413wrp.83.2021.08.10.06.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 06:48:57 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] plugins/cache: split command line arguments into name and
 value
Date: Tue, 10 Aug 2021 15:48:42 +0200
Message-Id: <20210810134844.166490-4-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210810134844.166490-1-ma.mandourr@gmail.com>
References: <20210810134844.166490-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32f.google.com
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This way of handling args is more lenient and sets a better framework to
parse boolean command line arguments.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/cache.c | 57 ++++++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 27 deletions(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index 908c967a09..ff325beb9f 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -11,6 +11,8 @@
 
 #include <qemu-plugin.h>
 
+#define STRTOLL(x) g_ascii_strtoll(x, NULL, 10)
+
 QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
 
 static enum qemu_plugin_mem_rw rw = QEMU_PLUGIN_MEM_RW;
@@ -746,35 +748,36 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
 
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
-        if (g_str_has_prefix(opt, "iblksize=")) {
-            l1_iblksize = g_ascii_strtoll(opt + 9, NULL, 10);
-        } else if (g_str_has_prefix(opt, "iassoc=")) {
-            l1_iassoc = g_ascii_strtoll(opt + 7, NULL, 10);
-        } else if (g_str_has_prefix(opt, "icachesize=")) {
-            l1_icachesize = g_ascii_strtoll(opt + 11, NULL, 10);
-        } else if (g_str_has_prefix(opt, "dblksize=")) {
-            l1_dblksize = g_ascii_strtoll(opt + 9, NULL, 10);
-        } else if (g_str_has_prefix(opt, "dassoc=")) {
-            l1_dassoc = g_ascii_strtoll(opt + 7, NULL, 10);
-        } else if (g_str_has_prefix(opt, "dcachesize=")) {
-            l1_dcachesize = g_ascii_strtoll(opt + 11, NULL, 10);
-        } else if (g_str_has_prefix(opt, "limit=")) {
-            limit = g_ascii_strtoll(opt + 6, NULL, 10);
-        } else if (g_str_has_prefix(opt, "cores=")) {
-            cores = g_ascii_strtoll(opt + 6, NULL, 10);
-        } else if (g_str_has_prefix(opt, "l2cachesize=")) {
-            l2_cachesize = g_ascii_strtoll(opt + 6, NULL, 10);
-        } else if (g_str_has_prefix(opt, "l2blksize=")) {
-            l2_blksize = g_ascii_strtoll(opt + 6, NULL, 10);
-        } else if (g_str_has_prefix(opt, "l2assoc=")) {
-            l2_assoc = g_ascii_strtoll(opt + 6, NULL, 10);
-        } else if (g_str_has_prefix(opt, "evict=")) {
-            gchar *p = opt + 6;
-            if (g_strcmp0(p, "rand") == 0) {
+        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+
+        if (g_strcmp0(tokens[0], "iblksize") == 0) {
+            l1_iblksize = STRTOLL(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "iassoc") == 0) {
+            l1_iassoc = STRTOLL(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "icachesize") == 0) {
+            l1_icachesize = STRTOLL(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "dblksize") == 0) {
+            l1_dblksize = STRTOLL(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "dassoc") == 0) {
+            l1_dassoc = STRTOLL(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "dcachesize") == 0) {
+            l1_dcachesize = STRTOLL(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "limit") == 0) {
+            limit = STRTOLL(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "cores") == 0) {
+            cores = STRTOLL(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "l2cachesize") == 0) {
+            l2_cachesize = STRTOLL(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "l2blksize") == 0) {
+            l2_blksize = STRTOLL(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "l2assoc") == 0) {
+            l2_assoc = STRTOLL(tokens[1]);
+        } else if (g_strcmp0(tokens[0], "evict") == 0) {
+            if (g_strcmp0(tokens[1], "rand") == 0) {
                 policy = RAND;
-            } else if (g_strcmp0(p, "lru") == 0) {
+            } else if (g_strcmp0(tokens[1], "lru") == 0) {
                 policy = LRU;
-            } else if (g_strcmp0(p, "fifo") == 0) {
+            } else if (g_strcmp0(tokens[1], "fifo") == 0) {
                 policy = FIFO;
             } else {
                 fprintf(stderr, "invalid eviction policy: %s\n", opt);
-- 
2.25.1


