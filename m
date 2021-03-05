Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653C732F23F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:18:37 +0100 (CET)
Received: from localhost ([::1]:52358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIF24-0001ws-E3
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:18:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3U-0007Bm-Pr
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:00 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:50740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3C-0007fX-Gx
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:00 -0500
Received: by mail-wm1-x32b.google.com with SMTP id i9so2110302wml.0
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SM11selGiZsqMweASDc/ZkgCkLQsgUvV/ySRzDeZnOc=;
 b=T88fQqyiGpSR4Kq3ONtZFxIuErKaYLuZp8CvMI43GvCnxce7cU8Z7rrBWz+Q6UEWiW
 SUj6iTY9WTAg3oMAVL6C762X9RuOItZgfEA4ZHstzrFKtuPoEP8l6W2J9xkNGC0F2lpw
 0vWPMyP+DLoKGL3lT3EVSj+yB2s8Dx+atVRjJZ3ZfTW9+7zso0UC/iznKdu2rWe/1S3W
 /bPtxyduLbeKHNSrBnUpp3U+TMafU3jZM3Q9D4WOzFhE1eOvPmuWbVLiD/I6NbLPtFzE
 afa/xfh7fdoJ1M4cKmy4+N74UI7ohqQ7MtEbWePM7y8pD4PpPQVJK9RJVymi//motvLj
 qQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SM11selGiZsqMweASDc/ZkgCkLQsgUvV/ySRzDeZnOc=;
 b=Jbtc1U8mJC15jPsSoeYTQ6smAWespLXLeDIwtMs80Zos1tqy8j+Gj+A3DDSIJoxC6o
 HoGJSFH7wu/Fj09P3qLFFLbxqeq2XRG34VRqD3HcYoV8o1ZnZXB8Id2Jc99Z6J4pa6SS
 czy3T+IgtGkm8rnVKqt9gCPCBsRCCB8QTOkRDLlxyh9T3bHGCTMzUZonRHU7uHWTH0vP
 FBRxV3SzebQIvW2LJxfkNaA4a4cFDD2ywMdTftIC4KCzdT77qLnxkm4HerP6NHUYFSje
 ozuij6We1NxAcFmqtvYQZr5zsVyzcTFPW3c3PDVdT7dqrwLQaBns1xx/i7y4CMLt82i5
 jUgQ==
X-Gm-Message-State: AOAM533mx9ye85WBX6dG89YEylowX3gu4MwI3wJLAyI8KsufBB69E12z
 NRx3fPkHvFKGhHGYp/LYe80RTQGxHKVJyQ==
X-Google-Smtp-Source: ABdhPJzQtxruvntgCo7qwwqgTv5wAlHcOQvrkB9KIecAC8bX2cGIGAxBYNATtTePil8SbtMLmUd84w==
X-Received: by 2002:a7b:c151:: with SMTP id z17mr9986079wmi.189.1614964539253; 
 Fri, 05 Mar 2021 09:15:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/49] hw/misc/mps2-fpgaio: Support SWITCH register
Date: Fri,  5 Mar 2021 17:14:57 +0000
Message-Id: <20210305171515.1038-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MPS3 boards have an extra SWITCH register in the FPGAIO block which
reports the value of some switches.  Implement this, governed by a
property the board code can use to specify whether whether it exists.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210215115138.20465-7-peter.maydell@linaro.org
---
 include/hw/misc/mps2-fpgaio.h |  1 +
 hw/misc/mps2-fpgaio.c         | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/include/hw/misc/mps2-fpgaio.h b/include/hw/misc/mps2-fpgaio.h
index bfe73134e78..0d3c8eef56c 100644
--- a/include/hw/misc/mps2-fpgaio.h
+++ b/include/hw/misc/mps2-fpgaio.h
@@ -38,6 +38,7 @@ struct MPS2FPGAIO {
     MemoryRegion iomem;
     LEDState *led[MPS2FPGAIO_MAX_LEDS];
     uint32_t num_leds;
+    bool has_switches;
 
     uint32_t led0;
     uint32_t prescale;
diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
index e74dec670f0..b04fcda844c 100644
--- a/hw/misc/mps2-fpgaio.c
+++ b/hw/misc/mps2-fpgaio.c
@@ -35,6 +35,7 @@ REG32(CLK100HZ, 0x14)
 REG32(COUNTER, 0x18)
 REG32(PRESCALE, 0x1c)
 REG32(PSCNTR, 0x20)
+REG32(SWITCH, 0x28)
 REG32(MISC, 0x4c)
 
 static uint32_t counter_from_tickoff(int64_t now, int64_t tick_offset, int frq)
@@ -156,7 +157,15 @@ static uint64_t mps2_fpgaio_read(void *opaque, hwaddr offset, unsigned size)
         resync_counter(s);
         r = s->pscntr;
         break;
+    case A_SWITCH:
+        if (!s->has_switches) {
+            goto bad_offset;
+        }
+        /* User-togglable board switches. We don't model that, so report 0. */
+        r = 0;
+        break;
     default:
+    bad_offset:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "MPS2 FPGAIO read: bad offset %x\n", (int) offset);
         r = 0;
@@ -318,6 +327,7 @@ static Property mps2_fpgaio_properties[] = {
     DEFINE_PROP_UINT32("prescale-clk", MPS2FPGAIO, prescale_clk, 20000000),
     /* Number of LEDs controlled by LED0 register */
     DEFINE_PROP_UINT32("num-leds", MPS2FPGAIO, num_leds, 2),
+    DEFINE_PROP_BOOL("has-switches", MPS2FPGAIO, has_switches, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.20.1


