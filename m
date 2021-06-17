Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B963ABAD5
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 19:46:50 +0200 (CEST)
Received: from localhost ([::1]:36298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltw6L-0001Sr-O2
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 13:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw3K-0006Fd-QX
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:43:42 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw3J-0001Cf-7C
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:43:42 -0400
Received: by mail-wr1-x429.google.com with SMTP id c5so7692033wrq.9
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 10:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jc2qmXWDFJ8kQFMS9jZlt3xShTo6ocA1K1RvWad+d5Q=;
 b=VitH2s/DdnCniSQ76YAFM4o/8gtg3cCOAWqh/9xGsCITQ+I0457wQgyJ46DR6abKDF
 CyKtSjnX743LibFyOQ3qkUVLJ2MJ7a3iMB4r4Gi7Yb5JmKxXH4+znCcdSwLixsyf4kwb
 wXqqep0HnC0FuZvxY3FWBTm6LPkj9MEw13bEvd2zT6UcPKUKu1vGAhNtwKGT5fNFKclG
 roJdQ4n3UBgtGlmJQWSw970mhvrb8uGPzMbAjAzmXUfT/qLvlRkZytINHtik4uAIG6o8
 Vrj20+j0KFQ3LrZDcG0+fRbhhZM7EOyBlVRtBvFUO4jRVtT+Ij8Veaa+GBaGoCw0pzZg
 WPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Jc2qmXWDFJ8kQFMS9jZlt3xShTo6ocA1K1RvWad+d5Q=;
 b=Oy26spBM4Edl/txoIGavdvYlsd+KFfXxdCO0lS+RCDCmrRHtRlVSNl8qECLUer28Hz
 lA/YjqXhr6hIYH0FsJ7gW6NLQx/oX1b4fL8YewIpemtKyNhr6DzyuwIwp+XQICs74UMY
 5QQD5xbb30u++YiXWsVkr6YMLVm2lfNoVikL8jplLFRCs4nvUbm/TvlueMKOrn3sjPa4
 9CwiCx40PLjLxE1kkdcsZRyD0ZChIpyO1Ty8UcqB3WdWbaKZSohTTtr42H+WIjJlW8CJ
 fMkk39UUyn9worUfpIGRIvE4tZOYXhO9mWkW0w7V/NWwnHVvG5Q3WJ0sB8hubgxyZ/dW
 by2Q==
X-Gm-Message-State: AOAM533rBkpKUVLVEbK5pyqqgErgBrXH/iEiGbDONq9rS4sBS4gpZtS6
 3uYtxkweR80BG43P8CIxghITp3bnNYs9Wg==
X-Google-Smtp-Source: ABdhPJyRkX1gdvgaCjd7VXPlW3Pb6qCcMip+lEhVkj2gvhrm6zGYaJVLBnb3HpKXnwc4JtYUBFJC4Q==
X-Received: by 2002:adf:9ccf:: with SMTP id h15mr7133290wre.217.1623951819647; 
 Thu, 17 Jun 2021 10:43:39 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id f14sm8342507wmq.10.2021.06.17.10.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 10:43:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/9] target/mips: Move TCG trace events to tcg/ sub directory
Date: Thu, 17 Jun 2021 19:43:17 +0200
Message-Id: <20210617174323.2900831-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617174323.2900831-1-f4bug@amsat.org>
References: <20210617174323.2900831-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit a2b0a27d33e ("target/mips: Move TCG source files under
tcg/ sub directory") forgot to move the trace-event file.
As it only contains TCG events, move it for consistency.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build                        | 2 +-
 target/mips/tcg/translate.c        | 1 +
 target/mips/{ => tcg}/trace-events | 0
 3 files changed, 2 insertions(+), 1 deletion(-)
 rename target/mips/{ => tcg}/trace-events (100%)

diff --git a/meson.build b/meson.build
index a2311eda6ec..196adef6f8d 100644
--- a/meson.build
+++ b/meson.build
@@ -1882,7 +1882,7 @@
     'target/hppa',
     'target/i386',
     'target/i386/kvm',
-    'target/mips',
+    'target/mips/tcg',
     'target/ppc',
     'target/riscv',
     'target/s390x',
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 4b7229a868a..a4cab66d338 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -33,6 +33,7 @@
 
 #include "target/mips/trace.h"
 #include "trace-tcg.h"
+#include "trace.h"
 #include "exec/translator.h"
 #include "exec/log.h"
 #include "qemu/qemu-print.h"
diff --git a/target/mips/trace-events b/target/mips/tcg/trace-events
similarity index 100%
rename from target/mips/trace-events
rename to target/mips/tcg/trace-events
-- 
2.31.1


