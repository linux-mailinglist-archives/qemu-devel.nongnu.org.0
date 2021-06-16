Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A303AA650
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 23:51:24 +0200 (CEST)
Received: from localhost ([::1]:60910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltdRT-0008Fj-67
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 17:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdJt-0001ML-Ub; Wed, 16 Jun 2021 17:43:34 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:50908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdJs-0006Rr-Bf; Wed, 16 Jun 2021 17:43:33 -0400
Received: by mail-wm1-x32e.google.com with SMTP id k42so179820wms.0;
 Wed, 16 Jun 2021 14:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WmyHaJHcvUKLEVm6aSpmTart9qZchQ/2Um+oWz7mMdA=;
 b=gSI59bBqHbKcJKwzyvgmBKRH5hvXTSABasX41TFH0De/0Ui4pY4hIG+zBJDeqUbSnC
 AU9C0rAUllPQMS1RoWs8fBMLcNvLJZ0TpfB6Py1dX3YMzI6Z1P6vYxfOhdqbOwqQtMI0
 1jb9RSyzBw+QTY3cbEjP1dWgJm1qFfjjQ33uMbnPvrjFqt8yUmlyDXDx9r6kFglH27AO
 67bXjcDjEIcWlX2B3qfEvr+5RAhNehJ06q2u5sCD78bjhGHs5uIp8+5ZhCRz3bBOr15n
 8WwoonqxtHQJDib8Lez0oT7RO75UtBh+xQppFshNYBZg/tClz9hWJsJj6o7YGia7pbae
 jFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WmyHaJHcvUKLEVm6aSpmTart9qZchQ/2Um+oWz7mMdA=;
 b=WEOAd6PSZgPSb8oGihtimP5u9EpBbxecwqawj/PJXQyrOGjh7iiBxxqStsZ99c4Mtr
 FD7U0ZHhznOWw/P/QZWCNzuIotgg6jSE+7XS4LTOIDyMdbjBRlhIsNAhJpCv1xj5LB42
 sGJVaIRL7SGGRBJ0ryntKN131mLYKyn1DOslRy+F8WDJoIY9udr1I2LcQhMzpKHNTQ7H
 hY3eHlri9gIy5AjueBJxsi+WS/ws6SYSxyVmuHmLZ2KwRMJjwonNk2TEZ9OCPLhmYIIn
 ohl71aTXEp0YLu1qXa0Ot1F4/L3Nu/U6tX3Wgokrnnj6QWmFMX82u94lvO/wO5u/3xfZ
 OCRg==
X-Gm-Message-State: AOAM533JRswyYZIdVP/Nnpf0i5Yv9Q8x/SwQAxKEU7S+ekZGNBw36W1i
 21oKGPsRXpAbJ2O9AJczTt/SJoT0QV+r+g==
X-Google-Smtp-Source: ABdhPJzyOnHL/3rjKttzyhAZVqXsPCbeOclDkPiCFEC4/znyX8cGpgc3MpnVNXBnjimOhHz5PakZ0w==
X-Received: by 2002:a05:600c:1ca6:: with SMTP id
 k38mr1147060wms.49.1623879810085; 
 Wed, 16 Jun 2021 14:43:30 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id m65sm2796646wmm.19.2021.06.16.14.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 14:43:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/15] hw/i2c/ppc4xx_i2c: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
Date: Wed, 16 Jun 2021 23:42:45 +0200
Message-Id: <20210616214254.2647796-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616214254.2647796-1-f4bug@amsat.org>
References: <20210616214254.2647796-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of using the confuse i2c_send_recv(), rewrite to directly
call i2c_recv() & i2c_send(), resulting in code easier to review.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i2c/ppc4xx_i2c.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/i2c/ppc4xx_i2c.c b/hw/i2c/ppc4xx_i2c.c
index f4c5bc12d36..75d50f15158 100644
--- a/hw/i2c/ppc4xx_i2c.c
+++ b/hw/i2c/ppc4xx_i2c.c
@@ -240,11 +240,14 @@ static void ppc4xx_i2c_writeb(void *opaque, hwaddr addr, uint64_t value,
                         i2c->sts &= ~IIC_STS_ERR;
                     }
                 }
-                if (!(i2c->sts & IIC_STS_ERR) &&
-                    i2c_send_recv(i2c->bus, &i2c->mdata[i], !recv)) {
-                    i2c->sts |= IIC_STS_ERR;
-                    i2c->extsts |= IIC_EXTSTS_XFRA;
-                    break;
+                if (!(i2c->sts & IIC_STS_ERR)) {
+                    if (recv) {
+                        i2c->mdata[i] = i2c_recv(i2c->bus);
+                    } else if (i2c_send(i2c->bus, i2c->mdata[i]) < 0) {
+                        i2c->sts |= IIC_STS_ERR;
+                        i2c->extsts |= IIC_EXTSTS_XFRA;
+                        break;
+                    }
                 }
                 if (value & IIC_CNTL_RPST || !(value & IIC_CNTL_CHT)) {
                     i2c_end_transfer(i2c->bus);
-- 
2.31.1


