Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4171A564663
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:21:52 +0200 (CEST)
Received: from localhost ([::1]:56262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vnb-0001Hy-83
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7vSM-0004y7-0M
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:59:54 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:39767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7vSK-0004C3-LK
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:59:53 -0400
Received: by mail-pg1-x52e.google.com with SMTP id q140so6285132pgq.6
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7miE1J32cGCfgzDoEjdy1xniOQ1sdRcJ/+h0R/nm0Nc=;
 b=OOhcRLEV+AHP3/2mcgUTIouoU7yUbLkrUmYrS71DppONiMsWqmje60LjByI5Bmnw7p
 BrXxWMEXiPvbruQC1fdOu75LVsoJZG6/WyyNqwE/WaWYQQvlWxhBRrE1V7Qt9q9FRW6b
 vWmIO/54vtHoOTyYV9WrnEoDhpMIa8ZIvMA5jD7TgzpOZfgoGhMQNhUduNabNnHEp6WR
 weY43dOgTv84pQbS0wd+7FohEgtNEphriNsBM1CZwLXPOrF++zxAxPItgDw3EO+gY+Zj
 v3jp0JEbr11auFB/wexliFyeNtjZhFltAb55+s5VeRO0CKfH+SCUvEjHgKp16XbUlCPR
 POag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7miE1J32cGCfgzDoEjdy1xniOQ1sdRcJ/+h0R/nm0Nc=;
 b=zzl7ILBO8152qc1Z8oVhGkIfVqtwAeyfdXcAPi1zsMQWekQRgaRSZ217Oz+mLAGQTA
 5hscFTrhZrfBO6OIwotboHYcxysqij36gqHR3Le4MmmTtmBiTvXRHmnSnsL97d95JeMi
 jOJq5nNJ9lig3ABT+4/oeaC4oVtYVuKgQiAHSWjBgASY0oj05o8xvID+llUaJVSo09FJ
 LY8g+b/OpOUNb0DdOZ+JwXC3bFAZgxFC6uZPpoIuPcyDHH7r/tR2PqKI83M7rFMoj4hk
 +OOsChHNmMSYhDYkzALkcU/C5o9Iq5hMUmLJpLj0y7tW329soxQBXfPVS6OVmkHltL8X
 xswQ==
X-Gm-Message-State: AJIora8XOlE0DWjD0MoHkv760X5Fob0vkKmeU5l5BsDJBbz+KppEZgdN
 uumxyyDIQ3Jetg1tcLijDTdF6adockam2e5z
X-Google-Smtp-Source: AGRyM1t2viVGieSmyBrhHnB8WacHs5mzCg4Sgc4KHFStwA6hr4zlM84MgGKYrt/AS/zi8TgaO1MhPQ==
X-Received: by 2002:a63:7a59:0:b0:40c:8f3f:8a7e with SMTP id
 j25-20020a637a59000000b0040c8f3f8a7emr19687918pgn.582.1656838791338; 
 Sun, 03 Jul 2022 01:59:51 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 cq16-20020a056a00331000b00518764d09cdsm18777593pfb.164.2022.07.03.01.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:59:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PATCH v21 10/13] target/loongarch: remove unused include hw/loader.h
Date: Sun,  3 Jul 2022 14:29:10 +0530
Message-Id: <20220703085913.772936-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703085913.772936-1-richard.henderson@linaro.org>
References: <20220703085913.772936-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Song Gao <gaosong@loongson.cn>

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220624031049.1716097-11-gaosong@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 0013582a3a..bf163a8dce 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -18,7 +18,6 @@
 #include "fpu/softfloat-helpers.h"
 #include "cpu-csr.h"
 #include "sysemu/reset.h"
-#include "hw/loader.h"
 
 const char * const regnames[32] = {
     "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7",
-- 
2.34.1


