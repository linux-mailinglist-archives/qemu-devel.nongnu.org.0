Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E563DBA0F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 16:07:49 +0200 (CEST)
Received: from localhost ([::1]:59274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9TAy-0003Jn-DI
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 10:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2l-0004zp-E0
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:59:19 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2j-0006jN-TG
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:59:19 -0400
Received: by mail-wr1-x430.google.com with SMTP id l18so11454042wrv.5
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 06:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3nmUEZ6fsiaaAzFrMlJ9P6ABRodgQbIf6UW0T/fpo6M=;
 b=sqLPlywEGfLzKSNsMIJyxA+k9hi7EgoIS2hwgMmuKLqcBSpQ327wABVkQdodofoE2H
 CGRMkdLVrInTPgDlyxoRr1Wk+r32VKwgdd5whyYnAwQh349Z4I9FMQHtU/wVx3yiwAxs
 4A1UFUnmbWIYjGRycx2cXuekgU3t5wJ7yw7u5Q0Y7bbkIW/p83FNrxzPxrnIWMHjLr/7
 Xd+c37j34lzjglXP0dihrww/OZZGFsXaIg/fKqt6CFBwmVof0KQoESDHwe7O7k0WXzbD
 S/UaJSIuVa8rmS38GK5exTxOlpuLLlyGqb/LcsmzNWbPqgjucJ6pemtbiZvYO/u4AX9O
 sxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3nmUEZ6fsiaaAzFrMlJ9P6ABRodgQbIf6UW0T/fpo6M=;
 b=KIyrRLZTd3BQiYMM82xhXGCELYdQEDHs3JaRzAtQUrTTdKGg20c5nYXSfSQSPks5hY
 4FkgGewnM1qlI1Ck/JGvFgmvwg9oYa7j6cNomLzrcaGwWC8w0SonwlznihuosfZCZqog
 a2ylRIJiyxpf+3xRcELlwR9t5PS5cq3DUnV9uoSO+HXAOCPp38d2LMjkU/8WHJ63MTj9
 aNZqxI5GPn4g92Ru890Dys513InoiNkingg3yTKBtmYw7yWU46wywLqraR+bE0QNiMnF
 pve0FtJbfa8uCdWSJxgexmGo8+IcMKZN0cfyXHGthMeHBM/GngF2h2LnhCd8SFyZjAj+
 AHEg==
X-Gm-Message-State: AOAM5325DOFLwhlAEFK+YQfASKYKzBXIu3pT2AzBP/OJ+zidyh6nRuij
 aT7CROircm8orCYFgRP+l5/TRnuQ1q8=
X-Google-Smtp-Source: ABdhPJxi/Gr8RPZR/c1S/9qT3c7rP22j6Ypf5OexhQu/HkErXgt5YXiMcS7AFN7Gw2a5f7AkEn4A6w==
X-Received: by 2002:adf:fc0c:: with SMTP id i12mr3209494wrr.373.1627653556510; 
 Fri, 30 Jul 2021 06:59:16 -0700 (PDT)
Received: from localhost.localdomain ([102.44.217.242])
 by smtp.gmail.com with ESMTPSA id h9sm1770277wrw.38.2021.07.30.06.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 06:59:16 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/13] tests/plugins/syscalls: adhere to new arg-passing
 scheme
Date: Fri, 30 Jul 2021 15:58:16 +0200
Message-Id: <20210730135817.17816-13-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730135817.17816-1-ma.mandourr@gmail.com>
References: <20210730135817.17816-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x430.google.com
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
 tests/plugin/syscall.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/tests/plugin/syscall.c b/tests/plugin/syscall.c
index 6dd71092e1..484b48de49 100644
--- a/tests/plugin/syscall.c
+++ b/tests/plugin/syscall.c
@@ -119,17 +119,26 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                                            const qemu_info_t *info,
                                            int argc, char **argv)
 {
-    if (argc == 0) {
-        statistics = g_hash_table_new_full(NULL, g_direct_equal, NULL, g_free);
-    } else {
-        for (int i = 0; i < argc; i++) {
-            if (g_strcmp0(argv[i], "print") != 0) {
-                fprintf(stderr, "unsupported argument: %s\n", argv[i]);
-                return -1;
+    bool do_print = false;
+
+    for (int i = 0; i < argc; i++) {
+        char *opt = argv[i];
+        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+
+        if (g_strcmp0(tokens[0], "print") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_print)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
             }
+        } else {
+            fprintf(stderr, "unsupported argument: %s\n", argv[i]);
+            return -1;
         }
     }
 
+    if (!do_print) {
+        statistics = g_hash_table_new_full(NULL, g_direct_equal, NULL, g_free);
+    }
+
     qemu_plugin_register_vcpu_syscall_cb(id, vcpu_syscall);
     qemu_plugin_register_vcpu_syscall_ret_cb(id, vcpu_syscall_ret);
     qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
-- 
2.25.1


