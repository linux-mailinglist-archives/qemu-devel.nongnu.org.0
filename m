Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F4D6790C9
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 07:22:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKCfg-0003iL-56; Tue, 24 Jan 2023 01:20:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pKCfc-0003hQ-VW; Tue, 24 Jan 2023 01:20:36 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pKCfa-0003t2-Cr; Tue, 24 Jan 2023 01:20:36 -0500
Received: by mail-pf1-x42c.google.com with SMTP id 200so10538328pfx.7;
 Mon, 23 Jan 2023 22:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=21b0rkeZy1N/RWqrtQxzVAaa/yqPk4LUXikbY/Hcxwk=;
 b=TsIJRW2R9k8NVxIUSvrmgTkoXzPUIPObf2s1RPIVjOdz/ee7Xt+CK3TrIi8mjjXUM2
 pv90hB/LoOfWyw2koCyIYRt6b05ujSIu5SyiYHys42PaYsB7qzKigdP5IdCsF/0cOWUG
 6EiE2qvjAcpvA1N66XDmg3wJPJY7TwYB8s+Wb7iCvOoXnBTXbFmx21eDs9lKdrxk6j29
 u8aTHgxDL2qGyVp/wjYilm56EkinJ+cKxSckGkOYhCCv7H0dSsL5W4wRDsOb+FbRfh7H
 Mf8DfqV6ToExx2D9c4k1+JyXcyXUmEcsCPNU8K4qjoqmC5cDSicHS5+oJa5yiG3Xwnb/
 KF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=21b0rkeZy1N/RWqrtQxzVAaa/yqPk4LUXikbY/Hcxwk=;
 b=UESWXLvAWvrKlYpINL7hzfu08XgIWLuWXpsTGNv1BnCuo9bJPHu5OCZBvq1O7rH7dG
 iZYmfewkRUu0qu8oY3UTFbNsdN3no06ekV+UWdk4c4jcHuwUcY3v0SioezrwoAi2+AzY
 DDraa2BIANFEccJY/WQTgke8pG1rw6YT1JT1UiD+y/gykGJhhlI50EjWJm+dyrA0jFGn
 gJJgq5TmKNyzsovnOStZOt5HoXGKzmAJQppr0HcEt+Vz3nNor4IV/UkjX0ufokzez7f0
 EpMqbDD5R7FVAej1tCm3naIdAg3hB+edzUV0yyi7ce5NaOC5JOw3EB3rmQSQ84/I9IA1
 C9dQ==
X-Gm-Message-State: AFqh2komNfJ0o9MYYSGwu2WGcd5/6JfjBB6TkJdmN+AdHFk6gzWmDCDW
 /ahqLXLYvezbChE4U5V+o2g=
X-Google-Smtp-Source: AMrXdXvsFupLj1TGu8XjaurxGnBFAcWiSdO4xsC1uUTPRWP0DbUkpEafHa0AshJnWncEwJqibyeFmA==
X-Received: by 2002:aa7:9570:0:b0:58d:967b:8408 with SMTP id
 x16-20020aa79570000000b0058d967b8408mr25610026pfq.22.1674541232089; 
 Mon, 23 Jan 2023 22:20:32 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id
 h14-20020aa786ce000000b0058bb8943c9asm655515pfo.161.2023.01.23.22.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 22:20:31 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH] aspeed/sdmc: Drop unnecessary scu include
Date: Tue, 24 Jan 2023 16:50:22 +1030
Message-Id: <20230124062022.298230-1-joel@jms.id.au>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.149,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The model includes aspeed_scu.h but doesn't appear to require it.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/misc/aspeed_sdmc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index d2a3931033b3..abb272793393 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -12,7 +12,6 @@
 #include "qemu/module.h"
 #include "qemu/error-report.h"
 #include "hw/misc/aspeed_sdmc.h"
-#include "hw/misc/aspeed_scu.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
-- 
2.39.0


