Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3FE3C242F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 15:19:00 +0200 (CEST)
Received: from localhost ([::1]:55488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1qPD-000191-5l
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 09:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mdnelson8@gmail.com>)
 id 1m1pHp-0001gk-1j; Fri, 09 Jul 2021 08:07:17 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:38525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mdnelson8@gmail.com>)
 id 1m1pHn-0005Mf-Gy; Fri, 09 Jul 2021 08:07:16 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 i5-20020a9d68c50000b02904b41fa91c97so4794716oto.5; 
 Fri, 09 Jul 2021 05:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zQYdDYlCFYkwZsOZUYKcR3j8cEffEN4GEuOPkkmf/Jo=;
 b=n9YSxJY8JAXi3cyxojmK8Ul1XBvKQNq5zm4zs9NZ+6V6iJuv77SA/UBLZ7uguYrHtp
 qNNsVueGg/oC/Ppy+7QrO4IPOs6CJXfJJxMi4jxcGQvFrvJj3esAMwBCvuq2pPkSvRxh
 D83p/0obxA5LnKsKyupZTO+x++yB67DSHrP7GV0IZKn7WNd84lBqliJVY1WrBwKk0lrF
 VT2Y3qr+MFUR46XB8aPEwPooR9eT7t0KOO0R360+9+ucnYNNbzn+lAfO1rCRjdzgVr9l
 6qfecn5T7BNgsG90iLKF/aULVzShbt9RGFX/1fTyJUh2wHEJpvkkoqjbrWbCzwm95C4m
 qlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zQYdDYlCFYkwZsOZUYKcR3j8cEffEN4GEuOPkkmf/Jo=;
 b=HD/bHFJCGRHEOzq+FP47Uyfbtyh9+KjSN5/FRp+gZs+99Ht4aEolv0SgFYij/5z+aO
 C1NMpvId/Zwjl1Sxw9beLOdwSslH1coZLc9OHwbnlaH4iiRJJSbpCh7WTBv3AIlMzPXK
 7SqXY1bE0CZ7ypx5pWp8O5xXB5asy0nSscp+fz8Sn4BlcfUC9D/sKqe5nTk3Gja31VNR
 dpUXvQ9zJz9989IiLGltGB3BfkoX9MoHm2PfIFEM8iQ+Y+Igdzpsu1XPbsocr+nTwTMa
 IAu98fbhjqlCc9jD0InXoWd+jofde48OHZn1/VHbPKAHK4/0rfu0jjEIl/BlQfQ8tvqz
 5GxQ==
X-Gm-Message-State: AOAM533JN29FTGtqIF64I/S5PNCT3LayDfdNPjlkkO8iL3Pw7OptP8GG
 k80RMLwy9XdLQO5X2EekYfGb8qkJkOKIbw==
X-Google-Smtp-Source: ABdhPJxqJLrtxTosZ4ewKpFWBlCFb27xWrxKOBCtBWY9TzPk90YshyyhnxnDA9begAHpp2bQSKX+kw==
X-Received: by 2002:a9d:2214:: with SMTP id o20mr5793821ota.66.1625832432610; 
 Fri, 09 Jul 2021 05:07:12 -0700 (PDT)
Received: from ripper.. (cpe-72-133-92-246.sw.res.rr.com. [72.133.92.246])
 by smtp.gmail.com with ESMTPSA id z19sm956544ooi.32.2021.07.09.05.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 05:07:11 -0700 (PDT)
From: Mark Nelson <mdnelson8@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] util/guest-random: Fix size arg to tail memcpy
Date: Fri,  9 Jul 2021 07:06:00 -0500
Message-Id: <20210709120600.11080-1-mdnelson8@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=mdnelson8@gmail.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 09 Jul 2021 08:59:19 -0400
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
Cc: qemu-trivial@nongnu.org, Mark Nelson <mdnelson8@gmail.com>,
 richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We know that in the body of this if statement i is less than len, so
we really should be copying len - i bytes not i - len bytes.

Fix this typo.

Signed-off-by: Mark Nelson <mdnelson8@gmail.com>
---
 util/guest-random.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/guest-random.c b/util/guest-random.c
index 086115bd67..23643f86cc 100644
--- a/util/guest-random.c
+++ b/util/guest-random.c
@@ -38,7 +38,7 @@ static int glib_random_bytes(void *buf, size_t len)
     }
     if (i < len) {
         x = g_rand_int(rand);
-        __builtin_memcpy(buf + i, &x, i - len);
+        __builtin_memcpy(buf + i, &x, len - i);
     }
     return 0;
 }
-- 
2.30.2


