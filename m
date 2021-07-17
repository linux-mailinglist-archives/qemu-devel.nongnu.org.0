Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DEC3CC26F
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 12:14:24 +0200 (CEST)
Received: from localhost ([::1]:41388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4hKx-0007iS-JR
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 06:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hH8-0007vq-3L
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:26 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hH4-0007YI-9m
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:25 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d2so15046539wrn.0
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 03:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f8o0n+4DG6HViuGjG54BZ2SQjZzUv2ICi5cU27e7QLU=;
 b=dySDNL9nVZaMUb/4gHYjamz54oTo/FaxIvaLuBpbMWITVOCvbLxGA99FORF/zTZnK4
 /ZG57AKh7q0Olbasps/qszDn7tiqBWJHHPMOe5O9VvbmOl3AzQ3H+I8grKqayzmbVMbr
 aA19Ii8sdJb2TqRmZYvjfQEQfgMuTKCo3PHorPWQQc3Pee6+91/4Cr+Qqyqz4yCnb2Tv
 xGiqKzctxPyW+/TxBHp6m3KzE6vS2BlKEnDgd5uMCk0gyOnhsRQqmlobmwFUN2ftj7XN
 8dT1NztcMZawLgt4C40RCa5+K3yfn0C8pN2I4wq45gK9O50UQ/xZQH0nDlfMomWyq/co
 +FQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f8o0n+4DG6HViuGjG54BZ2SQjZzUv2ICi5cU27e7QLU=;
 b=h9qe0uNFyzLh59JSWce7lzGgfVTPNECL4XCBA53qOmkycXh5LPazPD7X5KywUp3PSA
 12KZqP2pJ2A4e9kCwiwfA80RidmJw6q+XeQiFOjDvq9eiMzf+UvwSK1cTXlC72xr3/WA
 p8sBlj5+cW6ppfXaDJ7jlxWiJeIKj0lyG5BPhEoJiS0Uin3XAuvglhxArOu/1hPDGz8s
 YG5UyPiPYjoOaqVhu4FgRNYhCGd6SGqHPCEykdc5sfTua0Sq6tgZzrqmJefWnaPK/Gv+
 iOYkOlmJemgrJVJLUtF070/z3Pc0Qlu8H41w9Eooz+R56c/Pt4pHY8WhiXSzHTsowvAZ
 rUGw==
X-Gm-Message-State: AOAM533WFxz5LhjAx5MdkFpUbx8EsIa6qDQkel6nvomqqwOXOhe8f6Lf
 RQIJdFo87B9Tnce6F8tk9Axq4we9RXU=
X-Google-Smtp-Source: ABdhPJyeaJ8DitNWvtMxP33MbRiHfgJLCbV04zhgUIQQqXVWoZGOIXWL3pu7N7hQhEnb66gPT/ihCg==
X-Received: by 2002:a5d:6302:: with SMTP id i2mr18063496wru.366.1626516620802; 
 Sat, 17 Jul 2021 03:10:20 -0700 (PDT)
Received: from localhost.localdomain ([41.34.125.69])
 by smtp.gmail.com with ESMTPSA id 11sm13846923wmo.10.2021.07.17.03.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 03:10:20 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/13] tests/plugins/insn: made arg inline not positional and
 parse it as bool
Date: Sat, 17 Jul 2021 12:09:17 +0200
Message-Id: <20210717100920.240793-11-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717100920.240793-1-ma.mandourr@gmail.com>
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Made argument "inline" not positional, this has two benefits. First is
that we adhere to how QEMU passes args generally, by taking the last
value of an argument and drop the others. And the second is that this
sets up a framework for potentially adding new args easily.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 tests/plugin/insn.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tests/plugin/insn.c b/tests/plugin/insn.c
index c253980ec8..0f6a1938c1 100644
--- a/tests/plugin/insn.c
+++ b/tests/plugin/insn.c
@@ -62,8 +62,18 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                                            const qemu_info_t *info,
                                            int argc, char **argv)
 {
-    if (argc && !strcmp(argv[0], "inline")) {
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
 
     qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
-- 
2.25.1


