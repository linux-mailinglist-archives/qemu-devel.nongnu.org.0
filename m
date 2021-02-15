Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC8831B885
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:59:59 +0100 (CET)
Received: from localhost ([::1]:58792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcXm-0001Xt-Mv
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:59:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQI-000730-V6
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:14 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:35170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQH-0003to-Cf
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:14 -0500
Received: by mail-wm1-x32e.google.com with SMTP id n10so9071541wmq.0
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gQ23dryhYlpvJQf3jI2/hncVTbnfMBWe8fcCzHmxYJw=;
 b=mylxvaoUVxgcyeE5u9vPxsFK32UYRzO7GKA9+a60vV3G2kaxC2ZvM4d5W/3np3s6KY
 CYPRLceB5+gtEItUj8M8f6/ema3TARi1A0VHZ7WLOsaC/Buxhd8gl+e9IXZUoAD54rCE
 rVu0CCPAZJBti+sFeaQMcpKOXB8s5lKOkfpP2VpbNwj9c1PbkW7GrF+e5k6b7dFveQPV
 RhBbI1RzYvB7tew5LnCE88cmTVJPseDzms/Oj7dSwVxn1qCToS8w3aMCyFx0gUh6sjAG
 tvkb+ZOf4+9rdrJkZ1ddUtC3KgIVjTo9vpT3ggv20OWKuWj0w4jYFsWmzV3RE4eUWIVH
 a/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gQ23dryhYlpvJQf3jI2/hncVTbnfMBWe8fcCzHmxYJw=;
 b=qe/wHjBsvJ7mrDobw9QgAGFWjj4VzG+005YHBIAurv0EAaPzSp1XIr0L9UzdpLaUCj
 AHUxfVi5gI7s/j9NxP/ZTPo4O1s1uc/xNigFc2b8JIbxezZJKV/ve673ycaAB7pyRkCP
 hK7S47AoX2popYFhmWZ6U9eSv7bfdpf1TKEcGQOIZXQoO5NHqhh/hij3RfrAIppNywmw
 nYZGo2I2JYZzCZvCUGujgpXpfhVfWIA1G/Ae3mHK17QdYh15Bwk5Lk/p3ZLN6DMqzRbW
 78yzX9bllkwJa9zvv2X67MCiEl19/IoauyokCglb/SmwpkaLIgkcee93lbG1wVhpM8Ej
 Og8g==
X-Gm-Message-State: AOAM531WweDTM++k1PaW1e61WYIUtqEIQNUzR8hfwcnWK7JfO3DP7/5G
 orrbZWyxZCC3jJX0b5lSTD+d0g==
X-Google-Smtp-Source: ABdhPJw07kg4M+0/1iR7hFsHJh0ab2zmPcIXP8433UtT3Mf+z0smBqZ6C4rl4lGkwbRp8Gn0K85Aiw==
X-Received: by 2002:a1c:4ca:: with SMTP id 193mr13925166wme.178.1613389932082; 
 Mon, 15 Feb 2021 03:52:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:52:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 06/24] hw/misc/mps2-fpgaio: Support SWITCH register
Date: Mon, 15 Feb 2021 11:51:20 +0000
Message-Id: <20210215115138.20465-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MPS3 boards have an extra SWITCH register in the FPGAIO block which
reports the value of some switches.  Implement this, governed by a
property the board code can use to specify whether whether it exists.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index b28a1be22cc..acbd0be9f4b 100644
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


