Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4574E5F6A8C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:26:28 +0200 (CEST)
Received: from localhost ([::1]:32808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogSlX-0001fI-6L
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXn-0003cC-PJ
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:12:18 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:45014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXm-0004b8-7w
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:12:15 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 t10-20020a17090a4e4a00b0020af4bcae10so2019177pjl.3
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x1FTgrQXR6uNMn6KBsxmdWGkHMmBa5ff+i5f1cGTWhw=;
 b=h8d7PBKABPESlh9PuRVZ/fUcpqKe9alWw4fi8huTY32EboIcDylcl8t7xBZHnqOYUz
 M09GkdtgcTRiGLm9OicK/9HSgcVYj/MvDZ6m9LyQGhGfJoX9rRdzF8lu1gI79dRoY5bT
 kk5phn+TbBbsmXLDF226+ZDzDvM2LLfQ7lvxo0uxyGiOFRAvCT9IF/9Sgc+9FS9iyHTN
 u0vvWtEv8YgM8a0TaatHtMoNF6eefBPmPH7vMKgJr4yMlUA2o2moFxcm3MEsWFY2dNMb
 vJo4apmGAofa64FX7LrIyvndWhhFEDsH8uODlpVe18EDwoyWwVb4ftUqKgUHFJ6zr0hm
 3aYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x1FTgrQXR6uNMn6KBsxmdWGkHMmBa5ff+i5f1cGTWhw=;
 b=qxXZafQpieZqwiIpFYswJJbWaWzksywZbWRh8cWkU5r4zI/0VDIFSbWK4cRzWNuJIP
 mlExM8lKICfc+WcvRvP7y6v7OoXY/OG4TLj1QUVpkFsx1A+40nUfL3hc7gBTRkfpJKHs
 n6aIIJ7XRqG5H4Hb1nfhv2IV3msL5rXl1Us7/pKHGfav3ZKhHKz7QLmFDPbDrNjZFT1Q
 KSr2TAvegbSaZ5ED9V6xrZug/NGhlL+L8HFi8981plxsVUbuohu4vw8qssDqwbLePNec
 bwGj7j26Xng5rGk22k9Ctu/GJngC2+y/xc4hHX0hEtNdWu31jqPw6euZCa+4IwWPRXUh
 KaeA==
X-Gm-Message-State: ACrzQf1gLu5pNgoeJFh0SIkYwKWChhfgpRFuKyv2xYnHIw7jEkDThGuO
 Me7IYDxyWMfXRBldrsXTmEwvgybCQdQ=
X-Google-Smtp-Source: AMsMyM65XrASXH7AA3KnXulWigEt2iCLnfMIGd8rFsq6a9WtyGtMA/jHB7+KfDZfFhn1L38nZxnasQ==
X-Received: by 2002:a17:902:b415:b0:178:2835:29e7 with SMTP id
 x21-20020a170902b41500b00178283529e7mr35767plr.86.1665069132505; 
 Thu, 06 Oct 2022 08:12:12 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62148d000000b00540c8ed61ddsm8589067pfu.150.2022.10.06.08.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:12:12 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 10/18] tests/qtest: libqtest: Install signal handler via
 signal()
Date: Thu,  6 Oct 2022 23:11:27 +0800
Message-Id: <20221006151135.2078908-11-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151135.2078908-1-bmeng.cn@gmail.com>
References: <20221006151135.2078908-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102f.google.com
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

At present the codes uses sigaction() to install signal handler with
a flag SA_RESETHAND. Such usage can be covered by the signal() API
that is a simplified interface to the general sigaction() facility.

Update to use signal() to install the signal handler, as it is
available on Windows which we are going to support.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

Changes in v5:
- Replace sighandler_t with its actual definition, since it is not
  available on BSD hosts

 tests/qtest/libqtest.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 8228262938..54e5f64f20 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -66,7 +66,7 @@ struct QTestState
 };
 
 static GHookList abrt_hooks;
-static struct sigaction sigact_old;
+static void (*sighandler_old)(int);
 
 static int qtest_query_target_endianness(QTestState *s);
 
@@ -179,20 +179,12 @@ static void sigabrt_handler(int signo)
 
 static void setup_sigabrt_handler(void)
 {
-    struct sigaction sigact;
-
-    /* Catch SIGABRT to clean up on g_assert() failure */
-    sigact = (struct sigaction){
-        .sa_handler = sigabrt_handler,
-        .sa_flags = SA_RESETHAND,
-    };
-    sigemptyset(&sigact.sa_mask);
-    sigaction(SIGABRT, &sigact, &sigact_old);
+    sighandler_old = signal(SIGABRT, sigabrt_handler);
 }
 
 static void cleanup_sigabrt_handler(void)
 {
-    sigaction(SIGABRT, &sigact_old, NULL);
+    signal(SIGABRT, sighandler_old);
 }
 
 static bool hook_list_is_empty(GHookList *hook_list)
-- 
2.34.1


