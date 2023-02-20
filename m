Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6821869C774
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:16:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2G9-0006AD-Nb; Mon, 20 Feb 2023 04:14:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2G2-00067g-Mc
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:14:50 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Fz-0003pI-P2
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:14:50 -0500
Received: by mail-wr1-x42d.google.com with SMTP id l1so57006wry.10
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6GX52poexdzbavesE33D0oasmIscp78YK8pcc7pX2tY=;
 b=XUYBeljvgh3q1R3oaieUKzDYpey0axCv2ZuZVQEDUz0dafL+FauEShaqdnxFqj9ytB
 SzsMNIbDRo137M2qEkkWROt+SgkCu6Fa+fxEQjmxfDlX+2JPRagg/L8G46VgsE6N4xtt
 V+oeyIXlD9UD7eGJiOe1bazyLLqhzpNv1YXAyOwIzHMpe5wpIi8NkSudPJ3IXxhL7Alh
 XJ/0kCCaTuzVbc3nkuxzYbeGyi/oscV6S0w0entZsTRNiF4ObQOM8pj19qtkP4kqtznV
 y5NBj+4ALmzxYqxvHu8gfJ70TuZVhA9QDXZKXvlGA/vNEtGbjxpKN8RNxubxx2CJqzTh
 0jCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6GX52poexdzbavesE33D0oasmIscp78YK8pcc7pX2tY=;
 b=UkjAMsq4CsuuLMLnXKupDz9FhL4oxKg3EXIZrG5qeVR5OlVDXfEbeGavF4M1PKfEvJ
 1l3HmZ38//cPZFiE4EsL7fcZAYEbTUDGSt1wqutLNwmMGtWoJq49uJMXGIfUbCiW+kKc
 c5jqBlK3eWU9dOJoQ9y7j+1S9XdPkZT/4IjTY/Qi/XTfOhMzM28oN26XoWrSPpvnyeL6
 t6WI+gBjRmWP72n3bBGYt9fNR2Ou6uy9ssBI7NCiaMevRXmrspxf14RAQkN4wwBoTpKC
 rAJ3AR9EnImn7NxR5lDcyQqcsLH7KbE+9Gulz5TOQGvT3GDpYOVo589G4P/utqLc1Kq+
 /omQ==
X-Gm-Message-State: AO0yUKW/lW4U0QK8Qw5LoL0ImhvDtu6/TyjGCl2Xgn5iJNUTQeFEGlNO
 Zx0+ZxL+loCgG3H00fFnRksLjAjS3+iUNxic
X-Google-Smtp-Source: AK7set9aCOobBztU81ODWPbX1hlkZU+slrJ5YJ243d9krvrqFkQvitv4gSIk/+7ZIXQTJCZia97Vog==
X-Received: by 2002:adf:e54e:0:b0:2c6:e7b9:a4a0 with SMTP id
 z14-20020adfe54e000000b002c6e7b9a4a0mr1821220wrm.71.1676884486438; 
 Mon, 20 Feb 2023 01:14:46 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a5d4b8f000000b002c561805a4csm3096438wrt.45.2023.02.20.01.14.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:14:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 09/24] hw/ide: Include 'exec/ioport.h' instead of
 'hw/isa/isa.h'
Date: Mon, 20 Feb 2023 10:13:43 +0100
Message-Id: <20230220091358.17038-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

The IDEBus structure has PortioList fields, so we need its
declarations from "exec/ioport.h". "hw/isa/isa.h" is not required.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215112712.23110-9-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/ide/internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index e6deb1c5dc..84d3722d67 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -9,9 +9,9 @@
 
 #include "hw/ide.h"
 #include "hw/irq.h"
-#include "hw/isa/isa.h"
 #include "sysemu/dma.h"
 #include "hw/block/block.h"
+#include "exec/ioport.h"
 
 /* debug IDE devices */
 #define USE_DMA_CDROM
-- 
2.38.1


