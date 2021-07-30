Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C79AC3DB9F5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 16:03:36 +0200 (CEST)
Received: from localhost ([::1]:47420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9T6t-0003fU-SR
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 10:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2X-00048m-6a
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:59:05 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2U-0006ZM-Fz
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:59:04 -0400
Received: by mail-wr1-x432.google.com with SMTP id r2so11497511wrl.1
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 06:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xGfAEZI06RYsFGS9ZJIyiWOEo8EAYMj1eN2Iae2jGXM=;
 b=M6Wm2g/7jNBhuN6IbK2/PbW1sVpbxISmUpWfJAjxicvECgDxGmBjZldi+RBW3E1Jn1
 JBRMEupnfnhbTfhrf3/bc2IlLOJl0/rp17qDGSlpZFy0Wmam1uGj6Cd4DFErzSFOdmuy
 q8acEv0lgLIH4a3bhaFkpuUCuSnhxUkkoIT67hnqvlhOY6ZhO+TFQUbKPf2+DJ/OMxOE
 ORU39q+lzrnn3cU5Kcii0LY3Rc4XCTWw877SHJtx1831HQu5aEWgS0fq068X/HXijJM4
 pqsefTanQpoXAhu1X2wG8M+vi1ZI6x2crZbzmxCSlv+cKqwklOeUJ/QlG1STwpH64SzM
 4HlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xGfAEZI06RYsFGS9ZJIyiWOEo8EAYMj1eN2Iae2jGXM=;
 b=MfKkscFuQzd1+BoH0XQxG0AqdfCr8RU1D9IaqFtNg0RIM5tnRL8VOhgD1Amt57Nmz7
 UFE3lssW12TrsNycOOX3CNyZoreF1MwqDZJ+t1f+hEq6suQtY1k6OzIx61nJncwvbz5y
 pAtsetBJJpfrXDp+QM6SB7JaZg6N57v+4D0a1V0sbHEFR5uRBK5CQckPxtG6jqH4T7aZ
 3y0NuDKvauGRzsBPa+6XgSlJOaXgirhwvNauiI3KgKi9UpJZZ4gABdVw+lJRYqeJOTlB
 yYtgt3NTWRyZ4Nrvchjw2pugkYJK2r75LAtyn7/ZKMyzq+JCVnNlZ4h/wTn9VrSJIjq5
 lIzw==
X-Gm-Message-State: AOAM531RGu2pXtc7NTRrigR7qoXP5ulLclz0PYQnwVMf6GKbe+0bEvn9
 AFVLj1GFNhzpEMDECkK7M9/dHx1otX4=
X-Google-Smtp-Source: ABdhPJytxg/ZcTcnXj8DiyRCbrQXntpmoLZRU0dCV7Ma2WosX74PNBNxWOBBi1WbNvxuthY4To/tYA==
X-Received: by 2002:adf:d086:: with SMTP id y6mr3360518wrh.247.1627653540811; 
 Fri, 30 Jul 2021 06:59:00 -0700 (PDT)
Received: from localhost.localdomain ([102.44.217.242])
 by smtp.gmail.com with ESMTPSA id h9sm1770277wrw.38.2021.07.30.06.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 06:59:00 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/13] plugins/hotblocks: Added correct boolean argument
 parsing
Date: Fri, 30 Jul 2021 15:58:08 +0200
Message-Id: <20210730135817.17816-5-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730135817.17816-1-ma.mandourr@gmail.com>
References: <20210730135817.17816-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/hotblocks.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/contrib/plugins/hotblocks.c b/contrib/plugins/hotblocks.c
index 4b08340143..062200a7a4 100644
--- a/contrib/plugins/hotblocks.c
+++ b/contrib/plugins/hotblocks.c
@@ -133,8 +133,18 @@ QEMU_PLUGIN_EXPORT
 int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
                         int argc, char **argv)
 {
-    if (argc && strcmp(argv[0], "inline") == 0) {
-        do_inline = true;
+    for (int i = 0; i < argc; i++) {
+        char *opt = argv[i];
+        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+        if (g_strcmp0(tokens[0], "inline") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_inline)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
+        } else {
+            fprintf(stderr, "option parsing failed: %s\n", opt);
+            return -1;
+        }
     }
 
     plugin_init();
-- 
2.25.1


