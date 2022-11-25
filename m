Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18EF638F6B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 18:56:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oycvN-0007nm-1a; Fri, 25 Nov 2022 12:55:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oycvL-0007md-1s
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 12:55:39 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oycvJ-0003TI-5L
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 12:55:38 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 a11-20020a05600c2d4b00b003cf6f5fd9f1so3959394wmg.2
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 09:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SsKozInxZZRcq/qH+57Qf2OKb8tQKRGxe6TGhWxBgV8=;
 b=r/eFlGsQyTU041ooLeXMYx0sCfWtZLmZcyACZ+5LEr3BABCD1pqs1ELCCWTySa7aSJ
 8clZVSQUf8jnr8+vXz3OamuAHNslneCWLKCdO+ofQW7KKwJ9Wdf4eyLjhuPRhkwmzkad
 PMyPkPE5UMiTx8rt1dZQwkrEwn8rrH8ObnDUIWWrQfHjGPWL6Vtaj3gLhxPHE8ZyP5ev
 W6wgLTBn2ABHQaJvT4f9FqnwfuVNt1wmitrsB5vS1PvWCkBS/aGMGqwnQpXMhmNj17sH
 MGPIynJm/M1p76TwDBJ633zYZI4xsqkbOg2iQyG7/ejfiPDBXpZtDkyvSadvAX6+51FK
 7eUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SsKozInxZZRcq/qH+57Qf2OKb8tQKRGxe6TGhWxBgV8=;
 b=ElqbRgNEVamWohsONLqWhseNcSlnyQmD7DxSer+cj5RhQjFmUp0mbQIfhMJ80x3+IL
 CVkTnApuX6ov2o8493U8NJIkNxKqEVNZ4L128WbfGCKmciuxomBcCmiSzFzreqaQBWV5
 Gn7GxdwPOUIHgniGRi9U+QjrFrudy0/r2KGL2pMJjdiQQVuzrUQAujF2qVw1rqi28YlW
 JiLvlvHyDX2A+U/6+d6xag1HN/qL9ORjb0LmXO6OEkxcz5XBeWZo39rgcCkY4J4XZldX
 Yh5JE7IYS8cFrte13di/S1bdQiIxLj35qjqZLreBknTv9FW2/N+mY/vN6K1at9A5uJaR
 lBgw==
X-Gm-Message-State: ANoB5pm+9MqdQlMNvQk2+4Du5srS7tLoPnEVwrHtTabmdsI3MZR855xO
 NlEo/gffV6h9Qw0ZO4xnq1P+RY8sddcQRQ==
X-Google-Smtp-Source: AA0mqf7MsbKaqRISshoZVbqM2jMsna7N3pxCW/3QuEat/ctCWsNFkHbh4jSZqdH7tQadI0zQQ6Etdw==
X-Received: by 2002:a05:600c:4a99:b0:3cf:91e5:3d69 with SMTP id
 b25-20020a05600c4a9900b003cf91e53d69mr33051832wmp.160.1669398934417; 
 Fri, 25 Nov 2022 09:55:34 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x9-20020a5d6b49000000b002366e3f1497sm4234200wrw.6.2022.11.25.09.55.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 25 Nov 2022 09:55:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0] coroutine: Add missing <qemu/atomic.h> include
Date: Fri, 25 Nov 2022 18:55:32 +0100
Message-Id: <20221125175532.48858-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

qemu_co_mutex_assert_locked() calls qatomic_read(), which
is declared in <qemu/atomic.h>. This fixes when refactoring:

  In file included from include/qemu/osdep.h:113,
                   from ../../util/error-report.c:13:
  include/qemu/coroutine.h: In function 'qemu_co_mutex_assert_locked':
  include/qemu/coroutine.h:182:12: error: implicit declaration of function 'qatomic_read' [-Werror=implicit-function-declaration]
    182 |     assert(qatomic_read(&mutex->locked) &&
        |            ^~~~~~~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/coroutine.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 89650a2d7f..1750c30d8e 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -17,6 +17,7 @@
 
 #include "qemu/queue.h"
 #include "qemu/timer.h"
+#include "qemu/atomic.h"
 
 /**
  * Coroutines are a mechanism for stack switching and can be used for
-- 
2.38.1


