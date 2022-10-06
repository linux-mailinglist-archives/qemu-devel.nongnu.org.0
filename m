Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BB25F6A7A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:23:32 +0200 (CEST)
Received: from localhost ([::1]:42524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogSih-0006Wy-G2
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXX-000347-1n
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:11:59 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXV-0004ZX-G2
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:11:58 -0400
Received: by mail-pl1-x630.google.com with SMTP id x1so1984555plv.5
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EgL4d6VdvWsoCo8DlQTj5egD3vl1ynzfG1/OtpHXHWg=;
 b=GBWSjRPcpug53/ozuo2QBqNKU9Bmg8y4oGUU32jYgjEfG6m6kKtmnICwfKTrfDJqmW
 Fxog+8XJW84HfVPmoCwFmzk1Szf68ljBQR/y4vyAGQ9bLP72c8j1wbyXUbqlo67G4K6A
 5JMdT7edGOYiYJ9m1OToaZLpeZC33DNUCcNeNU/i7z3dqOr54kz+ugAAXHhh7Fz8p5lS
 n7EHdIOuf5kmP1OH2jwoMOTMbp7rer7oYLYVhxj8tbY1bgNm8uC3asnIptsF9QSl990i
 +GLtw4gvYcUDzWQEflnJSy6bmPYkSwBFPq6tjC3IObz2XD3cli+09tSNA/J/q6PDotFg
 plCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EgL4d6VdvWsoCo8DlQTj5egD3vl1ynzfG1/OtpHXHWg=;
 b=f1wA8xkCbyocvBX0kCc3C8e73ruUL+kCLA10PcxlyVksER0JrSfAVct+JNzdRjxtZk
 QJ8qfgChXtSyjCffDba9Twa8N8IA8N+IgWIHF7S5V9S5yjwGf1eZTA2zHi5JQ4ElJXW9
 FxkIM7PfbtqkTQBP+t1BFVOaXtTJ/eTK7CJUcv6dI0hb4Y8ihNkF7Tk6ym/1orTNSwSB
 2+HDX9Bqi19UUlgd0eehpvI2iA7l3zEmQjhbT89w8vX7Nt81aXS7d4XwAT2s2+KJfrfm
 QeLOyuktCMkArx3aJTdbKti5mgNnWWGd/gRQnObdEJCevryeHgTv8fNUt+71NFxJqWCh
 VKxw==
X-Gm-Message-State: ACrzQf3iuiyr9hc+09Hy2mCEqOvBgsYZgy+ri+az2cqJAuZKd1Z5cLIL
 o1MgF7DdI3biXDlZ9OVwzOb3tuB0BNg=
X-Google-Smtp-Source: AMsMyM7eTeb3VSA6H7VAYzaXxJWl464rGpQH6QZ1tyl/ptKEpFAs+q0Ou+cS8K/APIYgBqxlZaY9Pg==
X-Received: by 2002:a17:90b:4d8b:b0:20a:e256:fdd8 with SMTP id
 oj11-20020a17090b4d8b00b0020ae256fdd8mr11207554pjb.4.1665069114467; 
 Thu, 06 Oct 2022 08:11:54 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62148d000000b00540c8ed61ddsm8589067pfu.150.2022.10.06.08.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:11:54 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 04/18] tests/qtest: migration-test: Avoid using hardcoded /tmp
Date: Thu,  6 Oct 2022 23:11:21 +0800
Message-Id: <20221006151135.2078908-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151135.2078908-1-bmeng.cn@gmail.com>
References: <20221006151135.2078908-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x630.google.com
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

This case was written to use hardcoded /tmp directory for temporary
files. Update to use g_dir_make_tmp() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

Changes in v5:
- Use g_autoptr(GError)

Changes in v4:
- Update the error reporting by using the GError "error" argument
  of g_dir_make_tmp()
- Remove the const from tmpfs declaration

Changes in v3:
- Split to a separate patch

 tests/qtest/migration-test.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 0d153d6b5e..ef4427ff4d 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -102,7 +102,7 @@ static bool ufd_version_check(void)
 
 #endif
 
-static const char *tmpfs;
+static char *tmpfs;
 
 /* The boot file modifies memory area in [start_address, end_address)
  * repeatedly. It outputs a 'B' at a fixed rate while it's still running.
@@ -2451,10 +2451,10 @@ static bool kvm_dirty_ring_supported(void)
 
 int main(int argc, char **argv)
 {
-    char template[] = "/tmp/migration-test-XXXXXX";
     const bool has_kvm = qtest_has_accel("kvm");
     const bool has_uffd = ufd_version_check();
     const char *arch = qtest_get_arch();
+    g_autoptr(GError) err = NULL;
     int ret;
 
     g_test_init(&argc, &argv, NULL);
@@ -2479,9 +2479,10 @@ int main(int argc, char **argv)
         return g_test_run();
     }
 
-    tmpfs = g_mkdtemp(template);
+    tmpfs = g_dir_make_tmp("migration-test-XXXXXX", &err);
     if (!tmpfs) {
-        g_test_message("g_mkdtemp on path (%s): %s", template, strerror(errno));
+        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
+                       err->message);
     }
     g_assert(tmpfs);
 
@@ -2612,6 +2613,7 @@ int main(int argc, char **argv)
         g_test_message("unable to rmdir: path (%s): %s",
                        tmpfs, strerror(errno));
     }
+    g_free(tmpfs);
 
     return ret;
 }
-- 
2.34.1


