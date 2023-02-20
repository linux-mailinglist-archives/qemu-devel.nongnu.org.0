Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BD169C7B1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:30:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2JR-0002ez-PS; Mon, 20 Feb 2023 04:18:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2H0-0007Fg-5R
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:15:52 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Gx-0004HM-0u
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:15:49 -0500
Received: by mail-wr1-x430.google.com with SMTP id v3so259152wrp.2
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U0KdhDKZTpIfdnIsIhU6e7ahfJOkAf9uQWOD0nOAFFM=;
 b=tbSyiQnYW7uyyr1xu3zTSDiwzYz+kA5vEvAMfnRm3+slVutvwEMeB7+UvXA0Q8YWxm
 JH6q0PhP9bQOnn4P9qBMgVJulIlV5DGK/Gqg+36Sq+bn4Gd1uqfURpKVojvxj9WVPoae
 lnhhnjEGRKX17U1Kvl/+wo2zImfXchxgW8jueRl3t8cZ8M+Tup3YehRe9Zba9ExlX1sa
 W4dI7mPknbSFYOehIjNbH9JAyh7Z+O7UmyxOP1i501BnyXvyHRhRan6dimdGl2Ei360/
 N7mmY+SDOl8LgHcmV8skuv8pFKp9WDWwSt762CCeR/QLjjmswTxxlfZCEtLOaeSQ7Zbt
 zoTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U0KdhDKZTpIfdnIsIhU6e7ahfJOkAf9uQWOD0nOAFFM=;
 b=XH7mTDravODAofeqL5S5sJCjCZt54IbqZ/XE4OCbXMruQNd4P01urfMBQBxezISzK9
 a38hRw9lh9W3+wns2/HWJVtl3RNUMD7CV/A1gRLz5rpwit3kKNTAzFk1Su/nsze0p4I9
 YEjVUPyWjuPgmVA1zVB6IWT5cqYWUt2HYBidWF+MBipaWH0fhLE3D20heF9h/j6UY9ly
 KSqL/iYSUL10crvX4aC/3EJN5GYGyQp4lJKvs1PxNndegIXEk8gvGKVvKMVau8c9bM3f
 qguWJJM4gAZjXZ/gGo0yQ6PSC4IQ9dNMizRqRu/zckicDQeifLrO/Cyb32n1VTUykmdt
 OAdA==
X-Gm-Message-State: AO0yUKWn403XhDACqxBAXp5AdgCUptdMV4tyRvrU3lE24iiBmZhq/n5H
 Yg+AXxOk4A5T5Y+LKHlPc6xoa2LZUsLoPf2C
X-Google-Smtp-Source: AK7set9OXhQAb8b8AMCyILxvRdbPjGrxHzsWvCWmQGKg4DHGbs/bU6wEBM877A9tzDafMczBoNEjZg==
X-Received: by 2002:a5d:66c5:0:b0:2bf:ee7d:5369 with SMTP id
 k5-20020a5d66c5000000b002bfee7d5369mr949275wrw.59.1676884546169; 
 Mon, 20 Feb 2023 01:15:46 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a5d6092000000b002c6d0462163sm3253711wrt.100.2023.02.20.01.15.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:15:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 21/24] hw/ide/piix: Remove unused includes
Date: Mon, 20 Feb 2023 10:13:55 +0100
Message-Id: <20230220091358.17038-22-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215112712.23110-19-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/ide/piix.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index fc44c261cc..5b1455e232 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -28,14 +28,9 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/pci/pci.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
-#include "qemu/module.h"
-#include "sysemu/block-backend.h"
-#include "sysemu/blockdev.h"
-#include "sysemu/dma.h"
-
+#include "hw/pci/pci.h"
 #include "hw/ide/piix.h"
 #include "hw/ide/pci.h"
 #include "hw/ide/isa.h"
-- 
2.38.1


