Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF8A5A4557
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 10:41:36 +0200 (CEST)
Received: from localhost ([::1]:49812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSaKt-0002q1-CW
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 04:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oSaCo-0007c3-CQ
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 04:33:19 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:33397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oSaCm-0006et-Sw
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 04:33:14 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 i7-20020a17090adc0700b001fd7ccbec3cso4454714pjv.0
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 01:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=X2O3ErojL0CRWFZ4+4lyDfsx/IEV0kZ58CrLKV6Ex4I=;
 b=bVOMKlwg+Q6z0t1g5PjbqyIgU5PwLcbPcwe5JUGSVqKEFJyunSqNvEMMlCGLNQneai
 WVQkRE5GyLIktLw32fiMCl4fMNDa6GumI6Yf1t+en1ujMO/zjHkndONcuslocHLfpoHP
 ynpZr962o0cZRpDIjj5NVPZeB42kYb09qzetTvX/R7a2CaLKc0Z3ry6bTxZ5HkCY7taE
 D9RYzTcV8lB+DDsN4Kr0jMEzJU0wtOHdmWxywdupJ2g5YGhmkrv7L50+WpawORCz4xUD
 XWB9H971LpjhI7tQCClIYvPckYBFvp0oCkmDxH7iQtfWJoapXxmaI1T0oevlp5t0FEtZ
 YVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=X2O3ErojL0CRWFZ4+4lyDfsx/IEV0kZ58CrLKV6Ex4I=;
 b=79JFso+elrPwTZ/gzXwpmUxKIliH94t/oS7tTyqApOFGeupMozjqNcpgoo/QIrqDgF
 71xUT4r1EcsYwwGzRN4Zc6Vzzs8XQOZSnOXNVeR3uMGQZy4kffQn5RTs9a0Cf8b8KW/x
 XWRztKscJ4W7HEYM9WRhKBUoVbYSMHeTlPPHMdBrc5EyggB4fj8XEoVaitlw/7r7vYRK
 Ejo4ewArKU8QloQ/kT46KyKeYScUaUssNLhp87EBzDtWF3wb5q5DNl6xLaTLbEeDyspS
 gg8IaAkfJvmvatbqNDgqFb2twOG0xT8c+oyzSdeZL5TOVrFoE6azjmRSBRm8Xw5OFkTR
 +qew==
X-Gm-Message-State: ACgBeo2/eOrezbTdukIBWeKq4Go04h4ROCf+rdpi3Wsv/DqpmDw2VCuE
 1fnCvKBQSop8ioLoYlqIsVxd+nXsGuc=
X-Google-Smtp-Source: AA6agR5TwvRBySt4R+pQNr1nY4ghT4RtldZfaTqYE+rEC1h0Y75NuCiBl8So77ib5Xp6UAmsq5XsHA==
X-Received: by 2002:a17:902:8ecc:b0:174:3c10:542b with SMTP id
 x12-20020a1709028ecc00b001743c10542bmr14443541plo.91.1661761989710; 
 Mon, 29 Aug 2022 01:33:09 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 na15-20020a17090b4c0f00b001df264610c4sm26316187pjb.0.2022.08.29.01.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 01:33:08 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
X-Google-Original-From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] tests/qtest/ac97-test: Correct reference to driver
Date: Mon, 29 Aug 2022 17:33:01 +0900
Message-Id: <20220829083301.143527-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/qtest/ac97-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/ac97-test.c b/tests/qtest/ac97-test.c
index b084e31bff..74103efdfa 100644
--- a/tests/qtest/ac97-test.c
+++ b/tests/qtest/ac97-test.c
@@ -28,7 +28,7 @@ static void *ac97_get_driver(void *obj, const char *interface)
         return &ac97->dev;
     }
 
-    fprintf(stderr, "%s not present in e1000e\n", interface);
+    fprintf(stderr, "%s not present in ac97\n", interface);
     g_assert_not_reached();
 }
 
-- 
2.37.2


