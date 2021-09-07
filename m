Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC46402998
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:20:30 +0200 (CEST)
Received: from localhost ([::1]:60440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNb1Z-0003vb-HQ
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:20:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNaZe-00081M-BT
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:51:39 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:41794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNaZc-0001E6-Kr
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:51:38 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so2170095wmq.0
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 05:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dmX0o4nkxofFX7RHFQBbRjzG5pTyRx2wcmHhXpMEUyg=;
 b=YDUWCZwdDvoSeyk8Sl28JpYVh3P0uhQReWFqtOMX0skbTiidEzArGkdYt67TxGqjpt
 YFpbkCjW8zZzz8AsMz7rFrWcOhhPe0ujhpySrrrD6tOxH8QuNw2JbzjQ0O8BQuuxS3Dn
 PnbvS4fmhhe2Jz6is0Sq9a9U+Bw83O9q0S1Ajk6eNfb/sy5zjvss7LIPE2T4rrzSAdQO
 4Lk2rKtIA7v7HKwys+UaxjHnfrmAj800NxhUcIlXvhQ9sWnbXRcb7wOgyhRvp8gBTH+3
 gvIBJcTopvp0Dj1d58SXA2CiOJckmNxQA+HuEAxF7h9/IqgBV9g9wKVyopBD80TTwN/M
 lMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=dmX0o4nkxofFX7RHFQBbRjzG5pTyRx2wcmHhXpMEUyg=;
 b=cIHKQo9Pqeyc4H8f4ZklUW9AiIgHRVV/YBWaGG/3dizA+uxM7zW+JESoU5Qw5DSUu1
 FAzoBibWlNqAXxroPknI7STwxHUH2/tuhFJsC3PN1+LQxiNViM3CiwIq/2nANX1kSt/s
 6e91tZFlutmX+wU161PN9t9bp/282hSCC2nB0pE0rjdNsu/Ripf16tYjNxi6Kf0lBKgH
 Os352CElqSUsFoekYVhDg5UaXeGOiCsS58DhYNNQnrwdoDoWf/Ds91itKdnWMcoqZ0xg
 O4hxaT7WXNkMXjz12OwhAa7tctuiSpqZMLe2DSHnTpp/jxr4Qul011XutdP3oZpkTll7
 SHIQ==
X-Gm-Message-State: AOAM53153mYv0W70nRbFETttehM2aOvk7pudrvPeahQ2dKbfrAofU54s
 BVMHnvkkvth7QDIGxbLs/nEgxTuKi/s=
X-Google-Smtp-Source: ABdhPJwYOUbYHKpyizKE/dWbILdcxn3emQ7hzPg81A3YkYVhjkK3/X/gyHX60GfaPsW5wydPwUGHkw==
X-Received: by 2002:a05:600c:350b:: with SMTP id
 h11mr3805222wmq.101.1631019094605; 
 Tue, 07 Sep 2021 05:51:34 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c7sm2238912wmq.13.2021.09.07.05.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 05:51:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qemu-thread: avoid false positive in pthread_cleanup_push
Date: Tue,  7 Sep 2021 14:51:20 +0200
Message-Id: <20210907125120.145068-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following error occurs with GCC gcc (Debian 11-20210327-1) 11.0.1 20210327
on Debian Bullseye:

../util/qemu-thread-posix.c: In function ‘qemu_thread_start’:
../util/qemu-thread-posix.c:520:5: error: ‘__sigsetjmp’ accessing 200 bytes in a region of size 72 [-Werror=stringop-overflow=]
  520 |     pthread_cleanup_push(qemu_thread_atexit_notify, NULL);
      |     ^~~~~~~~~~~~~~~~~~~~
../util/qemu-thread-posix.c:520:5: note: referencing argument 1 of type ‘struct __jmp_buf_tag *’
/usr/include/pthread.h:719:12: note: in a call to function ‘__sigsetjmp’
  719 | extern int __sigsetjmp (struct __jmp_buf_tag *__env, int __savemask) __THROWNL;
      |            ^~~~~~~~~~~
cc1: all warnings being treated as errors

Disable the warning just like it was done in glibc.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/400
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-thread-posix.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index fd9d714038..4cf47b3414 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -537,7 +537,16 @@ static void *qemu_thread_start(void *args)
     QEMU_TSAN_ANNOTATE_THREAD_NAME(qemu_thread_args->name);
     g_free(qemu_thread_args->name);
     g_free(qemu_thread_args);
+
+    /*
+     * Work around GCC 11 false positives.  Ideally glibc would use
+     * _Pragma itself, for now do it.  See
+     * https://sourceware.org/bugzilla/show_bug.cgi?id=26647
+     */
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wstringop-overflow"
     pthread_cleanup_push(qemu_thread_atexit_notify, NULL);
+#pragma GCC diagnostic pop
     r = start_routine(arg);
     pthread_cleanup_pop(1);
     return r;
-- 
2.31.1


