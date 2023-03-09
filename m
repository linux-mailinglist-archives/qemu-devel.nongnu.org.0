Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EB36B2E4C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:12:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWr-0004WY-Uh; Thu, 09 Mar 2023 15:06:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWo-0004Ux-Mc
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:18 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWn-0000mv-7A
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:18 -0500
Received: by mail-pl1-x62d.google.com with SMTP id i5so3225874pla.2
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AFjWRzj98yUhKuyGHnHqQqyKOMIaGxI1tWOoBs1FnDQ=;
 b=VXQFFMkCHjm3Ag+tzkUzNHaDqvaYziEE6gguErUK767kyyd/IuNfFLtfjFUP4vYlsm
 TwSCrNeZpCOlwU1dyuC/wArc/hxBKVmA/XHiBPvWGWR4QG4W9X/SaZW0rtYdwRBN6Mpf
 6FeLvybkldzbET8SRUCgxsTaLUWwi5q122LcI9jmsSjmLz4ZXckeRJ0MGdvyiZKSLcVf
 cWpi0jsLKC5p4I0HvqAOMK9SdqzqLKU8g9AE9fKlDXDW7JGjiq4R3AGXhZ9cvkTotEAf
 uxa4rPijPSlLz6iZOwZdh0gCFfxaq1XhmBIXVNaNi/L+7+r4A+O8fAB9qvP58fNlUk5k
 V6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AFjWRzj98yUhKuyGHnHqQqyKOMIaGxI1tWOoBs1FnDQ=;
 b=JLJc1L65g80r1VQQBknJid5ea59fU06OwwufdUcH9twRQmCtbV3V55vbkgeSsqwI0e
 gdrw71ZJQvtxuwHg+W0KiYzSWfSN7B3Xlg/xYZRa/hQJXRmDXzQdy3zhrGS44IlKgey5
 0muYvUJRTQTKPiKMfPgy2vjX1Bka2/OHO5obimLZz/WDvqhX01Jr4aoFf8n/V9d9zNYC
 hAzdP6lcZ+XyWE5028DYV0Xr8n8arFoIUWRfv9lHTBdcbhZkDUusrGUHfi+8GuNR14Pf
 Oi6egUaNqGkrBi6oMzTLmGJ7ym2z97fVEaPP+t5T0ym2OfLfkg+vHiY7zMpYrrLJWyDJ
 G7Fg==
X-Gm-Message-State: AO0yUKW655ZdY+4am7L2oqS+bVvtRh0Cf23l1Jq6IAK13NUg4/PczqP/
 IPQ/ohN1traq2c1Iu5diVjWu7VZGBiF3B7Yh6OM=
X-Google-Smtp-Source: AK7set+oco00kR+yCnGpQAe4SUqXJ5eSWTTYrwjjnFhhU+FHNkluo8JD0q24pnrdu+TZuPqnRB8M4g==
X-Received: by 2002:a17:90a:6485:b0:237:461c:b44d with SMTP id
 h5-20020a17090a648500b00237461cb44dmr23524247pjj.46.1678392375978; 
 Thu, 09 Mar 2023 12:06:15 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 27/91] target/mips: Remove `NB_MMU_MODES` define
Date: Thu,  9 Mar 2023 12:04:46 -0800
Message-Id: <20230309200550.3878088-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

From: Anton Johansson <anjo@rev.ng>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230306175230.7110-13-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/mips/cpu-param.h b/target/mips/cpu-param.h
index f4c76994ea..594c91a156 100644
--- a/target/mips/cpu-param.h
+++ b/target/mips/cpu-param.h
@@ -29,6 +29,5 @@
 #define TARGET_PAGE_BITS_VARY
 #define TARGET_PAGE_BITS_MIN 12
 #endif
-#define NB_MMU_MODES 4
 
 #endif
-- 
2.34.1


