Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AE35F6AA0
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:31:35 +0200 (CEST)
Received: from localhost ([::1]:44538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogSqU-000879-9L
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXv-0003fZ-3d
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:12:25 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:42541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXt-0004cj-LZ
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:12:22 -0400
Received: by mail-pl1-x629.google.com with SMTP id c24so1962636pls.9
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9AFisMEhPtudU5rqA28QSZ0J20KCJlzzQQR7vCLusZI=;
 b=qDj61fpMDU7ofxInZN8Iixa2HVBIJr0J5QKjAIWQ4k2mLUczR9SgLKEFxnrHYfUwDK
 OBIVT7q/OhlTayxdY8tSqT9IB3rELdDvh9SnoJRW7+LZkuUwyAKsCor1i7ggdvfEFFfd
 YTja1gEFnZ7dNVC8c2wypZRV2uDRrPsig2PrMwXdx7WlqCcaBO/fwy758sqOJUW9KL+W
 gFaDVb5kSmnGj8SDj86RubV2KtmPGds1fHM/ZSbpO+ri/W2g69YMq2htG1Mcg1g3TC/1
 lEUyw+aXJXvUFgE4ndo+WaRTM4jiiu3ssVdc492XUPypSh5jpqiEjtQPbc3wVeKwEUMd
 MpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9AFisMEhPtudU5rqA28QSZ0J20KCJlzzQQR7vCLusZI=;
 b=NsrjdBeN9hO6Vlf+/iso5wrHxM7KksiMgbjWbnA26gbimNB5ZAqlNwd+P9gUguZcM6
 224tESqcyp/g/H4UOoKvw17lD+uvJekSJ1/gl3JkQtISUJlUP9O+IyzToWV8NqsGkk8Y
 ai0UlNkwG5wUZRgTw5JjUAU+ikWD0rjuQSAMgUSrZEvzYfAND2YwmQtWHvdcMj0JnevJ
 rxh03cbdrdsGNOmKavoGtZ7AkCtxGkL4UoHnzwlIA0TPf5GJdoen1sgT4rjmMzMZhe82
 ho7oqdNiAC6DyklMUjVu0DVHjb8JzxTR65zvlY0h58+jN4pBcAIWle/HM3S+up2xWijU
 0iFw==
X-Gm-Message-State: ACrzQf2i68QnvM28ma2UliYbbOrhrHCxvgPmV3NGdynWbFPkliBm4ChD
 Gtj6h1b9sunh7TWbsYIYdqudfIxC868=
X-Google-Smtp-Source: AMsMyM6yuSErXZB296yjwbTq1quK825gRVrj3DXZRMmfUv85l0CXTCuk8G/NIwKr89mcFJ/DcG+uvw==
X-Received: by 2002:a17:902:7295:b0:17d:5176:fe6e with SMTP id
 d21-20020a170902729500b0017d5176fe6emr5041766pll.147.1665069139036; 
 Thu, 06 Oct 2022 08:12:19 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62148d000000b00540c8ed61ddsm8589067pfu.150.2022.10.06.08.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:12:18 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 12/18] tests/qtest: migration-test: Make sure QEMU process
 "to" exited after migration is canceled
Date: Thu,  6 Oct 2022 23:11:29 +0800
Message-Id: <20221006151135.2078908-13-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151135.2078908-1-bmeng.cn@gmail.com>
References: <20221006151135.2078908-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x629.google.com
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Make sure QEMU process "to" exited before launching another target
for migration in the test_multifd_tcp_cancel case.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v3)

Changes in v3:
- Add a usleep(1) in the busy wait loop

Changes in v2:
- Change to a busy wait after migration is canceled

 tests/qtest/migration-test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index ef4427ff4d..e5ba0e21d2 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2140,6 +2140,10 @@ static void test_multifd_tcp_cancel(void)
     wait_for_migration_pass(from);
 
     migrate_cancel(from);
+    /* Make sure QEMU process "to" exited */
+    while (qtest_probe_child(to)) {
+        usleep(1);
+    }
 
     args = (MigrateStart){
         .only_target = true,
-- 
2.34.1


