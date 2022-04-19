Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9415064D9
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:51:07 +0200 (CEST)
Received: from localhost ([::1]:41114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nghha-0006Zs-CO
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmF-0001F6-Es
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:52 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggly-0004Rl-PW
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:51 -0400
Received: by mail-wr1-x436.google.com with SMTP id k22so20924349wrd.2
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hXRtQ2q38QfPSpgZNZm47aH6FCiJbFi6LLcyuNfmZqM=;
 b=OC+oEfnLLjQCWnW3AguBrtfw3IrCKyJUfqWGmlKDSBGMFGQ8RHWvwN0POOlPEU+RN4
 uROpW6OBmTTzSQVNMVWNr0aP0TZzDriH+nd5VDnX7tBtcgu5wCV6TCT9R5XYP4Cz5KXh
 wDJKjVjoPLt7+NieWM4LOHtKJKDFOjo8CX4PnDAawG1Q1SbwRVb+nrONwiblBwae9ovy
 ra204WceQA9/W58LsEc1bayg7px4Z0wDxslPfVoDJMzxPuFIPr2KOHFPQcDHY/oWVI1E
 t9zp3uQARK7tatd20/iKJHNj5FUiFx0hrWk8hk3oK0cTA9g2duxbynT1s20cAX2bZD2h
 eTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hXRtQ2q38QfPSpgZNZm47aH6FCiJbFi6LLcyuNfmZqM=;
 b=aEpRymX/I0idUKaM86/arslaYCjr6vmahFFehGPsmvxoi+KJr2dx5eh6cHXg3oZi3m
 Lefs3mH28j7syU51piVheBbIKWJCOdqq9wOiF/+oMPs68+cpjj02FQRwVOFvvj5eZWKp
 C79w6UQNpRWuYtnFL6UQENI2zxhEwf3X4Od76CgYbn3Ua0x0GxNjTJkVKyFtVxwWkxtA
 s6KmZuNDosEKmbJ4ZsWU4TbzkTYSV4A9nP21GHxLHxAjT1nYundtIJWg+2SshlcZKt7R
 spMtYQR1ZV8I8lYXprcwMRB81byEHRR1GeOt968gnsc0TNH33gO1QqIKEjc6KROZ7Sz0
 g6Wg==
X-Gm-Message-State: AOAM531AQExgICh9Dhz9LtW+zUT3dHOUVdvavgg0OSLQbr5BW+YV6sF/
 A5bMpXtSUH4/A6r3S1eI3NLhsK0IjJ83lg==
X-Google-Smtp-Source: ABdhPJyA3GEL72PjdmBdnXb/PaCXgkUKK+ACB5Zjc+ygFCgTxrs/a0OGd+q5z8oTObmqu1lapBiHNA==
X-Received: by 2002:a05:6000:2c8:b0:20a:9587:76c1 with SMTP id
 o8-20020a05600002c800b0020a958776c1mr6205431wry.335.1650347492438; 
 Mon, 18 Apr 2022 22:51:32 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/53] include: move progress API to qemu-progress.h
Date: Tue, 19 Apr 2022 07:50:45 +0200
Message-Id: <20220419055109.142788-30-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, PP_MIME_FAKE_ASCII_TEXT=0.999,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220323155743.1585078-25-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu-common.h        | 4 ----
 include/qemu/qemu-progress.h | 8 ++++++++
 qemu-img.c                   | 1 +
 util/qemu-progress.c         | 2 +-
 4 files changed, 10 insertions(+), 5 deletions(-)
 create mode 100644 include/qemu/qemu-progress.h

diff --git a/include/qemu-common.h b/include/qemu-common.h
index bc73daecb4..fee2181af2 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -24,10 +24,6 @@
 int qemu_main(int argc, char **argv, char **envp);
 #endif
 
-
-void qemu_progress_init(int enabled, float min_skip);
-void qemu_progress_end(void);
-void qemu_progress_print(float delta, int max);
 const char *qemu_get_vm_name(void);
 
 /* OS specific functions */
diff --git a/include/qemu/qemu-progress.h b/include/qemu/qemu-progress.h
new file mode 100644
index 0000000000..137e1c316f
--- /dev/null
+++ b/include/qemu/qemu-progress.h
@@ -0,0 +1,8 @@
+#ifndef QEMU_PROGRESS_H
+#define QEMU_PROGRESS_H
+
+void qemu_progress_init(int enabled, float min_skip);
+void qemu_progress_end(void);
+void qemu_progress_print(float delta, int max);
+
+#endif /* QEMU_PROGRESS_H */
diff --git a/qemu-img.c b/qemu-img.c
index cf63db7655..116e058675 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -26,6 +26,7 @@
 #include <getopt.h>
 
 #include "qemu-common.h"
+#include "qemu/qemu-progress.h"
 #include "qemu-version.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-block-core.h"
diff --git a/util/qemu-progress.c b/util/qemu-progress.c
index 20d51f8c12..aa994668f1 100644
--- a/util/qemu-progress.c
+++ b/util/qemu-progress.c
@@ -23,7 +23,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
+#include "qemu/qemu-progress.h"
 
 struct progress_state {
     float current;
-- 
2.35.1



