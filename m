Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 474E13CC270
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 12:14:25 +0200 (CEST)
Received: from localhost ([::1]:41496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4hKy-0007nL-9H
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 06:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hH8-0007w8-7G
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:26 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hH6-0007ZU-L9
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:25 -0400
Received: by mail-wr1-x429.google.com with SMTP id i94so14978092wri.4
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 03:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4qyLRgjtuRAGaJfw5IPvpDI1rMZ3+dPJpfrbSZzJXHU=;
 b=tQEXJpBCZ+pgaM4vPbNPJonJk4Kg7aqyTVGCc35trRPKONB4e3k/hFy3U0P+gcilXv
 uMSqzDvnTQp0ZMuIJj7HeSp7sDVN8MtV7MmneQU8sXX8AYPVbZl6CYMxloyWC50J/tda
 KGwfORaCFn4FhytsEdqPi9JGVfURpEpeqQcaUliRm5eLBEHU6zePmLTNfmCdX8e3DK38
 REv1MNI14NGh4uoQftwWWjh8FixKuGgXxq5YLnzx7yk3Rx1ITb5A9rp6rENbOdmGNSnz
 JdS/QYcmqE9EyBnosJUB8zpxf2jhFsa59SCt8UNj7U0x+6BGF9INni81B0qUEkbj94Fn
 u4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4qyLRgjtuRAGaJfw5IPvpDI1rMZ3+dPJpfrbSZzJXHU=;
 b=gEYGPMhGFBScEsA4eg0rkk/6vImj1LSno+GnF1d9REXvJx8S2f0QYzIQYFZJ3GIO16
 5z4xqOKqW/6uHIB4mn7TLdCKqJ1tBQnC9WQK+zAaSXXzDnTFPgt3JnEamWEKd6drg1+x
 pgwDThnDD1+2M0kIHYw2wHiLpaNzGBHPMujWQxfXxC/TcZ8mgOnhZEzC5Cpk9i8QIwRr
 kvcTNDywSVD2C/LrwjbjS97q7+dLSitoMaV8MRVVeU/3mEhJaGZCRnL/A0PgsgCA2oB/
 8tumN54Mu4IM64p7T9KSEnkG6pTKcMZhfdDlZKqBqWsedH0tefPYM8L7mFfs0gjKTRJE
 Bw6w==
X-Gm-Message-State: AOAM532+qtHfloum0aTWLHThhozA2Z0YuF+bvzvR2ZBAdLkFcJvM2ueQ
 ThOAk9GyR0yeCP3Z32QejuwzLWRDBUs=
X-Google-Smtp-Source: ABdhPJzq89nPzpl7S6K0Gmqa/8PBZ39vQAQY8z/ed6DG5BqxEQi0B9+zvKCn8sZZ/MT90aUD2bZDdg==
X-Received: by 2002:adf:b318:: with SMTP id j24mr18517793wrd.361.1626516623050; 
 Sat, 17 Jul 2021 03:10:23 -0700 (PDT)
Received: from localhost.localdomain ([41.34.125.69])
 by smtp.gmail.com with ESMTPSA id 11sm13846923wmo.10.2021.07.17.03.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 03:10:22 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/13] tests/plugins/syscalls: adhere to new arg-passing scheme
Date: Sat, 17 Jul 2021 12:09:19 +0200
Message-Id: <20210717100920.240793-13-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717100920.240793-1-ma.mandourr@gmail.com>
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x429.google.com
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


