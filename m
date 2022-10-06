Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CE05F6B99
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 18:25:09 +0200 (CEST)
Received: from localhost ([::1]:41378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogTgI-0008Ec-KV
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 12:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSfP-0004V7-Ih
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:20:09 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSfM-000627-VE
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:20:07 -0400
Received: by mail-pl1-x633.google.com with SMTP id b2so1991116plc.7
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x1FTgrQXR6uNMn6KBsxmdWGkHMmBa5ff+i5f1cGTWhw=;
 b=EtSPf7z/A8vVs6xX4SMasLekdLW9mdExa6dpmdfmkqSXfyvGz/XWHvYhu7UQEiwrL8
 LVKSxh2miS675ApsCcSUVtXy5PSZ3x/2CjK8ZMKDePfmmEpTkJwfeMSqj25Gx3h05YSR
 Rw7WZha9O1TlGhrqLA0+aA17tgjnuYRp3TsSxtUo40BflbTVW75lf8EXZXXCjlJKn+i0
 bb7E0Nh0J90mfE6GypPCcKBdHxdR6GlJs/r9nfg7d8MgUqXRaSCeXamdDQ08sygTlWlH
 HGzWz2Ea9jrJFlcRDcMQc8x3FBLO2LYkgitDWMh/P+rTVRZini2fuvGOXPRcr77u6Vh8
 QF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x1FTgrQXR6uNMn6KBsxmdWGkHMmBa5ff+i5f1cGTWhw=;
 b=nogFRrR+GMIkM3WXaMwU3xM44Zf/B3zSKr1Qw9A03G2k9rNDGaEZIKrlQCTeoat8mb
 r5w31K2w0A1GcKkn/JlsSKYWMOUB6UZfvTe5uFtH6RsRhscCYwil6MG60Mpm7CGaFa4s
 ZnKCENIQq68ZVba0ZIHlDoc5AVJCtvPVpu+RlyBN8slhbZMR3kZ+Tg9waTmd9qQQ3ro3
 HClpwkXHa+M2YRE8H7VbpAHCwu5RK0+2t08EAYo0TEI2gqqvDzH1yuLokREpyh0VxZ1p
 tUA/b15Pwum920zp55pyb2jjOrh10rYsBdqAC5V34yEbJgAi6+PwWWOwiSN2ZamPNsRI
 qNLQ==
X-Gm-Message-State: ACrzQf0PYjtYnsA3jhrpBOuwKwzd53Sd4DaU/CCNvA2Vh8y8XJEGTMCh
 ePC9NNXWBxHe2gow4vk7/BlW6FFdIlE=
X-Google-Smtp-Source: AMsMyM5+sW4hcH+vCtFP7TGxj+CuaCAM+cb1cRFv+DKIA8YepkXFroaL4lVeyn08WWSuJg15skxeKg==
X-Received: by 2002:a17:902:a707:b0:178:bd1e:e8be with SMTP id
 w7-20020a170902a70700b00178bd1ee8bemr5128523plq.167.1665069602340; 
 Thu, 06 Oct 2022 08:20:02 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a170902780d00b0017c37a5a2fdsm11426759pll.216.2022.10.06.08.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:20:01 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v5 10/18] tests/qtest: libqtest: Install signal handler via
 signal()
Date: Thu,  6 Oct 2022 23:19:19 +0800
Message-Id: <20221006151927.2079583-11-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151927.2079583-1-bmeng.cn@gmail.com>
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x633.google.com
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


