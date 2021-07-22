Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C05823D1EC9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 09:17:43 +0200 (CEST)
Received: from localhost ([::1]:55378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Sxi-0006lo-Qs
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 03:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6StE-0006ci-8p
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:13:04 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:47000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6StC-0005Yr-MS
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:13:03 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d12so4724721wre.13
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 00:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4qyLRgjtuRAGaJfw5IPvpDI1rMZ3+dPJpfrbSZzJXHU=;
 b=AntOj9Y2I92RBmKECEDufiCA+SWY3iNb8oQRijAZyXI31c/VsBcBq/KL3Rx5JWSvH7
 4vi7YYg4CygQwYTLZOCCKPjJbrKhJcWtLM7h9CloOxV65T9If7iTDN4LFNgAWtIKqOe2
 2VYBcd16bvukc69C/ak2b5kvbmyFNxkflzxqNc/Og6FN5Tca6A954Ow7eqZ2ftFMW0HY
 tDpaRG6+tAzu/buQxDk48bVAGoIxX3Q2QGPnqaXWgZAHtK5N/RGFPyhRiynR5oi7u8Qs
 C9IbsUs94W1q6x6r/yY3Rc2bAPzVx0R/MoJqCO75RzoZWOzXnlMY30bK5emu6acpCcUO
 RBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4qyLRgjtuRAGaJfw5IPvpDI1rMZ3+dPJpfrbSZzJXHU=;
 b=ZjN5fqzjInYICGzdxXRi1kH3S4+3AbbZGTN3bCizJ+XBFeI/ChCt9oXfcdVGJJgvrj
 jfa2mYqu+fsqDDGYiD4ZiQtIf5UfGDCF1dLaxaNrEKs8JvT8GG2JNfHMYT95SyhQc08A
 nl/J+mOF59WIl46KlClYCfuLqYAx/yY6ugEP2tgKTyFH7HlipuPS2T/bq2pLqAME9W+R
 Z/5PQb7ApADasekxQTTpQejGH54pU2VnTmv2cie3ho1V7H4WeSeP4tDvZqKhqG4DLFHh
 7io7m0VF5/iTykjvojK4jHCv4IrFbMcFpyGHLiEUziVW1moTXClcZH68lkNmF+DIL6n9
 H5gA==
X-Gm-Message-State: AOAM531TCK617rJrVlifIhvs5j05DNk5hZ9dVDcNymzWgF0e3o6E7ove
 CNWPDnPZojxJ5qK2DTHyDpO++RSQlQU=
X-Google-Smtp-Source: ABdhPJzAFTOewNMVhawBTDq5nShr74Q9EKFfJX7NtrCkUrrLs3iwnDeVGM95owUqKsTapOaAClcU5w==
X-Received: by 2002:a5d:6148:: with SMTP id y8mr46533715wrt.20.1626937981341; 
 Thu, 22 Jul 2021 00:13:01 -0700 (PDT)
Received: from localhost.localdomain ([102.44.10.38])
 by smtp.gmail.com with ESMTPSA id v21sm1802871wml.5.2021.07.22.00.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 00:13:00 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/13] tests/plugins/syscalls: adhere to new arg-passing
 scheme
Date: Thu, 22 Jul 2021 09:12:35 +0200
Message-Id: <20210722071236.139520-13-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722071236.139520-1-ma.mandourr@gmail.com>
References: <20210722071236.139520-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42a.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
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


