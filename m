Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9820D66A0BC
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:29:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMGt-00022F-HU; Fri, 13 Jan 2023 10:47:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMGq-00021W-TK
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:47:08 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMGp-0006ME-BC
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:47:08 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so17666156wms.4
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8CMDTWyaM/sURRlt0mwrX8M++JXQ4OKCfWi58ZO4hlM=;
 b=IuRcJ0AHK+xb4gZylByCYAi+Qh8nEObUJO6bv0pq6YyTKXP9o6YJ7yp8G3qswec9IP
 w1Xn9Jpo88gwPDO7FIQhy3d2iQ/IBN9rihz/PGX3zHCvJOPkVjKHpOSqaVU0FxovZ7CK
 P3sDiBX9rB4DzYVzgLbp5blNC/9CSSSu4HbV0qKouHjKKl6B2JKR6fOQKC9dNg3Lfc7M
 6wX3nSn9Tu9LApiMKsx5/TPhzWj9Pv4mMmN4bTo9ZpnecjELm/bTQ0E7rCBeVOoGM21F
 UVVgDMIOZeGPp5wV7OfQH711ZqpVbvzuAJnvw0hY0mV69pUIYVNRqOmhOGEYfxMrjkWH
 YoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8CMDTWyaM/sURRlt0mwrX8M++JXQ4OKCfWi58ZO4hlM=;
 b=e4pfMtG2IX81jC9wIduNJaxhTcHhlAVZLNuIEO34ga9qMxlyD3uMipSJol0K875sXk
 3aFPeKYymaCZNomMlt/PQPV0RwxdWiJwiJ+6KaBUvCVtBWgMYxnHkq2rchd7dadecfCQ
 jgj6Qahh4oS22vG8KG5p/NHZJOmHob3S8lNRKDktqv3ZmGEFmOv1qVwmM0oXTZgjNkIR
 Jh+YzeEuBPFOHr2E4JLTHmH2YCJ3wFN4frmHz4I9v8KBzP7A0Oy7QfhCNDzWsEevOIHP
 1yB+ZsgnC7zESvF8CEEsKz9JBHPr4YXp5NIBkjqDFjddn/YWgQex4cnXLHgU3XH3ACX2
 W0Gw==
X-Gm-Message-State: AFqh2ko0nw9rGsfAWlVYyhtWpyow41krfO4QzcJnmgU9MGDcwEoCw0jI
 oj63wjm084UeRUISq2yNZMn18ilmHsUIsAGo
X-Google-Smtp-Source: AMrXdXuCsIpQbeRbpgy9/r9ddDRnGcJ/ZzP61LeSMOqsZKY6pBMEs0palb6y3UiWwqi+u6oMFulnAA==
X-Received: by 2002:a05:600c:ac7:b0:3cf:9ac8:c537 with SMTP id
 c7-20020a05600c0ac700b003cf9ac8c537mr154698wmr.14.1673624825552; 
 Fri, 13 Jan 2023 07:47:05 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a1ced18000000b003d99da8d30asm29512215wmh.46.2023.01.13.07.47.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:47:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 19/46] hw/mips/malta: Use bootloader generator API for nanoMIPS
 CPUs (2/5)
Date: Fri, 13 Jan 2023 16:45:05 +0100
Message-Id: <20230113154532.49979-20-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Part 2/5: Convert PCI0 MEM0 BAR setup

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221211204533.85359-8-philmd@linaro.org>
---
 hw/mips/malta.c | 35 ++++++-----------------------------
 1 file changed, 6 insertions(+), 29 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index a496053a9a..7d0fc5d0c8 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -693,7 +693,6 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
      * Load BAR registers as done by YAMON:
      *
      *  - set up PCI0 I/O BARs from 0x18000000 to 0x181fffff
-     *  - set up PCI0 MEM0 at 0x10000000, size 0x8000000
      *
      */
     stw_p(p++, 0xe040); stw_p(p++, 0x0681);
@@ -729,20 +728,6 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
     stw_p(p++, 0xe020); stw_p(p++, 0x0001);
                                 /* lui t0, %hi(0x80000000)      */
 
-    /* 0x58 corresponds to GT_PCI0M0LD                          */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9058);
-                                /* sw t0, 0x58(t1)              */
-
-    stw_p(p++, 0xe020); stw_p(p++, 0x07e0);
-                                /* lui t0, %hi(0x3f000000)      */
-
-    /* 0x60 corresponds to GT_PCI0M0HD                          */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9060);
-                                /* sw t0, 0x60(t1)              */
-
-    stw_p(p++, 0xe020); stw_p(p++, 0x0821);
-                                /* lui t0, %hi(0xc1000000)      */
-
 #else
 #define cpu_to_gt32 cpu_to_be32
 
@@ -773,24 +758,16 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
 
     stw_p(p++, 0x0020); stw_p(p++, 0x0080);
                                 /* addiu[32] t0, $0, 0x80       */
-
-    /* 0x58 corresponds to GT_PCI0M0LD                          */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9058);
-                                /* sw t0, 0x58(t1)              */
-
-    stw_p(p++, 0x0020); stw_p(p++, 0x003f);
-                                /* addiu[32] t0, $0, 0x3f       */
-
-    /* 0x60 corresponds to GT_PCI0M0HD                          */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9060);
-                                /* sw t0, 0x60(t1)              */
-
-    stw_p(p++, 0x0020); stw_p(p++, 0x00c1);
-                                /* addiu[32] t0, $0, 0xc1       */
 #endif
     v = p;
 
     /* setup PCI0 mem windows */
+    bl_gen_write_u32(&v, /* GT_PCI0M0LD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x58),
+                     cpu_to_gt32(0x10000000 << 3));
+    bl_gen_write_u32(&v, /* GT_PCI0M0HD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x60),
+                     cpu_to_gt32(0x07e00000 << 3));
     bl_gen_write_u32(&v, /* GT_PCI0M1LD */
                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x80),
                      cpu_to_gt32(0x18200000 << 3));
-- 
2.38.1


