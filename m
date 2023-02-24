Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3DB6A1EA1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:35:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVa5Y-0002CX-0H; Fri, 24 Feb 2023 10:34:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVa5S-0002Bi-Gw
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:34:21 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVa5P-0004yK-LS
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:34:18 -0500
Received: by mail-wr1-x42c.google.com with SMTP id r7so14159821wrz.6
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 07:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yjM0RbXuosFrIrEm5/DdW20R5Mc7XEH9e5KQaaksw2M=;
 b=X/hL6LNArIf747REIubU8yUm5N8zW7MRqk8dL5uCpgXwIidzawEs/L4s16KiVzfg2O
 UZfyqVB9kx7XEMSJxBHdIWQR6+DaxEJ3t2op4A8S1oeMdVzBOpt0oPgNc69N++G04N2g
 yh40x/79AlCDqGyPXZWYztds9htJGXW7/agx3YAXYOazreGoLnkZyOSvvoQpsuKfTL7m
 LDCzNM+m2KPt/TXU6BLGhcV6gQ9NzUrsP1Y5vwS1f1QibHkgPUAJRbHa8UgBC6oxA2AD
 ziCVMyeaAg+WqhbI8PjC9vZJaukmurrAjniF7PPITNhXqVWgCRzy1nvSeH3crkuTtHT8
 2+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yjM0RbXuosFrIrEm5/DdW20R5Mc7XEH9e5KQaaksw2M=;
 b=FzqlH7VxAft7XG5RkLOqlFM0oQn4huTDAqvrJ0IR14k3faCDqAHTmGeqUMlBX1MzEA
 jg8lCPohnbUQYoBWqKZP7p9ojj+SAl9pHbMtVN1oAHTPT9GpkqRPadXlI/vDn7fs2Wwl
 +G3+g0FN4BD7pxdJ7P4tv+KDFzIh1RuEDfUqJioofYNBGaKnfTzM/+WHA1NFRTKHkHNC
 7ELsM0Aop8M4Y7GIzmlEhD2w6iZBDit1iI/pSHSxKM7RV7bwJc7h/xXcDcI5+xXeeFwG
 5zuRLyAS6+hFWHI0QZCqE6JU6pqCpX9NXE+190Ag1a/02LtW2l+nCGqZPfLVuV9bMmt1
 I01A==
X-Gm-Message-State: AO0yUKUZ59y3ucfjx+7Ud/CLMxEwjP6zYJb6W+RnN3ooos8/B/doKmyx
 /HhanmOhJ3UV5E2ttfKqCJlYNHBfnZ/y52Yw
X-Google-Smtp-Source: AK7set/2Szl6eQoBgC2XYZnvZoAXR0Y8UP0KqQ54UuNNWqiRrIZEAZOmFArtqMMYgOqZXP5NRUiYGw==
X-Received: by 2002:a5d:5959:0:b0:2c7:df22:1184 with SMTP id
 e25-20020a5d5959000000b002c7df221184mr927733wri.56.1677252853912; 
 Fri, 24 Feb 2023 07:34:13 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003e2096da239sm3242285wmq.7.2023.02.24.07.34.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Feb 2023 07:34:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, qemu-trivial@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/ide: Remove unuseful IDE_DMA__COUNT definition
Date: Fri, 24 Feb 2023 16:34:10 +0100
Message-Id: <20230224153410.19727-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
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

First, IDE_DMA__COUNT represents the number of enumerated
values, but is incorrectly listed as part of the enum.

Second, IDE_DMA_CMD_str() is internal to core.c and only
takes sane enums from ide_dma_cmd. So no need to check the
'enval' argument is within the enum range. Only checks
IDE_DMA_CMD_lookup[] entry is not NULL.

Both combined, IDE_DMA__COUNT can go.

Reduce IDE_DMA_CMD_lookup[] scope which is only used locally.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/core.c             | 10 +++++-----
 include/hw/ide/internal.h |  3 ---
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index 5d1039378f..8bf61e7267 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -63,19 +63,19 @@ static const int smart_attributes[][12] = {
     { 190,  0x03, 0x00, 0x45, 0x45, 0x1f, 0x00, 0x1f, 0x1f, 0x00, 0x00, 0x32},
 };
 
-const char *IDE_DMA_CMD_lookup[IDE_DMA__COUNT] = {
+static const char *IDE_DMA_CMD_lookup[] = {
     [IDE_DMA_READ] = "DMA READ",
     [IDE_DMA_WRITE] = "DMA WRITE",
     [IDE_DMA_TRIM] = "DMA TRIM",
-    [IDE_DMA_ATAPI] = "DMA ATAPI"
+    [IDE_DMA_ATAPI] = "DMA ATAPI",
 };
 
 static const char *IDE_DMA_CMD_str(enum ide_dma_cmd enval)
 {
-    if ((unsigned)enval < IDE_DMA__COUNT) {
-        return IDE_DMA_CMD_lookup[enval];
+    if (!IDE_DMA_CMD_lookup[enval]) {
+        return "DMA UNKNOWN CMD";
     }
-    return "DMA UNKNOWN CMD";
+    return IDE_DMA_CMD_lookup[enval];
 }
 
 static void ide_dummy_transfer_stop(IDEState *s);
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index fc0aa81a88..e864fe8caf 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -352,11 +352,8 @@ enum ide_dma_cmd {
     IDE_DMA_WRITE,
     IDE_DMA_TRIM,
     IDE_DMA_ATAPI,
-    IDE_DMA__COUNT
 };
 
-extern const char *IDE_DMA_CMD_lookup[IDE_DMA__COUNT];
-
 #define ide_cmd_is_read(s) \
         ((s)->dma_cmd == IDE_DMA_READ)
 
-- 
2.38.1


