Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2006149B1
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 12:46:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opphz-0006hK-N3; Tue, 01 Nov 2022 07:45:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oppht-0006eg-Gk
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 07:45:27 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opphl-0004Iv-Sx
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 07:45:21 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 m29-20020a05600c3b1d00b003c6bf423c71so12602103wms.0
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 04:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yBytmr5TleNMxUcv80n5M2RRq/s8QMuW5oRDWbLlEbg=;
 b=K4+pj2UVW04wZmto8Txzak/myD4fbW7IYx0t2qINkYnnn3UpkGDV0AUJBAjC5OiIts
 rqrz2hNiLcotPYWXkhrJ2pzRAxfeVddFuR9tzASeJXa4lUPE4lPY+LX153eHu3SYdQ8L
 Xzv+xUxiL62yLsZzGEtilgqfUPEmOh65k9hTheRC7GnOL2Zjc9Fmqn1Tcd+yW9ZjxPdF
 5wzHQkDJBjheDQ+EYDXD8bdQFXfFK/5Xndiert01jLWKhrF2GW10IaYS7qhjWSGyReyK
 YPkz2S0qIPnHjwdbmZ4OOMZOD6Crgm4kG8yIN+ZBD1dCN2eQAZOnR1os11mcvDbxsgxb
 J6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yBytmr5TleNMxUcv80n5M2RRq/s8QMuW5oRDWbLlEbg=;
 b=XWYDiWZ/+TVSNnZDm5Eko1VHL98o6brkLFJLLipDZJVmyOpkNo2dvIA0LROWIRj4V7
 0K03YXmg4LNapGB8C8K831iWNknNYL/TpW0+ilZQNUdhqHjqhIKc+7JO8Lw3vzHhZ4PG
 vDQYfH8G/ycJxF3l/B1bgFerv3B+DVhK9N/lCh6FrkgwANmEitiQeuDI0k2lTmOYNVhi
 1LT9JF/nEqVu+GwbfDfzDl4FbB0PM4/eH3r8pTaX/aoo+czZoUybtT4vXKfF/XfPrxm0
 u+wwJyO8kwFLaNp5j8YceKKfHZn8RbtsO8n5qLnZc/BKTOHUGgBaoUdwnXzsGpmMqqWI
 KceA==
X-Gm-Message-State: ACrzQf2WZpclUILN/h+caaQ4Jri2BIFF8vfQv68YUjxV/A6J6FGxAIJo
 A5hJgBAiDoVx8wvwIqKViZwwGzc2ceouvg==
X-Google-Smtp-Source: AMsMyM4Y9y6PLTR1URFnyLJBybGAordr5I8hYlqJnl37F76XebuW+pihOlpdaX8Mks4vDd7xsAmXDw==
X-Received: by 2002:a05:600c:13c9:b0:3cf:5b8f:a7cf with SMTP id
 e9-20020a05600c13c900b003cf5b8fa7cfmr11972692wmg.153.1667303114696; 
 Tue, 01 Nov 2022 04:45:14 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a05600c354400b003cf4c1e211fsm10937322wmq.38.2022.11.01.04.45.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Nov 2022 04:45:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Petar Jovanovic <mips32r2@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 2/5] disas/nanomips: Fix invalid PRIx64 format calling
 img_format()
Date: Tue,  1 Nov 2022 12:44:55 +0100
Message-Id: <20221101114458.25756-3-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221101114458.25756-1-philmd@linaro.org>
References: <20221101114458.25756-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

Fix:

  disas/nanomips.c:12231:62: warning: format specifies type 'char *' but the argument has type 'uint64' (aka 'unsigned long long') [-Wformat]
    return img_format("RESTOREF 0x%" PRIx64 ", %s", u_value, count_value);
                                               ~~            ^~~~~~~~~~~
                                               %llu

Fixes: 4066c152b3 ("disas/nanomips: Remove IMMEDIATE functions")
Reported-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/nanomips.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/disas/nanomips.c b/disas/nanomips.c
index 6466c80dc5..e4b21e7c45 100644
--- a/disas/nanomips.c
+++ b/disas/nanomips.c
@@ -12235,7 +12235,8 @@ static char *RESTOREF(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
 
 
-    return img_format("RESTOREF 0x%" PRIx64 ", %s", u_value, count_value);
+    return img_format("RESTOREF 0x%" PRIx64 ", 0x%" PRIx64,
+                      u_value, count_value);
 }
 
 
-- 
2.37.3


