Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 088873D1EDE
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 09:22:58 +0200 (CEST)
Received: from localhost ([::1]:44984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6T2n-0001qc-3J
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 03:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6StB-0006TI-FO
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:13:01 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6St9-0005W8-V1
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:13:01 -0400
Received: by mail-wr1-x435.google.com with SMTP id u1so4791472wrs.1
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 00:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f8o0n+4DG6HViuGjG54BZ2SQjZzUv2ICi5cU27e7QLU=;
 b=DkGP6sXMmwp3ds9M9m4o4yV6tmuP/fpq6w09dV7vkTQiteGQp6w583yA0Gv+62fqzv
 4dIZrHh8TeyWQRtN5M2C4spve2nXz7ZM9LstnS+xWpDUyUWFSGxxdLLrR6GZ0nSPdP50
 DrrVu3pm5mCEJgBMb97/yMJUfohrhEGTcgb54TAL3QNiYNGWLmgmkoJKPkiAjDeP4nu+
 +vd/Vx16Mpydi498SSBRzx89rPz7bS8JyMqtEKlAKEjPakKIlIrZqGesl0B9HvIA1N7K
 qIsrkmOVGGO9CHMBJufE3RMVqIKDtamkM5WYBQnaAUb+KLHd3RHEyH4vQ1uvcVFdydMX
 OsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f8o0n+4DG6HViuGjG54BZ2SQjZzUv2ICi5cU27e7QLU=;
 b=sPohf+2dPVyFgZv4MGr6m3bWgdHagFQ4qzLXASV5E2SbLIPED4uEnv5kLO2NeQXl48
 uF5J7nsQIHbapP1Z9DXJS71P6h/roCo0DzdtC0v4eie7iNECvb+2+BAy70GtSXv86CM5
 6YkWZK+yuuvS3a0ixq5HTePq0H+YQB6XmOWlf2nP3HULbOA5Xm/n8lbhJLl1ZqpGkwD2
 NbCzYXqX9GxgPX/ZuSjREInaFMDe1p7nT+Aq6oiRyiYW0UYPKEIniv8rOMcj3e18C1Vu
 PudifvyZrWrpqJ/FF9kLJeEo8zpWUAciBykvuyN8YXJDkxPEshP4HHLHHntmcpAeLo7E
 +apQ==
X-Gm-Message-State: AOAM532tuasglhfwdtog+o6eE6qi+7KwUxkC9+bvIK8u+zH5kBsiCDNS
 bD7fEC8cbkFxIQWLPcNCfhlEd+DdD2U=
X-Google-Smtp-Source: ABdhPJwU82LDKw5fcB2K+PtoxSzxkJ5XYLmduhCSd7Ix2Gl67G3Sy4VdRbZy6iPNLOtQ5wTxz8x9AQ==
X-Received: by 2002:a05:6000:1a86:: with SMTP id
 f6mr26555386wry.127.1626937978487; 
 Thu, 22 Jul 2021 00:12:58 -0700 (PDT)
Received: from localhost.localdomain ([102.44.10.38])
 by smtp.gmail.com with ESMTPSA id v21sm1802871wml.5.2021.07.22.00.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 00:12:58 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/13] tests/plugins/insn: made arg inline not positional
 and parse it as bool
Date: Thu, 22 Jul 2021 09:12:33 +0200
Message-Id: <20210722071236.139520-11-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722071236.139520-1-ma.mandourr@gmail.com>
References: <20210722071236.139520-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x435.google.com
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


