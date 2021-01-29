Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F38B330888A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:49:05 +0100 (CET)
Received: from localhost ([::1]:40204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SGu-00082X-Vr
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:49:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnC-0004Dt-M9
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:22 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:33269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnB-0005ta-3L
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:22 -0500
Received: by mail-ed1-x532.google.com with SMTP id c6so10159809ede.0
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p0gUq9l/dd+MCZ+Us772HwQOuGhCcjbbMzRDKa3bhUc=;
 b=OWa/xB7MlHU1oS51y5C6PXk3vfdHU2nG06V304FaXI2+zWc3TMV+gxkjsELiLP9VjW
 90+pLHxWrFDs2E22HurS3/Ahx6tqP9tbPKzDIGy2EymXi+szYkZTBfRUnaB3ZN4yuFOm
 xVwTjVT1BuW4mJ4Dx+6Ziqu0EPmVUVlCUoRW30pvvf9Aur2ufKQaKtwZVaWYMojr+83A
 95PXGmK5g7LQsSD01BTLG8gmZ7PyROH4V2kmgEOp+L10aKL44v1uIFbnbQhCzgwVBvrJ
 iVL2WFpFY2aK9qukDkRxso9pwLvMsc20YQckBFK7E/LXENnSVy6TZs1qOCYc1Wj89gSk
 ApqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=p0gUq9l/dd+MCZ+Us772HwQOuGhCcjbbMzRDKa3bhUc=;
 b=YW8wp+wqIP+XDRyOrrQXmR6/8nhkCMgT6FZuPqYJFyRZgU8IpiYNXSQdmpS5n4zeKG
 LjkZep3IZXNGPyvgZMqHV1GeRUrx7XveARIJ9Bp7nYxI3ZY8d00BbodKVG1kIEUV1OM+
 7Zga9/daIo+rdSoewufF3bzrZko+6S1Le6xFZ33CuE8LrXm7xnfoH8I873XQgGZPdcpd
 znUpPB/Jccc1ch+1xfReADKyEH/GnvPmNmKGtbb4NfvRlrwOyM9BMSCdx0EtHiFRbHak
 M6nCCBWTqdbBQYCcPuWrGRCoJBiZsBQAQm3MGSNDvMfBamkFCex2MU5hiW2WavA1AyIr
 ArdQ==
X-Gm-Message-State: AOAM533rZ8cARxWTPT7FV9v12Yi8kMznKHzZ/znSZLG+rQTI493mqDik
 +hc38rjUA8eOs5K0dJI160rEoFCWdtRVow==
X-Google-Smtp-Source: ABdhPJz0GSkhO5kCqS9R4Y27c/Ide4jl+asg4o27I4cojSR9o/9A+okZHF7dJ+sGPgVY0IgWoYMj8w==
X-Received: by 2002:a05:6402:20e:: with SMTP id
 t14mr4509565edv.178.1611919099478; 
 Fri, 29 Jan 2021 03:18:19 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:18 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/36] fuzz: log the arguments used to initialize QEMU
Date: Fri, 29 Jan 2021 12:17:42 +0100
Message-Id: <20210129111814.566629-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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



