Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AA25BE622
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 14:44:40 +0200 (CEST)
Received: from localhost ([::1]:47276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaccB-0002EU-2C
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 08:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYr-00019R-Rf
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:05 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:50918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYq-0004rp-3Q
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:05 -0400
Received: by mail-pj1-x1033.google.com with SMTP id fv3so2613936pjb.0
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=UN6281p/RMPF4xkeiz72JCfUX7VJgvaymIo+YvmfI5M=;
 b=Pl4nL+OROspIT4xVNOd6xGli+Lr0M7xBeE2hrpktOPNeTY0irRCNx1/9e0Y1P/y81O
 hTiXv4+ZMq9LybX8LCeQGRQ8u+FKzAR6QvaBg2kv1fJ3ZSPKw/ITSHRFUCMScLHQAwMk
 lmLrwjKKJbNgkoIgTNpwOEEYDcLmAGTjcq6xcs3SJlHfQGQFBqUK0ZJCPO1CuQ/9X/KW
 PEwAcTsSnPGRf43ynfLPLTSo9ZmGfx125kp3FyHJLk8W5FLYzxdErA5+s6Z+dNtnPHZ1
 oQXv/KAlHO/aIzFyOvj1ab5PBOlFc4iaLYlBez7HyRBkG8OFqKbmZXxsUhSYxTqGjfSL
 7+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=UN6281p/RMPF4xkeiz72JCfUX7VJgvaymIo+YvmfI5M=;
 b=BNiObB4WU81eE8RNRrXuqDobpJBVRPUMNwftjrcGASlRQBy7AThiGBLdNiMrU8noAs
 3JOpFR13O32HGAwDrqzAY8BIHsJy3As8AMikdiDf0wzKG0/W1gHEcmxRRuEhkQuz5Sdy
 FlRBkpTHa/ow0YjEL/iY6fA5HMHnXjimcEZXApzQeGooeD1DrqKJnWQ9FroKbZnLo1sF
 bncfxPZfKZGwfO1KGqLLdUBK09hw1QumaT1TmA4LDEoRaLQZ7aeDOpPP2rQuTTovP6sF
 36BRoKE6gANapwq7cAE5zDW/hQaolEn07QE/RqklJgZtWOIp/QdFsRP7/Q62I4YO5JbB
 tveQ==
X-Gm-Message-State: ACrzQf0PMN2exqh50pXclNHWwRyMiZsgWjFUaoV1iaYpWgxN3URNSziG
 3srCXcgEX5eIFJUQ2tQULetmx/6rEJU=
X-Google-Smtp-Source: AMsMyM7T07HrEX1URbETQF4vnxogIO1duWPZvZYCOmemqDQFK/QTHJRXqKDN3I4OotXh8dpYaATRQA==
X-Received: by 2002:a17:90b:4fc8:b0:202:a340:3594 with SMTP id
 qa8-20020a17090b4fc800b00202a3403594mr3250965pjb.149.1663669982463; 
 Tue, 20 Sep 2022 03:33:02 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:33:02 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 18/39] tests/qtest: libqtest: Install signal handler via
 signal()
Date: Tue, 20 Sep 2022 18:31:38 +0800
Message-Id: <20220920103159.1865256-19-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1033.google.com
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
---

(no changes since v1)

 tests/qtest/libqtest.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 8b804faade..f46a21fa45 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -66,7 +66,7 @@ struct QTestState
 };
 
 static GHookList abrt_hooks;
-static struct sigaction sigact_old;
+static sighandler_t sighandler_old;
 
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


