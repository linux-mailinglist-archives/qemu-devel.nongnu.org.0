Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE2336DDD9
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:07:26 +0200 (CEST)
Received: from localhost ([::1]:37118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnen-0000am-N4
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbnbz-0007OF-Sj
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:04:31 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbnby-0005gJ-Bb
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:04:31 -0400
Received: by mail-wr1-x429.google.com with SMTP id n2so10664798wrm.0
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pi4Yqp/Ga3uNxjsupGFLY1gAQ5ebMQowaCuPTS7xonw=;
 b=GxlgsrYCVusN/Q/fwa6c60LGwupHB6Dc3VhOtigEydalOP9jT61c9XMa3paurKakRm
 y1MtSIckNuDdCJbPEBcw1sqp0tTDeu38iN8GEF2b8Ztjcahh72k3U3oeDQb/QW/NnrlO
 hnY/rgjbppTSlK/CpCErghoLYgr98aDvir7lFjL+pYnBI/dzmE8JeniQPOg6XBQncDZY
 KioualR7aaV957V8UN0pj1sgcHYFVDCnRS70wzH7tPUI1DVQGJfO/XfqL0FKHnorHPTV
 yStSGtc4eFRrlFg5fJh8aBdslt5zMAXUFKF7GsQnB1kmAfDYOEa8U9JXD+1DXkT0eZhv
 /oCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pi4Yqp/Ga3uNxjsupGFLY1gAQ5ebMQowaCuPTS7xonw=;
 b=IY11PZMKT4NrwwlTy5QVoagvguuydgLTPwWGzigAthz9jfXfBgSOPzqu7+jMwXxkc+
 HczD3JtxKRGPMv3PPNQPytcNtLQJIDma5nt5GELIyCYzLy1pmX2izOViPZzOms9WFuWR
 MuMoWq0WfNPrDKaN9uHlxkrb8NBWL4ex48a0/uYTCREvfnCJrRKJ0zLdbqxqpuTUL449
 IoJZKLd+6k4I5bD4xSFCnO4BYgX/4aIzFUkquWbEyqc0mRAbeELBREN5pgod9rx5cwMB
 eNz1zgotX8it/KtaFDd12+FvPwV666aUEO1yCSzy7t81qJeIFfLwHalnRytOD6I6Y1/2
 /0mA==
X-Gm-Message-State: AOAM531bFUpWdkjFJHAmDTTZc/e05aQJl14GyPYUFawCugYpZTP/ue4T
 MszRjVk2yjrbSl7F3GHgZkZWkpbgP5XytA==
X-Google-Smtp-Source: ABdhPJxjQM33GzEe2r4BP3keMsKNCXfq8FWimFGRm6CU2/XjrbBk/9AzhgGe6I7XGtTSO3rEdDv+pw==
X-Received: by 2002:a05:6000:1547:: with SMTP id
 7mr5360614wry.388.1619629468770; 
 Wed, 28 Apr 2021 10:04:28 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n5sm411720wrx.92.2021.04.28.10.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:04:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/30] target/mips: Simplify meson TCG rules
Date: Wed, 28 Apr 2021 19:03:41 +0200
Message-Id: <20210428170410.479308-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428170410.479308-1-f4bug@amsat.org>
References: <20210428170410.479308-1-f4bug@amsat.org>
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
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have the mips_tcg_ss source set for TCG-specific files,
use it for mxu_translate.c and tx79_translate.c to simplify a bit.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/meson.build | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/mips/meson.build b/target/mips/meson.build
index 3b131c4a7f6..3733d1200f7 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -26,10 +26,9 @@
   'translate_addr_const.c',
   'txx9_translate.c',
 ))
-mips_ss.add(when: ['CONFIG_TCG', 'TARGET_MIPS64'], if_true: files(
+mips_tcg_ss.add(when: 'TARGET_MIPS64', if_true: files(
   'tx79_translate.c',
-))
-mips_tcg_ss.add(when: 'TARGET_MIPS64', if_false: files(
+), if_false: files(
   'mxu_translate.c',
 ))
 
-- 
2.26.3


