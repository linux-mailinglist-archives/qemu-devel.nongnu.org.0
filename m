Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DB55EC1BE
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 13:44:02 +0200 (CEST)
Received: from localhost ([::1]:41828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od90L-0003Y3-H7
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 07:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8RH-0002oK-JN
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:49 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:42818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8RE-0004yA-4t
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:47 -0400
Received: by mail-pl1-x632.google.com with SMTP id v1so8742437plo.9
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=pltk4hzB+ifyBuv3+h8PEwxuQX6c0kjc3n3kVoOS+a8=;
 b=MSJVCCPyFVceRXM2DdX7ECdodI2htDxNU97xdL0n2luqXVEmZsjcVh7GEVptFvq3cX
 rDz70LATjmuk7tWFtGHXMkS5Vf4mNyKFZobJVoZr4S8KnxU0r8sPLc3LqsBBYwrcPj/p
 4Xq1LRma8gcp7AyZcY8PgjpQ13i9c6GakFw3cOdApgm3krhnHyNhbuvQ641KCTr60Gon
 kwSyBqfyZiFG1h44ucGVbK/ia1uIaeIjUSLVLhMdUgRjzJibdxbFzlcQXts39dWzILqO
 zqTI/xvv3QZTksuwBg8GBj/j10jWfpvuLdA/SFxXTji4fBUImtPOfPv4qrvlKMx1p2KN
 FEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=pltk4hzB+ifyBuv3+h8PEwxuQX6c0kjc3n3kVoOS+a8=;
 b=5TaI3GJfS2DgRgEdCwIASEBrz229zczs8KWFfoS/avgs6UeVvDCQxrYBdHkvhzfcC9
 r7ZAFHx/ZIn/AyOBjGHLeEoYor6zd3Oh5Bf8Lo0bhrp9QbzN+hhmWKB2dZvte+2/Ki9M
 Xkb2wwXIXAGEQ0XzcMDsPizRJjGg7gb+TyoY72ITFyV/0CxRElCgyk3wCVifLzBiQuju
 FWppJWRJUE5wzbFil4L1WBfSrvwL/ZvVeSnYnJ6nC2TvPyuaZHwo85UBylM33SL8UW2o
 8ZccnAmMl0B7yuaIDG+oVGPpoWmV/1yef9Jo/nATE9V3MAC9V8zHnJ/4fW26Uqe27fmP
 RcXw==
X-Gm-Message-State: ACrzQf1WC8vpQzCkxNs8P+9ifJd5eBTqi+q14xCXEi9jksQrkrnePoYz
 YqQc9tJxAzpEco7uOQOk0de/64utFLU=
X-Google-Smtp-Source: AMsMyM4yUUSFnqwmtcEnWaYEwi0dhTgmUFa2l78gKMYzI4iWzOIzCDk7xvUqdKqFyf6lCjRRzlk8Cg==
X-Received: by 2002:a17:90b:1650:b0:205:65db:d6eb with SMTP id
 il16-20020a17090b165000b0020565dbd6ebmr4037056pjb.246.1664276859357; 
 Tue, 27 Sep 2022 04:07:39 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:07:39 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 21/54] tests/qtest: libqtest: Avoid using hardcoded /tmp
Date: Tue, 27 Sep 2022 19:05:59 +0800
Message-Id: <20220927110632.1973965-22-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

The qtest library was written to use hardcoded /tmp directory for
temporary files. Update to use g_get_tmp_dir() and g_dir_make_tmp()
for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v3)

Changes in v3:
- Split to a separate patch
- Ensure g_autofree variable is initialized

 tests/qtest/libqtest.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 7c9fc07de4..d8ffa0e7b1 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -265,8 +265,10 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
 
     s = g_new(QTestState, 1);
 
-    socket_path = g_strdup_printf("/tmp/qtest-%d.sock", getpid());
-    qmp_socket_path = g_strdup_printf("/tmp/qtest-%d.qmp", getpid());
+    socket_path = g_strdup_printf("%s/qtest-%d.sock",
+                                  g_get_tmp_dir(), getpid());
+    qmp_socket_path = g_strdup_printf("%s/qtest-%d.qmp",
+                                      g_get_tmp_dir(), getpid());
 
     /* It's possible that if an earlier test run crashed it might
      * have left a stale unix socket lying around. Delete any
@@ -390,10 +392,12 @@ QTestState *qtest_initf(const char *fmt, ...)
 QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd)
 {
     int sock_fd_init;
-    char *sock_path, sock_dir[] = "/tmp/qtest-serial-XXXXXX";
+    g_autofree char *sock_dir = NULL;
+    char *sock_path;
     QTestState *qts;
 
-    g_assert_true(g_mkdtemp(sock_dir) != NULL);
+    sock_dir = g_dir_make_tmp("qtest-serial-XXXXXX", NULL);
+    g_assert_true(sock_dir != NULL);
     sock_path = g_strdup_printf("%s/sock", sock_dir);
 
     sock_fd_init = init_socket(sock_path);
-- 
2.34.1


