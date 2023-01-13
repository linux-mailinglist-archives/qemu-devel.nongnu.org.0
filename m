Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC29669AF5
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 15:52:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKnG-0001TW-D7; Fri, 13 Jan 2023 09:12:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmk-00012R-BS
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:59 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmh-0003iJ-8x
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:57 -0500
Received: by mail-wm1-x32e.google.com with SMTP id ja17so15355266wmb.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8kvFw5OaxUrQIg+Lm57FxJPCYrHar5GDxptYQDtd90o=;
 b=fLRZ51g+/LZcdByPJa1+EMN7RrBni5M3j3VCSCvBKpyClpmSFkacPNMhWYe/5yT833
 jJzsKk0lnx0t3Gf673814ZZN4KuYnY8HeL6rsv96N7Ovf6G6lPm2UX9j5N7UYLeGcbUH
 C5+nJOERhrASxgc9Mr5oSv88G9m5CqUKHq8QqugJ3vrvneDc0yJewMMp2yjKEqgzXS46
 Xn3A+501OsTWLA8QfapWZNxZk0Ne0uMaBSMP6Xj+aS+5ZSnTmqb3uiPNkKzhCQtkJPJG
 L2MCeuDUMSXrgjPiJNtBYUdn22zZLH8mloUhinxumlvkgLOLSZTSHU7QGUI96PzvBbiB
 ZmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8kvFw5OaxUrQIg+Lm57FxJPCYrHar5GDxptYQDtd90o=;
 b=MLz7Ac7d4tL4ELC/7vyPCLxmljfWSiQWdm57qJTiXomPlkZzm2yD0oZn7w3agY0vKq
 QlL3fgkG6mki6i9QNb+/f/Iojk3liNOQu+/RaW1w+MUZcqSBVucc9sEA4yoG/2kTMdyu
 C8CNLI1/8uIQv/JCYKuQtS3PyjZoAXkhyaesFMlPpq0RCd4DpFU7D/Nldlmiz1d9GND4
 /97fEcTfi6iZaXKTPO7m5wzgLICy69d3ZNZvt2ueVpFXDS2Ng6P0HJwX9m+VzFDl/ADO
 7F9YsWdq9AKbAlP0GgVjSguata7JQSGUNsYQuGzPvpa+ROs6tTgsZaoxDGyvIkmOTtWH
 TFSQ==
X-Gm-Message-State: AFqh2kqBP7jYVQY1dckApQbPmGREkieEpCnocn2Oj5rU5Sx9ZeGghah/
 g2d7pfaP1+suLZSnieQcsSdxL2zSw8DjiKul
X-Google-Smtp-Source: AMrXdXuCCdY/1NCQXQD0Pq8vUzzmcWyH2FcXwzStSa/AWjairpQVHstHoIbLg5HzpjHtmYLT+Ij34Q==
X-Received: by 2002:a05:600c:2046:b0:3da:1357:4ca2 with SMTP id
 p6-20020a05600c204600b003da13574ca2mr5372565wmg.11.1673619103541; 
 Fri, 13 Jan 2023 06:11:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/38] hw/arm/musicpal: Use the IEC binary prefix definitions
Date: Fri, 13 Jan 2023 14:11:06 +0000
Message-Id: <20230113141126.535646-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

IEC binary prefixes ease code review: the unit is explicit.

Add the FLASH_SECTOR_SIZE definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230109115316.2235-9-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/musicpal.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index b65c020115a..73e2b7e4cef 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -10,6 +10,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
@@ -1196,6 +1197,8 @@ static const TypeInfo musicpal_key_info = {
     .class_init    = musicpal_key_class_init,
 };
 
+#define FLASH_SECTOR_SIZE   (64 * KiB)
+
 static struct arm_boot_info musicpal_binfo = {
     .loader_start = 0x0,
     .board_id = 0x20e,
@@ -1264,8 +1267,8 @@ static void musicpal_init(MachineState *machine)
         BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
 
         flash_size = blk_getlength(blk);
-        if (flash_size != 8*1024*1024 && flash_size != 16*1024*1024 &&
-            flash_size != 32*1024*1024) {
+        if (flash_size != 8 * MiB && flash_size != 16 * MiB &&
+            flash_size != 32 * MiB) {
             error_report("Invalid flash image size");
             exit(1);
         }
@@ -1277,7 +1280,7 @@ static void musicpal_init(MachineState *machine)
          */
         pflash_cfi02_register(0x100000000ULL - MP_FLASH_SIZE_MAX,
                               "musicpal.flash", flash_size,
-                              blk, 0x10000,
+                              blk, FLASH_SECTOR_SIZE,
                               MP_FLASH_SIZE_MAX / flash_size,
                               2, 0x00BF, 0x236D, 0x0000, 0x0000,
                               0x5555, 0x2AAA, 0);
-- 
2.34.1


