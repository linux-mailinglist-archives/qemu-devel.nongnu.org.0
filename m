Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22D9638F67
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 18:55:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyctO-0006r5-Dp; Fri, 25 Nov 2022 12:53:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyctK-0006qd-SS
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 12:53:34 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyctH-0002zR-VA
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 12:53:34 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 i64-20020a1c3b43000000b003d016c21100so6727528wma.3
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 09:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=INE6OZGY4azvCuediKuhsFQWrf2Zukrhm0RyaddTozE=;
 b=hRW6lsgQ6liMwlidIbO1J1HmRlucVMFwxp+a0lD1rrcYlBPNbrfBJMQdiQSkVuq/FO
 S75wTmiLheWm7lUVaChHwV6b6O55Bs8/aEBIsbndudkTP1p1Ef5KSUPKQYQFqwXdvvCV
 rj28FTTHP8gsFePYkDBBE1NTkuy7eyHWQ4P9eLBz8LRqLo+mBVWM1yBwbo2aYpu5WO3f
 K3qnulyl0FER8RO40fKpnGtGynZLltU5OSjt/2Yt6H2cRJ23mqnkOnIxUJhJUo10yEh2
 tK9Wd1ST0Z6FCshd4vpJmVjLuVKQHIlNwZoov9ccPO9qcphFSZAE+RR2ZOHoMLBN5w/r
 koBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=INE6OZGY4azvCuediKuhsFQWrf2Zukrhm0RyaddTozE=;
 b=qG7JfwwSA3k7ofTotF23LVoopblEa5RW0UrWYo59FDLeIwUdCEwiHYwzBtv9DuD70y
 QJoTYtbgJckoAQ5uXQ9+4Vus3IlsPP8+GAb1bIJ5xuQ85EZ8zZ6wMU/YHFgV1aljp575
 LiR4PLkOTvAV7GemVvm3105WQo3AH7zCp+xpVRlsCWmkSMCPGyTnQYpeC3JYJxgfQISS
 CPE7itT6q+xHO9lvssrlkBdPDCuNOBmMscYiukLr8iPxDCnIQ6KR6/t/wMsjTjxhaTmg
 ieFZ3u0ljNlgJZ91y9f8/JvWjhzk6u0ozHXOp9gioS6HYbdOkKRwSKvzzZMKdijSQXw8
 nnrQ==
X-Gm-Message-State: ANoB5pkbXq3cZqWXF6YGAZOIkJZ0MWjTC+oey7Xr4mY7aeS4FZ7L+BR1
 tVa8P0q6YHo7vIrB/AxGCR91OY/WhXHecw==
X-Google-Smtp-Source: AA0mqf6KiQjDXGkJquJfLa2xuqZXsioUyM3G+sZDqzxlpx/sGPWqi0g3axqaSN9KN8cVOWT6fcgtVA==
X-Received: by 2002:a05:600c:4f82:b0:3cf:aa11:9394 with SMTP id
 n2-20020a05600c4f8200b003cfaa119394mr17030921wmq.183.1669398810421; 
 Fri, 25 Nov 2022 09:53:30 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a1c4306000000b003cf774c31a0sm9233776wma.16.2022.11.25.09.53.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 25 Nov 2022 09:53:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-trivial@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0] block/nbd: Add missing <qemu/bswap.h> include
Date: Fri, 25 Nov 2022 18:53:28 +0100
Message-Id: <20221125175328.48539-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

The inlined nbd_readXX() functions call beXX_to_cpu(), themselves
declared in <qemu/bswap.h>. This fixes when refactoring:

  In file included from ../../block/nbd.c:44:
  include/block/nbd.h: In function 'nbd_read16':
  include/block/nbd.h:383:12: error: implicit declaration of function 'be16_to_cpu' [-Werror=implicit-function-declaration]
    383 |     *val = be##bits##_to_cpu(*val);                                     \
        |            ^~
  include/block/nbd.h:387:1: note: in expansion of macro 'DEF_NBD_READ_N'
    387 | DEF_NBD_READ_N(16) /* Defines nbd_read16(). */
        | ^~~~~~~~~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/block/nbd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 4ede3b2bd0..a4c98169c3 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -24,6 +24,7 @@
 #include "io/channel-socket.h"
 #include "crypto/tlscreds.h"
 #include "qapi/error.h"
+#include "qemu/bswap.h"
 
 extern const BlockExportDriver blk_exp_nbd;
 
-- 
2.38.1


