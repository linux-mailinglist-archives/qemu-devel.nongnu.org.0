Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B6831430F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:36:27 +0100 (CET)
Received: from localhost ([::1]:56174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9F8t-0007BQ-1B
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:36:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCH-0002s4-3n
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:43 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCF-00062V-24
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:40 -0500
Received: by mail-wr1-x429.google.com with SMTP id n6so5553278wrv.8
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p0gUq9l/dd+MCZ+Us772HwQOuGhCcjbbMzRDKa3bhUc=;
 b=C4MlXNBfo2KsFenIf2jAJp20ZJcb1EwTiUETBSDMXpmmPvfME9vK1yeBmAOAAqZBPw
 s+MP7P2at3lNp2mXUwpErjV9aIMxwQ1/9t4peGgbkPbaAJvPaqnsBUqW6LL+GZKc1Un0
 C1lVN7D7O8uuVMkWhNU8emBf5ZGfmYORur8LpzDHdOo6KF7Czr2XpR5JFTwTZnYeMUow
 qDhbAwOwGTQ35izbPJ8mAvkg4SEOvjS0ubQMsnRa1jZ7lloM+qA1art6kN6FQ2jZBHWQ
 tcTJn+p+DGNK8Jg0mDxWSYnj5SgN3KTITFWcnitwKw2KidMFqQ09fCL6pZQS7CK5Kaam
 peog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=p0gUq9l/dd+MCZ+Us772HwQOuGhCcjbbMzRDKa3bhUc=;
 b=r+Aj0Es1WxZ/FuHPfvhlOwoj5bjtF9Ay+Gq7IFnJ+G7a3AFekGS1753JKGa9v1GAhm
 qtbIwWEa6SaqSyE/X1fkrrletpdR+k/LsejpiMkTYQhMalM3PaAyNUrfiKtzPxCqjrFa
 JvnwLL5Wy65h6QvjW78nJYLEflh6TDjWrgZh+2KePzWewjCCCAONKA6jjJ48fa3vk2ZA
 JVKAZhbiSJlRBiKM3ubc0qSpl35H7ZRKGDMNIdklxxDjoU5wk/DPZziG709MosRmqBwh
 eNfMQMgqBsmzpP5Z80zxmiajCPzST83Z9s2hsOOHeuzJq0jTjFPUq9zX1c1s+wUbwTUL
 CNVQ==
X-Gm-Message-State: AOAM533MAxBV+8vK0LqCxdS5C1nT4rW67L8BZsUeGMKVA0cB4YsKQkud
 2SapZJDfcevqEZm7ddWJYU5wIwkTIQT06w==
X-Google-Smtp-Source: ABdhPJyqZJc0p7f8aVop4tInF0spbjsV1poCkdP2dyU1094oEZqI9P4ZeWXrNJMg9n6hQEsgafXhMw==
X-Received: by 2002:a5d:6541:: with SMTP id z1mr20743318wrv.128.1612808617619; 
 Mon, 08 Feb 2021 10:23:37 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:36 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/46] fuzz: log the arguments used to initialize QEMU
Date: Mon,  8 Feb 2021 19:22:49 +0100
Message-Id: <20210208182331.58897-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

This is useful for building reproducers. Instead checking the code or
the QEMU_FUZZ_ARGS, the arguments are at the top of the crash log.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210117201014.271610-3-alxndr@bu.edu>
---
 tests/qtest/fuzz/fuzz.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
index 238866a037..496d11a231 100644
--- a/tests/qtest/fuzz/fuzz.c
+++ b/tests/qtest/fuzz/fuzz.c
@@ -159,6 +159,8 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
     char *target_name;
     const char *bindir;
     char *datadir;
+    GString *cmd_line;
+    gchar *pretty_cmd_line;
     bool serialize = false;
 
     /* Initialize qgraph and modules */
@@ -217,7 +219,7 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
     }
 
     /* Run QEMU's softmmu main with the fuzz-target dependent arguments */
-    GString *cmd_line = fuzz_target->get_init_cmdline(fuzz_target);
+    cmd_line = fuzz_target->get_init_cmdline(fuzz_target);
     g_string_append_printf(cmd_line, " %s -qtest /dev/null ",
                            getenv("QTEST_LOG") ? "" : "-qtest-log none");
 
@@ -226,6 +228,13 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
     wordexp(cmd_line->str, &result, 0);
     g_string_free(cmd_line, true);
 
+    if (getenv("QTEST_LOG")) {
+        pretty_cmd_line  = g_strjoinv(" ", result.we_wordv + 1);
+        printf("Starting %s with Arguments: %s\n",
+                result.we_wordv[0], pretty_cmd_line);
+        g_free(pretty_cmd_line);
+    }
+
     qemu_init(result.we_wordc, result.we_wordv, NULL);
 
     /* re-enable the rcu atfork, which was previously disabled in qemu_init */
-- 
2.29.2



