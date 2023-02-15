Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42975697ABA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:29:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFx6-0000Ve-6U; Wed, 15 Feb 2023 06:27:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFx1-0000Tl-7m
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:27:52 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFwz-0003X4-No
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:27:50 -0500
Received: by mail-wr1-x42c.google.com with SMTP id m10so9869520wrn.4
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 03:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M23gg0YigFnxbpUVzAASU/zs2NVYx0tOCbHI90Qobfg=;
 b=sztDv0y8JLAfErwm8VMIfL+bLQPwoenJZLmrl1nYpmAsN8Tp2rg5fdtYPIzoJqy+xr
 KjmtFNpeC76HqdeyZ87Hs/qwsF09+MEX3ZPGOcfXnF6MZfw0QQFoH0cX8iBD8d5WoATU
 3NT74Qd0HrUmDjuxudNwf9DFUOtALJEyEZULUg2uzK80+37zT9ES3FZ7gYcEIcNTcu0V
 2k5CMo0xiMgu2mys6gJuFa2N2oABy/NVqNq8e0Qx6vhtBIP1LlNk0kIYKxrfFlkbxhNE
 FwdwjxRm7dmgLe0cKFV/7OtgQI62OPWjBRgVdQG7d6xV39JKhrd70lNpx/iTMI5XULBT
 JziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M23gg0YigFnxbpUVzAASU/zs2NVYx0tOCbHI90Qobfg=;
 b=kci5UArG1ZNURKJSu0Sfj65F89iZbsN6Up4T3JxzvkLdDYN4Fgv3u6OUqN9Xyk13dx
 +NUNKxVA3OGB4WBY4HUeAzAMevOPkzSNHEBhtIpUyvnu8hUgXF6pw/Iaj1aiAEBF1P2L
 owFCfdVtpTNi5Z+6dD4nwvZ1XKykV0hAGnoAngXWvtBSBinkA0qXviDY8n9fqxv84eUg
 VC4yQwaE4Ftsnar42q7RwYJSgPu6p0wZ6H+ydTL4oz9P8I8Ld4G7+bk/r9WbnznwkS1U
 mtc6rRLVqj0kxn3wA4lst+tAE4Eo+jEDsmU+4GSS0G8lLRCailh3A/DyUc/uUWak006g
 0OSA==
X-Gm-Message-State: AO0yUKVzmn1lTxaI04H+CPcHyaYof5djsk1920I8LiKIrWLIyQHiBVaX
 ni7qadeCLhwlLZKNsjbW+kfbzl4Pu6rgUyfU
X-Google-Smtp-Source: AK7set8yck9E+zDiaNE7UZYk5ik+DdTYgs/vylNi8+FKqpKk+4V7YwWKHJJ4GKVzrwB+kGIjMByAWA==
X-Received: by 2002:adf:cf10:0:b0:2c3:dd9e:8ccc with SMTP id
 o16-20020adfcf10000000b002c3dd9e8cccmr1501226wrj.64.1676460468191; 
 Wed, 15 Feb 2023 03:27:48 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k1-20020adff5c1000000b002bff574a250sm15524326wrp.2.2023.02.15.03.27.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 03:27:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/20] hw/ide: Remove unused 'qapi/qapi-types-run-state.h'
Date: Wed, 15 Feb 2023 12:26:59 +0100
Message-Id: <20230215112712.23110-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215112712.23110-1-philmd@linaro.org>
References: <20230215112712.23110-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Missed in commit d7458e7754 ("hw/ide/internal: Remove unused
DMARestartFunc typedef") which removed the single use of RunState.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/ide/internal.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index 29a8e79817..e6deb1c5dc 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -7,7 +7,6 @@
  * non-internal declarations are in hw/ide.h
  */
 
-#include "qapi/qapi-types-run-state.h"
 #include "hw/ide.h"
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
-- 
2.38.1


