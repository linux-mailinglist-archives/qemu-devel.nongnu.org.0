Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5D73CC296
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 12:19:38 +0200 (CEST)
Received: from localhost ([::1]:58168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4hQ1-00023D-OU
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 06:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hH7-0007sG-8L
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:25 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hH3-0007XW-BB
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:24 -0400
Received: by mail-wr1-x42d.google.com with SMTP id l7so14967420wrv.7
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 03:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g9GPBnOls6lqCRr2cBSrHII9Px4RdKxn4NmBlv5xAGo=;
 b=fWgthwIvFg0rDex8JVcOUT/nQunff3u/j+Y93SmEdgjsrfvWxT9W/8e/l/e9SCBjKR
 KEo2hHRH6DjEuUoFiSLzufX7uArvhhnsIxHlRiI7iBsQosaZJGW9Dc56uhWidbv6sh2+
 gm+uBEsT/dHSGz25LA3serLej07t5bEU8vUiXM0xt/620SWgXmoa9t8Z6ao/Uy+KGmG3
 3JisBu0H/lEnTQvoYlX2FMIWXW3mfpPNaSSOwHIhRqVcj1KcRtPH5HMP+OQEbZKFYCmP
 tlakOf5GB4sJubwmSgLVmpaigUDgRk53lqxWKLn9IJgV5sfPD7TtnTHOetT9SrPmuDUw
 Gw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g9GPBnOls6lqCRr2cBSrHII9Px4RdKxn4NmBlv5xAGo=;
 b=INmEdy+3LMTPs2hUAoA5Xt9nwNDQRHqkmpq0CCHzOQBL13cuaqtZvUsGmkL74VhcJP
 5wbQMHU2jkzQ+Dth671gIDve6SqUV7jBYtVBIEfs+nZHNIYdTFxUkIUsc4LqaC/hHZ0Y
 YJgYfV+VJHG10+7yM3+WzK0jEK0BoLCqbrrBk/6iulau+h55vskrBFiRA28aQBrdLCXG
 OCuoVU4nCGDi3gUn8GtUCB6TCqYtS9PXADKmuYMPQt9KFv5uvLVUfn6frxvx7WfIpFEK
 pzaHlQ0L0oHhK7hxRFeJ4poG3JKMYNb57D0+6WMCbDwnbolzHc+4vwkS6aRkzv3t7JYo
 V4sQ==
X-Gm-Message-State: AOAM530geiuTAUJihg9JTQYbonJYP99uk5Q/yKiL5wSD9OphYNsRQp6I
 TwyVgJ/qyn1t9BonrlxomdBb3vq5DjI=
X-Google-Smtp-Source: ABdhPJwh6+Cbu4E4I2PWWUGYgCoJspVQVCrvFUTR6zhpVz4IpAhFCwDmjakIAmacVBVT7eblQLFgfA==
X-Received: by 2002:a5d:4573:: with SMTP id a19mr18183656wrc.346.1626516619616; 
 Sat, 17 Jul 2021 03:10:19 -0700 (PDT)
Received: from localhost.localdomain ([41.34.125.69])
 by smtp.gmail.com with ESMTPSA id 11sm13846923wmo.10.2021.07.17.03.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 03:10:19 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/13] tests/plugins/bb: adapt to the new arg passing scheme
Date: Sat, 17 Jul 2021 12:09:16 +0200
Message-Id: <20210717100920.240793-10-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717100920.240793-1-ma.mandourr@gmail.com>
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42d.google.com
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
 tests/plugin/bb.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tests/plugin/bb.c b/tests/plugin/bb.c
index de09bdde4e..7d470a1011 100644
--- a/tests/plugin/bb.c
+++ b/tests/plugin/bb.c
@@ -104,10 +104,17 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
 
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
-        if (g_strcmp0(opt, "inline") == 0) {
-            do_inline = true;
-        } else if (g_strcmp0(opt, "idle") == 0) {
-            idle_report = true;
+        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+        if (g_strcmp0(tokens[0], "inline") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_inline)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "idle") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &idle_report)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
             return -1;
-- 
2.25.1


