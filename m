Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B056149B2
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 12:46:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oppi1-0006ic-9f; Tue, 01 Nov 2022 07:45:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opphv-0006g9-HQ
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 07:45:27 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opphs-0004JD-Bb
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 07:45:26 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so9731113wmb.0
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 04:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8xrR7YX0KQYmpE4nUY3dwv/3+doB1kdHZM6mgoRyRmE=;
 b=idBjVj2MZQ1nrqNHtjIrTeURv5d+eZl5JwaDqfRb4vt26ZlG7lbGARM2B+Y2fhYHnl
 fqAGhHhObiw2zpnYQ1FTkAuCyvDZCaidppne5QvTCjdzCAeYf94MJAohH/62R6C/fyqG
 MlKrGDfvwirz4qKTDaL4upsjclEIZgcDgFyGYkLB6y3hfBbSk629YtPBsnT8xnKI3O8g
 0fMHY57vlBuXN31DJiED4JvLKzl967Z82tZWQ4X+NYrWnlv7AnBeGQ1QQszCxuH4Agqm
 RhCf85HWBpe3KiU5VcqFiF6hHyKE7dXsxbGYjHzXY3GeqzyHuY2JIY9dOkNtYYsR41wf
 Vr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8xrR7YX0KQYmpE4nUY3dwv/3+doB1kdHZM6mgoRyRmE=;
 b=tLEZP/BQGBiL5JAqtPkuBV/mNdyyvmpP5wIalNZyQVmHBJoxIdFZnhTaBooByifOy9
 8vYHqnib/ukc+GEjio0ZtaYcU99FdzEjLlB68Ymhr/dNVJJIl/x5/EA7HCYjQOxOTcGS
 yIY8+pUP+Btz3zettszuDK5txo8QMFU4Unf0ND5ifHgN8DAi1r+O8nEbJ1wgZBPCfiFd
 w40cWRmz3bJEUpXeeARudA22Xi7rmT7gzSpfWnppVQTg6zTLdHnhYLan7yc9xa4/HGjN
 qGtlxSGHnu2Sz2YeWhzSQu53fn+vcgkKwMTUzoa6Lffb0fhbgdwR4vmdgv+0dVkcHVbP
 NOYg==
X-Gm-Message-State: ACrzQf2hdi3Lm7MfAvugyE7UYhnYQhPCwNa2M8eTkwvJkOyKAyd4Gve5
 zp7NUGO0y6PAAxWiLcbRkJ8j6BnexMwAXg==
X-Google-Smtp-Source: AMsMyM5lX2vgY6Za6dc7YMM5NjeuBmYRYqQb6DxwAAnxcS8h5BcGU0gUNeLCL7aev06DgvSEq/pngw==
X-Received: by 2002:a05:600c:a09:b0:3b5:2f6b:c7c5 with SMTP id
 z9-20020a05600c0a0900b003b52f6bc7c5mr11562500wmp.141.1667303120604; 
 Tue, 01 Nov 2022 04:45:20 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a5d64c5000000b0022cd96b3ba6sm12664689wri.90.2022.11.01.04.45.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Nov 2022 04:45:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Petar Jovanovic <mips32r2@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 3/5] disas/nanomips: Use G_GNUC_PRINTF to avoid invalid string
 formats
Date: Tue,  1 Nov 2022 12:44:56 +0100
Message-Id: <20221101114458.25756-4-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221101114458.25756-1-philmd@linaro.org>
References: <20221101114458.25756-1-philmd@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Suggested-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/nanomips.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas/nanomips.c b/disas/nanomips.c
index e4b21e7c45..3f45447292 100644
--- a/disas/nanomips.c
+++ b/disas/nanomips.c
@@ -95,7 +95,7 @@ typedef struct Pool {
 #define IMGASSERTONCE(test)
 
 
-static char *img_format(const char *format, ...)
+static char * G_GNUC_PRINTF(1, 2) img_format(const char *format, ...)
 {
     char *buffer;
     va_list args;
-- 
2.37.3


