Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F93C6F5210
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:43:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6tu-0005tG-6X; Wed, 03 May 2023 03:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ti-00058H-H4
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:34 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tg-0005cO-7c
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:34 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f192c23fffso29636705e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098851; x=1685690851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bVDQIGY4qsUIGLjKLkOyu6DlKk1Y53Q32bQuvC8FPMo=;
 b=CIG1Cpdb3O5mWoLM5a62EJ8gB1GmMQP4jqQI6iLYxtRYsb5mA3igP/Yn3IvJMBM0YB
 HdRFypLRAx/KSM9JKnIFbQGMlmkN8fDrfnGN1Z861tWnYcfxeDin7n3UsgRTpsdIM9e7
 SNz/aT4ujYq3e33+Juca7XzWhXezy9QFfJXhKB7ZlYHKj27k9FE/Ke04pzvYpudewM1G
 auP2b9PPqiyBA33pPOgJuynhOpbeLwh1JYv3uilFjPMuR5drE1wA8dvxo9+mKcKC8NlD
 0wGBCcTAq3Z+iMgFUYCNS0rKxGgXTktR0xyJyDeY7o+D4PnMMp66E3kWvbVFjJsC2n4q
 Q++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098851; x=1685690851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bVDQIGY4qsUIGLjKLkOyu6DlKk1Y53Q32bQuvC8FPMo=;
 b=GRIWWDJx0LZkk6FeV9rF8pgvH4wPJzOhqIFlbbg1MuF6hBLP/zOoLCUMb9i4xwQdUz
 mSMXAiG4CJBV/7p1y5MojFQd8cKbKZ15QGJdRJZ5I8ifAql8jzv/RRFGBZkqnFacma1e
 E5ZKO53KIk8ozM8UXAtcnSJTzJ0g9RJtmdE8ZZwp62mvGgmFuwjnujXIZIVFxBP9LNSY
 9SGLGG7zQilGZJ22kIr9keEDZKD98+nwAZTs99bOQZG0gjgx2L1hyMhCHLYQCV9LoaTX
 oyrztwNpXJPNZuPZUaflXcrq5wtbhpsLP/OPHiY1X/MtQaczYqkDUg7XAZhK7Os/E9aO
 QVqg==
X-Gm-Message-State: AC+VfDz7dl9jkbhlOlYQhL1NksWaVHoubYUA4/0lELap1x4PYziD/Spj
 ixqhmxupt1Sbg8/7kQtCzi0LI/N/GfX1SfuA4TZgdQ==
X-Google-Smtp-Source: ACHHUZ6BBPVNqkxvk1eCfZ2oMKJhGaOdU0oIERbzm/thBcZbtZaBt4Vz/F7b968b0pCTxz9KQEUqUQ==
X-Received: by 2002:a1c:7710:0:b0:3f1:6527:df05 with SMTP id
 t16-20020a1c7710000000b003f16527df05mr14500901wmi.22.1683098851420; 
 Wed, 03 May 2023 00:27:31 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 78/84] plugins: Drop unused headers from exec/plugin-gen.h
Date: Wed,  3 May 2023 08:23:25 +0100
Message-Id: <20230503072331.1747057-79-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Two headers are not required for the rest of the
contents of plugin-gen.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/plugin-gen.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/exec/plugin-gen.h b/include/exec/plugin-gen.h
index e9a976f815..52828781bc 100644
--- a/include/exec/plugin-gen.h
+++ b/include/exec/plugin-gen.h
@@ -12,8 +12,6 @@
 #ifndef QEMU_PLUGIN_GEN_H
 #define QEMU_PLUGIN_GEN_H
 
-#include "exec/cpu_ldst.h"
-#include "qemu/plugin.h"
 #include "tcg/tcg.h"
 
 struct DisasContextBase;
-- 
2.34.1


